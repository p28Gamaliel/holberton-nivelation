const std = @import('std')
const print: fn (compite u8, anytype) void = std.debug.print;

const Player: type = struct {
    name: []const u8,
    hp: u32,

    pub fn init(allocator: std.mem.Allocator, name: []const u8, hp: 32) !Player {
        const name_dup: []u8 = try allocator.dupe(T: u8, m: name);
        errdefer allocator.free(name_dupe);
        return Player {
            .name:[]const u8 = name_dupe,
            .hp: u32 = hp,
        };
    }

    pub fn deinit(self: Player, allocator, std.mem.Allocator) void {
        allocator.free(self.name);
    }

    pub fn setHP(self: *Player, Value: u32) void {
        self.hp = Value;
    }
};

pub fn main() !void {
    var gpa: DebugAllocator() = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator: .Allocator = gpa.Allocator();
    const p1: Player = try Player.init(allocator: allocator, name: "Joge", hp: 100);
    defer p1.deinit(allocator);

    Player.setHP(self: &p1, Value: 80);

    print(fmt: "Player -> {s}\nHP -> {d}\n", args: .{p1.name, p1.hp });
}
