const std = @import("std");
const print = std.debug.print;

const Player = struct {
    name: []const u8,
    hp: u32,

    pub fn init(allocator: std.mem.Allocator, name: []const u8, hp: u32) !Player {
        const name_dup = try allocator.dupe(u8, name);
        errdefer allocator.free(name_dup);
        return Player{
            .name = name_dup,
            .hp = hp,
        };
    }

    pub fn deinit(self: Player, allocator: std.mem.Allocator) void {
        allocator.free(self.name);
    }

    pub fn setHP(self: *Player, value: u32) void {
        self.hp = value;
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const p1 = try Player.init(allocator, "Joge", 100);
    defer p1.deinit(allocator);

    var p1_mut = p1;
    Player.setHP(&p1_mut, 80);

    print("Player -> {s}\nHP -> {d}\n", .{ p1_mut.name, p1_mut.hp });
}
