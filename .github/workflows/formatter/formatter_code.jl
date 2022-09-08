using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()
Pkg.update()

using JuliaFormatter

main_paths = ["./src", "./test", "./docs"]
for main_path in main_paths
    for (root, dir, files) in walkdir(main_path)
        for f in files
        !occursin(".jl", f) && continue
        @show file_path = abspath(root, f)
        occursin("generated", file_path) && continue
        format(file_path;
            whitespace_ops_in_indices = true,
            remove_extra_newlines = true,
            verbose = true,
            always_for_in = true,
            whitespace_typedefs = true
            )
        end
    end
end
