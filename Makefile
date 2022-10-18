.DEFAULT_GOAL := documentation
generate:
	@echo "Creating localbundle dir..."
	mkdir localbundle
	@ls -ltra localbundle
documentation:
	@echo "porter create  --> Generates a a porter bundle in the current directory"
	@echo "porter build   --> Builds the bundle in the current directory by generating a Dockerfile and a CNAB bundle.json, and then building the invocation image."
	@echo "porter publish --> Publishing involves pushing both the invocation image and the CNAB bundle manifest to an OCI registry."