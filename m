Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0195C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7110E685;
	Mon, 26 Feb 2024 16:14:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8C210E5B7;
 Mon, 26 Feb 2024 16:14:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EHooks=3A_success_for_drm/xe=3A_Use_vmalloc_for_arra?=
 =?utf-8?q?y_of_bind_allocation_in_bind_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 16:14:40 -0000
Message-ID: <170896408094.299097.11572974821157954857@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226155554.103384-1-matthew.brost@intel.com>
In-Reply-To: <20240226155554.103384-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Use vmalloc for array of bind allocation in bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/130325/
State : success

== Summary ==

run-parts: executing /workspace/ci/hooks/00-showenv
/workspace
+ pwd
+ ls -la
total 1140
drwxrwxr-x 12 1003 1003    4096 Feb 26 16:14 .
drwxr-xr-x  1 root root    4096 Feb 26 16:14 ..
-rw-rw-r--  1 1003 1003 1026032 Feb 26 16:13 build.log
-rw-rw-r--  1 1003 1003    1147 Feb 26 16:02 checkpatch.log
drwxrwxr-x  5 1003 1003    4096 Feb 26 15:57 ci
drwxrwxr-x  9 1003 1003    4096 Feb 26 15:56 docker
drwxrwxr-x  8 1003 1003    4096 Feb 26 15:56 .git
-rw-rw-r--  1 1003 1003     252 Feb 26 16:01 git_apply.log
drwxrwxr-x  4 1003 1003    4096 Feb 26 15:56 .github
-rw-rw-r--  1 1003 1003     233 Feb 26 15:56 .groovylintrc.json
-rw-rw-r--  1 1003 1003      78 Feb 26 16:14 hooks.log
drwxrwxr-x 31 1003 1003    4096 Feb 26 16:13 kernel
-rw-rw-r--  1 1003 1003    2980 Feb 26 16:01 kernel.mbox
-rw-rw-r--  1 1003 1003   51984 Feb 26 16:03 kunit.log
-rw-rw-r--  1 1003 1003      48 Feb 26 16:01 parent.tag
-rw-rw-r--  1 1003 1003     270 Feb 26 16:01 parent_tag_mismatch_alert.txt
drwxrwxr-x 46 1003 1003    4096 Feb 26 15:56 pipelines
-rw-rw-r--  1 1003 1003     793 Feb 26 15:56 README.adoc
drwxrwxr-x  3 1003 1003    4096 Feb 26 15:56 scripts
drwxrwxr-x  3 1003 1003    4096 Feb 26 15:56 src
drwxrwxr-x  2 1003 1003    4096 Feb 26 15:56 vars
drwxrwxr-x  2 1003 1003    4096 Feb 26 15:56 .vscode
+ uname -a
Linux 643e5472661b 5.4.0-164-generic #181-Ubuntu SMP Fri Sep 1 13:41:22 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
+ export
+ grep -Ei '(^|\W)CI_'
declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
declare -x CI_WORKSPACE_DIR="/workspace"
+ '[' -n /workspace ']'
+ git_args='-C /workspace/kernel'
+ git_log_args=
+ git --no-pager -C /workspace/kernel log --format=oneline --abbrev-commit
1b042af42ce3 drm/xe: Use vmalloc for array of bind allocation in bind IOCTL
c815c7fa9257 drm-tip: 2024y-02m-26d-15h-49m-08s UTC integration manifest
91c4d70162bb Merge remote-tracking branch 'drm-xe/topic/xe-for-CI' into drm-tip
0db12a87a1e5 Merge remote-tracking branch 'drm-intel/topic/core-for-CI' into drm-tip
8863f1402b5a Merge remote-tracking branch 'drm-xe/drm-xe-next' into drm-tip
67ddb0e8d860 Merge remote-tracking branch 'drm-intel/drm-intel-gt-next' into drm-tip
3e9ec9f66766 Merge remote-tracking branch 'drm-intel/drm-intel-next' into drm-tip
889614eadafb Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
f074a1a7793e Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into drm-tip
66671e4775da Merge remote-tracking branch 'drm-legacy/drm-next' into drm-tip
5161960e716d Merge remote-tracking branch 'drm-intel/drm-intel-fixes' into drm-tip
00d6a284fcf3 fbcon: always restore the old font data in fbcon_do_set_font()
bfa4437fd393 drm/mgag200: Add a workaround for low-latency
9d3f8a723c79 drm/ttm/tests: depend on UML || COMPILE_TEST
2f910859724b Merge drm/drm-fixes into drm-misc-fixes
b2121f2bd223 drm/xe: Extend uAPI to query HuC micro-controler firmware version
b0fda2fcb472 Merge drm/drm-next into drm-misc-next-fixes
173239176363 drm/xe: Remove useless mem_access on PAT dumps
23be0e6e8316 drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
5d118681d341 drm/xe: Remove mem_access from suspend and resume functions
48fef288070b drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
f9d9f94cfb25 drm/xe: Remove useless mem_access protection for query ioctls
5a2a90847450 drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
db5a5a833834 drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
5b2b3a0fbb28 drm/xe: Runtime PM wake on every debugfs call
1e941c9881ec drm/xe: Remove mem_access from guc_pc calls
3f0e14651ab0 drm/xe: Runtime PM wake on every sysfs call
6a0784e6001f drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
23cf006beac3 drm/xe: Runtime PM wake on every IOCTL
0f9d886f0bf9 drm/xe: Convert mem_access assertion towards the runtime_pm state
30c399529f4c drm/xe: Document Xe PM component
047518490538 Merge drm/drm-next into drm-misc-next
89ac522d4507 drm/edid/firmware: Remove built-in EDIDs
86bf8cfda6d2 drm/tegra: Remove existing framebuffer only if we support display
f112b68f273f Merge v6.8-rc6 into drm-next
aa775edbbe7b Merge tag 'drm-habanalabs-next-2024-02-26' of https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into drm-next
19b232b9d537 Merge tag 'drm-xe-next-2024-02-25' of ssh://gitlab.freedesktop.org/drm/xe/kernel into drm-next
358e76fd613a drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
c6686f274d5e drm/sun4i: hdmi: Switch to container_of_const
9ca6bc246035 drm/sun4i: hdmi: Move mode_set into enable
cedb7dd193f6 drm/sun4i: hdmi: Convert encoder to atomic
71ab34f72f6d Merge tag 'drm-misc-next-2024-02-22' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
c079e2e113f2 drm/tidss: Fix sync-lost issue with two displays
3ec948ccb2c4 drm/tidss: Fix initial plane zpos values
576d7cc5a9e2 accel: constify the struct device_type usage
fa58b5949366 accel/habanalabs: modify pci health check
c51706834983 accel/habanalabs: keep explicit size of reserved memory for FW
db45bbdd024e accel/habanalabs: handle reserved memory request when working with full FW
5b6658eb7c92 accel/habanalabs/hwmon: rate limit errors user can generate
3bf6ef981f0b accel/habanalabs/gaudi2: drain event lacks rd/wr indication
fd8d2fa0665e accel/habanalabs: fix error print
c8c062e96718 accel/habanalabs: initialize maybe-uninitialized variables
0b105a2a7225 accel/habanalabs: fix debugfs files permissions
e855869bec3f accel/habanalabs: fix glbl error cause handling
c1e89ae45528 accel/habanalabs/gaudi2: check extended errors according to PCIe addr_dec interrupt info
7159813c9120 accel/habanalabs: modify print for skip loading linux FW to debug log
c14e5cd3ed0d accel/habanalabs: remove hop size from asic properties
1c71d925c03a drm: lcdif: Switch to drmm_mode_config_init
025ac05f15d4 drm/mxsfb: Switch to drmm_mode_config_init
9e263c5042d0 accel/habanalabs: use kcalloc() instead of kzalloc()
5ae8b6b77473 accel/habanalabs/goya: remove redundant assignment to pointer 'input'
01f8cd0fafa6 accel/habanalabs/gaudi2: fail memory memset when failing to copy QM packet to device
731d320e689d accel/habanalabs: remove call to deprecated function
8a5be2b62ba1 accel/habanalabs: Remove unnecessary braces from if statement
f728c17fc97a accel/habanalabs/gaudi2: move HMMU page tables to device memory
246d8b6cfb80 accel/habanalabs: abort device reset for consecutive heartbeat failures
d0df8a35a76d accel/habanalabs: fix DRAM BAR base address calculation
8c075401f2db accel/habanalabs: increase HL_MAX_STR to 64 bytes to avoid warnings
e91c37f19404 accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
429ccbd1c39b drm/i915/hdcp: Remove additional timing for reading mst hdcp message
dfaf305b5c42 drm/i915/hdcp: HDCP Capability for the downstream device
813cca96e4ac drm/i915/hdcp: Add new remote capability check shim function
8e754d9e9e8a drm/i915/hdcp: Rename hdcp capable functions
4ae5a0977901 drm/i915/hdcp: Pass drm_dp_aux to read_bcaps function
55d9b2b8e440 drm/i915/hdcp: Refactor intel_dp_hdcp2_capable
26f7d01ca7c2 drm/i915/hdcp: Move source hdcp2 checks into its own function
287c0de8b294 drm/i915/hdcp: Move to direct reads for HDCP
20af10845864 drm/i915/display/debugfs: New entry "DRRS capable" to i915_drrs_status
d206a76d7d27 Linux 6.8-rc6
e231dbd452a7 Merge tag 'bcachefs-2024-02-25' of https://evilpiepirate.org/git/bcachefs
5197728f8182 bcachefs: fix bch2_save_backtrace()
70ff1fe626a1 Merge tag 'docs-6.8-fixes3' of git://git.lwn.net/linux
c46ac50ebec3 Merge tag 'usb-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
1e592e953684 Merge tag 'tty-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
1eee4ef38ca1 Merge tag 'x86_urgent_for_v6.8_rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
8c46ed3740e2 Merge tag 'irq_urgent_for_v6.8_rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
4ca0d9894fd5 Merge tag 'erofs-for-6.8-rc6-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
66a97c2ec953 Merge tag 'pull-fixes.pathwalk-rcu-2' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
9b24349279d5 Merge tag 'pull-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
9fa8e282c2bf ext4_get_link(): fix breakage in RCU mode
0511fdb4a378 cifs_get_link(): bail out in unsafe case
053fc4f755ad fuse: fix UAF in rcu pathwalks
e31f0a57ae1a procfs: make freeing proc_fs_info rcu-delayed
47458802f660 procfs: move dropping pde and pid from ->evict_inode() to ->free_inode()
c1b967d03c5d nfs: fix UAF on pathwalk running into umount
10a973fc4fb2 nfs: make nfs_set_verifier() safe for use in RCU pathwalk
275655d3207b afs: fix __afs_break_callback() / afs_drop_open_mmap() race
af072cf683ac hfsplus: switch to rcu-delayed unloading of nls and freeing ->s_fs_info
a13d1a4de3b0 exfat: move freeing sbi, upcase table and dropping nls into rcu-delayed helper
529f89a9e453 affs: free affs_sb_info with kfree_rcu()
cdb67fdeed72 rcu pathwalk: prevent bogus hard errors from may_lookup()
583340de1d8b fs/super.c: don't drop ->s_user_ns until we free struct super_block itself
c4333eb541b9 bcachefs: Fix check_snapshot() memcpy
097471f9e458 bcachefs: Fix bch2_journal_flush_device_pins()
b58b1b883b9b bcachefs: fix iov_iter count underflow on sub-block dio read
204f45140faa bcachefs: Fix BTREE_ITER_FILTER_SNAPSHOTS on inodes btree
04fee68dd99a bcachefs: Kill __GFP_NOFAIL in buffered read path
1f626223a0c8 bcachefs: fix backpointer_to_text() when dev does not exist
ab0a97cffa0b Merge tag 'powerpc-6.8-4' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
91403d50e9b1 Merge tag 'iommu-fixes-v6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
ac389bc0ca56 Merge tag 'cxl-fixes-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
f2e367d6ad3b Merge tag 'for-6.8/dm-fix-3' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
6d20acbf3e3a Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
fef85269a19d Merge tag 'i2c-for-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
c6a597fcc7ad Merge tag 'loongarch-fixes-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
66ad2fbcdbea dm-integrity, dm-verity: reduce stack usage for recheck
87aec499368d i2c: imx: when being a target, mark the last read as processed
de8de2c8acb9 drm/i915: convert remaining intel_dp_vsc_sdp_pack
a9e483dda3ef drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
3121fed0c51b drm/xe: Cleanup some layering in GGTT
ddadc7120d4b drm/xe: Fix execlist splat
51b76c1f3017 drm/v3d: Enable V3D to use different PAGE_SIZE
603c04e27c3e Merge tag 'parisc-for-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
e44baca77968 Merge tag 'arm-fixes-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
86f01602a41f Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
5efa18e8626a Merge tag 's390-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
95e73fb16ad9 Merge tag 'mm-hotfixes-stable-2024-02-22-15-02' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
e7768e65cd77 Merge tag 'for-6.8/dm-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
06b7ef70b1f2 Merge tag 'drm-fixes-2024-02-23' of git://anongit.freedesktop.org/drm/drm
b6d69282db55 Merge tag 'ata-6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
9cd42be825fa Merge tag 'gpio-fixes-for-v6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
76d885a1e545 Merge tag 'hwmon-for-v6.8-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
155ad86b5eca accel/qaic: Constify aic100_channels
65d4418c5002 iommu/sva: Restore SVA handle sharing
16b1b39126e5 Merge tag 'arm-smmu-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/will/linux into iommu/fixes
f79ee78767ca soc: qcom: pmic_glink: Fix boot when QRTR=m
b979f2d50a09 soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
e5ca263508f7 drm/bridge: aux-hpd: separate allocation and registration
0be4e0a5203d drm/i915: Fix doc build issue on intel_cdclk.c
84a1ed5e6756 drm/xe/uapi: Remove unused flags
dcb8e53e339e Merge tag 'renesas-fixes-for-v6.8-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
4bd5b4c2eb43 Merge tag 'riscv-dt-fixes-for-v6.8-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
fe514e177532 Merge tag 'riscv-soc-drivers-fixes-for-v6.8-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
4d934f94adc9 Merge tag 'riscv-firmware-fixes-for-v6.8-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
bcb323bd10a1 Merge tag 'riscv-cache-fixes-for-v6.8-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
9ee485bdda68 drm/bridge: aux-hpd: fix OF node leaks
f0f5c4894f89 LoongArch: KVM: Streamline kvm_check_cpucfg() and improve comments
ec83f39d2b07 LoongArch: KVM: Rename _kvm_get_cpucfg() to _kvm_get_cpucfg_mask()
179af5751af5 LoongArch: KVM: Fix input validation of _kvm_get_cpucfg() & kvm_check_cpucfg()
f661ca407873 LoongArch: dts: Minor whitespace cleanup
9fa304b9f8ec LoongArch: Call early_init_fdt_scan_reserved_mem() earlier
752cd08da320 LoongArch: Update cpu_sibling_map when disabling nonboot CPUs
1001db6c42e4 LoongArch: Disable IRQ before init_fn() for nonboot CPUs
131288c4681b drm/i915/lnl: Program PKGC_LATENCY register
3d890f328773 drm/i915/lnl: Add pkgc related register
4f933fae1dc7 drm/xe/guc: define PVC FW
a7a3d73686f5 drm/xe: Prefer struct_size over open coded arithmetic
72fa02fdf833 nouveau: add an ioctl to report vram usage
3f4d8aac6e76 nouveau: add an ioctl to return vram bar size.
1d492944d3d0 nouveau/gsp: add kconfig option to enable GSP paths by default
7c548869f5f5 Merge tag 'drm-xe-fixes-2024-02-22' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
bfc7746a044c Merge tag 'amd-drm-fixes-6.8-2024-02-22' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
741922e7fbfd Merge tag 'drm-intel-fixes-2024-02-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
7a975748d4dc drm/xe: Use pointers in trace events
f581dbb34c39 Merge tag 'drm-misc-fixes-2024-02-22' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
0d024974014f drm/dp: add an API to indicate if sink supports VSC SDP
b55b88d86fec drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()
47f419e07111 drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
ffd2cb6b718e Merge tag 'block-6.8-2024-02-22' of git://git.kernel.dk/linux
4c36fbb46f13 Merge tag 'for-linus-iommufd' of git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd
c7138f7a354d Merge tag 'platform-drivers-x86-v6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
88953761b94d Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
1c892cdd8fe0 Merge tag 'vfs-6.8-rc6.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
6714ebb922ab Merge tag 'net-6.8.0-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
32ca5ebfde9a drm/i915: Fix possible null pointer dereference after drm_dbg_printer conversion
1fa8d07ae1a5 gpu: host1x: Skip reset assert on Tegra186
32e5a120a510 drm/tegra: put drm_gem_object ref on error in tegra_fb_create
bbfaf2aea716 drm/amdgpu: Fix the runtime resume failure issue
967176179215 drm/amd/display: fix null-pointer dereference on edid reading
bae67893578d drm/amd/display: Fix memory leak in dm_sw_fini()
27a6c49394b1 drm/amd/display: fix input states translation error for dcn35 & dcn351
d2b48f340d9e drm/amd/display: Fix potential null pointer dereference in dc_dmub_srv
efa80dcbb7a3 Merge tag 'trace-v6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
4e73826089ce drm/amd/display: Only allow dig mapping to pwrseq in new asic
22e1dc4b2fec drm/amd/display: adjust few initialization order in dm
5ef1dc40ffa6 s390/cio: fix invalid -EBUSY on ccw_device_start
a3baaca4a876 drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()
510325e5ac5f selftests/iommu: fix the config fragment
2aa6f5b0fd05 drm/syncobj: handle NULL fence in syncobj_eventfd_entry_func
b5bf7778b722 iommu/arm-smmu-v3: Do not use GFP_KERNEL under as spinlock
3c43177ffb54 drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
d3f552488a73 drm/syncobj: call might_sleep before waiting for fence submission
18226ba52159 drm/syncobj: reject invalid flags in drm_syncobj_find_fence
8c44ea81634a drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
40510a941d27 drm/ttm: Fix an invalid freeing on already freed page in error path
8c987693dc2d ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes
359e54a93ab4 l2tp: pass correct message length to ip6_append_data
9ff27943060c Merge tag 'nf-24-02-22' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
fdcd4467ba15 Merge tag 'for-netdev' of https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
3489182b11d3 net: phy: realtek: Fix rtl8211f_config_init() for RTL8211F(D)(I)-VD-CG PHY
39a4cd5a3a32 Merge branch 'ioam6-fix-write-to-cloned-skb-s'
187bbb6968af selftests: ioam: refactoring to align with the fix
f198d933c2e4 Fix write to cloned skb in ipv6_hop_ioam()
7d2a894d7f48 phonet/pep: fix racy skb_queue_empty() use
3b2d9bc4d4ac phonet: take correct lock to peek at the RX queue
56ee7db31187 erofs: fix refcount on the metabuf used for inode lookup
a24d9099777d drm/xe: Do not include current dir for generated/xe_wa_oob.h
de74079f0089 drm/xe: Add debug prints for skipping rebinds
40d47c5fb4f2 Merge tag 'amd-drm-next-6.9-2024-02-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
603ead96582d net: sparx5: Add spinlock for frame transmission from CPU
1fde0ca3a0de net/sched: flower: Add lock protection when remove filter handle
61c43780e944 devlink: fix port dump cmd type
90d07e36d400 net: stmmac: Fix EST offset for dwmac 5.10
1e07900d87f1 Merge branch 'tools-ynl-fix-impossible-errors'
5d78b73e8514 tools: ynl: don't leak mcast_groups on init error
e4fe082c38cd tools: ynl: make sure we always pass yarg to mnl_cb_run
9990889be142 net: mctp: put sock on tag allocation failure
195e5f88c2e4 netfilter: nf_tables: use kzalloc for hook allocation
d472e9853d7b netfilter: nf_tables: register hooks last when adding new chain/flowtable
8762785f459b netfilter: nft_flow_offload: release dst in case direct xmit path is used
9e0f0430389b netfilter: nft_flow_offload: reset dst in route object after setting up flow
bccebf647017 netfilter: nf_tables: set dormant flag on hook register failure
f76d5f658056 Merge branch 'tls-fixes-for-record-type-handling-with-peek'
2bf6172632e1 selftests: tls: add test for peeking past a record of a different type
7b2a4c2a623a selftests: tls: add test for merging of same-type control messages
ec823bf3a479 tls: don't skip over different type records from the rx_list
fdfbaec5923d tls: stop recv() if initial process_rx_list gave us non-DATA
10f41d0710fc tls: break out of main loop when PEEK gets a non-data record
136cfaca2256 gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
d56e460e19ea hwmon: (nct6775) Fix access to temperature configuration registers
b7b2ffc3ca59 docs: translations: use attribute to store current language
ec4308ecfc88 irqchip/gic-v3-its: Do not assume vPE tables are preallocated
0eb2a18a8fad drm/xe: Implement VM snapshot support for BO's and userptr
0cd99046ca05 drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
ffb7249df199 drm/xe: Annotate each dumpable vma as such
76a86b58d2b3 drm/xe: Add uapi for dumpable bos
bd71cdd209c6 drm/xe: Clear all snapshot members after deleting coredump
8491b0ef3233 drm/xe/snapshot: Remove drm_err on guc alloc failures
9cec467d0502 ata: libata-core: Do not call ata_dev_power_set_standby() twice
fb33a46cd75e irqchip/mbigen: Don't use bus_get_dev_root() to find the parent
39133352cbed Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
8da8d88455eb Merge tag 'for-6.8-rc5-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
d8be5a55b8e3 Merge tag 'v6.8-p4' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
9bd405c48b0a cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()
583f2bdc8a44 MAINTAINERS: Create entry for Renesas RZ DRM drivers
bf7e1dc79a59 MAINTAINERS: Update entries for Renesas DRM drivers
768e9e61b3b9 drm: renesas: Add RZ/G2L DU Support
ac23216bb1f5 dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
c1bb7f9f1e15 dt-bindings: display: Document Renesas RZ/G2L DU bindings
4cd12c6065df bpf, sockmap: Fix NULL pointer dereference in sk_psock_verdict_data_ready()
b820de741ae4 fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
aeedaee5ef54 drm/bridge: adv7511: fix crash on irq during probe
e78fb4eac817 ring-buffer: Do not let subbuf be bigger than write mask
723a2cc8d69d s390: use the correct count for __iowrite64_copy()
7adc0c1cfa77 iommufd: Reject non-zero data_type if no data_len is provided
ed683b9bb91f sparc: Fix undefined reference to fb_is_primary_device
14dec56fdd4c MAINTAINERS: Add framer headers to NETWORKING [GENERAL]
aa82ac51d633 af_unix: Drop oob_skb ref before purging queue in GC.
d80f8e96d47d net: ipa: don't overrun IPA suspend interrupt registers
56667da7399e net: implement lockless setsockopt(SO_PEEK_OFF)
3b1ae9b71c2a octeontx2-af: Consider the action set by PF
c77ad63fb6d3 drm/i915: Check before removing mm notifier
c48617fbbe83 Merge tag 'kvmarm-fixes-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
6650d23f3e20 drm/xe: Fix modpost warning on xe_mocs kunit module
85a71ee9a070 KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
8d3a7dfb801d KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
e2941a482a5d drm/xe/xe_gt_idle: Drop redundant newline in name
5b672ec3f5e1 drm/xe: Return 2MB page size for compact 64k PTEs
4cf8ffeb6625 drm/xe: Add XE_VMA_PTE_64K VMA flag
ecfac05f962f drm/xe: Fix xe_vma_set_pte_size
4578f989ed6b iommu/vt-d: Fix constant-out-of-range warning
1f0198fce683 iommu/vt-d: Set SSADE when attaching to a parent with dirty tracking
f1e1610950ea iommu/vt-d: Add missing dirty tracking set for parent domain
0c7f2497b39d iommu/vt-d: Wrap the dirty tracking loop to be a helper
56ecaf6c5834 iommu/vt-d: Remove domain parameter for intel_pasid_setup_dirty_tracking()
5e54e861f16f iommu/vt-d: Add missing device iotlb flush for parent domain
29e10487d6df iommu/vt-d: Update iotlb in nested domain attach
821985301124 iommu/vt-d: Add missing iotlb flush for parent domain
0455d317f533 iommu/vt-d: Add __iommu_flush_iotlb_psi()
85ce8e1d6d73 iommu/vt-d: Track nested domains in parent
77aebae1ea12 drm/xe/uapi: Remove support for persistent exec_queues
fb1e881273f4 drm/i915/tv: Fix TV mode
5c6224bfabbf cxl/acpi: Fix load failures due to single window creation failure
40de53fd002c Merge branch 'for-6.8/cxl-cper' into for-6.8/cxl
f3e6b3ae9cfc acpi/ghes: Remove CXL CPER notifications
9fc1ccccfd8d Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
2597c9947b01 kasan: guard release_free_meta() shadow access with kasan_arch_is_ready()
13d0599ab3b2 mm/damon/lru_sort: fix quota status loss due to online tunings
1b0ca4e4ff10 mm/damon/reclaim: fix quota stauts loss due to online tunings
379c5aaa1435 MAINTAINERS: mailmap: update Shakeel's email address
0721a614ef79 mm/damon/sysfs-schemes: handle schemes sysfs dir removal before commit_schemes_quota_goals
118642d7f606 mm: memcontrol: clarify swapaccount=0 deprecation warning
4f155af0ae44 mm/memblock: add MEMBLOCK_RSRV_NOINIT into flagname[] array
678e54d4bb9a mm/zswap: invalidate duplicate entry when !zswap_enabled
1eb1e984379e lib/Kconfig.debug: TEST_IOV_ITER depends on MMU
13ddaf26be32 mm/swap: fix race when skipping swapcache
16e96ba5e92c mm/swap_state: update zswap LRU's protection range with the folio locked
7efa6f2c8033 selftests/mm: uffd-unit-test check if huge page size is 0
e9e3db69966d mm/damon/core: check apply interval in damon_do_apply_schemes()
e3b63e966cac mm: zswap: fix missing folio cleanup in writeback race path
bb619d71224e drm/xe: Fix modpost warning on xe_mocs kunit module
e5626eb80026 drm/xe/xe_gt_idle: Drop redundant newline in name
0df8669f69a8 docs: Instruct LaTeX to cope with deeper nesting
704dccec0d49 arm64: dts: qcom: Fix interrupt-map cell sizes
f02b0f0dc26f arm: dts: Fix dtc interrupt_map warnings
91adecf911e5 arm64: dts: Fix dtc interrupt_provider warnings
96fd598e9c34 arm: dts: Fix dtc interrupt_provider warnings
e08f65491c0e arm64: dts: freescale: Disable interrupt_map check
69a5f1774add drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
0cf54e404d4f Merge tag 'v6.8-rockchip-dtsfixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
fca7526b7d89 drm/tests/drm_buddy: fix build failure on 32-bit targets
bf8ec3c3e82c drm/xe: Initialize GuC earlier during probe
8a4587ef9f95 drm/xe/guc: Move GuC power control init to "post-hwconfig"
7606f7d0f069 drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
a44bbace73df drm/xe/guc: Allocate GuC data structures in system memory for initial load
0e99d74a7fa7 drm/xe: Add PVC's PCI device IDs
0e0c50e85a36 dm-crypt, dm-integrity, dm-verity: bump target version
787f1b280046 dm-verity, dm-crypt: align "struct bvec_iter" correctly
42e15d12070b dm-crypt: recheck the integrity tag after a failure
50c70240097c dm-crypt: don't modify the data when using authenticated encryption
9177f3c0dea6 dm-verity: recheck the hash after a failure
c88f5e553fe3 dm-integrity: recheck the integrity tag after a failure
fbb944086f2f Merge drm/drm-next into drm-xe-next
bf7626f19d6f drm/i915/tv: Fix TV mode
944d5fe50f3f sched/membarrier: reduce the ability to hammer on sys_membarrier
0f688c0eb63a drm/xe: Return 2MB page size for compact 64k PTEs
15f0e0c2c46d drm/xe: Add XE_VMA_PTE_64K VMA flag
19adaccef8b2 drm/xe: Fix xe_vma_set_pte_size
d0a59944e34f Merge tag 'imx-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
fdf87a0dc26d ARM: ep93xx: Add terminator to gpiod_lookup_table
eb0d253ff9c7 accel/ivpu: Don't enable any tiles by default on VPU40xx
427c70dec738 platform/x86: thinkpad_acpi: Only update profile if successfully converted
84c16d01ff21 platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler
8215ca518164 platform/x86: x86-android-tablets: Fix acer_b1_750_goodix_gpios name
812a79b52b92 platform/x86: x86-android-tablets: Fix serdev instantiation no longer working
dc5afd720f84 platform/x86: Add new get_serdev_controller() helper
bd8905d70944 platform/x86: x86-android-tablets: Fix keyboard touchscreen on Lenovo Yogabook1 X90
d7b77a0d565b arm64/sme: Restore SMCR_EL1.EZT0 on exit from suspend
9533864816fb arm64/sme: Restore SME registers on exit from suspend
a6b3eb304a82 Revert "arm64: jump_label: use constraints "Si" instead of "i""
802379b8f9e1 perf: CXL: fix CPMU filter value mask length
ae366ba8576d gpiolib: Handle no pin_ranges in gpiochip_generic_config()
20c8c4dafe93 KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to empty 'arch_compat'
23f9c2c066e7 docs: netdev: update the link to the CI repo
a7d6027790ac arp: Prevent overflow in arp_req_get().
def689fc26b9 devlink: fix possible use-after-free and memory leaks in devlink_init()
5cf0fbf76374 drm/i915: Add some boring kerneldoc
5559cea2d5aa ipv6: sr: fix possible use-after-free and null-ptr-deref
6ea38e2aeb72 afs: Increase buffer size in afs_update_volume_status()
bfacaf71a148 afs: Fix ignored callbacks over ipv4
e21a2f17566c cachefiles: fix memory leak in cachefiles_add_cache()
69f89168b310 usb: typec: tpcm: Fix issues with power being removed during reset
a0df2cc858c3 drm/xe/xe_bo_move: Enhance xe_bo_move trace
237412e45390 drm/xe: Enable 32bits build
2c88c16dc20e erofs: fix handling kern_mount() failure
43fb862de8f6 KVM/VMX: Move VERW closer to VMentry for MDS mitigation
706a189dcf74 KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
6613d82e617d x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
a0e2dab44d22 x86/entry_32: Add VERW just before userspace transition
3c7501722e6b x86/entry_64: Add VERW just before userspace transition
baf8361e5455 x86/bugs: Add asm helpers for executing VERW
882a2a724ee9 parisc: Fix stack unwinder
4101f25ae26d drm/i915: remove intel_memory_region_ops::flags
4c1f2a1e2b73 drm/i915: remove i915_vma::obj_hash
95f4e97f5e00 drm/i915: remove execute_cb::signal
7be6ff785af2 drm/i915: remove intel_gvt_irq::pending_events
4ced7884ac69 drm/i915: remove intel_gvt_event_info::policy
ad180eb410e3 drm/i915: remove intel_gvt_irq_info::warned
58b67c04cd8a drm/i915: remove gvt_mmio_block::device
7c25ef44547f drm/i915: remove intel_vgpu::intx_trigger
c1d8fa8163bc drm/i915: remove intel_vgpu_opregion::mapped
0c274be3f2bc drm/i915: remove intel_vgpu_fence::base
dcbe15d92063 drm/i915: remove intel_vgpu_gtt::active_ppgtt_mm_bitmap
0b8722d65af5 drm/i915: remove i915_perf_stream::size_exponent
c5d859e34c91 drm/i915: remove i915_drm_client::id
394a1376d827 drm/i915: remove intel_guc::ads_engine_usage_size
dd0eb202bf4a drm/i915: remove intel_vbt_panel_data::edp::initialized
8266cdae3c5d drm/i915: remove intel_vgpu_workload::{ring_context, restore_inhibit}
9fda1fd90984 drm/i915: remove intel_gvt_mmio_info::{device, addr_range}
fe7ed0e9dc92 drm/i915: remove intel_gvt_gtt::{mm_alloc_page_table, mm_free_page_table}
de2fa4ef66b8 drm/i915: remove intel_dsi::{port_bits,hs}
172c52e276d5 drm/i915: remove structs intel_vgpu_pipe_format and intel_vgpu_fb_format
a9b5f422339f drm/i915: remove unused intel_dvo_dev_ops hooks
1f4c6f11a557 drm/ci: mark universal-plane-sanity as failing on SC7180
e00fc5402402 drm/ci: update msm-apq8096-fails list
0326a5710e6d drm/ci: update IGT test names
31e0a586f338 drm/amdgpu: add MMHUB 3.3.1 support
385d9f7f2e3f drm/amd/display: Remove break after return
e3481abc2c62 drm/ci: skip suspend tests for both msm-sc7180 machines
db744ddd59be PCI/MSI: Prevent MSI hardware interrupt number truncation
9c92006b896c irqchip/sifive-plic: Enable interrupt if needed before EOI
76d41fb06333 platform/x86/amd/pmf: Fix a potential race with policy binary sideload
e70961505808 platform/x86/amd/pmf: Fixup error handling for amd_pmf_init_smart_pc()
20545af302bb platform/x86/amd/pmf: Add debugging message for missing policy data
b2b6fa6f5c57 platform/x86/amd/pmf: Fix a suspend hang on Framework 13
11e298f3548a platform/x86/amd/pmf: Fix TEE enact command failure after suspend and resume
3da01394c0f7 platform/x86/amd/pmf: Remove smart_pc_status enum
f1a9abc0cf31 drm/xe/uapi: Remove support for persistent exec_queues
f0ddb8a90213 platform/x86: touchscreen_dmi: Consolidate Goodix upside-down touchscreen data
dbcbfd662a72 platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
8f812373d195 platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to request_irq()
6f7d0f5fd8e4 platform/x86: think-lmi: Fix password opcode ordering for workstations
dc90214ff58b drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
763955fd6c93 dt-bindings: display: simple: Add boe,bp082wx1-100 8.2" panel
5c138a8a4abe selftests/bpf: Add negtive test cases for task iter
5f2ae606cb5a bpf: Fix an issue due to uninitialized bpf_iter_task
3f00e4a9c96f selftests/bpf: Test racing between bpf_timer_cancel_and_free and bpf_timer_cancel
0281b919e175 bpf: Fix racing between bpf_timer_cancel_and_free and bpf_timer_cancel
b59dcca97bf0 dt-bindings: display: ti,am65x-dss: Add support for common1 region
40b9385dd8e6 enic: Avoid false positive under FORTIFY_SOURCE
121e4dcba370 ionic: use pci_is_enabled not open code
b0ad381fa769 btrfs: fix deadlock with fiemap and extent locking
e42b9d8b9ea2 btrfs: defrag: avoid unnecessary defrag caused by incorrect extent size
335126937753 drm/tests/drm_buddy: fix 32b build
b7f9b9b67ebd accel/ivpu: Rename VPU to NPU in message strings
42328003ecb6 accel/ivpu: Refactor BO creation functions
adfef713d2b5 accel/ivpu: Fix ivpu_reset_engine_fn merge issue
f32d59677ab1 accel/ivpu: Use lazy allocation for doorbell IDs
00b9151cd4a3 accel/ivpu: Add support for FW boot param system_time_us
3bd0edf825b7 accel/ivpu: Update FW API headers
575fcdd3cfd4 accel/ivpu: Remove legacy firmware name
70ef769f5129 accel/ivpu: Rename TILE_SKU_BOTH_MTL to TILE_SKU_BOTH
26c8404e162b ata: ahci_ceva: fix error handling for Xilinx GT PHY support
9815e3961754 ahci: asm1064: correct count of reported ports
cd65c48d6692 selftests: bonding: set active slave to primary eth1 specifically
42a7a16bedc9 drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
1a9e51bef89a drm/meson: improve encoder probe / initialization error handling
3b69e32e151b serial: amba-pl011: Fix DMA transmission in RS485 mode
f418ae73311d serial: stm32: do not always set SER_RS485_RX_DURING_TX if RS485 is enabled
8b79d4e99407 tty: hvc: Don't enable the RISC-V SBI console by default
bd915ae73a2d drm/meson: Don't remove bridges which are created by other drivers
84b6238aff3d MAINTAINERS: Drop myself as maintainer of TYPEC port controller drivers
76c51146820c usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
23b1d2d99b0f Revert "usb: typec: tcpm: reset counter when enter into unattached state after try role"
858a74cb5128 usb: gadget: omap_udc: fix USB gadget regression on Palm TE
b191a18cb5c4 usb: dwc3: gadget: Don't disconnect if not started
5fd9e45f1ebc usb: cdns3: fix memory double free when handle zero packet
cd45f99034b0 usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
b787a3e78175 usb: roles: don't get/set_role() when usb_role_switch is unregistered
1c9be13846c0 usb: roles: fix NULL pointer issue when put module's reference
47625b018c6b usb: cdnsp: fixed issue with incorrect detecting CDNSP family controllers
18a6be674306 usb: cdnsp: blocked some cdns3 specific code
d70c7a6614ac usb: uhci-grlib: Explicitly include linux/platform_device.h
a5c57fd2e9bd powerpc/pseries/iommu: DLPAR add doesn't completely initialize pci_controller
b401b621758e Linux 6.8-rc5
6c160f16be5d Merge tag 'kbuild-fixes-v6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
ddac3d8b8a48 Merge tag 'x86_urgent_for_v6.8_rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
7cb7c32d60ad Merge tag 'irq_urgent_for_v6.8_rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
626721edeebd Merge tag 'i2c-for-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
ee710bbcad48 Merge branch 'bcmasp-fixes'
f120e62e37f0 net: bcmasp: Sanity check is off by one
5b76d928f8b7 net: bcmasp: Indicate MAC is in charge of PHY PM
398b7c3770c2 Merge branch 'mptcp-fixes'
4103d8480866 selftests: mptcp: diag: unique 'cestab' subtest names
645c1dc965ef selftests: mptcp: diag: unique 'in use' subtest names
2ef0d804c090 selftests: mptcp: userspace_pm: unique subtest names
4d8e0dde0403 selftests: mptcp: simult flows: fix some subtest names
694bd45980a6 selftests: mptcp: diag: fix bash warnings on older kernels
662f084f3396 selftests: mptcp: pm nl: avoid error msg on older kernels
d2a2547565a9 selftests: mptcp: pm nl: also list skipped tests
045e9d812868 mptcp: fix duplicate subflow creation
967d3c27127e mptcp: fix data races on remote_id
a7cfe7766370 mptcp: fix data races on local_id
b8adb69a7d29 mptcp: fix lockless access in subflow ULP diag
584f38942626 mptcp: add needs_id for netlink appending addr
6c347be62ae9 mptcp: add needs_id for userspace appending addr
59a646d6c7e4 Merge branch 'inet-fix-NLM_F_DUMP_INTR-logic'
e898e4cd1aab ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
081a0e3b0d4c ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
c02197fc9076 Merge tag 'powerpc-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
f2667e0c3240 Merge tag 'bcachefs-2024-02-17' of https://evilpiepirate.org/git/bcachefs
97dde8402633 net: stmmac: Fix incorrect dereference in interrupt handlers
ced590523156 Merge tag 'driver-core-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
7efc0eb82508 Merge tag 'char-misc-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
4b2981b2270d Merge tag 'tty-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
a3a7d1627429 Merge tag 'usb-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
ac00b6546d39 Merge tag 'media/v6.8-4' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
4a7571485c46 Merge tag 'pci-v6.8-fixes-3' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
ad645dea35c1 Merge tag 'probes-fixes-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
55f626f2d0c8 Merge tag '6.8-rc4-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
5928d411557e Documentation: Document the Linux Kernel CVE process
9704669c386f tracing/probes: Fix to search structure fields correctly
67ec505fae32 Merge tag 'i2c-host-fixes-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current
0cab68720598 cxl/pci: Fix disabling memory if DVSEC CXL Range does not match a CFMWS window
117132edc690 cxl/test: Add support for qos_class checking
cc214417f06f cxl: Fix sysfs export of qos_class for memdev
10cb393d769b cxl: Remove unnecessary type cast in cxl_qos_class_verify()
00413c150682 cxl: Change 'struct cxl_memdev_state' *_perf_list to single 'struct cxl_dpa_perf'
cb66b1d60c28 cxl/region: Allow out of order assembly of autodiscovered regions
453a7fde8031 cxl/region: Handle endpoint decoders in cxl_region_find_decoder()
b626070ffc14 x86/numa: Fix the sort compare func used in numa_fill_memblks()
9b99c17f7510 x86/numa: Fix the address overlap check in numa_fill_memblks()
5429c8de56f6 block: sed-opal: handle empty atoms when parsing response
172c0cf519fb MAINTAINERS: Add Siddharth Vadapalli as PCI TI DRA7XX/J721E reviewer
15afd3d332b8 Merge tag 'md-6.8-20240216' of https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-6.8
239cce651ea6 drm/panel: ltk500hd1829: add panel type for ltk101b4029w
c71efc633713 dt-bindings: display: ltk500hd1829: add variant compatible for ltk101b4029w
f9488c160d6e drm/panel: ltk500hd1829: make room for more similar panels
c530379a6876 dt-bindings: display: panel-lvds: Add compatible for admatec 9904370 panel
9de552935b6c dt-bindings: vendor-prefixes: add prefix for admatec GmbH
c1ca10ceffbb Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
975b26ab307e Merge tag 'wq-for-6.8-rc4-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq
7edfe0aaa6e7 Merge tag 'block-6.8-2024-02-16' of git://git.kernel.dk/linux
809601508259 Merge tag 'io_uring-6.8-2024-02-16' of git://git.kernel.dk/linux
3f9c1b315d65 Merge tag 'ceph-for-6.8-rc5' of https://github.com/ceph/ceph-client
2bb2ad58f6b7 drm/amd: Change `jpeg_v4_0_5_start_dpg_mode()` to void
f6aed043ee5d drm/amd/display: Add 'replay' NULL check in 'edp_set_replay_allow_active()'
6f18d7ad9dba drm/amdgpu: Fix missing parameter descriptions in ih_v7_0.c
a02cfac90fbd drm/amdgpu: add SDMA 6.1.1 discovery support
c40797d32024 drm/amdgpu: add sdma 6.1.1 firmware
aec765a4dc91 drm/amdgpu: add psp 14.0.1 discovery support
24b5a5df943a drm/amdgpu: add PSP 14.0.1 support
c5ce1f1a2101 drm/amdgpu: add smuio 14.0.1 support
bd377b128125 drm/amdgpu: add nbio 7.11.1 discovery support
dc84f52eb26d drm/amdgpu/nbio: Add NBIO 7.11.1 Support
34a1de0f7935 drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole
79863ddee8eb drm/amd/display: 3.2.272
f945a404ed8a parisc/kprobes: always include asm-generic/kprobes.h
250f5402e636 parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
683b783c2093 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
4b6f7c624e70 Merge tag 'trace-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
3f3f64cb60ee Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
65323796debe drm/nouveau/mmu/r535: uninitialized variable in r535_bar_new_()
0affdba22aca nouveau: fix function cast warnings
efb0b63afce6 Merge tag 'zonefs-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs
1e5a2ec938d7 char/agp: remove agp_bridge_data::type
9895ceeb5cd6 Merge tag 'kvmarm-fixes-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
8046fa5fc2f7 Merge tag 'kvmarm-fixes-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
0f1dd5e91e2b Merge tag 'sound-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
beda9c23ad82 Merge tag 'gpio-fixes-for-v6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
ca6a62f9fe23 Merge tag 'drm-fixes-2024-02-16' of git://anongit.freedesktop.org/drm/drm
b8ef92016814 Merge tag 'lsm-pr-20240215' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
79e2ea2eaaa6 drm/i915/cdclk: Document CDCLK update methods
c0151c695fbe drm/i915/cdclk: Remove the hardcoded divider from cdclk_compute_crawl_and_squash_midpoint()
76184fa3d32e drm/i915/cdclk: Squash waveform is 16 bits
26aba0d1c35f drm/i915/cdclk: Extract cdclk_divider()
f63f24488571 drm: bridge: dw_hdmi: Set DRM bridge type
02f76a9cd449 drm/buddy: Modify duplicate list_splice_tail call
61e738d81f75 drm/xe: Update shared stats to use the new gem helper
905a176a3ca3 drm/i915: Update shared stats to use the new gem helper
ba1a58d5b907 drm/amdgpu: add shared fdinfo stats
d50ea100ea7e drm: update drm_show_memory_stats() for dma-bufs
b31f5eba32ae drm: add drm_gem_object_is_shared_for_memory_stats() helper
77d17c4cd0bf Documentation/gpu: Update documentation on drm-shared-*
654f26a0f43c drm/panel: Add driver for DJN HX83112A LCD panel
3b59787a5170 dt-bindings: display: panel: Add Himax HX83112A
b40034994f60 gpu: host1x: remove redundant assignment to variable space
166c2c8a6a4d net/sched: act_mirred: don't override retval if we already lost the skb
52f671db1882 net/sched: act_mirred: use the backlog for mirred ingress
a9f80df4f514 net: ethernet: adi: requires PHYLIB support
66b60b0c8c4a dccp/tcp: Unhash sk from ehash for tb2 alloc failure after check_estalblished().
82a678e22d0b Merge branch 'bridge-mdb-events'
f7a70d650b0b net: bridge: switchdev: Ensure deferred event delivery on unoffload
dc489f86257c net: bridge: switchdev: Skip MDB replays of deferred events on offload
b4ea9b6a18eb net/iucv: fix the allocation size of iucv_path_table array
ea69f782d0e3 Merge tag 'drm-msm-fixes-2024-02-15' of https://gitlab.freedesktop.org/drm/msm into drm-fixes
44395701ad85 Merge tag 'amd-drm-fixes-6.8-2024-02-15-2' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
427e337f7ad9 Merge tag 'drm-xe-fixes-2024-02-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
7e1c3be3f9cd Merge tag 'drm-intel-fixes-2024-02-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
38df7e5e6cb5 Merge tag 'drm-misc-fixes-2024-02-15' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
4860abb91f3d smb: Fix regression in writes when non-standard maximum write size negotiated
54d46c9f581d Merge branch 'fix-the-read-of-vsyscall-page-through-bpf'
be66d79189ec selftest/bpf: Test the read of vsyscall page under x86-64
32019c659ecf x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()
ee0e39a63b78 x86/mm: Move is_vsyscall_vaddr() into asm/vsyscall.h
9ac4beb7578a Merge tag 'drm-misc-next-2024-02-15' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
14db5f64a971 zonefs: Improve error handling
6f167a367346 Merge tag 'drm-intel-gt-next-2024-02-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
9e46c70e829b md: Don't suspend the array for interrupted reshape
ad39c08186f8 md: Don't register sync_thread for reshape directly
82ec0ae59d02 md: Make sure md_do_sync() will set MD_RECOVERY_DONE
55a48ad2db64 md: Don't ignore read-only array in md_check_recovery()
1baae052cccd md: Don't ignore suspended array in md_check_recovery()
b13cfb445c91 Merge tag 'drm-intel-next-2024-02-07' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
9ddf190a7df7 scsi: jazz_esp: Only build if SCSI core is builtin
5761eb9761d2 scsi: smartpqi: Fix disable_managed_interrupts
f2dced9d1992 scsi: ufs: Uninitialized variable in ufshcd_devfreq_target()
de959094eb21 scsi: target: pscsi: Fix bio_put() for error case
b5fc07a5fb56 scsi: core: Consult supported VPD page list prior to fetching page
4f5e5092fdbf Merge tag 'net-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
cc9c4f0b3113 Merge tag 'for-linus-6.8a-rc5-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
a8ac4bcaeb66 drm/amdgpu: Fix implicit assumtion in gfx11 debug flags
e3de58f8fd5b drm/amdkfd: update SIMD distribution algo for GFXIP 9.4.2 onwards
0d555e481c13 drm/amd/display: Increase ips2_eval delay for DCN35
a82197e3a5f4 drm/amdgpu/display: Initialize gamma correction mode variable in dcn30_get_gamcor_current()
2f542421a47e drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution
0484e05d048b drm/amd/display: fixed integer types and null check locations
46806e59a877 drm/amd/display: Fix array-index-out-of-bounds in dcn35_clkmgr
deb110292180 drm/amd/display: Preserve original aspect ratio in create stream
a589fa17cc44 drm/amd/display: Fix possible NULL dereference on device remove/driver unload
a538dabf772c Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
94b38b895dec drm/amd/display: Add align done check
916361685319 Revert "drm/amd: flush any delayed gfxoff on suspend entry"
3a9626c816db drm/amd: Stop evicting resources on APUs in suspend
ccc514b7e7ac drm/amd/display: Fix possible buffer overflow in 'find_dcfclk_for_voltage()'
88c6d84dd8f7 drm/amd/display: Fix possible use of uninitialized 'max_chunks_fbc_mode' in 'calculate_bandwidth()'
7edb5830ecb0 drm/amd/display: Initialize 'wait_time_microsec' variable in link_dp_training_dpia.c
17ba9cde11c2 drm/amd/display: Fix && vs || typos
a0c9956a8d5a drm/amdkfd: Fix L2 cache size reporting in GFX9.4.3
d16df040c8da drm/amdgpu: make damage clips support configurable
68fb3ca0e408 update workarounds for gcc "asm goto" issue
339e2fca0214 Merge tag 'devicetree-fixes-for-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
6efe4d187969 seq_buf: Fix kernel documentation
8a566f94104d seq_buf: Don't use "proxy" headers
a00cf1988a13 Merge tag 'spi-fix-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
2c460834f603 Merge tag 'regmap-fix-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap
9207fe7572f9 Merge tag 'hid-for-linus-2024021501' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
8c7bfd826231 drm/msm: Wire up tlb ops
9c10f2b172eb Merge tag 'nvme-6.8-2024-02-15' of git://git.infradead.org/nvme into block-6.8
9b6326354cf9 tracing/synthetic: Fix trace_string() return value
1a5e81de180e Revert "drm/panel-edp: Add auo_b116xa3_mode"
c40c0d3a768c Merge branch '1GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
b2c6c5291124 Merge branch 'fix-module_description-for-net-p6'
538b22e74287 net: fill in MODULE_DESCRIPTION()s for missing arcnet
9de69f0e9958 net: fill in MODULE_DESCRIPTION()s for mdio_devres
e1e5ef2aefc2 net: fill in MODULE_DESCRIPTION()s for ppp
4ad9e8587439 net: fill in MODULE_DESCRIPTION()s for fddik/skfp
44c1197bcef4 net: fill in MODULE_DESCRIPTION()s for plip
c0872309ac84 net: fill in MODULE_DESCRIPTION()s for ieee802154/fakelb
5b8e3464071a net: fill in MODULE_DESCRIPTION()s for xen-netback
c4c96d1417fd drm: Spelling s/hardward/hardware/g
41c25e193b2b ALSA: usb-audio: More relaxed check of MIDI jack names
32f03f4002c5 ALSA: hda/realtek: fix mute/micmute LED For HP mt645
ed4adc07207d net: ravb: Count packets instead of descriptors in GbEth RX path
dc34ebd5c018 pppoe: Fix memory leak in pppoe_sendmsg()
4e45170d9acc net: sctp: fix skb leak in sctp_inq_free()
3db9d4b39519 Merge tag 'asoc-fix-v6.8-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
a951884d8288 kallsyms: ignore ARMv4 thunks along with others
e5b2e810daf9 net: bcmasp: Handle RX buffer allocation failure
d74b23d0c29c Merge tag 'nf-24-02-15' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
2813926261e4 arm64/sve: Lower the maximum allocation for the SVE ptrace regset
fb091ff39479 arm64: Subscribe Microsoft Azure Cobalt 100 to ARM Neoverse N2 errata
f3ac28e1f8ae Merge tag 'linux-can-fixes-for-6.8-20240214' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can
488b6d91b071 net-timestamp: make sk_tskey more predictable in error path
455dae7549ae drm/xe: avoid function cast warnings
8cb92dc730d8 drm/xe/pt: Allow for stricter type- and range checking
c2626b738721 drm/xe/display: fix i915_gem_object_is_shmem() wrapper
9377de4cb3e8 drm/xe/vm: Avoid reserving zero fences
f2c9364db579 drm/xe: avoid function cast warnings
2ec197fda25f selftests: tls: increase the wait in poll_partial_rec_async
dadd1701ae11 ice: Add check for lport extraction to LAG init
63a3dd6e62c8 Merge tag 'wireless-2024-02-14' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless
a37ee9e117ef io_uring/net: fix multishot accept overflow handling
eb927f01dfb6 drm/i915/gt: Restart the heartbeat timer when forcing a pulse
8d3dea210042 Merge tag 'mips-fixes_6.8_2' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
6004b044f771 Merge tag 'landlock-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux
1f3a3e2aaeb4 Merge tag 'for-6.8-rc4-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
1b923307a1b0 drm/i915: Enable fastboot across the board
7ab52cb3489e drm/i915: Add PLL .compare_hw_state() vfunc
b56e24be5916 drm/i915: Reuse ibx_dump_hw_state() for gmch platforms
8d18f12f97bf drm/i915: Include the CRTC name in the ELD buffer mismatch
733c454e0d14 drm/i915: Fix PLL state check for gmch platforms
91f842ffe6ca Merge tag 'linux_kselftest-kunit-fixes-6.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
84443741faab netfilter: nf_tables: fix bidirectional offload regression
0f1ae2821fa4 netfilter: nat: restore default DNAT behavior
f6374a82fc85 netfilter: nft_set_pipapo: fix missing : in kdoc
efc11f34e25f drm/amdgpu: support psp ip block discovery for psp v14
815282549896 drm/amdgpu: add psp_timeout to limit PSP related operation
e71658299d45 drm/amdgpu/psp: set boot_time_tmr flag
2fb4460fb84d drm/amdgpu/psp: handle TMR type via flag
8d339b0df229 drm/amdgpu/psp: set autoload support by default
e9e1abb397e5 Revert "drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split"
a78791c2b29e drm/amdgpu: support psp ip block for psp v14
f19cb916151d drm/amdgpu: use spirom update wait_for helper for psp v14
b7a900344546 drm/amd/pm: Allow setting max UCLK on SMU v13.0.6
efe0f34c2bd0 drm/amdgpu: Reduce VA_RESERVED_BOTTOM to 64KB
876fa5f8a066 drm/amdgpu: Add psp v14_0 ip block support
f00c8157b692 drm/amdgpu: Add mp v14_0_2 ip headers (v5)
3459ffe8a8bc drm/amdgpu: Fix implicit assumtion in gfx11 debug flags
5869b32bbeb7 drm/amdkfd: update SIMD distribution algo for GFXIP 9.4.2 onwards
749f1ad0c350 drm/amd/display: Increase ips2_eval delay for DCN35
bfeefe6ea5f1 drm/amd/display: should support dmub hw lock on Replay
ae3986e7276d drm/amd/display: allow psr-su/replay for z8
615fb058726d drm/amdgpu/display: Initialize gamma correction mode variable in dcn30_get_gamcor_current()
fc2d4230e50b drm/amdgpu/soc21: update VCN 4 max HEVC encoding resolution
b5e161e42e0a drm/amd/display: Add shared firmware state for DMUB IPS handshake
616b39467e81 drm/amd/display: fixed integer types and null check locations
a8edc9cc0b14 drm/amd/display: Fix array-index-out-of-bounds in dcn35_clkmgr
bb46122db730 drm/amd/display: Update FIXED_VS Retimer HWSS Test Pattern Sequences
41364afe3670 drm/amd/display: enable fgcg by default
3667c4298b41 drm/amd/display: treat plane clip size change as MED update type
3a6a32b31a11 Revert "drm/amd/display: Send DTBCLK disable message on first commit"
79f3e38f60e5 drm/amd/display: Preserve original aspect ratio in create stream
10cd2bf92b4c drm/amd/display: Fix possible NULL dereference on device remove/driver unload
194bef0cc1f5 Revert "drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz"
1b5078f01b95 drm/amd/display: Add align done check
5d9a16b2a4d9 modpost: trim leading spaces when processing source files list
dae4a0171e25 gen_compile_commands: fix invalid escape sequence warning
e3a9ee963ad8 kbuild: Fix changing ELF file type for output of gen_btf for big endian
6388cfd0e69b docs: kconfig: Fix grammar and formatting
c1c9d0f6f7f1 i2c: i801: Fix block process call transactions
f44bff192685 i2c: pasemi: split driver into two separate modules
3b9ab248bc45 kbuild: use 4-space indentation when followed by conditionals
425b463859ed drm/i915: Update ADL-N PCI IDs
d8bdd795d383 lsm: fix integer overflow in lsm_set_self_attr() syscall
321da3dc1f3c scsi: sd: usb_storage: uas: Access media prior to querying device properties
55ea989977f4 igc: Remove temporary workaround
c56d055893cb igb: Fix string truncation warnings in igb_set_fw_version
761b333718cf drm/xe: Remove exec queue bind.fence_*
2394ac4145ea tracing: Inform kmemleak of saved_cmdlines allocation
e67391ca7aa6 Merge tag 'kvm-riscv-fixes-6.8-1' of https://github.com/kvm-riscv/linux into HEAD
2f8ebe43a025 Merge tag 'kvm-x86-selftests-6.8-rcN' of https://github.com/kvm-x86/linux into HEAD
22d0bc072102 Merge tag 'kvm-x86-fixes-6.8-rcN' of https://github.com/kvm-x86/linux into HEAD
d9b904d2efdf drm/i915/display: update pll values in sync with Bspec for MTL
e37243b65d52 bpf, scripts: Correct GPL license name
e20f378d993b nvmem: include bit index in cell sysfs file name
b11236486749 drm/i915: Add GuC submission interface version query
23d62fb5d368 Merge tag 'iio-fixes-for-6.8a' of http://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus
aa1267e673fe drm: ci: use clk_ignore_unused for apq8016
a64056bb5a32 drm/tests/drm_buddy: add alloc_contiguous test
8746c6c9dfa3 drm/buddy: Fix alloc_range() error handling code
0846dd77c834 powerpc/iommu: Fix the missing iommu_group_put() during platform domain attach
2aa0a5e65eae can: netlink: Fix TDCO calculation using the old data bittiming
efe7cf828039 can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
6cdedc18ba7b can: j1939: prevent deadlock by changing j1939_socks_lock to rwlock
9b23fceb4158 ethernet: cpts: fix function pointer cast warnings
5d07e432cb38 bnad: fix work_queue type mismatch
6cf9ff463317 net: smc: fix spurious error message from __sock_release()
d9a31cdab789 Merge branch '40GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
4276d28e1da6 iosys-map: fix typo
50735922edb6 drm: drm_crtc: correct some comments
4b085736e44d ata: libata-core: Do not try to set sleeping devices to standby
858b31133dbe octeontx2-af: Remove the PF_FUNC validation for NPC transmit rules
eb5c7465c324 RDMA/srpt: fix function pointer cast warnings
852d432a14db ALSA: hda/realtek: cs35l41: Fix order and duplicates in quirks table
b91050448897 ALSA: hda/realtek: cs35l41: Fix device ID / model name
706c1fa1ab09 ALSA: hda/realtek: cs35l41: Add internal speaker support for ASUS UM3402 with missing DSD
ce6b6d151396 riscv: dts: sifive: add missing #interrupt-cells to pmic
8084a5b58929 fbdev/efifb: Remove framebuffer relocation tracking
78aa89d1dfba firmware/sysfb: Update screen_info for relocated EFI framebuffers
784e27f28118 fbdev/efifb: Do not track parent device status
4e754597d603 firmware/sysfb: Create firmware device only for enabled PCI devices
9040d0297a47 fbdev/efifb: Remove PM for parent device
9eac534db001 firmware/sysfb: Set firmware-framebuffer parent device
036105e3a776 video: Provide screen_info_get_pci_dev() to find screen_info's PCI device
75fa9b7e375e video: Add helpers for decoding screen_info
cbecc9fcbbec powerpc/pseries: fix accuracy of stolen time
ea73179e6413 powerpc/ftrace: Ignore ftrace locations in exit text sections
eb6d871f4ba4 powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
f1acb109505d powerpc/kasan: Limit KASAN thread size increase to 32KB
1fba2bf8e9d5 Revert "powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add"
816054f40a5f bcachefs: Fix missing va_end()
2eeccee86dc7 bcachefs: Fix check_version_upgrade()
4e07447503f0 bcachefs: Clamp replicas_required to replicas
8d30528a1709 nvmet: remove superfluous initialization
2127c6043836 xsk: Add truesize to skb_add_rx_frag().
9bc36e58d162 drm/xe: Add uAPI to query GuC firmware submission version
0db0c1770834 ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property
b6ddaa63f728 drm/rockchip: vop2: add a missing unlock in vop2_crtc_atomic_enable()
c22d03a95b0d arm64: dts: rockchip: Correct Indiedroid Nova GPIO Names
c60d847be7b8 KVM: arm64: Fix double-free following kvm_pgtable_stage2_free_unlinked()
6b1f93ea3459 dt-bindings: display: rockchip,dw-hdmi: add power-domains property
0d192c4c72ce dt-bindings: display: rockchip: rockchip,dw-hdmi: remove port property
11f522256e90 bpf: Fix warning for bpf_cpumask in verifier
1bbd894e2ae6 arm64: dts: rockchip: Drop interrupts property from rk3328 pwm-rockchip node
334bf0710c98 arm64: dts: rockchip: set num-cs property for spi on px30
00890f5d15f5 arm64: dts: rockchip: minor rk3588 whitespace cleanup
762195e5c269 drm/panel: st7703: Add Panel Rotation Support
20b18c2be4f3 dt-bindings: display: rocktech,jh057n00900: Document panel rotation
e0c732291250 drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
9913a60f318b dt-bindings: display: Add Powkiddy RGB10MAX3 panel
1e41f11f08bc Merge branch 'selftests-net-more-pmtu-sh-fixes'
20622dc934e1 selftests: net: more pmtu.sh fixes
a71d0908e32f selftests: net: more strict check in net_helper
5d012e512db1 gpu: host1x: bus: make host1x_bus_type const
a7ee79b9c455 selftests: net: cope with slow env in so_txtime.sh test
e58779f47e5e selftests: net: cope with slow env in gro.sh test
be46d7aacf9e drm/xe/vf: Don't support MCR registers if VF
96eb895c7ec6 drm/xe/vf: Don't program PAT if VF
602f9ebf321a drm/xe/vf: Don't enable hwmon if VF
3ed34c655210 drm/xe/vf: Don't check if LMEM is initialized if VF
60da62fbe9af drm/xe/vf: Don't initialize stolen memory manager if VF
18bc97fb4a0c drm/xe/vf: Don't program MOCS if VF
aec14e3370c4 drm/xe/vf: Don't try to capture engine data unavailable to VF
a43d5060086e drm/xe/vf: Assume fixed GSM size if VF
2f6397e448e6 btrfs: don't refill whole delayed refs block reserve when starting transaction
88e81a677730 btrfs: zoned: fix chunk map leak when loading block group zone info
1bd96c92c6a0 btrfs: reject encoded write if inode has nodatasum flag set
feefe1f49d26 btrfs: don't reserve space for checksums when writing to nocow files
9dbe95e28ff1 ASoC: SOF: Intel: pci-tgl/lnl: Change default paths
a6eaa24f1cc2 tracing: Use ring_buffer_record_is_set_on() in tracer_tracing_is_on()
bdbddb109c75 tracing: Fix HAVE_DYNAMIC_FTRACE_WITH_REGS ifdef
29f697533247 nvme: implement support for relaxed effects
f03606470886 riscv: dts: starfive: replace underscores in node names
7e90b5c295ec Merge tag 'trace-tools-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
4e06ec0774f5 dt-bindings: ufs: samsung,exynos-ufs: Add size constraints on "samsung,sysreg"
79bd7eab8366 nvme-fabrics: fix I/O connect error handling
b6802b61a9d0 drm/crtc: fix uninitialized variable use even harder
269e31aecdd0 spi-mxs: Fix chipselect glitch
b671cd3d4563 drm/prime: Support page array >= 4GB
24b6332c2d4f ALSA: hda: Add Lenovo Legion 7i gen7 sound quirk
599b0d8ce6ed drm/i915/selftests: Increasing the sleep time for live_rc6_manual
ce311df91d73 Revert "drm/amd: flush any delayed gfxoff on suspend entry"
226db36032c6 drm/amd: Stop evicting resources on APUs in suspend
fcbe4873089c ASoC: SOF: IPC3: fix message bounds on ipc ops
c40aad7c81e5 ASoC: SOF: ipc4-pcm: Workaround for crashed firmware on system suspend
5b5089e2a1e7 ASoC: q6dsp: fix event handler prototype
b029482011bf ASoC: SOF: Intel: pci-lnl: Change the topology path to intel/sof-ipc4-tplg
d463bcd7eb34 ASoC: SOF: Intel: pci-tgl: Change the default paths and firmware names
e083dd032eeb net: ti: icssg-prueth: add dependency for PTP
b419c5e2d978 Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
3a86cb16ab32 drm/i915: Prevent HW access during init from connector get_modes hooks
5c5a7fa61213 drm/i915: Prevent HW access during init from SDVO TV get_modes hook
00c3959d63ae drm/i915: Add bigjoiner force enable option to debugfs
ab41a31dd5e2 HID: wacom: generic: Avoid reporting a serial of '0' to userspace
25236c91b5ab af_unix: Fix task hung while purging oob_skb in GC.
bdab6c94bb24 HID: Intel-ish-hid: Ishtp: Fix sensor reads after ACPI S3 suspend
af9acbfc2c4b irqchip/gic-v3-its: Fix GICv4.1 VPE affinity update
8b02da04ad97 irqchip/gic-v3-its: Restore quirk probing for ACPI-based systems
846297e11e8a irqchip/gic-v3-its: Handle non-coherent GICv4 redistributors
1741a8269e1c HID: multitouch: Add required quirk for Synaptics 0xcddc device
dbc347ef7f0c ceph: add ceph_cap_unlink_work to fire check_caps() immediately
902d6d013f75 ceph: always queue a writeback when revoking the Fb caps
8929f95b2b58 connector/cn_proc: revert "connector: Fix proc_event_num_listeners count not cleared"
2df8aa3cad40 gpiolib: add gpio_device_get_label() stub for !GPIOLIB
ebe0c15b135b gpiolib: add gpio_device_get_base() stub for !GPIOLIB
6ac86372102b gpiolib: add gpiod_to_gpio_device() stub for !GPIOLIB
98459fb5ab92 drm/xe: fix arguments to drm_err_printer()
8ad032cc8c49 irqchip/qcom-mpm: Fix IS_ERR() vs NULL check in qcom_mpm_init()
f1c2765c6afc irqchip/loongson-eiointc: Use correct struct type in eiointc_domain_alloc()
f1acf1ac84d2 net:rds: Fix possible deadlock in rds_message_put
fa765c4b4aed xen/events: close evtchn after mapping cleanup
b0344d6854d2 irqchip/irq-brcmstb-l2: Add write memory barrier before exit
bf5802238dc1 xen/gntalloc: Replace UAPI 1-element array
b0f2f82c9c16 xen: balloon: make balloon_subsys const
2528dcbea944 xen: pcpu: make xen_pcpu_subsys const
b2c52b8c128e xen/privcmd: Use memdup_array_user() in alloc_ioreq()
379a58caa199 scsi: fnic: Move fnic_fnic_flush_tx() to a work queue
977fe773dcc7 scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
4cbec7e89a41 scsi: target: Fix unmap setup during configuration
9f30831390ed net: add rcu safety to rtnl_prop_list_size()
3e36031cc054 pds_core: no health-thread in VF path
2f74258d997c ionic: minimal work with 0 budget
b344e64fbda3 Merge tag 'amd-drm-next-6.9-2024-02-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
1692b9775e74 net: stmmac: xgmac: use #define for string constants
6ed8187bb36c i40e: take into account XDP Tx queues when stopping rings
89a373e9131d i40e: avoid double calling i40e_pf_rxq_wait()
343bb39e1f25 i40e: Fix wrong mask used during DCB config
c73729b64bb6 i40e: Fix waiting for queues of all VSIs to be disabled
c2b3ec36b422 selftests: net: ip_local_port_range: define IPPROTO_MPTCP
73d9629e1c8c i40e: Do not allow untrusted VF to remove administratively set MAC
d794734c9bbf x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
c664e16bb1ba Merge tag 'docs-6.8-fixes2' of git://git.lwn.net/linux
8fa507083388 mm/memory: Use exception ip to search exception tables
9d6e21ddf202 MIPS: Clear Cause.BD in instruction_pointer_set
11ba1728be3e ptrace: Introduce exception_ip arch hook
d55347bfe4e6 MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
157261c58b28 drm/xe/pt: Allow for stricter type- and range checking
ddc23e6e230e drm/amdgpu/psp: update define to better align with its meaning
040fdcde288a drm/amdgpu: respect the abmlevel module parameter value if it is set
2a3cfb9a24a2 drm/amd/display: fix NULL checks for adev->dm.dc in amdgpu_dm_fini()
c4891d979c76 drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
cff9960317fc drm/amdgpu: Add jpeg_v5_0_0 ip block support
75a178926c99 drm/amdgpu/jpeg5: Enable doorbell
785e53a83be1 drm/amdgpu/jpeg5: add power gating support
9ab1a996dc7f drm/amd/display: Fix possible buffer overflow in 'find_dcfclk_for_voltage()'
bbaf9ed33965 drm/amd/display: Fix possible use of uninitialized 'max_chunks_fbc_mode' in 'calculate_bandwidth()'
8abf2636f68c drm/amd/display: Initialize 'wait_time_microsec' variable in link_dp_training_dpia.c
dfad65c65728 drm/amdgpu: Add JPEG5 support
470675f6bf6a amdgpu/drm: Add vcn_v5_0_0_ip_block support
c37c3bcc0530 drm/amd/display: Fix && vs || typos
fc184dbe9fd9 drm/amdgpu: make damage clips support configurable
b6d1a0632051 drm/amdgpu: add VCN_5_0_0 IP block support
816dae1d697a drm/amdgpu: add VCN_5_0_0 firmware support
5995a22f2e66 drm/amdgpu: Add vcn v5_0_0 ip headers (v5)
ca46c2590918 drm/amdgpu/discovery: Add hdp v7_0 ip block
f3bcdf2d90c1 drm/amdgpu: Add hdp v7_0 ip block support
5fb2f479b010 drm/amdgpu: Add hdp v7_0_0 ip headers (v3)
56018e836352 drm/amdgpu/discovery: Add ih v7_0 ip block
12443fc53e7d drm/amdgpu: Add ih v7_0 ip block support
0a119d53f74a drm/amdgpu/jpeg: add support for jpeg DPG mode
617efef4af1c drm/amdgpu: add ucode id for jpeg DPG support
33c0c80ae5e9 drm/amdgpu: Add osssys v7_0_0 ip headers (v4)
39df603d2cf0 drm/amdgpu/discovery: Add lsdma v7_0 ip block
aa2fb2360582 drm/amdgpu: Add lsdma v7_0 ip block support
f902bf5dd4af drm/amdgpu: Add lsdma v7_0_0 ip headers (v3)
f579c06bdc9b drm/amdgpu: send smu rma reason event in ras eeprom driver
e3bfb8d9179e drm/amdgpu: implement smu send rma reason for smu v13.0.6
53edf77179f3 drm/amdgpu: Add athub v4_1_0 ip block support
0be41f31a907 drm/amdgpu: Add athub v4_1_0 ip headers (v5)
b35c3feafea4 drm/amdgpu: support rlc auotload type set
45b801c24cb3 drm/amdgpu: skip ucode bo reserve for RLC AUTOLOAD
a4aaf6a0333b drm/amd/swsmu: add judgement for vcn jpeg dpm set
172781696176 drm/amdkfd: Fix L2 cache size reporting in GFX9.4.3
804bf74b1683 drm/amdkfd: pass debug exceptions to second-level trap handler
7f9dde788400 drm/amdkfd: fill in data for control stack header for gfx10
3693bb4465e6 x86/xen: Add some null pointer checking to smp.c
8bde59b20de0 smb: client: handle path separator of created SMB symlinks
4508ec173570 smb: client: set correct id, uid and cruid for multiuser automounts
f8237c8c6a0e drm/xe: use drm based debugging instead of dev
7d8c67dd5d4f xen/xenbus: document will_handle argument for xenbus_watch_path()
83ef106fa732 i2c: qcom-geni: Correct I2C TRE sequence
f7fe85b229bc ASoC: amd: yc: Fix non-functional mic on Lenovo 82UU
716f4aaa7b48 Merge tag 'vfs-6.8-rc5.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
2c80a2b715df nouveau/svm: fix kvcalloc() argument order
2f0dbb24f78a regmap: kunit: Ensure that changed bytes are actually different
8f44e3808200 spi: intel-pci: Add support for Lunar Lake-M SPI serial flash
e56c671c2272 spi: omap2-mcspi: Revert FIFO support without DMA
d6755a53b8dd ASoC: rt5645: Add DMI quirk for inverted jack-detect on MeeGoPad T8
551539a8606e ASoC: rt5645: Make LattePanda board DMI match more precise
5b3fbd61b9d1 net: sysfs: Fix /sys/class/net/<iface> path for statistics
d2435a8e3d68 drm/i915: Add flex arrays to struct i915_syncmap
5ba4e6d5863c RDMA/qedr: Fix qedr_create_user_qp error flow
247f2ee4498c drm/xe: Fix a missing argument to drm_err_printer
a1d8700d9064 drm/nouveau: omit to create schedulers using the legacy uAPI
9a0c32d698c1 drm/nouveau: don't fini scheduler if not initialized
603604c8be42 Merge branch 'mptcp-misc-fixes'
68990d006d42 MAINTAINERS: update Geliang's email address
337cebbd850f mptcp: really cope with fastopen race
f012d796a6de mptcp: check addrs list in userspace_pm_get_local_id
e4a0fa47e816 mptcp: corner case locking for rx path fields initialization
3f83d8a77eee mptcp: fix more tx path fields initialization
013e3179dbd2 mptcp: fix rcv space initialization
bdd70eb68913 mptcp: drop the push_pending field
826eafebf68b drm/tests: mm: Convert to drm_dbg_printer
b5f319360371 tools/rtla: Exit with EXIT_SUCCESS when help is invoked
14f08c976ffe tools/rtla: Replace setting prio with nice for SCHED_OTHER
bab091d54600 Merge branch 'net-misplaced-fields'
c353c7b7ffb7 net-device: move lstats in net_device_read_txrx
666a877deab2 tcp: move tp->tcp_usec_ts to tcp_sock_read_txrx group
119ff04864a2 tcp: move tp->scaling_ratio to tcp_sock_read_txrx group
ad26d56d0807 drm/i915/dp: Limit SST link rate to <=8.1Gbps
962ac2dce56b drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg address
61ec586bc081 tools/rv: Fix curr_reactor uninitialized variable
f9b2c87105c9 tools/rv: Fix Makefile compiler options for clang
084ce16df0f0 tools/rtla: Remove unused sched_getattr() function
30369084ac6e tools/rtla: Fix clang warning about mount_point var size
64dc40f75233 tools/rtla: Fix uninitialized bucket/data->bucket_size warning
bc4cbc9d260b tools/rtla: Fix Makefile compiler options for clang
423af970da74 drm/lima: standardize debug messages by ip name
9e5690a16fc2 drm/lima: increase default job timeout to 10s
e721d1cc8101 drm/lima: remove guilty drm_sched context handling
53cb55b20208 drm/lima: handle spurious timeouts due to high irq latency
27aa58ec85f9 drm/lima: set gp bus_stop bit before hard reset
a9da58c86e3b drm/lima: set pp bus_stop bit before hard reset
2ccd4adc681e drm/lima: reset async_reset on gp hard reset
b5b345ea9b3e drm/lima: reset async_reset on pp hard reset
28083ff18d3f accel/ivpu: Fix DevTLB errors on suspend/resume and recovery
0de62399883d Merge tag 'drm-misc-next-2024-02-08' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
8c41be259973 ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT
79520587fe42 cifs: update the same create_guid on replay
cffe487026be cifs: fix underflow in parse_server_interfaces()
841c35169323 Linux 6.8-rc4
2766f59ca44e Merge tag 'timers_urgent_for_v6.8_rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
c021e191cf3d Merge tag 'x86_urgent_for_v6.8_rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
c4b603c6e2df ASoC: SOF: amd: Fix locking in ACP IRQ handler
6ef5d5b92f71 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
b3aa619a8b47 spi: ppc4xx: Drop write-only variable
de4af897ddf2 spi: ppc4xx: Fix fallout from rename in struct spi_bitbang
6f98e44984d5 spi: ppc4xx: Fix fallout from include cleanup
930375d34de6 ASoC: Intel: cht_bsw_rt5645: Cleanup codec_name handling
7d99a70b6595 ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards
7521f258ea30 Merge tag 'mm-hotfixes-stable-2024-02-10-11-16' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
04eb57930e4e bcachefs: fix missing endiannes conversion in sb_members
7dcfb87af973 bcachefs: fix kmemleak in __bch2_read_super error handling path
1a1c93e7f814 bcachefs: Fix missing bch2_err_class() calls
78e563f2d629 Merge branch 'tls-fixes'
ac437a51ce66 net: tls: fix returned read length with async decrypt
49d821064c44 selftests: tls: use exact comparison in recv_partial
32b55c5ff910 net: tls: fix use-after-free with partial reads and async decrypt
859054147318 net: tls: handle backlogging of crypto requests
e01e3934a1b2 tls: fix race between tx work scheduling and socket close
aec7961916f3 tls: fix race between async notify and socket close
c57ca512f3b6 net: tls: factor out tls_*crypt_async_wait()
78367c32bebf iio: adc: ad4130: only set GPIO_CTRL if pin is unused
a22b0a2be69a iio: adc: ad4130: zero-initialize clock init data
a5b6244cf87c Merge tag 'block-6.8-2024-02-10' of git://git.kernel.dk/linux
a38ff5bbf979 Merge tag 'firewire-fixes-6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
5a7ec87063c0 Merge tag '6.8-rc3-ksmbd-server-fixes' of git://git.samba.org/ksmbd
7e4a205fe56b Revert "get rid of DCACHE_GENOCIDE"
4a7bbe7519b6 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
ca00c700c521 Merge tag '6.8-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
e1e3f530a17f Merge tag 'ceph-for-6.8-rc4' of https://github.com/ceph/ceph-client
a2343df3fb1e Merge tag 'ntfs3_for_6.8' of https://github.com/Paragon-Software-Group/linux-ntfs3
4356e9f841f7 work around gcc bugs with 'asm goto' with outputs
2fbdc5c6b130 Merge branch 'net-fix-module_description-for-net-p5'
6034e059f5d3 net: fill in MODULE_DESCRIPTION()s for dsa_loop_bdinfo
830bd88cc151 net: fill in MODULE_DESCRIPTION()s for ipvtap
a46c31bf2744 net: fill in MODULE_DESCRIPTION()s for net/sched
b058a5d25d92 net: fill in MODULE_DESCRIPTION()s for ipv4 modules
92ab08eb63bb net: fill in MODULE_DESCRIPTION()s for ipv6 modules
2898f3075e6a net: fill in MODULE_DESCRIPTION()s for 6LoWPAN
6e2cf0eb6926 net: fill in MODULE_DESCRIPTION()s for af_key
f73f55b0fcff net: fill in MODULE_DESCRIPTION()s for mpoa
2599bb5e0c74 net: fill in MODULE_DESCRIPTION()s for xfrm
15faa1f67ab4 lan966x: Fix crash when adding interface under a lag
aae09a6c7783 net/sched: act_mirred: Don't zero blockid when net device is being deleted
6a12401b65a5 Merge branch 'net-openvswitch-limit-the-recursions-from-action-sets'
bd128f62c365 selftests: openvswitch: Add validation for the recursion test
6e2f90d31fe0 net: openvswitch: limit the number of recursions from action sets
a5cc98eba259 smb3: clarify mount warning
a39c757bf059 cifs: handle cases where multiple sessions share connection
c6e02eefd6ac cifs: change tcon status when need_reconnect is set on it
7edd06233958 drivers/ps3: select VIDEO to provide cmdline functions
d02bfae3646a Merge branch 'selftests-forwarding-various-fixes'
f97f1fcc9690 selftests: forwarding: Fix bridge locked port test flakiness
dd6b34589441 selftests: forwarding: Suppress grep warnings
7399e2ce4d42 selftests: forwarding: Fix bridge MDB test flakiness
93590849a05e selftests: forwarding: Fix layer 2 miss test flakiness
38ee0cb2a2e2 selftests: net: Fix bridge backup port test flakiness
12c5128f101b btrfs: add new unused block groups to the list of unused block groups
f4a9f219411f btrfs: do not delete unused block group if it may be used soon
1693d5442c45 btrfs: add and use helper to check if block group is used
5571e41ec6e5 btrfs: don't drop extent_map for free space inode on write error
9ed18b0b7765 Merge tag 'riscv-for-linus-6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
ca8a66738a44 Merge tag 'trace-v6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
6dc512a0a22e Merge tag 'probes-fixes-v6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
41044d536068 PCI: Fix active state requirement in PME polling
e6f39a90de92 Merge tag 'efi-fixes-for-v6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
5ddfc2460611 Merge tag 'pci-v6.8-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
5ca243c23ee1 Merge tag 'hwmon-for-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
eb747bcc3611 Merge tag 'mmc-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
3760081ff414 Merge tag 'pmdomain-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm
4a8e4b3c2741 Merge tag 'gpio-fixes-for-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
c76b766ec50d Merge tag 'drm-fixes-2024-02-09' of git://anongit.freedesktop.org/drm/drm
50572064ec71 perf/arm-cmn: Workaround AmpereOneX errata AC04_MESH_1 (incorrect child count)
f9daab0ad01c arm64: jump_label: use constraints "Si" instead of "i"
c0b26c06ed00 arm64: fix typo in comments
719da04f2d12 perf: CXL: fix mismatched cpmu event opcode
61da7c8e2a60 arm64/signal: Don't assume that TIF_SVE means we saved SVE state
f6a1892585cd x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
9f208e097801 spi: spi-ppc4xx: include missing platform_device.h
727b943263dc ASoC: cs35l56: Remove default from IRQ1_CFG register
124468af7e76 s390/configs: update default configurations
027790f61132 s390/configs: enable INIT_STACK_ALL_ZERO in all configurations
7f8b81ca35f9 s390/configs: provide compat topic configuration target
e5aa6d51a2ef ALSA: hda/cs35l56: select intended config FW_CS_DSP
cd1f0d3df26a drm/i915/dvo: Use sizeof(*variable) instead of sizeof(type)
8dc0e7dfc5aa drm/i915/dvo/ns2501: Nuke pointless casts
1db5efe51f94 drm/i915/wm: Use per-device debugs ilk wm code
167712d82aad drm/i915/wm: Use per-device debugs in pre-ilk wm code
29d7a5b4d224 drm/i915/wm: Pass the whole i915 to intel_get_cxsr_latency()
8c9e4f68b861 drm/i915/hdcp: Use per-device debugs
ff9bc20cd21c drm/i915/bios: Use per-device debugs for VBT related stuff
abe6af1627c7 drm/i915/bios: Switch to kms debugs
5f67258c0872 drm/i915/fb: Use per-device debugs
0128e89a9163 drm/i915/color: Use per-device debugs
ca93f9f3a8d6 drm/i915/sdvo: Fix up code alignment
dff8f3f85a1b drm/i915/sdvo: Convert to per-device debugs
c9950a5d5056 drm/i915: Correct for_each_old_global_obj_in_state() arguments
6061811d72e1 drm/i915/dp: Limit SST link rate to <=8.1Gbps
44dc5c41b5b1 tracing: Fix wasted memory in saved_cmdlines logic
8f1e0d791b52 of: property: Add in-ports/out-ports support to of_graph_get_port_parent()
782bfd03c3ae of: property: Improve finding the supplier of a remote-endpoint property
f4653ec9861c of: property: Improve finding the consumer of a remote-endpoint property
63fb531fbfda drm/xe/display: fix i915_gem_object_is_shmem() wrapper
7d708c145b26 Revert "usb: dwc3: Support EBC feature of DWC_usb31"
a8b9cf62ade1 ftrace: Fix DIRECT_CALLS to use SAVE_REGS by default
e154c4fc7bf2 drm: remove drm_debug_printer in favor of drm_dbg_printer
e7835e023f84 drm/xe: switch from drm_debug_printer() to device specific drm_dbg_printer()
d2dda3bf5c15 drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()
d50892a9554c drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()
2e61504fd1c3 drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
3b32a1b9fade drm/mode: switch from drm_debug_printer() to device specific drm_dbg_printer()
6470aac024a0 drm/dp_mst: switch from drm_debug_printer() to device specific drm_dbg_printer()
9fd6f61a297e drm/print: add drm_dbg_printer() for drm device specific printer
82195d48b77c drm/print: move enum drm_debug_category etc. earlier in drm_print.h
5e0c04c8c40b drm/print: make drm_err_printer() device specific by using drm_err()
27b8f91c08d9 drm/bridge: remove ->get_edid callback
bf6def0c5757 drm/bridge: ti-sn65dsi86: switch to ->edid_read callback
d1a5af987a1d drm/bridge: tc358767: switch to ->edid_read callback
867a3ad827df drm/bridge: tc358767: update the EDID property
758abe988cf3 drm: bridge: dw_hdmi: clear the EDID property and CEC address on failures
6ebe4020fb66 drm: bridge: dw_hdmi: switch to ->edid_read callback
56e7ce5dcdee drm: adv7511: switch to ->edid_read callback
d4fb6c44cbc6 drm: xlnx: zynqmp_dpsub: switch to ->edid_read callback
46876af3a4bb drm/omap/hdmi5: switch to ->edid_read callback
13a9e2beb817 drm/omap/hdmi4: switch to ->edid_read callback
18701c50d661 drm/msm/hdmi: switch to ->edid_read callback
604aa950b721 drm/msm/hdmi: fix indent
ada5281ace6f drm/mediatek/hdmi: switch to ->edid_read callback
0c13bd9bf444 drm/mediatek/dp: switch to ->edid_read callback
ac2854ddfa69 drm/bridge: sii902x: switch to ->edid_read callback
3de47e1309c2 drm/bridge: sii902x: use display info is_hdmi
d0f1fd3a2900 drm/bridge: nxp-ptn3460: switch to ->edid_read callback
e3cbc95fb586 drm/bridge: megachips: switch to ->edid_read callback
26b2ddd8dc3c drm/bridge: lt9611uxc: switch to ->edid_read callback
231e330fb1ba drm/bridge: lt9611: switch to ->edid_read callback
1d83b43e1eb4 drm: bridge: it66121: switch to ->edid_read callback
9ed8ba5a6ea6 drm/bridge: it6505: switch to ->edid_read callback
183ea1e1ace4 drm/bridge: display-connector: switch to ->edid_read callback
1b48b6c41ffc drm/bridge: cdns-mhdp8546: clear the EDID property on failures
9da5f1048db1 drm/bridge: cdns-mhdp8546: switch to ->edid_read callback
939857d69bcf drm/bridge: anx7625: switch to ->edid_read callback
f072b272aa27 RISC-V: KVM: Use correct restricted types
3752219b6007 RISC-V: paravirt: Use correct restricted types
17c8e9ac95d8 RISC-V: paravirt: steal_time should be static
c0ec2a712daf crypto: virtio/akcipher - Fix stack overflow on memcpy
02d9009f4e8c selftests: net: add more missing kernel config
4ab18af47a2c devlink: Fix command annotation documentation
9b0ed890ac2a bonding: do not report NETDEV_XDP_ACT_XSK_ZEROCOPY
4e1d71cabb19 net/handshake: Fix handshake_req_destroy_test1
aa1eec2f546f net/mlx5: DPLL, Fix possible use after free after delayed work timer triggers
53c0441dd2c4 dpll: fix possible deadlock during netlink dump operation
311520887d7c Merge tag 'drm-msm-fixes-2024-02-07' of https://gitlab.freedesktop.org/drm/msm into drm-fixes
b30bed9d0012 Merge tag 'amd-drm-fixes-6.8-2024-02-08' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
9da93fe430aa Merge tag 'drm-intel-fixes-2024-02-08' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
60c16201b680 Merge tag 'drm-xe-fixes-2024-02-08' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
6c2bf9ca24a4 Merge tag 'drm-misc-fixes-2024-02-08' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
1f719a2f3fa6 Merge tag 'net-6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
b0d5d0f73761 Merge tag 'pinctrl-v6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
5f63a493b99c Merge tag 'nvme-6.8-2023-02-08' of git://git.infradead.org/nvme into block-6.8
82bd83a0cf7a drm/xe/irq: allocate all possible msix interrupts
4ce6e2db00de virtio-blk: Ensure no requests in virtqueues before deleting vqs.
c23de7ceae59 docs: kernel_feat.py: fix build error for missing files
2a427b49d029 blk-iocost: Fix an UBSAN shift-out-of-bounds warning
55c7788c3724 smb: client: set correct d_type for reparse points under DFS mounts
45be0882c5f9 smb3: add missing null server pointer check
3ca8fbabcceb Revert "kobject: Remove redundant checks for whether ktype is NULL"
eb538b557425 drm/xe/vm: Avoid reserving zero fences
3ce7384048fa drm/bridge: remove drm_bridge_get_edid() in favour of drm_bridge_edid_read()
b334be86c64c drm/meson: switch to drm_bridge_edid_read()
d61f65159eee drm/bridge: tfp410: clear the EDID property on failures
7b90330f20bf drm/bridge: tfp410: use drm_bridge_edid_read()
400bb4ee97b4 drm: bridge: simple-bridge: clear the EDID property on failures
0d966d59d1e5 drm: bridge: simple-bridge: use drm_bridge_edid_read()
392b6e9a3c02 drm/bridge: lt9611uxc: use drm_bridge_edid_read()
4f7ad8cca619 drm/bridge: lt8912b: use ->edid_read callback
29e032296da5 drm/bridge: lt8912b: clear the EDID property on failures
60d1fe1a7f30 drm/bridge: lt8912b: use drm_bridge_edid_read()
348803ae4e59 drm/bridge: chrontel-ch7033: switch to drm_bridge_edid_read()
f7930e64c1eb drm/bridge: switch to drm_bridge_edid_read()
d807ad80d811 drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
9efd24ec5599 kprobes: Remove unnecessary initial values of variables
9a571c1e275c tracing/probes: Fix to set arg size and fmt after setting type from BTF
8c427cc2fa73 tracing/probes: Fix to show a parse error for bad type for $comm
d7332c4a4f1a ASoC: SOF: ipc3-topology: Fix pipeline tear down logic
c14f09f010cc ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization
b7198383ef2d wifi: iwlwifi: mvm: fix a crash when we run out of stations
65c6ee904550 wifi: iwlwifi: uninitialized variable in iwl_acpi_get_ppag_table()
c6ebb5b67641 wifi: iwlwifi: Fix some error codes
3012477cd510 wifi: iwlwifi: clear link_id in time_event
2e57b77583ca wifi: iwlwifi: mvm: use correct address 3 in A-MSDU
c98d8836b817 wifi: mac80211: reload info pointer in ieee80211_tx_dequeue()
63e4b9d693e0 Merge tag 'nf-24-02-08' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
5a8cdf6fd860 netfilter: nft_set_pipapo: remove scratch_aligned pointer
47b1c03c3c1a netfilter: nft_set_pipapo: add helper to release pcpu scratch area
76313d1a4aa9 netfilter: nft_set_pipapo: store index in scratch maps
60c0c230c6f0 netfilter: nft_set_rbtree: skip end interval element from gc
f82777e8ce6c netfilter: nfnetlink_queue: un-break NF_REPEAT
7395dfacfff6 netfilter: nf_tables: use timestamp to check for set element timeout
38ed1c7062ad netfilter: nft_ct: reject direction for ct id
fa173a1b4e3f netfilter: ctnetlink: fix filtering for zone 0
2fe8a236436f s390/qeth: Fix potential loss of L3-IP@ in case of network issues
27c5a095e251 netfilter: ipset: Missing gc cancellations fixed
db010ff6700f octeontx2-af: Initialize maps.
03fa49a386b2 Merge branch 'cpsw-enable-mac_managed_pm-to-fix-mdio'
bc4ce46b1e3d net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
9def04e759ca net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
6074be620c31 drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg address
2526dffc6d65 gpio: remove GPIO device from the list unconditionally in error path
ab0beafd52b9 netfilter: nft_set_pipapo: remove static in nft_pipapo_get()
e5dbaa9f43ea drm/i915/display: On Xe2 always enable decompression with tile4
bf4c27b8267d drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
9e3fc1d65d4e drm/xe/vm: don't ignore error when in_kthread
95c058c8ef1d drm/xe: Assume large page size if VMA not yet bound
11572b3f68d9 drm/xe/display: Fix memleak in display initialization
3aa3c5c24908 drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
90773aaf9129 drm/xe: circumvent bogus stringop-overflow warning
21abf108a062 drm/xe: Pick correct userptr VMA to repin on REMAP op failure
fc29b6d5ab53 drm/xe: Take a reference in xe_exec_queue_last_fence_get()
ddc7d4c58470 drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
855678ed8534 md: Fix missing release of 'active_io' for flush
047371968ffc Merge tag 'v6.8-p3' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
860d7dcb2010 Merge tag 'percpu-for-6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu
5bc09b397cbf nilfs2: fix potential bug in end_buffer_async_write
b9e4bc1046d2 mm/damon/sysfs-schemes: fix wrong DAMOS tried regions update timeout setup
38296afe3c6e nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
6f1f15a5e492 MAINTAINERS: Leo Yan has moved
27d3969b47cc mm/zswap: don't return LRU_SKIP if we have dropped lru lock
79d72c68c587 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
f20760320967 mailmap: switch email address for John Moon
2e601e1e8e4b mm: zswap: fix objcg use-after-free in entry destruction
4c2da3188b84 mm/madvise: don't forget to leave lazy MMU mode in madvise_cold_or_pageout_pte_range()
e870920bbe68 arch/arm/mm: fix major fault accounting when retrying under per-VMA lock
01c1484ac047 selftests: core: include linux/close_range.h for CLOSE_RANGE_* macros
2fde9e7f9e6d mm/memory-failure: fix crash in split_huge_page_to_list from soft_offline_page
9cee7e8ef3e3 mm: memcg: optimize parent iteration in memcg_rstat_updated()
67b8bcbaed47 nilfs2: fix data corruption in dsync block recovery for small block sizes
56ae10cf628b mm/userfaultfd: UFFDIO_MOVE implementation should use ptep_get()
c1be35a16b2f exit: wait_task_zombie: kill the no longer necessary spin_lock_irq(siglock)
7601df8031fd fs/proc: do_task_stat: use sig->stats_lock to gather the threads/children stats
60f92acb60a9 fs/proc: do_task_stat: move thread_group_cputime_adjusted() outside of lock_task_sighand()
f7ec1cd5cc7e getrusage: use sig->stats_lock rather than lock_task_sighand()
daa694e41375 getrusage: move thread_group_cputime_adjusted() outside of lock_task_sighand()
e656c7a9e596 mm: hugetlb pages should not be reserved by shmat() if SHM_NORESERVE
108a020c6443 ksmbd: free aux buffer if ksmbd_iov_pin_rsp_read fails
a12bc36032a2 ksmbd: Add kernel-doc for ksmbd_extract_sharename() function
4054705215ad nvme: use ns->head->pi_size instead of t10_pi_tuple structure size
534c8a5b9d5d drm/amdgpu: Fix HDP flush for VFs on nbio v7.9
58fca355ad37 drm/amd/display: Implement bounds check for stream encoder creation in DCN301
e63e35f0164c drm/amd/display: Increase frame-larger-than for all display_mode_vba files
da48914e1fcd drm/amd/display: Clear phantom stream count and plane count
55173942a636 drm/amdgpu: Avoid fetching VRAM vendor info
29c5da1a1246 drm/amd/display: Disable ODM by default for DCN35
ca8179ba11f2 drm/amd/display: Update phantom pipe enable / disable sequence
e6a7df96facd drm/amd/display: Fix MST Null Ptr for RV
2dcf82a8e8dc drm/amdgpu: Fix shared buff copy to user
280df4996c2b drm/amd/display: Increase eval/entry delay for DCN35
897925dcc5df drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend
6ef82ac664bb drm/amdgpu: reset gpu for s3 suspend abort case
93bafa32a691 drm/amdgpu: skip to program GFXDEC registers for suspend abort
2103370afba7 drm/amd/display: set odm_combine_policy based on context in dcn32 resource
66951d98d9bf drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
e96fddb32931 drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
6badfc463d60 drm/xe: Avoid cryptic message when there's no GuC definition
45883418969c drm/xe: Always allow to override firmware
d694b754894c netfilter: nft_compat: restrict match/target protocol to u16
292781c3c548 netfilter: nft_compat: reject unused compat flag
36fa8d697132 netfilter: nft_compat: narrow down revision to unsigned 8-bits
46f5ab762d04 fs: relax mount_setattr() permission checks
67057f48df79 PCI: dwc: Clean up dw_pcie_ep_raise_msi_irq() alignment
b5d1b4b46f85 PCI: dwc: Fix a 64bit bug in dw_pcie_ep_raise_msix_irq()
e8c263ed6de8 nvme-core: fix comment to reflect right functions
335bac1daae3 Merge tag 'wireless-2024-02-06' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless
1f4137e882c6 nvme: move passthrough logging attribute to head
3951f6add519 riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask
ddccaf79b3af kunit: device: Unregister the kunit_bus on shutdown
547ab8fc4cb0 Merge tag 'loongarch-fixes-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
2cf963787529 riscv: declare overflow_stack as exported from traps.c
ce68c035457b riscv: Fix arch_hugetlb_migration_supported() for NAPOT
5c24ba20555a Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
c8d80f83de47 Merge tag 'nfsd-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
d5597444032b drm/amdgpu: Fix HDP flush for VFs on nbio v7.9
15dba12c5659 drm/amd/display: Implement bounds check for stream encoder creation in DCN301
321036db915b drm/amd/display: Increase frame-larger-than for all display_mode_vba files
3cafcc93cfef drm/amd/display: Clear phantom stream count and plane count
04e1ef8aba14 drm/amd/display: Simplify the calculation of variables
3d1554d99983 drm/amdgpu: Avoid fetching VRAM vendor info
3fa6352415e1 drm/amd/display: 3.2.271
c7b33856139d drm/amd/display: Drop some unnecessary guards
c84dff70e16d drm/amd/display: Trivial code style adjustment
dddb3e5a6df5 drm/amd/display: Disable ODM by default for DCN35
22c3b09ef2ff drm/amd/display: Drop legacy code
6a068e64fb25 drm/amd/display: Update phantom pipe enable / disable sequence
0701117efd1e Revert "drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel"
84d2ae7ca0e5 drm/amd/display: Adjust set_p_state calls to fix logging
461bf81a1016 drm/amd/display: Add delay before logging clks from hw
1b5b72b4d67c drm/amd/display: Fix MST Null Ptr for RV
d5aaa9dbb28f drm/amd/display: correct comment in set_default_brightness_aux()
288c0254a0b0 drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split
ead4c6b94d9b drm/amd/display: Add debug option to force 1-tap chroma subsampling
6226a5aa7737 drm/amd/display: Disable idle reallow as part of command/gpint execution
28b34ad207cc drm/amdgpu: Fix shared buff copy to user
7f6f92b1036f drm/amd/display: Increase eval/entry delay for DCN35
c2359c6d7f4d drm/amd/display: Disable timeout in more places for dc_dmub_srv
cdb637d33957 drm/amdgpu: Fix potential out-of-bounds access in 'amdgpu_discovery_reg_base_init()'
015bae7d2957 drm/amd/pm: Retrieve UMC ODECC error count from aca bank
a9b1a4f684b3 drm/amd/display: Add more checks for exiting idle in DC
db8391479f44 drm/amd/display: correct static screen event mask
0a8ff0cbee35 drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend
3f719cf22f56 drm/amdgpu: reset gpu for s3 suspend abort case
0326de4c444a drm/amdgpu: skip to program GFXDEC registers for suspend abort
0a5fd7811a17 drm/amd/display: set odm_combine_policy based on context in dcn32 resource
70efd0422021 drm/amd/display: Don't perform rate toggle on DP2-capable FIXED_VS retimers
5a2df8ecba86 drm/amdkfd: Add cache line sizes to KFD topology
2e7ef37c7ca8 drm/amd/display: Remove Legacy FIXED_VS Transparent LT Sequence
63d0b87213a0 drm/amd/display: add panel_power_savings sysfs entry to eDP connectors
75428f537d7c net: intel: fix old compiler regressions
5001bfe927b5 MAINTAINERS: Maintainer change for rds
44d3b8a19b91 ASoC: Intel: avs: Fix dynamic port assignment when TDM is set
aeaf3e6cf842 drm/amdgpu: Clear the hotplug interrupt ack bit before hpd initialization
39a82d304b63 drm/amdgpu: fix typo in parameter description
3fad1565720f drm/amdgpu: Only create mes event log debugfs when mes is enabled
fb5a3d037082 drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
886571d217d7 drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
fb38ad0aab41 drm/amdgpu/pm: Use inline function for IP version check
07045648c07c ceph: always check dir caps asynchronously
cda4672da1c2 ceph: prevent use-after-free in encode_cap_msg()
51c161008e04 Merge tag 'icc-6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-linus
bbb20ea993f4 ceph: always set initial i_blkbits to CEPH_FSCRYPT_BLOCK_SHIFT
8e46a2d068c9 libceph: just wait for more data to be available on the socket
ee97302fbc0c libceph: rename read_sparse_msg_*() to read_partial_sparse_msg_*()
cd7d469c2570 libceph: fail sparse-read if the data length doesn't match
4b00d0c513da selftests: cmsg_ipv6: repeat the exact packet
ef8d8df3cb06 drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
7717fc5b22e5 drm: xlnx: zynqmp_dpsub: Clear status register ASAP
b214b37c902d drm: xlnx: zynqmp_dpsub: Fix timing for live mode
e8ef91f14db1 drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
0e85f1ae4ac6 Merge drm/drm-next into drm-misc-next
7011b51f13b3 regmap: kunit: fix raw noinc write test wrapping
2c8ba564a42c drm: mipi-dsi: make mipi_dsi_bus_type const
78cb1f1d19b6 drm: display: make dp_aux_bus_type const
64353af49fec ASoC: cs42l43: Add system suspend ops to disable IRQ
d1722057477a ASoC: cs42l43: Handle error from devm_pm_runtime_enable
c4ae9fd0de44 drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
aaf7f8099683 drm/panel: re-alphabetize the menu list
c9424076d764 drm/panel: simple: push blanking limit on RK32FN48H
536090b695c4 drm/panel: simple: fix flags on RK043FN48H
38cc3c6dcc09 net: stmmac: protect updates of 64-bit statistics counters
6d280f4d760e Merge tag 'for-6.8-rc3-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
449c2d5948ba drm/i915/alpm: Alpm aux wake configuration for lnl
29f3067a236a drm/i915/alpm: Calculate ALPM Entry check
96a24945731f drm/i915/psr: Add alpm_parameters struct
4ee30a448255 drm/i915/alpm: Add ALPM register definitions
cb88cb53badb ppp_async: limit MRU to 64K
58086721b778 devlink: avoid potential loop in devlink_rel_nested_in_notify_work()
1279f9d9dec2 af_unix: Call kfree_skb() for dead unix_(sk)->oob_skb in GC.
97cf301fa42e riscv: Flush the tlb when a page directory is freed
829388b725f8 kunit: device: Unregister the kunit_bus on shutdown
074146f45783 drm/i915: Annotate more of the BIOS fb takeover failure paths
a8153627520a drm/i915: Try to relocate the BIOS fb to the start of ggtt
ea5e150ac2cf drm/i915: Tweak BIOS fb reuse check
f1ee98cff3d8 drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
30865e4abb79 drm/i915: Simplify intel_initial_plane_config() calling convention
6bfdb06d1efa drm/i915: Split the smem and lmem plane readout apart
27fbcaf7ca24 drm/i915: s/phys_base/dma_addr/
f46fb69489f5 drm/i915: Fix MTL initial plane readout
d74f3a930c1d drm/i915: Fix region start during initial plane readout
6b757e1d420c drm/i915: Fix PTE decode during initial plane readout
f8ae1d5291c3 drm/i915: Rename the DSM/GSM registers
be5e8dc84f61 drm/i915: Disable the "binder"
c08c364102d0 drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
8f7cf0a215b3 drm/i915: Remove ad-hoc lmem/stolen debugs
2ab1fe53e298 drm/i915: Print memory region info during probe
3c0fa9f4ec22 drm/i915: Use struct resource for memory region IO as well
7ed4380009e9 firewire: core: send bus reset promptly on gap count error
82b143aeb169 Revert "parisc: Only list existing CPUs in cpu_possible_mask"
6fd78beed021 KVM: selftests: Don't assert on exact number of 4KiB in dirty log split test
ba58f873cdee KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
d9890c028d66 drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
f814bdda774c blk-wbt: Fix detection of dirty-throttled tasks
853b8d7597ee remap_range: merge do_clone_file_range() into vfs_clone_file_range()
4bbcbc6ea2fa iommufd/iova_bitmap: Consider page offset for the pages to be pinned
fe13166f0562 iommufd/selftest: Add mock IO hugepages tests
7db521e23fe9 iommufd/selftest: Hugepage mock domain support
02a8c61a8b06 iommufd/selftest: Refactor mock_domain_read_and_clear_dirty()
407fc184f0e0 iommufd/selftest: Refactor dirty bitmap tests
2780025e01e2 iommufd/iova_bitmap: Handle recording beyond the mapped pages
42af95114535 iommufd/selftest: Test u64 unaligned bitmaps
d18411ec3057 iommufd/iova_bitmap: Switch iova_bitmap::bitmap to an u8 array
a4ab7dedaee0 iommufd/iova_bitmap: Bounds check mapped::pages access
c1d6708bf0d3 HID: wacom: Do not register input devices until after hid_hw_start
411a20db905b HID: logitech-hidpp: Do not flood kernel log
b55fe36efc22 Merge tag 'thunderbolt-for-v6.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
7be50f2e8f20 serial: mxs-auart: fix tx
3ee07964d407 serial: core: introduce uart_port_tx_flags()
720e78d7fa0f serial: 8250_pci1xxxx: partially revert off by one patch
95ec8c1d6c9a drm/xe/pm: add debug logs for D3cold
404669db6010 drm/xe/hwmon: Refactor xe hwmon
1ce2654d87e2 net: stmmac: xgmac: fix a typo of register name in DPP safety handling
5f8408aca667 accel/ivpu: Add job status for jobs aborted by the driver
553099da4539 accel/ivpu/40xx: Stop passing SKU boot parameters to FW
a939c03d3778 accel/ivpu/40xx: Enable D0i3 message
a7f31091ddf4 accel/ivpu: Disable d3hot_delay on all NPU generations
b039f1c4d372 accel/ivpu: Correct MMU queue size checking functions
c9da9a1f17bf accel/ivpu: Force snooping for MMU writes
cc9432c4fb15 mmc: slot-gpio: Allow non-sleeping GPIO ro
58aeb5623c2e mmc: sdhci-pci-o2micro: Fix a warm reboot issue that disk can't be detected by BIOS
8087199cd595 drm/xe/vm: don't ignore error when in_kthread
1c57b9f63ab3 powerpc: 85xx: mark local functions static
5c84bc8b617b powerpc: udbg_memcons: mark functions static
dad6a09f3148 hrtimer: Report offline hrtimer enqueue
610010737f74 ASoC: amd: yc: Add DMI quirk for Lenovo Ideapad Pro 5 16ARP8
b083d24fcf57 selftests/net: Amend per-netns counter checks
e45964771007 x86/coco: Define cc_vendor without CONFIG_ARCH_HAS_CC_PLATFORM
1f36d634670d drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
8933d29e7703 dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
3871aa01e1a7 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
99bd3cb0d12e Merge tag 'bcachefs-2024-02-05' of https://evilpiepirate.org/git/bcachefs
7bca405c9860 bus: imx-weim: fix valid range check
cca5efe77a6a LoongArch: vDSO: Disable UBSAN instrumentation
639420e9f6cd LoongArch: Fix earlycon parameter if KASAN enabled
4551b30525cf LoongArch: Change acpi_core_pic[NR_CPUS] to acpi_core_pic[MAX_CORE_PIC]
6b79ecd084c9 LoongArch: Select HAVE_ARCH_SECCOMP to use the common SECCOMP menu
b3ff2d9c3a9c LoongArch: Select ARCH_ENABLE_THP_MIGRATION instead of redefining it
d0399da9fb5f drm/sched: Re-queue run job worker when drm_sched_entity_pop_job() returns NULL
aac8a59537df Revert "workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()"
5ad6af5c91e9 drm/xe: Assume large page size if VMA not yet bound
418d6e296626 drm/sched: Add Matthew Brost to maintainers
17e94b258541 scsi: ufs: core: Remove the ufshcd_release() in ufshcd_err_handling_prepare()
b513d30d59bb scsi: ufs: core: Fix shift issue in ufshcd_clear_cmd()
d6c1b19153f9 scsi: lpfc: Use unsigned type for num_sge
4e6c90119907 scsi: core: Move scsi_host_busy() out of host lock if it is for per-command
3376ca3f1a20 KVM: x86: Fix KVM_GET_MSRS stack info leak
2592a36d9569 dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing @codeaurora address
0647903efbc8 wifi: mt76: mt7996: fix fortify warning
34e659f34a75 drm/nouveau: nvkm_gsp_radix3_sg() should use nvkm_gsp_mem_ctor()
042b5f83841f drm/nouveau: fix several DMA buffer leaks
61712c94782c nouveau/gsp: use correct size for registry rpc.
17adc3f329e9 net: marvell,prestera: Fix example PCI bus addressing
2a2e2f5f4827 drm/i915/hdcp: Pin the hdcp gsc message high in ggtt
e66a176592bd drm/i915/hdcp: Do intel_hdcp_component_init() much later during init
5ea9a7c5fe41 nfsd: don't take fi_lock in nfsd_break_deleg_cb()
c712c05e46c8 spi: imx: fix the burst length at DMA mode and CPU mode
34a1066981a9 ASoC: tas2781: add module parameter to tascodec_init()
b5fbde22684a ASoC: Intel: avs: Fix pci_probe() error path
ac670505d825 ASoC: dt-bindings: google,sc7280-herobrine: Drop bouncing @codeaurora
4703b014f28b ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()
a99682e839af Merge tag 'gvt-fixes-2024-02-05' of https://github.com/intel/gvt-linux into drm-intel-fixes
a19747c3b9bf selftests: net: let big_tcp test cope with slow env
645eb54331ed Merge branch 'rxrpc-fixes'
41b7fa157ea1 rxrpc: Fix counting of new acks and nacks
6f769f22822a rxrpc: Fix response to PING RESPONSE ACKs to a dead call
e7870cf13d20 rxrpc: Fix delayed ACKs to not set the reference serial number
f31041417bf7 rxrpc: Fix generation of serial numbers to skip zero
4a7aee96200a powerpc/kasan: Fix addr error caused by page alignment
a038a3ff8c65 powerpc/6xx: set High BAT Enable flag on G2_LE cores
f09696279b5d selftests/powerpc/papr_vpd: Check devfd before get_system_loc_code()
aad98efd0b12 powerpc/64: Set task pt_regs->link to the LR value on scv entry
ed8b94f6e0ac powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add
4856380063b1 Merge drm-misc-next-fixes-2024-01-19 into drm-misc-fixes
059c53e877ca drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
f490d0cb9360 dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
fdeba0b57d61 Merge branch 'nfp-fixes'
0f4d6f011bca nfp: enable NETDEV_XDP_ACT_REDIRECT feature flag
1a1c13303ff6 nfp: flower: prevent re-adding mac index for bonded port
b3d4f7f22889 nfp: use correct macro for LengthSelect in BAR config
1ad55cecf22f x86/efistub: Use 1:1 file:memory mapping for PE/COFF .compat section
bb3bc3eac316 drm/panel: visionox-r66451: Set prepare_prev_first flag
311d0fad2a27 drm/rect: fix kernel-doc typos
690085d866f0 Revert "arm64: dts: imx8mn-var-som-symphony: Describe the USB-C connector"
f954785a124e Revert "arm64: dts: imx8mp-dhcom-pdk3: Describe the USB-C connector"
a620a7f2ae8b arm64: dts: tqma8mpql: fix audio codec iov-supply
fdfa083549de RDMA/srpt: Support specifying the srpt_service_guid parameter
fddab35fd064 ALSA: hda/realtek: add IDs for Dell dual spk platform
4639c5021029 ALSA: hda/conexant: Add quirk for SWS JS201D
7b508b323b2e bcachefs: time_stats: Check for last_event == 0 when updating freq stats
dd839f31d7cd bcachefs: install fd later to avoid race with close
8ded03ae48b3 powerpc/pseries/papr-sysparm: use u8 arrays for payloads
f8e4806e0dfa Merge tag 'drm-misc-next-2024-01-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
44e4192f8897 MAINTAINERS: Update Zhi Wang's email address
47caa96478b9 drm/i915/gvt: Fix uninitialized variable in handle_mmio()
1a00897e5e96 drm/i915: Replace dead 01.org link
c8bdef1560d9 Merge branch 'master' into mm-hotfixes-stable
5464e7acea4a interconnect: qcom: x1e80100: Add missing ACV enable_mask
a40f93e92869 interconnect: qcom: sm8650: Use correct ACV enable_mask
eef00a82c568 inet: read sk->sk_family once in inet_recv_error()
4cb81840d8f2 iio: accel: bma400: Fix a compilation problem
862cf85fef85 iio: commom: st_sensors: ensure proper DMA alignment
34cf8c657cf0 hwmon: (coretemp) Enlarge per package core count limit
fdaf0c8629d4 hwmon: (coretemp) Fix bogus core_id to attr name mapping
4e440abc8945 hwmon: (coretemp) Fix out-of-bounds memory access
1168491e7f53 hwmon: (aspeed-pwm-tacho) mutex for tach reading
621c62571281 iio: hid-sensor-als: Return 0 for HID_USAGE_SENSOR_TIME_TIMESTAMP
9cae43da9867 hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
42dfa94d802a KVM: arm64: Do not source virt/lib/Kconfig twice
54be6c6c5ae8 Linux 6.8-rc3
bab7ec1d80fe arm64: dts: rockchip: drop unneeded status from rk3588-jaguar gpio-leds
f98643d8daf3 ARM: dts: rockchip: Drop interrupts property from pwm-rockchip nodes
5556a8c3af8b arm64: dts: rockchip: Fix the num-lanes of pcie3x4 on Cool Pi CM5 EVB
c7e8dbb3bc12 arm64: dts: rockchip: rename vcc5v0_usb30_host regulator for Cool Pi CM5 EVB
cebda3dd36be arm64: dts: rockchip: aliase sdmmc as mmc1 for Cool Pi CM5 EVB
a41f91b4da14 arm64: dts: rockchip: aliase sdmmc as mmc1 for Cool Pi 4B
e6f57c688191 IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
630bdb6f28ca RDMA/irdma: Add AE for too many RNRS
666047f3ece9 RDMA/irdma: Set the CQ read threshold for GEN 1
ee107186bcfd RDMA/irdma: Validate max_send_wr and max_recv_wr
bd97cea7b18a RDMA/irdma: Fix KASAN issue with tasklet
3f24fcdacd40 Merge tag 'for-linus-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4
9e28c7a23bac Merge tag 'v6.8-rc3-smb-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
fc86e5c9909b Merge tag 'xfs-6.8-fixes-2' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
3a0e92207940 Merge tag 'char-misc-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
021496097193 Merge tag 'tty-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
809be620dc07 Merge tag 'usb-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
bdda52cc664c Merge tag 'i2c-for-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
8a0c60a0e47a Merge tag 'dmaengine-fix-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine
843a33d63b45 Merge tag 'phy-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
957bd221ac7b Merge tag 'i2c-host-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current
dbea519d6878 cxl/trace: Remove unnecessary memcpy's
54ce1927eb78 cxl/cper: Fix errant CPER prints for CXL events
f03869698bc3 arm64: dts: imx8mp: Disable UART4 by default on Data Modul i.MX8M Plus eDM SBC
b555d191561a Merge tag 'perf-tools-fixes-for-v6.8-1-2024-02-01' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
b09b58e31b0f octeontx2-pf: Fix a memleak otx2_sq_init
f3616173bf9b atm: idt77252: fix a memleak in open_card_ubr0
d75abeec401f tunnels: fix out of bounds access when building IPv6 PMTU error
d7f5fb33cf77 tsnep: Fix mapping for zero copy XDP_TX action
17ffcdb041a4 drm/xe/query: Use kzalloc for drm_xe_query_engines
db0adab04912 drm/xe/guc: Add support for LNL firmware
32ca46bf2944 drm/xe/guc: Update to GuC firmware 70.19.2
6650ad3e0948 drm/xe/uc: Include patch version in expectations
86c99abb5f1b drm/xe/display: Fix memleak in display initialization
010e03db4dca Merge branch 'selftests-net-more-fixes'
691bb4e49c98 selftests: net: avoid just another constant wait
e71e016ad0f6 selftests: net: fix tcp listener handling in pmtu.sh
d75df7526477 selftests: net: fix setup_ns usage in rtnetlink.sh
cb9f4a30fb85 selftests: net: cut more slack for gro fwd tests.
2e7d3b67630d net: atlantic: Fix DMA mapping for PTP hwts ring
72f86ed3c889 drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
56897d51886f Merge tag 'trace-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
6b89b6af459f Merge tag 'gfs2-v6.8-rc2-revert' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2
05519c86d699 KVM: x86/pmu: Fix type length error when reading pmu->fixed_ctr_ctrl
774ef5dfc955 drm/xe: circumvent bogus stringop-overflow warning
35396cd3efa8 drm/i915/fbc: Allow FBC with CCS modifiers on SKL+
3d94e7584486 dt-bindings: visionox-rm69299: Update maintainers
0581bcc48048 drm/panel: visionox-vtdr6130: Set prepare_prev_first flag
d543d1b6086b drm/panel: novatek-nt36523: Set prepare_prev_first
c1ce62e4d6dd drm/i915: Extract intel_atomic_swap_state()
e0aee99015a7 drm/i915: Rework global state serializaiton
1e41fa945203 drm/i915: Compute use_sagv_wm differently
b1dd6c26bca4 Merge tag 'pci-v6.8-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
9c2f0338bbd1 Merge tag 'drm-fixes-2024-02-03' of git://anongit.freedesktop.org/drm/drm
eab5c86d2413 Merge tag 'input-for-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
01370ceb2ae6 Merge tag 'sound-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
43e7ef642ef2 Merge tag 'hwmon-for-v6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
79837a7c0f42 Merge tag 'for-v6.8-rc' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply
4f18d3fd2975 Merge tag 'iommu-fixes-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
ba5e1272142d netdevsim: avoid potential loop in nsim_dev_trap_report_work()
6897cea71837 Merge tag 'for-6.8/dm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
035032753bfc Merge tag 'ata-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
4255447ad34c Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
815a76b9644e Merge tag 'block-6.8-2024-02-01' of git://git.kernel.dk/linux
717ca0b8e55e Merge tag 'io_uring-6.8-2024-02-01' of git://git.kernel.dk/linux
ec86369c88f6 Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
0bcff59ef7a6 efi: Don't add memblocks for soft-reserved memory
de1034b38a34 efi: runtime: Fix potential overflow of soft-reserved region size
a60e6c3918d2 Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
0a9bab391e33 dm-crypt, dm-verity: disable tasklets
5bdda0048c8d wifi: brcmfmac: Adjust n_channels usage for __counted_by
ad834c7c8e4a Merge tag 'usb-serial-6.8-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus
e9f1e6bb55be Revert "gfs2: Use GL_NOBLOCK flag for non-blocking lookups"
bd6081be2251 dmaengine: at_hdmac: add missing kernel-doc style description
6e7ad1aebb4f driver core: fw_devlink: Improve logs for cycle detection
6442d79d880c driver core: fw_devlink: Improve detection of overlapping cycles
7fddac12c382 driver core: Fix device_link_flag_is_sync_state_only()
447f74d223b4 drm/xe: Pick correct userptr VMA to repin on REMAP op failure
a856b67a8416 drm/xe: Take a reference in xe_exec_queue_last_fence_get()
2bb98fc1d4a7 drm/imx/dcss: have all init functions use devres
a23c0af103e1 wifi: iwlwifi: do not announce EPCS support
16867c38bcd3 wifi: iwlwifi: exit eSR only after the FW does
90393c9b5408 drm/imx/dcss: request memory region
1fa942f31665 wifi: iwlwifi: mvm: fix a battery life regression
fe92f874f091 net: Fix from address in memcpy_to_iter_csum()
62a6183c1331 wifi: mac80211: accept broadcast probe responses on 6 GHz
c042600c17d8 wifi: mac80211: adding missing drv_mgd_complete_tx() call
a0b4f2291319 wifi: mac80211: fix waiting for beacons logic
178e9d6adc43 wifi: mac80211: fix unsolicited broadcast probe config
86b2dac224f9 wifi: mac80211: initialize SMPS mode correctly
733c498a8085 wifi: mac80211: fix driver debugfs for vif type change
dd6c064cfc3f wifi: mac80211: set station RX-NSS on reconfig
9480adfe4e0f wifi: mac80211: fix RCU use in TDLS fast-xmit
35e2385dbe78 wifi: mac80211: improve CSA/ECSA connection refusal
177fbbcb4ed6 wifi: cfg80211: detect stuck ECSA element in probe resp
349bd87f6091 Merge branch 'master' into mm-hotfixes-stable
24c890dd712f crypto: algif_hash - Remove bogus SGL free on zero-length error path
69fba378edca crypto: cbc - Ensure statesize is zero
ccb88e9549e7 crypto: ccp - Fix null pointer dereference in __sev_platform_shutdown_locked
46eba193d04f net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
bb6f4dbe2639 selftests/landlock: Fix capability for net_test
7fd4548d4b64 drm/i915/display: Include debugfs.h in intel_display_debugfs_params.c
d2d00e15808c powerpc: iommu: Bring back table group release_ownership() call
39126abc5e20 nouveau: offload fence uevents work to workqueue
b5e69be18549 nouveau/gsp: use correct size for registry rpc.
a639525686c5 Merge tag 'amd-drm-fixes-6.8-2024-02-01' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
ec9d669eba4c ext4: make ext4_set_iomap() recognize IOMAP_DELALLOC map type
874eaba96d39 ext4: make ext4_map_blocks() distinguish delalloc only extent
9f1118223aa0 ext4: add a hole extent entry in cache after punch
9cf6e24c9fbf Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID
683cd8259a9b Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
6430dea07e85 ext4: correct the hole length returned by ext4_map_blocks()
acf795dc161f ext4: convert to exclusive lock while inserting delalloc extents
3fcc2b887a1b ext4: refactor ext4_da_map_blocks()
111a3f0afb88 Merge tag 'drm-xe-fixes-2024-02-01' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
5fcbf83e39ec drm/xe: Drop rebind argument from xe_pt_prepare_bind
3acc1ff1a72f drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
419d8a93757f Merge tag 'drm-misc-fixes-2024-02-01' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
917e9b7c2350 Revert "drm/msm/gpu: Push gpu lock down past runpm"
6a0dbcd20ef2 drm/msm/a6xx: set highest_bank_bit to 13 for a610
03facb39d6c6 drm/msm/gem: Fix double resv lock aquire
021533194476 Kconfig: Disable -Wstringop-overflow for GCC globally
168b849728c2 Merge patch series "svnapot fixes"
a179a4bfb694 riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
1458eb2c9d88 riscv: Fix set_huge_pte_at() for NAPOT mapping
d6beadc8d732 drm/xe/gsc: Add status check during gsc header readout
41b9fb381a48 Merge tag 'net-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
91481c909246 Merge tag 'parisc-for-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
a412682659b3 Merge tag 'kbuild-fixes-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
cfdf0c09a68b Merge tag 'nfsd-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
49a4be2c845e Merge tag 'exfat-for-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat
d4ea2bd1bb50 Merge tag 'asoc-fix-v6.8-rc2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
5c24e4e9e708 Merge tag 'hid-for-linus-2024020101' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
11d4d1dba331 smb: client: increase number of PDUs allowed in a compound request
6aac002bcfd5 cifs: failure to add channel on iface should bump up weight
f6cdd897cc70 Merge tag 'firewire-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
88675b22d34e cifs: do not search for channel if server is terminating
e77e15fa5eb1 cifs: avoid redundant calls to disable multichannel
6a864c09ea6e Merge tag 'spi-fix-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
4b561d100192 Merge tag 'regulator-fix-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
8a2514c0c61f Merge tag 'v6.8-p2' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
6d805afaf02e Merge tag 'lsm-pr-20240131' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
f3c89983cb4f block: Fix where bio IO priority gets set
e81fdba02086 ALSA: Various fixes for Cirrus Logic CS35L56 support
4e192be1a225 Merge tag 'batadv-net-pullrequest-20240201' of git://git.open-mesh.org/linux-merge
f0377ff97509 nvme-host: fix the updating of the firmware version
069a6ed2992d doc/netlink/specs: Add missing attr in rt_link spec
93561eefbf87 Merge tag 'nf-24-01-31' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
f0588b157f48 idpf: avoid compiler padding in virtchnl2_ptype struct
79144a818a80 Merge branch 'mptcp-fixes-for-recent-issues-reported-by-ci-s'
04b57c9e096a selftests: mptcp: join: stop transfer when check is done (part 2)
31ee4ad86afd selftests: mptcp: join: stop transfer when check is done (part 1)
de46d138e773 selftests: mptcp: allow changing subtests prefix
5e2f3c65af47 selftests: mptcp: decrease BW in simult flows
4d4dfb2019d7 selftests: mptcp: increase timeout to 30 min
2d41f10fa497 selftests: mptcp: add missing kconfig for NF Mangle
8c86fad2cecd selftests: mptcp: add missing kconfig for NF Filter in v6
3645c844902b selftests: mptcp: add missing kconfig for NF Filter
b6c620dc43cc mptcp: fix data re-injection from stale subflow
9e62797fd7e8 KVM: x86: Make gtod_is_based_on_tsc() return 'bool'
b6831a108be1 KVM: selftests: Make hyperv_clock require TSC based system clocksource
09951bf2cbb3 KVM: selftests: Run clocksource dependent tests with hyperv_clocksource_tsc_page too
410cb01ead5b KVM: selftests: Use generic sys_clocksource_is_tsc() in vmx_nested_tsc_scaling_test
e440c5f2e3e6 KVM: selftests: Generalize check_clocksource() from kvm_clock_test
ca185770db91 eventfs: Keep all directory links at 1
12d823b31fad eventfs: Remove fsnotify*() functions from lookup()
264424dfdd5c eventfs: Restructure eventfs_inode structure to be more condensed
5a49f996046b eventfs: Warn if an eventfs_inode is freed without is_freed being set
1389358bb008 tracing/timerlat: Move hrtimer_init to timerlat_fd open()
c15a729c9d45 selftests: net: enable some more knobs
1939f738c73d selftests: net: add missing config for NF_TARGET_TTL
cf6601e289a2 Merge branch 'selftests-net-more-small-fixes'
96cd5ac4c0e6 selftests: forwarding: List helper scripts in TEST_FILES Makefile variable
06efafd8608d selftests: net: List helper scripts in TEST_FILES Makefile variable
9d851dd4dab6 selftests: net: Remove executable bits from library scripts
8cc063ae1b3d selftests: bonding: Check initial state
7b6fb3050d8f selftests: team: Add missing config options
e0526ec5360a hv_netvsc: Fix race condition between netvsc_probe and netvsc_remove
7b55984c96ff xen-netback: properly sync TX responses
ae3f4b44641d net: sysfs: Fix /sys/class/net/<iface> path
373581643d3d Merge tag 'nvme-6.8-2024-02-01' of git://git.infradead.org/nvme into block-6.8
9f079dda1433 nvme: allow passthru cmd error logging
c3a846fe4bf3 nvme-fc: show hostnqn when connecting to fc target
d2045e6a4e2f nvme-rdma: show hostnqn when connecting to rdma target
524719b4c60d nvme-tcp: show hostnqn when connecting to tcp target
a90ac7b34877 nvmet-fc: use RCU list iterator for assoc_list
fe506a745893 nvmet-fc: take ref count on tgtport before delete assoc
710c69dbaccd nvmet-fc: avoid deadlock on delete association path
3146345c2e9c nvmet-fc: abort command when there is no binding
1c110588dd95 nvmet-fc: do not tack refs on tgtports from assoc
50b474e1faff nvmet-fc: remove null hostport pointer check
ca121a0f7515 nvmet-fc: hold reference on hostport match
c5e27b1a779e nvmet-fc: free queue and assoc directly
4049dc96b8de nvmet-fc: defer cleanup using RCU properly
c691e6d7e13d nvmet-fc: release reference on target port
dcfad4ab4d67 nvmet-fcloop: swap the list_add_tail arguments
70fbfc47a392 nvme-fc: do not wait in vain when unloading module
43aa6f97c2d0 eventfs: Get rid of dentry pointers without refcounts
8dce06e98c70 eventfs: Clean up dentry ops and add revalidate function
408600be78cd eventfs: Remove unused d_parent pointer field
49304c2b93e4 tracefs: dentry lookup crapectomy
eaa1b01fe709 ALSA: usb-audio: Ignore clock selector errors for single connection
04f647c8e456 octeontx2-pf: Remove xdp queues on program detach
6813cdca4ab9 drm/amdgpu/pm: Use inline function for IP version check
72bd80252fee io_uring/net: fix sr->len for IORING_OP_RECV with MSG_WAITALL and buffers
c7de2d9bb68a ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
28876c1ae8b8 ALSA: hda: cs35l56: Remove unused test stub function
6f8ad0480d82 ALSA: hda: cs35l56: Firmware file must match the version of preloaded firmware
e82bc517c6ef ALSA: hda: cs35l56: Fix filename string field layout
77c60722ded7 ALSA: hda: cs35l56: Fix order of searching for firmware files
9e92b77ceb6f ASoC: cs35l56: Allow more time for firmware to boot
245eeff18d7a ASoC: cs35l56: Load tunings for the correct speaker models
f4ef5149953f ASoC: cs35l56: Firmware file must match the version of preloaded firmware
f6c967941c5d ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon revision
07f7d6e7a124 ASoC: cs35l56: Fix for initializing ASP1 mixer registers
856ce8982169 ALSA: hda: cs35l56: Initialize all ASP1 registers
782e6c538be4 ASoC: cs35l56: Fix default SDW TX mixer registers
72a77d7631c6 ASoC: cs35l56: Fix to ensure ASP1 registers match cache
3739cc0733ba ASoC: cs35l56: Remove buggy checks from cs35l56_is_fw_reload_needed()
07687cd0539f ASoC: cs35l56: Don't add the same register patch multiple times
cd38ccbecdac ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
ae861c466ee5 ASoC: cs35l56: cs35l56_component_remove() must clear cs35l56->component
daf3f0f99cde ASoC: wm_adsp: Don't overwrite fwf_name with the default
3657e4cb5a8a ASoC: wm_adsp: Fix firmware file search order
e4af312177d9 Merge tag 'asoc-fix-v6.8-rc2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
346c84e281a9 media: pwm-ir-tx: Depend on CONFIG_HIGH_RES_TIMERS
dc9ceb90c4b4 media: ir_toy: fix a memleak in irtoy_tx
6a9d552483d5 media: rc: bpf attach/detach requires write permission
f66556c1333b media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8
fae6e669cdc5 drm/tegra: Do not assume that a NULL domain means no DMA IOMMU
83b3836bf83f iommu: Allow ops->default_domain to work when !CONFIG_IOMMU_DMA
47dc55181dcb firewire: core: search descriptor leaf just after vendor directory entry in root directory
5f9ab17394f8 firewire: core: correct documentation of fw_csr_string() kernel API
5f16ee27cd5a drm/hwmon: Fix abi doc warnings
c9cfed29f5fe drm/xe: Make all GuC ABI shift values unsigned
ed2bdf3b264d drm/xe/vm: Subclass userptr vmas
89642db3b288 drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
ef87557928d1 drm/xe: Don't use __user error pointers
3ecf036b04b9 drm/xe: Annotate mcr_[un]lock()
efeff7b38ef6 drm/xe: Only allow 1 ufence per exec / bind IOCTL
6d2096239af1 drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
f9c15a678db3 drm/xe: Fix crash in trace_dma_fence_init()
aa125f229076 wifi: iwlwifi: remove extra kernel-doc
5bd24e78829a drm/xe/vm: Subclass userptr vmas
ffb635bb398f media: rkisp1: Fix IRQ handling due to shared interrupts
a107d643b2a3 media: Revert "media: rkisp1: Drop IRQF_SHARED"
b59af3045a66 Merge branch 'selftests-net-a-few-pmtu-sh-fixes'
bc0970d5ac1d selftests: net: don't access /dev/stdout in pmtu.sh
e4e4b6d568d2 selftests: net: fix available tunnels detection
f7c25d8e17dd selftests: net: add missing config for pmtu.sh tests
152ca51d8db0 drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
ebe3121400f2 Merge branch 'pds_core-various-fixes'
bc90fbe0c318 pds_core: Rework teardown/setup flow to be more common
e96094c1d11c pds_core: Clear BARs on reset
7e82a8745b95 pds_core: Prevent race issues involving the adminq
951705151e50 pds_core: Use struct pdsc for the pdsc_adminq_isr private data
d321067e2cfa pds_core: Cancel AQ work on teardown
d9407ff11809 pds_core: Prevent health thread from running during reset/remove
4d322dce82a1 af_unix: fix lockdep positive in sk_diag_dump_icons()
0d150beff26e nvme-fc: log human-readable opcode on timeout
7d23e836b00e nvme: split out fabrics version of nvme_opcode_str()
15b87e267b69 Merge branch 'selftests-net-a-couple-of-typos-fixes-in-key-management-rst-tests'
6caf3adcc877 selftests/net: Repair RST passive reset selftest
384aa16d3776 selftests/net: Rectify key counters checks
d8f5df1fcea5 selftests/net: Argument value mismatch when calling verify_counters()
f9e9115d0c01 nvme: take const cmd pointer in read-only helpers
6f9a71c61183 nvme: remove redundant status mask
4b6821940eeb nvme: return string as char *, not unsigned char *
0945b43b4ef8 nvme-common: add module description
48dae46676d1 nvme: enable retries for authentication commands
bd2687f2e594 nvme: change __nvme_submit_sync_cmd() calling conventions
f9ddefb6c0de nvme-auth: open-code single-use macros
585b40e25dc9 net: dsa: mv88e6xxx: Fix failed probe due to unsupported C45 reads
5dee6d692345 net: ipv4: fix a memleak in ip_setup_cork
e028243003ad MAINTAINERS: Drop unreachable reviewer for Qualcomm ETHQOS ethernet driver
ee36a3b345c4 cifs: make sure that channel scaling is done only once
733025626866 drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
4f56acdee4c6 drm/amdgpu: remove asymmetrical irq disabling in vcn 4.0.5 suspend
de4a733868df drm/amdgpu: drm/amdgpu: remove golden setting for gfx 11.5.0
9c29282ecbee drm/amdkfd: reserve the BO before validating it
16da399091dc drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
97cba232549b drm/amd/display: Fix buffer overflow in 'get_host_router_total_dp_tunnel_bw()'
492a1e67ee59 drm/amd/display: Add NULL check for kzalloc in 'amdgpu_dm_atomic_commit_tail()'
8ef85a0ce24a drm/amd: Don't init MEC2 firmware when it fails to load
bb34bc2cd3ee drm/amdgpu: Fix the warning info in mode1 reset
faf51b201bc4 drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue
191cb4ed33a6 drm/amd/display: Underflow workaround by increasing SR exit latency
39079fe8e660 drm/amd/display: fix incorrect mpc_combine array size
31c2bf25eaf5 drm/amd/display: Fix DPSTREAM CLK on and off sequence
b5abd7f983e1 drm/amd/display: fix USB-C flag update after enc10 feature init
2ff33c759a42 drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz
514312c07f6c Revert "drm/amd/display: initialize all the dpm level's stutter latency"
4119734e06a7 drm/amdkfd: Use correct drm device for cgroup permission check
c49bf4fcfc2f drm/amdkfd: Use S_ENDPGM_SAVED in trap handler
961df3085416 drm/amdkfd: Correct partial migration virtual addr
8059918a1377 netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
259eb32971e9 netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
97f7cf1cd80e netfilter: ipset: fix performance regression in swap operation
6e348067ee4b netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
97830f3c3088 binder: signal epoll threads of self-work
776d45164844 netfilter: nf_tables: restrict tunnel object to NFPROTO_NETDEV
fb366fc7541a netfilter: conntrack: correct window scaling with retransmitted SYN
607aad1e4356 of: unittest: Fix compile in the non-dynamic case
a9ef277488cf x86/kvm: Fix SEV check in sev_map_percpu_data()
d52734d00b8e KVM: x86: Give a hint when Win2016 might fail to boot due to XSAVES erratum
9e05d9b06757 KVM: x86: Check irqchip mode before create PIT
d9807d60c145 riscv: mm: execute local TLB flush after populating vmemmap
db2aad036e77 drm/amdgpu: move the drm client creation behind drm device registration
041261ac4c36 drm/nouveau/svm: remove unused but set variables
1cff237962e7 drm/nouveau/acr/ga102: remove unused but set variable
99c001cb617d tracefs: Avoid using the ei->dentry pointer unnecessarily
4fa4b010b83f eventfs: Initialize the tracefs inode properly
d81786f53aec tracefs: Zero out the tracefs_inode when allocating it
66bbea9ed644 ring-buffer: Clean ring_buffer_poll_wait() error return
9217b91c6458 drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
615dd56ac537 drm/amdgpu: remove asymmetrical irq disabling in vcn 4.0.5 suspend
01087a1974a1 drm/amdgpu: use PSP address query command
a1eac5bd9127 drm/amdgpu: add PSP RAS address query command
e4d65510e87e drm/amdgpu: drm/amdgpu: remove golden setting for gfx 11.5.0
0c93bd495766 drm/amdkfd: reserve the BO before validating it
e3854253a5f6 drm/amd/display: Fix buffer overflow in 'get_host_router_total_dp_tunnel_bw()'
1c2806f6be23 drm/amd/display: Add NULL check for kzalloc in 'amdgpu_dm_atomic_commit_tail()'
fa8a91b0e52c drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
adb4d6a40d61 drm/amdgpu: Need to resume ras during gpu reset for gfx v9_4_3 sriov
edfdde9013b7 drm/amdgpu: disable RAS feature when fini
1731ba9b64f7 drm/amdgpu: Update boot time errors polling sequence
c3ec8c4f9a47 drm/amd: Don't init MEC2 firmware when it fails to load
2b9c3eb32a69 Input: bcm5974 - check endpoint type before starting traffic
6764c317b6bb Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
d83d8ae275c6 drm/xe: Make all GuC ABI shift values unsigned
fdd0ae72b34e perf tools headers: update the asm-generic/unaligned.h copy with the kernel sources
c9ec85153fea selftests: net: add missing config for GENEVE
f3f8f0503168 wifi: fill in MODULE_DESCRIPTION()s for mt76 drivers
c9013880284d wifi: fill in MODULE_DESCRIPTION()s for wilc1000
35337ac47260 wifi: fill in MODULE_DESCRIPTION()s for wl18xx
714ea2f109d9 wifi: fill in MODULE_DESCRIPTION()s for p54spi
e063d2a05d71 wifi: fill in MODULE_DESCRIPTION()s for wcn36xx
f8782ea450ad wifi: fill in MODULE_DESCRIPTION()s for ar5523
257ca10c7317 wifi: fill in MODULE_DESCRIPTION()s for Broadcom WLAN
2f2b503ea770 wifi: fill in MODULE_DESCRIPTION()s for wl1251 and wl12xx
5b778e1c2e97 wifi: fill in MODULE_DESCRIPTION()s for wlcore
996da37ffa82 drm/xe: Convert job timeouts from assert to warning
6231c9e1a9f3 KVM: x86: make KVM_REQ_NMI request iff NMI pending for vcpu
9189526c46f2 MAINTAINERS: Update i2c host drivers repository
925bd5e08106 MAINTAINERS: Add Manivannan Sadhasivam as PCI Endpoint maintainer
1e560864159d PCI/ASPM: Fix deadlock when enabling ASPM
bfef491df670 kconfig: initialize sym->curr.tri to 'no' for all symbol types again
9749c8684345 drm/amdgpu: Fix the warning info in mode1 reset
1c1914d6e8c6 dma-buf: heaps: Don't track CMA dma-buf pages under RssFile
358de8b4f201 kbuild: rpm-pkg: simplify installkernel %post
82175d1f9430 kbuild: Replace tabs with spaces when followed by conditionals
cda5f94e88b4 modpost: avoid using the alias attribute
89876175c8c8 kbuild: fix W= flags in the help message
8f7e91790738 of: property: fix typo in io-channels
adf0c363ad2c dt-bindings: tpm: Drop type from "resets"
4c654ec0ba0f dt-bindings: display: nxp,tda998x: Fix 'audio-ports' constraints
2d3b3ab8d0d5 dt-bindings: xilinx: replace Piyush Mehta maintainership
78366eed6853 drm/xe: Don't use __user error pointers
97fd7a7e4e87 drm/xe: Annotate mcr_[un]lock()
2468e8922d2f ALSA: hda/realtek: Apply headset jack quirk for non-bass alc287 thinkpads
1e5a4dfe3834 drm/xe: drop display/ subdir from include directories
f01ece502af0 drm/xe: move xe_display.[ch] under display/
913b9d443a01 parisc: BTLB: Fix crash when setting up BTLB at CPU bringup
51af8f255bda ahci: Extend ASM1061 43-bit DMA address quirk to other ASM106x parts
764ad6b02777 HID: bpf: use __bpf_kfunc instead of noinline
89be8aa5b0ec HID: bpf: actually free hdev memory after attaching a HID-BPF program
7cdd2108903a HID: bpf: remove double fdget()
b4a1f4eaf1d7 USB: serial: option: add Fibocom FM101-GL variant
be551ee15742 RDMA/mlx5: Relax DEVX access upon modify commands
43fdbd140238 IB/mlx5: Don't expose debugfs entries for RRoCE general parameters if not supported
4d5e86a56615 RDMA/mlx5: Fix fortify source warning while accessing Eth segment
4451e8e8415e pinctrl: amd: Add IRQF_ONESHOT to the interrupt request
03ee752f00fd drm/imx: prefer snprintf over sprintf
345a36c4f1ba drm/amdgpu: prefer snprintf over sprintf
e03ee2fe873e btrfs: do not ASSERT() if the newly created subvolume already got read
a8df35619948 btrfs: forbid deleting live subvol qgroup
0c309d66dacd btrfs: forbid creating subvol qgroups
f884a9f9e592 btrfs: send: return EOPNOTSUPP on unknown flags
1bbb19b6eb1b Merge tag 'erofs-for-6.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
6af191034c8f Merge branch '1GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
1a89e24f8bfd devlink: Fix referring to hw_addr attribute during state validation
f5c3eb4b7251 bridge: mcast: fix disabled snooping after long uptime
b40f873a7c80 selftests: net: Add missing matchall classifier
ac9762a74c7c misc: open-dice: Fix spurious lockdep warning
a4e61de63e34 misc: fastrpc: Mark all sessions as invalid in cb_remove
98323e9d7017 topology: Set capacity_freq_ref in all cases
d1df9bfbf68c drm/xe: Only allow 1 ufence per exec / bind IOCTL
2a6526c4f389 Merge tag 'linux_kselftest-kunit-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
d1d873a9bfac Merge tag 'linux_kselftest-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
80441f76ee67 Input: xpad - add Lenovo Legion Go controllers
5a287d3d2b9d lsm: fix default return value of the socket_getpeersec_*() hooks
10c02aad111d KVM: arm64: Fix circular locking dependency
aa0e784dea7c efi/libstub: Add one kernel-doc comment
2f77465b05b1 x86/efistub: Avoid placing the kernel below LOAD_PHYSICAL_ADDR
c2a449a30fa2 KVM: selftests: Fail tests when open() fails with !ENOENT
8ad485527348 KVM: selftests: Avoid infinite loop in hyperv_features when invtsc is missing
46fee9e38995 KVM: selftests: Delete superfluous, unused "stage" variable in AMX test
65612e993493 KVM: selftests: x86_64: Remove redundant newlines
be7d51c5b468 drm/xe: Add batch buffer addresses to devcoredump
5746eaaa805e drm/xe: Add functions to convert regular address to canonical address and back
8945a46a7cba drm/xe: Use function to emit PIPE_CONTROL
cd43106c9b05 drm/xe/guc: Reduce a print from warn to debug
53ed2ac8fc1d soc: apple: mailbox: error pointers are negative integers
9a9e8a7159ca drm/vmwgfx: Fix the lifetime of the bo cursor memory
ed96cf7ad590 drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of newly-created MOBs
0c10a15d2122 drm/vmwgfx: Add SPDX header to vmwgfx_drm.h
9840d28f2514 drm/vmwgfx: Make all surfaces shareable
935f795045a6 drm/vmwgfx: Refactor drm connector probing for display modes
40ef8756fbdd dm writecache: allow allocations larger than 2GiB
9cf11ce06ea5 dm stats: limit the number of entries
bd504bcfec41 dm: limit the number of targets and parameter size area
7104ba0f1958 phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
a22fe1d6dec7 dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
8b1d72395635 parisc: Fix random data corruption from exception handler
b54761f6e977 kselftest/seccomp: Report each expectation we assert as a KTAP test
5820cfee443f kselftest/seccomp: Use kselftest output functions for benchmark
f1fea725cc93 selftests/livepatch: fix and refactor new dmesg message code
6500ad28fd5d spi: sh-msiof: avoid integer overflow in constants
a3fa9838e814 regulator (max5970): Fix IRQ handler
d877550eaf2d x86/fpu: Stop relying on userspace for info to fault in xsave buffer
fe4c6ff50c68 drm/i915/xe2lpd: Move registers to PICA
d5c7854b50e6 drm/i915/xe2lpd: Move D2D enable/disable
129690fb229a USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
12b17b4eb82a USB: serial: cp210x: add ID for IMST iM871A-USB
aeacfd2dbebb drm/xe/xe2: Enable has_usm
1f8c43b09ec6 tools include UAPI: Sync linux/mount.h copy with the kernel sources
7814fe24a621 perf evlist: Fix evlist__new_default() for > 1 core PMU
efe80f9c9063 tools headers: Update the copy of x86's mem{cpy,set}_64.S used in 'perf bench'
f7c4cb4a3f77 ALSA: pcm: Add missing formats to formats list
be220d2e5544 ALSA: hda: cs35l41: Support ASUS Zenbook UM3402YAR
15d6daad8f8a tools headers x86 cpufeatures: Sync with the kernel sources to pick TDX, Zen, APIC MSR fence changes
c16dfab33f99 ALSA: hda: cs35l41: Support additional ASUS Zenbook UX3402VA
aa2b2eb39348 llc: call sock_orphan() at release time
c7767f5c43df arm64: vdso32: Remove unused vdso32-offsets.h
f8affba72548 Merge branch 'net-stmmac-dwmac-imx-time-based-scheduling-support'
3b12ec8f618e net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings
4896bb7c0b31 net: stmmac: do not clear TBS enable bit on link up/down
d104a6fef3fe arm64: scs: Disable LTO for SCS patching code
2fa28abd1090 arm64: Revert "scs: Work around full LTO issue with dynamic SCS"
60365049ccba ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
881f78f47255 xfs: remove conditional building of rt geometry validator functions
20485e3a810c drm/hwmon: Fix abi doc warnings
861c0981648f Merge tag 'jfs-6.8-rc3' of github.com:kleikamp/linux-shaggy
9b7bd05bebfc Merge tag 'trace-v6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
59c93583491a selftests: net: add missing config for nftables-backed iptables
c44fc98f0a8f net: dsa: qca8k: fix illegal usage of GPIO
6f3d7d5cedba Merge tag 'mm-hotfixes-stable-2024-01-28-23-21' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
cc976dbc492c Merge tag 'samsung-clk-fixes-6.8' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-fixes
eef5c7b28dbe cxl/pci: Skip to handle RAS errors if CXL.mem device is detached
788686e2d93a drm/amdgpu: use helper macro HW_ERR instead of Hardware error string
132a6a78b598 drm/amdgpu/pm: Use macro definitions in the smu IH process function
2bf85adfb304 drm/amd/display: 3.2.270
e8911e0a53de drm/amd/display: [FW Promotion] Release 0.0.202.0
b26b943a8dcf drm/amd/display: Populate invalid split index to be 0xF
4ba9ca63e696 drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue
ed2466da2c1c drm/amd/display: clkmgr unittest with removal of warn & rename DCN35 ips handshake for idle
2ba36e18566b drm/amd/display: fix DP audio settings
5024ae7fa88c drm/amd/display: Underflow workaround by increasing SR exit latency
c50c9c872e76 drm/amd/display: use correct phantom pipe when populating subvp pipe info
607e1b0cf480 drm/amd/display: fix incorrect mpc_combine array size
e8d131285c98 drm/amd/display: Fix DPSTREAM CLK on and off sequence
f2a905b01c6d drm/amd/display: fix invalid reg access on DCN35 FPGA
7fc0d111baad drm/amd/display: refine code for dmcub inbox1 ring buffer debug
f341055b10bd drm/amd/display: Send DTBCLK disable message on first commit
5549c37e3cf2 drm/amd/display: fix USB-C flag update after enc10 feature init
13b3d6bdbeb4 drm/amd/display: add debugfs disallow edp psr
fc9f47455ae1 drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel
dcbf438d4834 drm/amd/display: Unify optimize_required flags and VRR adjustments
d46fb0068c54 drm/amd/display: increased min_dcfclk_mhz and min_fclk_mhz
2812b5add41e drm/amd/display: Wait for mailbox ready when powering up DMCUB
05d3dfd3edba drm/amd/display: Wait before sending idle allow and after idle disallow
6bd0960644ed Revert "drm/amd/display: initialize all the dpm level's stutter latency"
9af68235ad3d drm/amd/display: Fix static screen event mask definition change
ba162ae749a5 Documentation/gpu: Introduce a simple contribution list for display code
21dd98b0ef89 Documentation/gpu: Add an explanation about the DC weekly patches
d79833f34bdc Documentation/gpu: Add entry for the DIO component
0fba33311e63 Documentation/gpu: Add entry for OPP in the kernel doc
b8c1c3a82e75 Documentation/gpu: Add kernel doc entry for MPC
c371aa12d817 Documentation/gpu: Add kernel doc entry for DPP
50d3cf5e5a21 drm/amdkfd: Use correct drm device for cgroup permission check
7297ff96ea57 drm/amdkfd: Use S_ENDPGM_SAVED in trap handler
34e98e5b07fc drm/amdkfd: Correct partial migration virtual addr
c0125b848abe drm/amdgpu: move the drm client creation behind drm device registration
9ccfe80d022d drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
b8e9a995fbda drm/amd/include: Add missing registers/mask for DCN316 and 350
3595678ff833 Documentation/gpu: Add simple doc page for DCHUBBUB
ee0a54a6ef6b Documentation/gpu: Add basic page for HUBP
a91cf53a1077 drm/amdgpu: update documentation on new chips
76b367a2d831 io_uring/net: limit inline multishot retries
704ea888d646 io_uring/poll: add requeue return code from poll multishot handling
91e5d765a82f io_uring/net: un-indent mshot retry path in io_recv_finish()
e84b01a880f6 io_uring/poll: move poll execution helpers higher up
5513c5d0fb3d ASoC: amd: acp: Fix support for a Huawei Matebook laptop
5d71e6000451 arm64: sun50i-h616: Add DMA and SPDIF controllers
0abcac4fe3ca firmware: microchip: fix wrong sizeof argument
ccbca118ef1a NFSv4.1: Assign the right value for initval and retries for rpc timeout
bbc404d20d1b ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
f1f6a6b1830a e1000e: correct maximum frequency adjustment values
7a9dc944f129 ASoC: sun4i-spdif: Add Allwinner H616 compatible
57b3c130d97e ASoC: sun4i-spdif: Fix requirements for H6
0adf963b8463 ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
9f5971bdf78e drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms
a38125f188c1 KVM: selftests: s390x: Remove redundant newlines
93e43e50b80b KVM: selftests: riscv: Remove redundant newlines
95be17e4008b KVM: selftests: aarch64: Remove redundant newlines
250e138d8768 KVM: selftests: Remove redundant newlines
02add85a9eef KVM: selftests: Reword the NX hugepage test's skip message to be more helpful
e4ad71e2367f MAINTAINERS: wifi: brcm80211: cleanup entry
c6dce23ec993 ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VF
21fdd8dd3726 tools headers UAPI: Sync unistd.h to pick {list,stat}mount, lsm_{[gs]et_self_attr,list_modules} syscall numbers
346f59d1e8ed ALSA: usb-audio: Check presence of valid altsetting control
6d3c7fb17b4c nvme: use ctrl state accessor
e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in dbJoin"
c92c108403b0 Revert "drm/amd/pm: fix the high voltage and temperature issue"
ca9ca1a5d5a9 netfs: Fix missing zero-length check in unbuffered write
2147caaac734 netfs: Fix i_dio_count leak on DIO read past i_size
4db102dcb039 Merge drm/drm-next into drm-misc-next
577e4432f3ac tcp: add sanity checks to rx zerocopy
bfb007aebe6b nfc: nci: free rx_data_reassembly skb on NCI device cleanup
37e8c97e5390 net: hsr: remove WARN_ONCE() in send_hsr_supervision_frame()
8eed4e00a370 x86/lib: Revert to _ASM_EXTABLE_UA() for {get,put}_user() fixups
aeb262c35335 drm/panel: simple: Add EDT ETML1010G3DRA panel
7a61bbc10a7b dt-bindings: display: panel-simple: add ETML1010G3DRA
622cd3daa8ea fs/ntfs3: Slightly simplify ntfs_inode_printk()
1f5fa4b3b85c fs/ntfs3: Add ioctl operation for directories (FITRIM)
731ab1f98288 fs/ntfs3: Fix oob in ntfs_listxattr
b2dd7b953c25 fs/ntfs3: Fix an NULL dereference bug
ebd4acc0cbea riscv: Fix wrong size passed to local_flush_tlb_range_asid()
9c64e749cebd drm/virtio: Set segment size for virtio_gpu device
82ef1a535657 xfs: reset XFS_ATTR_INCOMPLETE filter on node removal
c0787fcff88b Revert "ALSA: usb-audio: Skip setting clock selector for single connections"
f0d78972f27d ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
efb56d84dd9c ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
ec4d82f855ce thunderbolt: Fix setting the CNS bit in ROUTER_CS_5
d68968440b1a fs/ntfs3: Update inode->i_size after success write into compressed file
652cfeb43d6b fs/ntfs3: Fixed overflow check in mi_enum_attr()
1b7dd28e14c4 fs/ntfs3: Correct function is_rst_area_valid
4fd6c08a16d7 fs/ntfs3: Use i_size_read and i_size_write
5ca87d01eba7 fs/ntfs3: Prevent generic message "attempt to access beyond end of device"
d6d33f03baa4 fs/ntfs3: use non-movable memory for ntfs3 MFT buffer cache
c79f52f0656e io_uring/rw: ensure poll based multishot read retries appropriately
6bb3f7f4c3f4 bcachefs: unlock parent dir if entry is not found in subvolume deletion
eba38cc7578b bcachefs: Fix build on parisc by avoiding __multi3()
41bccc98fb79 Linux 6.8-rc2
3eb5ca857d38 Merge tag 'cxl-fixes-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
29142dc92c37 tracefs: remove stale 'update_gid' code
4854cf9c61d0 Merge tag 'mips-fixes_6.8_1' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
648f575d5e62 Merge tag 'locking_urgent_for_v6.8_rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
0e4363ac1a21 Merge tag 'irq_urgent_for_v6.8_rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
90db544ebaf4 Merge tag 'timers_urgent_for_v6.8_rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
9d451912dbef Merge tag 'x86_urgent_for_v6.8_rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
a08ebda97e2a Merge tag 'fixes-2024-01-28' of git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
6f6c72acddf4 iio: move LIGHT_UVA and LIGHT_UVB to the end of iio_modifier
cc575083cdcf drm/loongson: Error out if no VRAM detected
20e08a720cc5 parisc: Drop unneeded semicolon in parse_tree_node()
c8708d758e71 parisc: Prevent hung tasks when printing inventory on serial console
b9402e3b9728 parisc: Check for valid stride size for cache flushes
2751153b9945 parisc: Make RO_DATA page aligned in vmlinux.lds.S
b35f8dbbce81 serial: max310x: prevent infinite while() loop in port startup
8afa6c6decea serial: max310x: fail probe if clock crystal is unstable
93cd256ab224 serial: max310x: improve crystal stable clock detection
0419373333c2 serial: max310x: set default value when reading clock ready bit
30926783a468 serial: core: Fix atomicity violation in uart_tiocmget
86ee55e9bc7f serial: 8250_pci1xxxx: fix off by one in pci1xxxx_process_read_data()
e15c99be0c91 tty: serial: Fix bit order in RS485 flag definitions
f2e5d3de7e1f usb: typec: tcpm: fix the PD disabled case
f3be347ea42d usb: ucsi_acpi: Quirk to ack a connector change ack cmd
2840143e393a usb: ucsi_acpi: Fix command completion handling
c9aed03a0a68 usb: ucsi: Add missing ppm_lock
3caf2b2ad733 usb: ulpi: Fix debugfs directory leak
b717dfbf73e8 Revert "usb: typec: tcpm: fix cc role at port reset"
032178972f8e usb: gadget: pch_udc: fix an Excess kernel-doc warning
b2d2d7ea0dd0 usb: f_mass_storage: forbid async queue when shutdown happen
f17c34ffc792 USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
cc509b6a47e7 usb: chipidea: core: handle power lost in workqueue
61a348857e86 usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
de4b5b28c87c usb: dwc3: pci: add support for the Intel Arrow Lake-H
12783c0b9e2c usb: core: Prevent null pointer dereference in update_port_device_state
7c4650ded49e xhci: handle isoc Babble and Buffer Overrun events properly
5372c65e1311 xhci: process isoc TD properly when there was a transaction error mid TD.
09f197225cbc xhci: fix off by one check when adding a secondary interrupter.
a54a594d72f2 xhci: fix possible null pointer dereference at secondary interrupter removal
9dc292413c56 usb: gadget: ncm: Fix endianness of wMaxSegmentSize variable in ecm_desc
520b391e3e81 usb: host: xhci-plat: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
817349b6d26a usb: dwc3: host: Set XHCI_SG_TRB_CACHE_SIZE_QUIRK
20d03ae36ec0 usb: gadget: ncm: Fix indentations in documentation of NCM section
becc24e96ad4 perf vendor events intel: Alderlake/sapphirerapids metric fixes
e30dca91e566 tools headers UAPI: Sync kvm headers with the kernel sources
8a696a29c690 Merge tag 'platform-drivers-x86-v6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
955340433a79 Merge tag 'loongarch-fixes-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
cd2286fc5775 Merge tag 'xfs-6.8-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
064a4a5bfac8 Merge tag 'bcachefs-2024-01-26' of https://evilpiepirate.org/git/bcachefs
8c6f6a76465a Merge tag '6.8-rc2-smb3-server-fixes' of git://git.samba.org/ksmbd
d1bba17e20d5 Merge tag '6.8-rc1-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
397586506c3d modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
846cfbeed09b um: Fix adding '-no-pie' for clang
6c20faec8ffc kbuild: defconf: use SRCARCH to find merged configs
915644189c22 hwmon: (pmbus/mp2975) Correct comment inside 'mp2975_read_byte_data'
6db053cd949f staging: iio: ad5933: fix type mismatch regression
a69eeaad093d iio: humidity: hdc3020: fix temperature offset
59be5c358501 mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
822df315cc7c MIPS: loongson64: set nid for reserved memblock region
c91c6b2f08af Revert "MIPS: loongson64: set nid for reserved memblock region"
62b424810535 net: lan966x: Fix port configuration when using SGMII interface
586e40aa883c MAINTAINERS: Add connector headers to NETWORKING DRIVERS
0a186b49bba5 batman-adv: mcast: fix memory leak on deleting a batman-adv interface
59f7ea703c38 batman-adv: mcast: fix mcast packet type counter on timeouted nodes
e622502c310f ipmr: fix kernel panic when forwarding mcast packets
d9281660ff3f erofs: relaxed temporary buffers allocation on readahead
348769d1cbfa drm/xe: correct the assertion for number of PTEs
3a5879d495b2 Merge tag 'ata-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
914e17088e91 Merge tag 'block-6.8-2024-01-26' of git://git.kernel.dk/linux
cced1c5e72b7 Merge tag 'io_uring-6.8-2024-01-26' of git://git.kernel.dk/linux
667c889308a1 Merge tag 'thermal-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
0c879d88138c Merge tag 'pm-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
70da22eb63f7 Merge tag 'docs-6.8-fixes' of git://git.lwn.net/linux
99b817c173cd lsm: fix the logic in security_inode_getsecctx()
dfa988b4c7c3 net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
8d975c15c0cd ip6_tunnel: make sure to pull inner header in __ip6_tnl_rcv()
89abe6283753 selftests: net: give more time for GRO aggregation
d3cb3b0088ca selftests: net: add missing required classifier
281cb9d65a95 bnxt_en: Make PTP timestamp HWRM more silent
c3dfcdb65ec1 net/smc: fix incorrect SMC-D link group matching logic
168174d78157 Merge tag 'drm-fixes-2024-01-27' of git://anongit.freedesktop.org/drm/drm
d0266d7ab161 Revert "power: supply: qcom_battmgr: Register the power supplies after PDR is up"
2047b0b27508 Merge tag 'asm-generic-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
ae971859f810 Merge tag 'arm-fixes-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
c60fe56c169e hwmon: (pmbus/mp2975) Fix driver initialization for MP2975 device
48fa8ec61569 Merge tag 'spi-fix-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
5f91b9ba5aca Merge tag 'gpio-fixes-for-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
d688b86a290e drm/xe/guc: Flush G2H handler when turning off CTs
83a7173bacc9 drm/xe: Move TLB invalidation reset before HW reset
dc75d03716fe drm/xe/guc: Add more GuC CT states
4aeb083707d6 Merge tag 'media/v6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
0958b33ef5a0 tracing/trigger: Fix to return error if failed to alloc snapshot
fcf67d82b8b8 selftests: net: add missing config for big tcp tests
1abdf288b0ef platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet
8c898ec07a2f platform/x86/intel/ifs: Call release_firmware() when handling errors.
a692a86efe97 platform/x86/amd/pmf: Fix memory leak in amd_pmf_get_pb_data()
cedecdba60f4 platform/x86/amd/pmf: Get ambient light information from AMD SFH driver
71ce046327cf drm/ttm: Make sure the mapped tt pages are decrypted when needed
118063f38033 platform/x86/amd/pmf: Get Human presence information from AMD SFH driver
517621b70600 drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
97aab852c4b9 hwmon: gigabyte_waterforce: Fix locking bug in waterforce_get_status()
f3bdd82c5834 Merge branch 'pm-cpufreq'
987940f05735 Merge tag 'drm-misc-fixes-for-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes
4d7acc8f48bc Revert "nouveau: push event block/allowing out of the fence context"
11f563320917 Merge tag 'kvm-riscv-6.8-2' of https://github.com/kvm-riscv/linux into HEAD
9c4a1126ad9c Merge tag 'drm-intel-fixes-2024-01-26' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
ddd2b472a1b7 Merge tag 'drm-misc-fixes-2024-01-26' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
3f5198c7f672 Merge tag 'kvm-s390-master-6.8-1' of https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
00aab7dcb226 HID: i2c-hid-of: fix NULL-deref on failed power up
f3e17b42b28d drm/vmwgfx: Add SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 to command array.
47c5dd66c184 nvmet-tcp: fix nvme tcp ida memory leak
a7a6a01f88e8 x86/efistub: Give up if memory attribute protocol returns an error
7bbe8f0071df perf tools: Fix calloc() arguments to address error introduced in gcc-14
eeca59a6e8e6 ALSA: usb-audio: Support read-only clock selector control
79baac8acfc6 perf top: Remove needless malloc(0) call that triggers -Walloc-size
39af67413997 perf build: Make minimal shellcheck version to v0.6.0
1233d1d54b7f tools headers UAPI: Update tools's copy of drm.h headers to pick DRM_IOCTL_MODE_CLOSEFB
61f61c89fa5d MAINTAINERS: Add Andreas Larsson as co-maintainer for arch/sparc
9a8dd2f24d1c perf test shell daemon: Make signal test less racy
1c2124ec8431 perf test shell script: Fix test for python being disabled
a734c7f96975 perf test: Workaround debug output in list test
79bacb6ad73c perf list: Add output file option
9d95c6be48fc perf list: Switch error message to pr_err() to respect debug settings (-v)
2dac1f089add perf test: Fix 'perf script' tests on s390
b0dc99215598 tools headers UAPI: Sync linux/fcntl.h with the kernel sources
174372668933 tools arch x86: Sync the msr-index.h copy with the kernel sources to pick IA32_MKTME_KEYID_PARTITIONING
690811f0128e tools headers uapi: Sync linux/stat.h with the kernel sources to pick STATX_MNT_ID_UNIQUE
ff3d5d04db07 drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
1f4a994be2c3 riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint format
cc4b2dd95f0d erofs: fix infinite loop due to a race of filling compressed_bvecs
1b023d475ae9 wifi: mac80211: Drop WBRF debugging statements
3a3ef3940798 wifi: iwlwifi: mvm: skip adding debugfs symlink for reconfig
b743287d7a00 wifi: cfg80211: fix wiphy delayed work queueing
353d321f63f7 wifi: iwlwifi: fix double-free bug
4bf2a626dc4b MIPS: lantiq: register smp_ops on non-smp platforms
ce7b1b97776e MIPS: loongson64: set nid for reserved memblock region
abcabb9e30a1 MIPS: reserve exception vector space ONLY ONCE
dd3c33ccbb8f MIPS: BCM63XX: Fix missing prototypes
4073dbbc56ba drm/i915: Convert PLL flags to booleans
33c7760226c7 drm/i915: Suppress old PLL pipe_mask checks for MG/TC/TBT PLLs
d283ee5662c6 drm/i915: Include the PLL name in the debug messages
96204e15310c mm: thp_get_unmapped_area must honour topdown preference
c5a2f74db71a crypto: caam - fix asynchronous hash
e1d54d153fc3 crypto: qat - fix arbiter mapping generation algorithm for QAT 402xx
9b3058d1f456 MAINTAINERS: remove myself as iwlwifi driver maintainer
48ef9e87b407 LoongArch: KVM: Add returns to SIMD stubs
614f362918c7 LoongArch: KVM: Fix build due to API changes
5056c596c3d1 LoongArch/smp: Call rcutree_report_cpu_starting() at tlb_init()
4ef9ad19e176 mm: huge_memory: don't force huge page alignment on 32 bit
67695f18d559 userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
d021b442cf31 selftests/mm: ksm_tests should only MADV_HUGEPAGE valid memory
6f9dc684cae6 scs: add CONFIG_MMU dependency for vfree_atomic()
e4e3df290f65 mm/memory: fix folio_set_dirty() vs. folio_mark_dirty() in zap_pte_range()
db44c658f798 mm/huge_memory: fix folio_set_dirty() vs. folio_mark_dirty()
52e63d67b5bb selftests/mm: Update va_high_addr_switch.sh to check CPU for la57 flag
91b80cc5b39f selftests: mm: fix map_hugetlb failure on 64K page size systems
0fe8ff51efb3 MAINTAINERS: supplement of zswap maintainers update
4434a56ec209 stackdepot: make fast paths lock-less again
c2a292545cd4 stackdepot: add stats counters exported via debugfs
f6564fce256a mm, kmsan: fix infinite recursion due to RCU critical section
9319b647902c mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
bc29036e1da1 selftests/mm: switch to bash from sh
0d7e68c02718 MAINTAINERS: add man-pages git trees
63fd327016fd mm: memcontrol: don't throttle dying tasks on memory.high
c4608d1bf7c6 mm: mmap: map MAP_STACK to VM_NOHUGEPAGE
4dca82d14174 uprobes: use pagesize-aligned virtual address when replacing pages
f8ee4361b7be selftests/mm: mremap_test: fix build warning
19d3e2218077 fs/hugetlbfs/inode.c: mm/memory-failure.c: fix hugetlbfs hwpoison handling
ab4443fe3ca6 readahead: avoid multiple marked readahead pages
66dbd9004a55 drm/sched: Drain all entities in DRM sched run job worker
77fe8f195737 Merge tag 'amd-drm-fixes-6.8-2024-01-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
83cd3be8648f Merge tag 'drm-xe-fixes-2024-01-25' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
ff63cc2e9506 net: phy: mediatek-ge-soc: sync driver with MediaTek SDK
cae1f1c36661 net: ethernet: mtk_eth_soc: set DMA coherent mask to get PPE working
d833683d4385 Merge branch 'nfp-flower-a-few-small-conntrack-offload-fixes'
3a007b8009b5 nfp: flower: fix hardware offload for the transfer layer port
cefa98e806fd nfp: flower: add hardware offload check for post ct entry
534326711000 gve: Fix skb truesize underestimation
fc836129f708 selftests/net/lib: update busywait timeout value
d2fda304bb73 bcachefs: __lookup_dirent() works in snapshot, not subvol
5af2c3f44e00 Merge tag 'md-6.8-20240126' of https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-6.8
39b383d77961 selftests: tcp_ao: set the timeout to 2 minutes
ce36ea754051 Merge branch 'selftests-net-a-few-fixes'
4acffb66630a selftests: net: explicitly wait for listener ready
f5173fe3e13b selftests: net: included needed helper in the install targets
98cb12eb52a7 selftests: net: remove dependency on ebpf tests
b64787840080 selftests: tcp_ao: add a config file
8d35217149da drm/msm/mdss: specify cfg bandwidth for SDM670
8c2ae772fe08 spi: fix finalize message on error return
c82eb25c5f00 drm/amd/display: "Enable IPS by default"
d45669eb5e68 drm/amd: Add a DC debug mask for IPS
8894b9283afd drm/amd/display: Disable ips before dc interrupt setting
f37f7979202d drm/amd/display: Replay + IPS + ABM in Full Screen VPB
196107eb1e15 drm/amd/display: Add IPS checks before dcn register access
955406e6fd24 drm/amd/display: Add Replay IPS register for DMUB command table
ff8caade7429 drm/amd/display: Allow IPS2 during Replay
3380fcad2c90 drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs
03ff6d7238b7 drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
e7a8594cc2af drm/amd/amdgpu: Assign GART pages to AMD device mapping
f1807682de0e drm/amd/pm: Fetch current power limit from FW
bc8f6d42b133 drm/amdgpu: Fix null pointer dereference
89a7c0bd7491 drm/amdgpu: Show vram vendor only if available
30269954745c drm/amd/pm: update the power cap setting
90751bdeee4e drm/amdgpu: Avoid fetching vram vendor information
ca1ffb174f16 drm/amdgpu/pm: Fix the power source flag error
a58371d632eb drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
fdaca31a7668 drm/amd/pm: udpate smu v13.0.6 message permission
fc4657971be3 arm64: dts: rockchip: mark system power controller on rk3588-evb1
362936d613e8 amdgpu/drm: Use vram manager for virtualization page retirement
2474414c60b7 drm/amdgpu: Add RAS_POISON_READY host response message
ed1e1e42fd68 drm/amdgpu: Support passing poison consumption ras block to SRIOV
1630c6ded587 drm/amd/display: "Enable IPS by default"
85155f5b55b5 drm/amd: Add a DC debug mask for IPS
67bbf55bd3c7 drm/amd/display: Disable ips before dc interrupt setting
c0c48f0d61ff drm/amdgpu: adjust aca init/fini sequence to match gpu reset
6eb726a082e5 drm/amdgpu: add aca sysfs remove support
4b09715f1504 drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
c84a7e21db79 drm/amdgpu: Fix module unload hang with RAS enabled
1e201202eda1 drm/amdgpu/pm: Add default case for smu IH process func
4953be13bebb drm/amdgpu: convert some variable sized arrays to [] style
fc8f5a29d4cf drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs
ca01082353d4 drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
8352ca1090d1 drm/amd/amdgpu: Assign GART pages to AMD device mapping
8d1717fb647d drm/amdgpu: Fix return type in 'aca_bank_hwip_is_matched()'
6add38716548 drm/amd/pm: Fetch current power limit from FW
693d4e8861a5 drm/amdgpu/pptable: convert some variable sized arrays to [] style
ecb1b8288dc7 Merge tag 'net-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
bdc010200eb5 Merge tag 'ovl-fixes-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
a658e0e98688 Merge tag 'vfs-6.8-rc2.netfs' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
b9fa4cbd8415 Merge tag 'nfsd-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
3cb9871f8160 Merge tag 'urgent-rcu.2024.01.24a' of https://github.com/neeraju/linux
0d1d824a4ac1 Merge tag 'samsung-fixes-6.8' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes
8ad2c84e2ecb Merge tag 'ffa-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
d77b016bc917 Merge tag 'scmi-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
5e2400f11d4d arm64: dts: Fix TPM schema violations
8412c47d6843 ARM: dts: Fix TPM schema violations
20730e9b2778 ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
40b7835e74e0 selftests/landlock: Fix fs_test build with old libc
116099ed345c selftests/landlock: Fix net_test build with old libc
c6878e47431c drm/xe: Fix crash in trace_dma_fence_init()
b9328fd636bd x86/CPU/AMD: Add more models to X86_FEATURE_ZEN5
0a5bd0ffe790 Merge branch 'tsnep-xdp-fixes'
9a91c05f4bd6 tsnep: Fix XDP_RING_NEED_WAKEUP for empty fill ring
50bad6f797d4 tsnep: Remove FCS for XDP data path
5da459716356 Merge tag 'mlx5-fixes-2024-01-24' of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux
fdf8e6d18c6d Merge tag 'for-netdev' of https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
5e3448077350 net: fec: fix the unhandled context fault from smmu
80dde187f734 RDMA/bnxt_re: Add a missing check in bnxt_qplib_query_srq
3687b450c5f3 RDMA/bnxt_re: Return error for SRQ resize
8eaca6b5997b RDMA/bnxt_re: Fix unconditional fence for newer adapters
8fcbf0a55f71 RDMA/bnxt_re: Remove a redundant check inside bnxt_re_vf_res_config
282fd66e2ef6 RDMA/bnxt_re: Avoid creating fence MR for newer adapters
809aa64ebff5 IB/hfi1: Fix a memleak in init_credit_return
27d19268cf39 accel/ivpu: Improve recovery and reset support
264b271d12d0 accel/ivpu: Improve stability of ivpu_submit_ioctl()
f1cc6aceecd0 accel/ivpu: Fix dev open/close races with unbind
a78a8da51b36 drm/ttm: replace busy placement with flags v6
9a574ea9069b tick/sched: Preserve number of idle sleeps across CPU hotplug events
a2933a8759a6 selftests: bonding: do not test arp/ns target with mode balance-alb/tlb
f9f031dd21a7 drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT
644649553508 clocksource: Skip watchdog check for large watchdog intervals
a3bdcdd022c6 HID: hidraw: fix a problem of memory leak in hidraw_release()
9f3fe29d77ef md: fix a suspicious RCU usage warning
ebeae8adf89d ksmbd: fix global oob in ksmbd_nl_policy
a717932db11e Merge tag 'nf-24-01-24' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
d76779dd3681 cxl/region：Fix overflow issue in alloc_hpa()
b16702be210b Merge tag 'exynos-drm-fixes-for-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes
e5767a95abf7 Merge tag 'drm-misc-next-fixes-2024-01-19' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
b8c68345949c Merge tag 'drm-intel-next-fixes-2024-01-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
97cf5d53b481 erofs: get rid of unneeded GFP_NOFS
f6cc4b6a3ae5 fjes: fix memleaks in fjes_hw_setup
6098d87eaf31 Merge tag 'ceph-for-6.8-rc2' of https://github.com/ceph/ceph-client
f22face166ef Merge tag 'integrity-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
9d71bc833f57 Merge branch 'net-bpf_xdp_adjust_tail-and-intel-mbuf-fixes'
0cbb08707c93 i40e: update xdp_rxq_info::frag_size for ZC enabled Rx queue
a045d2f2d03d i40e: set xdp_rxq_info::frag_size
fbadd83a612c xdp: reflect tail increase for MEM_TYPE_XSK_BUFF_POOL
3de38c871742 ice: update xdp_rxq_info::frag_size for ZC enabled Rx queue
290779905d09 intel: xsk: initialize skb_frag_t::bv_offset in ZC drivers
2ee788c06493 ice: remove redundant xdp_rxq_info registration
83014323c642 i40e: handle multi-buffer packets that are shrunk by xdp prog
ad2047cf5d93 ice: work on pre-XDP prog frag count
c5114710c8ce xsk: fix usage of multi-buffer BPF helpers for ZC XDP
f7f6aa8e2438 xsk: make xsk_buff_pool responsible for clearing xdp_buff::flags
269009893146 xsk: recycle buffer in case Rx queue was full
7f3d03c48b1e drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup
77be22473b28 Merge branch 'fix-module_description-for-net-p2'
bdc6734115d7 net: fill in MODULE_DESCRIPTION()s for rvu_mbox
07d1e0ce8743 net: fill in MODULE_DESCRIPTION()s for litex
8183c470c176 net: fill in MODULE_DESCRIPTION()s for fsl_pq_mdio
2e8757648855 net: fill in MODULE_DESCRIPTION()s for fec
07c42d237567 net: fill in MODULE_DESCRIPTION()s for enetc
27881ca8c8e1 net: fill in MODULE_DESCRIPTION()s for nps_enet
53c83e2d3648 net: fill in MODULE_DESCRIPTION()s for ep93xxx_eth
bb567fbbbbb4 net: fill in MODULE_DESCRIPTION()s for liquidio
39535d7ff6c1 net: fill in MODULE_DESCRIPTION()s for Broadcom bgmac
f5e414167be7 net: fill in MODULE_DESCRIPTION()s for 8390
0879020a7817 selftests: netdevsim: fix the udp_tunnel_nic test
439987f6f471 drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
096386a5bcf0 bcachefs: discard path uses unlock_long()
fcccdafd91f8 drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case
77e8aad5519e drm/msms/dp: fixed link clock divider bits be over written in BPC unknown case
0719b5338a0c selftests: net: fix rps_default_mask with >32 CPUs
1793ce9f205e drm/msm/dpu: fix kernel-doc warnings
43751d3da708 kunit: Mark filter* params as rw
cf10015a24f3 Merge tag 'execve-v6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
3eab830189d9 uselib: remove use of __FMODE_EXEC
1ed4b5631002 Revert "KEYS: encrypted: Add check for strsep"
4104e634bba4 drm/i915/gt: Reflect the true and current status of rc6_enable
9f538b415db8 net: mvpp2: clear BM pool before initialization
a5f5eee282a0 net: stmmac: Wait a bit for the reset to take effect
443b349019f2 samples/cgroup: add .gitignore file for generated samples
90383cc07895 exec: Distinguish in_execve from in_exec
4759ff71f23e exec: Check __FMODE_EXEC instead of in_execve for LSMs
28a98c39fa9b drm/xe: Remove additional spaces in devcoredump HW Engines section
89e394f0db47 drm/xe: Print registers spread in 2 u32 as u64
4376cee62092 drm/xe: Print more device information in devcoredump
facd388708f0 drm/xe: Stash GMD_ID value in xe_gt
d0009effa886 netfilter: nf_tables: validate NFPROTO_* family
f342de4e2f33 netfilter: nf_tables: reject QUEUE/DROP verdict parameters
b462579b2b86 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
c9d9eb9c53d3 netfilter: nft_limit: reject configurations that cause integer overflow
83ef64ebde37 drm/xe: Nuke xe from xe_devcoredump
98fefec8c381 drm/xe: Change devcoredump functions parameters to xe_sched_job
c65908c33b80 drm/xe: Remove double new lines in devcoredump
01acb2e8666a netfilter: nft_chain_filter: handle NETDEV_UNREGISTER for inet/ingress basechain
b253d87fd78b netfilter: nf_tables: cleanup documentation
f9f4b0c6425e spi: cs42l43: Handle error from devm_pm_runtime_enable
e787644caf76 rcu: Defer RCU kthreads wakeup when CPU is dying
1110ebe05826 Merge tag 'fbdev-for-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
b32431b75321 media: vb2: refactor setting flags and caps, fix missing cap
78e23c3e914a media: media videobuf2: Stop direct calls to queue num_buffers field
c14d17a32568 media: chips-media: wave5: Remove K3 References
520d97089793 dt-bindings: media: Remove K3 Family Prefix from Compatible
28e5126718c7 drm/ttm: return ENOSPC from ttm_bo_mem_space v3
d1b163aa0749 Revert "drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync"
668abe6dc7b6 ALSA: usb-audio: Sort quirk table entries
e169bd4fb2b3 aoe: avoid potential deadlock at set_capacity
15ade5bfa5ab nvme-rdma: Fix transfer length when write_generate/read_verify are 0
7822baa844a8 ALSA: usb-audio: add quirk for RODE NT-USB+
41951f83ef90 nvmet: add module description to stop warnings
92b0b0ff0ba3 nvme: add module description to stop warnings
2f8c7c3715f2 spi: Raise limit on number of chip selects
edcf9725150e nfsd: fix RELEASE_LOCKOWNER
d915a6850e27 ALSA: usb-audio: Add delay quirk for MOTU M Series 2nd revision
d62ccb59afcd ALSA: virtio: remove duplicate check if queue is broken
7c4298534ce3 ALSA: usb-audio: fix typo
fcfc9f711d1e ALSA: hda/realtek - Add speaker pin verbtable for Dell dual speaker platform
b184c8c2889c genirq: Initialize resend_node hlist for all interrupt descriptors
56062d60f117 x86/entry/ia32: Ensure s32 is sign extended to s64
9e3a13f3eef6 drm/xe: Remove PVC from xe_wa kunit tests
d186e51b0ed0 drm/xe/vm: bugfix in xe_vm_create_ioctl
c0e2508cb100 drm/xe/xe2: Use XE_CACHE_WB pat index
981460d8ee60 drm/xe/display: Avoid calling readq()
52e8948c6b6a drm/xe/mmio: Cast to u64 when printing
32f6c3325703 drm/xe: Use _ULL for u64 division
03b72dbbd4e9 drm/xe: Use a NULL pointer instead of 0.
3213b8070ac6 drm/xe/dmabuf: Make xe_dmabuf_ops static
aef855df7e1b net/mlx5e: fix a potential double-free in fs_any_create_groups
3c6d5189246f net/mlx5e: fix a double-free in arfs_create_groups
315a597f9bcf net/mlx5e: Ignore IPsec replay window values on sender side
20f5468a7988 net/mlx5e: Allow software parsing when IPsec crypto is enabled
20cbf8cbb827 net/mlx5: Use mlx5 device constant for selecting CQ period mode for ASO
5b2a2523eeea net/mlx5: DR, Can't go to uplink vport on RX rule
5665954293f1 net/mlx5: DR, Use the right GVMI number for drop action
ec7cc38ef9f8 net/mlx5: Bridge, fix multicast packets sent to uplink
cc8091587779 net/mlx5: Fix a WARN upon a callback command failure
d76fdd31f953 net/mlx5e: Fix peer flow lists handling
c20767fd45e8 net/mlx5e: Fix inconsistent hairpin RQT sizes
3876638b2c7e net/mlx5e: Fix operation precedence bug in port timestamping napi_poll context
cfbc3608a8c6 net/mlx5: Fix query of sd_group field
25461ce8b3d2 net/mlx5e: Use the correct lag ports number when creating TISes
0077a504e1a4 ahci: asm1166: correct count of reported ports
4e4a1183f281 phy: lan966x: Add missing serdes mux entry
249abaf3bf0d phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
62a5df451ab9 phy: qcom-qmp-usb: fix serdes init sequence for IPQ6018
f74c35b630d4 phy: qcom-qmp-usb: fix register offsets for ipq8074/ipq6018
ab5ae65fb25d drm/xe: Remove PVC from xe_wa kunit tests
f4469f385835 scsi: storvsc: Fix ring buffer size calculation
993d1c346b1a cifs: fix stray unlock in cifs_chan_skip_or_disable
4cdad8026186 cifs: set replay flag for retries of write command
4f1fffa23769 cifs: commands that are retried should have replay flag set
64cc377b7628 cifs: helper function to check replayable error codes
a68106a6928e cifs: translate network errors on send to -ECONNABORTED
4373534a9850 scsi: core: Move scsi_host_busy() out of host lock for waking up EH handler
32f2a0afa95f net/sched: flower: Fix chain template offload
04fe7c5029cb selftests: fill in some missing configs for net
6941f67ad37d hv_netvsc: Calculate correct ring size when PAGE_SIZE is not 4 Kbytes
3222bc997a24 Revert "net: macsec: use skb_ensure_writable_head_tail to expand the skb"
fc43a8ac396d cifs: cifs_pick_channel should try selecting active channels
966cc171c8be cifs: Share server EOF pos with netfslib
6d46d09a0d7d drm/i915/mtl: Wake GT before sending H2G message
8deb05c84b63 smb: Work around Clang __bdos() type confusion
615d30064886 Merge tag 'trace-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
16bae3e13778 io_uring: enable audit and restrict cred override for IORING_OP_FIXED_FD_INSTALL
1732ebc4a261 riscv, bpf: Fix unpredictable kernel crash about RV64 struct_ops
d546978e0c07 docs: admin-guide: remove obsolete advice related to SLAB allocator
ea7dcd8a48ea doc: admin-guide/kernel-parameters: remove useless comment
3f0e4df37a1b docs/accel: correct links to mailing list archives
d2d0223441d3 docs/sphinx: Fix TOC scroll hack for the home page
d3b93fe159b8 Merge tag 'linux-cpupower-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux
5d390df3bdd1 smb: client: delete "true", "false" defines
1347775dea7f Merge tag 'wireless-2024-01-22' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless
41353fbad4f5 nvmet: unify aer type enum
13f3956eb568 block: Fix WARNING in _copy_from_iter
6240c2c43fd0 drm/xe: Document nested struct members according to guidelines
02c4e64a860a drm/xe/xe2_lpg: Introduce performance guide changes
c885886bda2a drm/xe: Fix typo in vram frequency sysfs documentation
de8b6e1c231a spi: hisi-sfc-v3xx: Return IRQ_NONE if no interrupts were detected
a67e1f0bd456 regulator: ti-abb: don't use devm_platform_ioremap_resource_byname for shared interrupt register
f13d8f28fe9f Merge branch 'netfs-fixes' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs
834bf76add3e eventfs: Save directory inodes in the eventfs_inode structure
67794f882adc ALSA: usb-audio: Skip setting clock selector for single connections
d2baf8cc82c1 riscv/efistub: Tighten ELF relocation check
afb2a4fb8455 riscv/efistub: Ensure GP-relative addressing is not used
633cd6fe6e19 spi: spi-cadence: Reverse the order of interleaved write and read operations
e267a5b3ec59 spi: spi-imx: Use dev_err_probe for failed DMA channel requests
574bf7bbe837 spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
435e202d645c ipv6: init the accept_queue's spinlocks in inet6_create
c41336f4d690 pmdomain: mediatek: fix race conditions with genpd
bc77bde2d3f0 drm/bridge: sii902x: Fix audio codec unregistration
dffdfb8f5de1 drm/bridge: sii902x: Fix probing race issue
f86ae204bec4 drm/bridge: tc358767: Limit the Pixel PLL input range
420332b94119 ovl: mark xwhiteouts directory with overlay.opaque='x'
26dd6a5667f5 HID: i2c-hid: Skip SET_POWER SLEEP for Cirque touchpad on system suspend
b6eda11c44dc HID: nvidia-shield: Add missing null pointer checks to LED initialization
234ec0b6034b netlink: fix potential sleeping issue in mqueue_flush_file
090e3bec0176 x86/cpu: Add model number for Intel Clearwater Forest processor
3e4147f33f8b x86/CPU/AMD: Add X86_FEATURE_ZEN5
97de5a15edf2 selftest: Don't reuse port for SO_INCOMING_CPU test.
7267e8dcad6b tcp: Add memory barrier to tcp_push()
71fc3249f50a video/nomodeset: Select nomodeset= parameter with CONFIG_VIDEO
55ea87a4f900 video/cmdline: Hide __video_get_options() behind CONFIG_FB_CORE
a3b6792e990d video/cmdline: Introduce CONFIG_VIDEO for video= parameter
a96921006605 ALSA: usb-audio: Add a quirk for Yamaha YIT-W12TX transmitter
ba407525f824 drm/i915: Try to preserve the current shared_dpll for fastset on type-c ports
4b088005c897 fbdev: stifb: Fix crash in stifb_blank()
a2ed0a44d637 ALSA: hda/cs8409: Suppress vmaster control for Dolphin models
56beedc88405 ALSA: hda: Increase default bdl_pos_adj for Apollo Lake
3526860f26fe ALSA: hda: Replace numeric device IDs with constant values
f0b7a0d1d466 Merge branch 'master' into mm-hotfixes-stable
7ed2632ec7d7 drm/ttm: fix ttm pool initialization for no-dma-device drivers
e01a83e12604 Revert "btrfs: zstd: fix and simplify the inline extent decompression"
be3382ecdf31 Merge drm/drm-next into drm-xe-next
b90493505347 afs: Fix missing/incorrect unlocking of RCU read lock
cfcc005dbcc7 afs: Remove afs_dynroot_d_revalidate() as it is redundant
17ba6f0bd14f afs: Fix error handling with lookup via FS.InlineBulkStatus
57e9d49c5452 afs: Hide silly-rename files from userspace
c3d6569a4332 cachefiles, erofs: Fix NULL deref in when cachefiles is not doing ondemand-mode
2b44760609e9 tracing: Ensure visibility when inserting an element into tracing_map
7055c5856aa1 Revert "drm/amd/pm: fix the high voltage and temperature issue"
e432f14a4285 drm/amd/display: hook up DCN20 color blocks data to DTN log
f5be15bb2699 drm/amd/display: add DPP and MPC color caps to DTN log
8feca9f32ce6 drm/amd/display: Address kdoc for eDP Panel Replay feature in 'amdgpu_dm_crtc_set_panel_sr_feature()'
060963bf7759 drm/amd/display: hook up DCN30 color blocks data to DTN log
9bfb1a538a25 drm/amdgpu: Fix null pointer dereference
2866a4549cf4 drm/amdgpu: skip call ras_late_init if ras block is not supported
9c3f6e2c4ee0 drm/amdgpu: Show vram vendor only if available
e0eb08dcec0f drm/amdgpu: Avoid fetching vram vendor information
bba8200a184a drm/amd/pm: update the power cap setting
42ffb3c396b5 drm/amdgpu/pm: Fix the power source flag error
a499b68cce3c drm/amd/display: Promote DAL to 3.2.269
a125206c2004 drm/amd/display: [FW Promotion] Release 0.0.201.0
f980579c29a6 drm/amd/display: Replay + IPS + ABM in Full Screen VPB
4516a7930203 drm/amd/display: turn off windowed Mpo ODM feature for dcn321
624e0d7f39cb drm/amd/display: Add GART memory support for dmcub
8457bddc266c drm/amd/display: Revert "Rework DC Z10 restore"
2a8e918f48bd drm/amd/display: add power_state and pme_pending flag
60818ed76577 drm/amd/display: Add IPS checks before dcn register access
b8f2234846d7 drm/amd/display: Add NULL-checks in dml2 assigned pipe search
855f42ba9254 drm/amd/display: Add usb4_bw_alloc_support flag
9feaa4c0de83 drm/amd/display: Promote DAL to 3.2.268
6348469450d6 drm/amd/display: create DCN3-specific log for MPC state
c597479f27b6 drm/amd/display: Fix timing bandwidth calculation for HDMI
aa708057c410 drm/amd/display: add get_gamut_remap helper for MPC3
e808825c6c38 drm/amd/display: fill up DCN3 DPP color state
f26407564f1e drm/amd/display: read gamut remap matrix in fixed-point 31.32 format
07b2483ee1d0 drm/amd/display: Add dpp_get_gamut_remap functions
efbfc987a331 drm/amd/display: decouple color state from hw state log
3295580d4683 drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
1757bb7dab6d drm/amdgpu: update check condition of query for ras page retire
18d71047922e Revert "drm/amd/pm: smu v13_0_6 supports ecc info by default"
e8cc57a96cb0 drm/amd/display: Drop kdoc markers for some Panel Replay functions
be91a828d08a drm/amdgpu: Cleanup inconsistent indenting in 'amdgpu_gfx_enable_kcq()'
0d50f4048de9 drm/amd/pm: udpate smu v13.0.6 message permission
0795b5d23490 drm/amdgpu:Support retiring multiple MCA error address pages
afb617f38f22 drm/amdgpu: add interface to check mca umc status
6c23f3d12a92 drm/amdgpu: Use asynchronous polling to handle umc_v12_0 poisoning
ee9c3031d027 drm/amdgpu: Fix ras features value calltrace
3fdcd0a31d7a drm/amdgpu: Prepare for asynchronous processing of umc page retirement
22f6e3e11297 drm/amdgpu: Add log info for umc_v12_0
3e22174603da drm/amdgpu: fix wrong sizeof argument
00a11f977beb drm/amdgpu: Enable seq64 manager and fix bugs
843609df0be7 netfs: Fix a NULL vs IS_ERR() check in netfs_perform_write()
3be0b3ed1d76 netfs, fscache: Prevent Oops in fscache_put_cache()
c40497d82387 cifs: Don't use certain unnecessary folio_*() functions
fa7d614da3c5 afs: Don't use certain unnecessary folio_*() functions
059e7c6b8f5e drm/radeon/ni_dpm: remove redundant NULL check
202bc57b6756 netfs: Don't use certain unnecessary folio_*() functions
bf38a4e4ab68 drm/radeon: remove dead code in ni_mc_load_microcode()
7c70825d1603 ASoC: qcom: volume fixes and codec cleanups
7c834a726596 ASoC: codecs: fix ES8326 performance and pop noise
018856c3f171 fbcon: Fix incorrect printed function name in fbcon_prepare_logo()
5d9248eed480 Merge tag 'for-6.8-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
73ae7e1c7644 ata: libata-sata: improve sysfs description for ATA_LPM_UNKNOWN
84c39ec57d40 exec: Fix error handling in begin_new_exec()
52998cdd8d34 Merge branch '6.8/scsi-staging' into 6.8/scsi-fixes
afa6ac2690bb HID: logitech-hidpp: add support for Logitech G Pro X Superlight 2
bdd8f62431eb exec: Add do_close_execat() helper
c481016bb4f8 ASoC: qcom: sc8280xp: limit speaker volumes
92c02d74ba7b ASoC: codecs: ES8326: Remove executable bit
22fb4f041999 cpufreq/amd-pstate: Fix setting scaling max/min freq values
8788a17c2319 exec: remove useless comment
27daa514c48d ELF, MAINTAINERS: specifically mention ELF
9c46e3a5232d iio: adc: ad7091r8: Fix error code in ad7091r8_gpio_setup()
59598510be1d iio: adc: ad_sigma_delta: ensure proper DMA alignment
8e98b87f515d iio: imu: adis: ensure proper DMA alignment
f1dfcbaa7b9d iio: humidity: hdc3020: Add Makefile, Kconfig and MAINTAINERS entry
35ec2d03b282 iio: imu: bno055: serdev requires REGMAP
792595bab492 iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
b67f3e653e30 iio: pressure: bmp280: Add missing bmp085 to SPI id table
95a0d596bbd0 iio: core: fix memleak in iio_device_register_sysfs
d72a4caf6859 cxl/pci: Skip irq features if MSI/MSI-X are not supported
c97dac57c804 tools/testing/nvdimm: Disable "missing prototypes / declarations" warnings
68deb9972079 tools/testing/cxl: Disable "missing prototypes / declarations" warnings
d53271c05965 selftests/rseq: Do not skip !allowed_cpus for mm_cid
610347effc2e Merge tag 'Wstringop-overflow-for-6.8-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux
0f0d819aef6f Merge tag 'xsa448-6.8-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
3e44f325f6f7 bcachefs: fix incorrect usage of REQ_OP_FLUSH
612e1110d689 bcachefs: Add gfp flags param to bch2_prt_task_backtrace()
1a84c213146a drm/dp_mst: Separate @failing_port list in drm_dp_mst_atomic_check_mgr() comment
6bc41f9cf252 Revert "drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB allocation"
1de63528e728 drm/i915: Perform vblank evasion around legacy cursor updates
dea1731dfc25 drm/i915: Move intel_vblank_evade() & co. into intel_vblank.c
318ec320c6c7 drm/i915: Move the min/max scanline sanity check into intel_vblank_evade()
b5ad7ce024b3 drm/i915: Extract intel_vblank_evade()
b1f9bc3dbe28 drm/i915: Include need_vlv_dsi_wa in intel_vblank_evade_ctx
637bda52bf36 drm/i915: Introduce struct intel_vblank_evade_ctx
bb83f348ead2 drm/i915: Reorder drm_vblank_put() vs. need_vlv_dsi_wa
c045bc428f77 drm/i915: Decouple intel_crtc_vblank_evade_scanlines() from atomic commits
f6bf0424cadc drm/xe/vm: bugfix in xe_vm_create_ioctl
4d5b7daa3c61 drm/bridge: anx7625: Ensure bridge is suspended in disable()
7777f47f2ea6 block: Move checking GENHD_FL_NO_PART to bdev_add_partition()
6dd9a236042e soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
cf41cebf9dc8 drm/exec, drm/gpuvm: Prefer u32 over uint32_t
6154fb9c2134 kselftest: dt: Stop relying on dirname to improve performance
87399f1ff922 media: tc358743: register v4l2 async device only after successful setup
8afe3c7fcaf7 spi: intel-pci: Add support for Arrow Lake SPI serial flash
6c314425b9ef spi: intel-pci: Remove Meteor Lake-S SoC PCI ID from the list
b3cbdcc19181 regulator: pwm-regulator: Manage boot-on with disabled PWM channels
6a7d11efd691 regulator: pwm-regulator: Calculate the output voltage for disabled PWMs
c92688cac239 regulator: pwm-regulator: Add validity checks in continuous .get_voltage
70b476995665 ASoC: allow up to eight CPU/codec DAIs
35314e39dabc ASoC: codecs: wcd934x: drop unneeded regulator include
22221b13d0c2 ASoC: codecs: wcd938x: skip printing deferred probe failuers
086df711d9b8 ASoC: codecs: wcd938x: handle deferred probe
6cc2aa9a75f2 ASoC: amd: acp: Add check for cpu dai link initialization
4bae2029ffcc ASoC: amd: acp: Update platform name for different boards
1d565de8d53c ASoC: amd: acp: Enable rt5682s clocks in acp slave mode
4d0e8bdfa4a5 ASoC: codecs: wcd938x: fix headphones volume controls
aafa3acf62f1 ASoC: codecs: wcd9335: drop unused gain hack remnant
46188db080bd ASoC: codecs: lpass-wsa-macro: fix compander volume hack
b53cc6144a3f ASoC: codecs: wsa883x: fix PA volume control
8c99a0a607b5 ASoC: codecs: ES8326: fix the capture noise issue
a3aa9255d6cc ASoC: codecs: ES8326: Minimize the pop noise on headphone
14a0a1ec3335 ASoC: codecs: ES8326: Improving the THD+N performance
523d242d4309 ASoC: codecs: ES8326: improving crosstalk performance
72a0cfdc3ad7 drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting
b2fe2292624a drm: bridge: samsung-dsim: enter display mode in the enable() callback
1a9f2c776d14 Documentation: KUnit: Update the instructions on how to test static functions
a1af6a2bfa0c kunit: run test suites only after module initialization completes
57e39086fb86 MAINTAINERS: kunit: Add Rae Moar as a reviewer
083974ebb8fc kunit: device: Fix a NULL vs IS_ERR() check in init()
ed1a72fb0d64 kunit: Fix a NULL vs IS_ERR() bug
f7cfe7017b53 x86/paravirt: Make BUG_func() usable by non-GPL modules
f0e4a1356466 pmdomain: renesas: r8a77980-sysc: CR7 must be always on
741ba0134fa7 pmdomain: core: Move the unused cleanup to a _sync initcall
d59da02d1ab6 netfs: Add Jeff Layton as reviewer
3c18703079b6 netfs, cachefiles: Change mailing list
8f04135c8843 drm/vmwgfx: remove vmw_vram_gmr_placement
192cdb1c907f cpufreq: intel_pstate: Refine computation of P-state for given frequency
4b5581f11207 accel/ivpu: Disable PLL after VPU IP reset during FLR
1513664f3402 ALSA: hda/realtek: fix mute/micmute LEDs for HP ZBook Power
6a02867560f7 drm/xe/xe2: Use XE_CACHE_WB pat index
0650006a93a2 dmaengine: fsl-qdma: Remove a useless devm_kfree()
3aa58cb51318 dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
968bc1d7203d dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
bc9847c9ba13 dmaengine: ti: k3-udma: Report short packet errors
13e788deb734 net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
6e2276203ac9 dmaengine: ti: edma: Add some null pointer checks to the edma_probe
732c35ce6d48 platform/mellanox: mlxbf-pmc: Fix offset calculation for crspace events
8cbc756b8026 platform/mellanox: mlxbf-tmfifo: Drop Tx network packet when Tx TmFIFO is full
aaf632f7ab6d net: micrel: Fix PTP frame parsing for lan8814
94fa82b095c7 Merge branch 'dpll-fixes'
7dc5b18ff71b dpll: fix register pin with unregistered parent pin
db2ec3c94667 dpll: fix userspace availability of pins
830ead5fb0c5 dpll: fix pin dump crash for rebound module
b6a11a7fc4d6 dpll: fix broken error path in dpll_pin_alloc(..)
c6a783be82c8 thermal: intel: powerclamp: Remove dead code for target mwait value
ef4852167245 Merge branch 'tun-fixes'
f1084c427f55 tun: add missing rx stats accounting in tun_xdp_act
5744ba05e7c4 tun: fix missing dropped counter in tun_xdp_act
eab4f56d3e75 ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd
d76c762e7ee0 clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names
80c86ff6800b arm64: dts: exynos: gs101: comply with the new cmu_misc clock names
1755c4b0372a dt-bindings: clock: gs101: rename cmu_misc clock-names
84aef4ed5970 gpio: eic-sprd: Clear interrupt after set the interrupt type
8530ecaf35f2 MAINTAINERS: remove defunct acpi4asus project info from asus notebooks section
20fe5e9be47e MAINTAINERS: add Luke Jones as maintainer for asus notebooks
452c314988db MAINTAINERS: Remove Perry Yuan as DELL WMI HARDWARE PRIVACY SUPPORT maintainer
41237735ccde platform/x86: silicom-platform: Add missing "Description:" for power_cycle sysfs attr
348d9cc7bde3 platform/x86: intel-wmi-sbl-fw-update: Fix function name in error message
9e054ed05dda platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()
5913320eb0b3 platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
416de0246f35 platform/x86: intel-uncore-freq: Fix types in sysfs callbacks
8446f9d11678 platform/x86: wmi: Fix wmi_dev_probe()
b73e43dcd7a8 dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
29e473f4b51e platform/x86: wmi: Fix notify callback locking
3ea7f59af8ff platform/x86: wmi: Decouple legacy WMI notify handlers from wmi_block_list
3d8a29fec2cb platform/x86: wmi: Return immediately if an suitable WMI event is found
6ba7843b59b7 platform/x86: wmi: Fix error handling in legacy WMI notify handler functions
e4cec073b775 dmaengine: at_hdmac: fix some kernel-doc warnings
f64fdde9bc77 MIPS: sgi-ip32: Fix missing prototypes
ab58a2f319de MIPS: sgi-ip30: Fix missing prototypes
e3a4f1b7ada8 MIPS: fw arc: Fix missing prototypes
f134bd1ebc28 MIPS: sgi-ip27: Fix missing prototypes
0c565d16b800 firmware: arm_ffa: Handle partitions setup failures
ace760d9c049 firmware: arm_ffa: Use xa_insert() and check for result
ad9d9a107a43 firmware: arm_ffa: Simplify ffa_partitions_cleanup()
c00d9738fd5f firmware: arm_ffa: Check xa_load() return value
5ff30ade16cd firmware: arm_ffa: Add missing rwlock_init() for the driver partition
59b2e242b131 firmware: arm_ffa: Add missing rwlock_init() in ffa_setup_partitions()
6bd1b3fede83 firmware: arm_scmi: Fix the clock protocol supported version
27600c96e2ff firmware: arm_scmi: Fix the clock protocol version for v3.2
b5dc0ffd3656 firmware: arm_scmi: Use xa_insert() when saving raw queues
e8ef4bbe39b9 firmware: arm_scmi: Use xa_insert() to store opps
0726fcc8d4af firmware: arm_scmi: Replace asm-generic/bug.h with linux/bug.h
437a310b2224 firmware: arm_scmi: Check mailbox/SMT channel for consistency
feab19143a1c MIPS: Alchemy: Fix missing prototypes
0dd20a48a541 MIPS: Cobalt: Fix missing prototypes
b246271d257b accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY param
37dee2a2f433 accel/ivpu: Improve buffer object debug logs
b7a0e75632eb accel/ivpu: Disable buffer sharing among VPU contexts
a8c099d5d0e4 accel/ivpu: Free buffer sgt on unbind
7f66319927a8 accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
2a20b857dd65 accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
8047d36fe563 accel/ivpu: Add debug prints for MMU map/unmap operations
929acfb9c539 accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
30cf36bb0408 accel/ivpu: Dump MMU events in case of VPU boot timeout
805c74eac8cb gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
240520520b90 HAX net/phy: Suppress WARN from phy_error
5f58bde4d775 HAX net/phy: Suppress WARN for calling stop while halted
a0188ebc7e38 HAX sound: Disable probing snd_hda with DG1
e81a4588b15e HAX suspend: Disable S3/S4 for fi-bdw-samus
1a02e6134d2c perf/core: Only copy-to-user after completely unlocking all locks, v3.
da8615de56e8 pci/msi: Stop warning for MSI enabling failure
e073db1ef2a9 mm: Show slab debug as offsets from section base not hashed pointers
c37e9157a108 net/sch_generic: Shut up noise
3470640bc6de sched: Mark "RT throttling activated" as KERN_NOTICE
f0ac59b3295d RFC: soft/hardlookup: taint kernel
31a3efd3abec RFC: hung_task: taint kernel
baeca0d44379 ICL HACK: usb/icl: Work around ACPI boottime crash
70558506a795 libata: Downgrade unsupported feature warnings to notifications
8fff128a3fe7 x86: Downgrade clock throttling thermal event critical error
7cb85659709f kernel/panic: Show the stacktrace after additional notifier messages
2c30054792ae ftrace: Allow configuring global trace buffer size (for dump-on-oops)
e4fb5e8ca65d lockdep: Swap storage for pin_count and references
cf79f291f985 Merge v6.8-rc1 into drm-misc-fixes
d8d222e09dab xfs: read only mounts with fsopen mount API are busted
4050957c7c2c drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
960b537e9172 drm/exynos: fix accidental on-stack copy of exynos_drm_plane
477552e1d339 drm/exynos: fix incorrect type issue
d09486a04f5d net: fix removing a namespace with conflicting altnames
0086ffec768b tools cpupower bench: Override CFLAGS assignments
a5e0ace04fbf init: Kconfig: Disable -Wstringop-overflow for GCC-11
113a61863ecb Makefile: Enable -Wstringop-overflow globally
ded080c86b3f rbd: don't move requests to the running list on errors
cd30e8bde28a rbd: remove usage of the deprecated ida_simple_*() API
72b0cbf6b810 smb: Fix some kernel-doc comments
6613476e225e Linux 6.8-rc1
35a4474b5c3d Merge tag 'bcachefs-2024-01-21' of https://evilpiepirate.org/git/bcachefs
4fbbed787267 Merge tag 'timers-core-2024-01-21' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
7b297a5cc930 Merge tag 'powerpc-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
249f441f83c5 bcachefs: Improve inode_to_text()
d826cc57c53f bcachefs: logged_ops_format.h
8d52ba60c4dc bcachefs: reflink_format.h
b2fa1b633bac bcachefs; extents_format.h
0560eb9abf7d bcachefs: ec_format.h
c6c4ff6507c4 bcachefs: subvolume_format.h
8fed323b1404 bcachefs: snapshot_format.h
d455179fce10 bcachefs: alloc_background_format.h
72e0801049c9 bcachefs: xattr_format.h
7ffc4daa5f08 bcachefs: dirent_format.h
b36425da71fe bcachefs: inode_format.h
82de6207fb20 bcachefs; quota_format.h
43314801a439 bcachefs: sb-counters_format.h
3a58dfbc46c2 bcachefs: counters.c -> sb-counters.c
12207f49ef41 bcachefs: comment bch_subvolume
d32088f2f2f0 bcachefs: bch_snapshot::btime
7be0208fc992 bcachefs: add missing __GFP_NOWARN
d7e77f53e90e bcachefs: opts->compression can now also be applied in the background
ec4edd7b9d20 bcachefs: Prep work for variable size btree node buffers
2acc59dd88d2 bcachefs: grab s_umount only if snapshotting
369acf97d6fd bcachefs: kvfree bch_fs::snapshots in bch2_fs_snapshots_exit
00fff4dd5866 bcachefs: bios must be 512 byte algined
aead3428e8b7 bcachefs: remove redundant variable tmp
b97de453651f bcachefs: Improve trace_trans_restart_relock
46bf2e9cc745 bcachefs: Fix excess transaction restarts in __bchfs_fallocate()
1a5039041b37 bcachefs: extents_to_bp_state
ba96d36ca526 bcachefs: bkey_and_val_eq()
e6a2566f7a00 bcachefs: Better journal tracepoints
4ae016607b90 bcachefs: Print size of superblock with space allocated
a6548c8b5eb5 bcachefs: Avoid flushing the journal in the discard path
189c176c5dd3 bcachefs: Improve move_extent tracepoint
ef740a1e2939 bcachefs: Add missing bch2_moving_ctxt_flush_all()
fa3185af43dc bcachefs: Re-add move_extent_write tracepoint
d92b83f592d8 bcachefs: bch2_kthread_io_clock_wait() no longer sleeps until full amount
741c1d3ec1a4 bcachefs: Add .val_to_text() for KEY_TYPE_cookie
0124f42da70c bcachefs: Don't pass memcmp() as a pointer
2368fcf341d3 Merge tag 'header_cleanup-2024-01-20' of https://evilpiepirate.org/git/bcachefs
359724fa3ab7 idpf: distinguish vports by the dev_port attribute
a54d51fb2dfb udp: fix busy polling
57f2d2097603 bcachefs: Reduce would_deadlock restarts
5b14ce35af90 bcachefs: bch2_trans_account_disk_usage_change()
8e7834a88316 bcachefs: bch_fs_usage_base
4f564f4f9fdd bcachefs: bch2_prt_compression_type()
e58f963cecbd bcachefs: helpers for printing data types
38c23fb809f6 bcachefs: BTREE_TRIGGER_ATOMIC
9d5dba2ba86d bcachefs: drop to_text code for obsolete bps in alloc keys
3fe8a1864042 bcachefs: eytzinger_for_each() declares loop iter
4ecad0da9de8 bcachefs: Don't log errors if BCH_WRITE_ALLOC_NOWAIT
e240c1b3635e bcachefs: fix memleak in bch2_split_devs
e421946be7d9 fbdev: sis: Error out if pixclock equals zero
04e5eac8f3ab fbdev: savage: Error out if pixclock equals zero
fead90507a37 fbdev: vt8500lcdfb: Remove unnecessary print function dev_err()
7a396820222d Merge tag 'v6.8-rc-part2-smb-client' of git://git.samba.org/sfrench/cifs-2.6
65163d16fcae Merge tag 'dmaengine-fix-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine
80fc600fafee Merge tag 'coccinelle-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux
31e97d7c9ae3 media: solo6x10: replace max(a, min(b, c)) by clamp(b, a, c)
ff82e84e80fc coccinelle: device_attr_show: simplify patch case
978ffcbf00d8 execve: open the executable file before doing anything else
e5075d8ec564 Merge tag 'riscv-for-linus-6.8-mw4' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
c25b24fa72c7 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
125514880ddd Merge tag 'sh-for-v6.8-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux
b1737ad4406a Merge tag 'fbdev-for-6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
e3f9bed9bee2 llc: Drop support for ETH_P_TR_802_2.
dad555c816a5 llc: make llc_ui_sendmsg() more robust against bonding changes
6c21660fe221 vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
9b6979563b83 Merge branch 'bnxt_en-bug-fixes'
467739baf636 bnxt_en: Fix possible crash after creating sw mqprio TCs
c20f482129a5 bnxt_en: Prevent kernel warning when running offline self test
523384a6aa09 bnxt_en: Fix RSS table entries calculation for P5_PLUS chips
2ad8e57338ac bnxt_en: Fix memory leak in bnxt_hwrm_get_rings()
3c1069fa4287 bnxt_en: Wait for FLR to complete during probe
198bc90e0e73 tcp: make sure init the accept_queue's spinlocks once
b01f15a7571b selftests: bonding: Increase timeout to 1200s
9d64bf433c53 Merge tag 'perf-tools-for-v6.8-1-2024-01-09' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
57f22c8dab6b Merge tag 'strlcpy-removal-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
18b5cb6cb85c Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
24fdd5189914 Merge tag 'loongarch-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
2bebc3cd4870 Revert "firmware/sysfb: Clear screen_info state after consuming it"
836e487149c2 drm/xe: Enable 32bits build
8d038f49c1f3 drm/xe: Fix cast on trace variable
406663f777be drm/xe/display: Avoid calling readq()
6d8d038364d8 drm/xe/mmio: Cast to u64 when printing
7b5bdb447b14 drm/xe: Use _ULL for u64 division
9bc44c51a046 Merge tag 'devicetree-for-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
68ea60a7961c coccinelle: device_attr_show: Adapt to the latest Documentation/filesystems/sysfs.rst
a638bfbfa1f8 Merge tag 'spi-fix-v6.8-merge-window' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
a1fe5b6d0dce Merge tag 'sound-fix-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
d26270061ae6 string: Remove strlcpy()
e08b57581539 Merge tag 'drm-next-2024-01-19' of git://anongit.freedesktop.org/drm/drm
ab1e2d0fccc5 Merge tag 'for-v6.8-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply
237c31cb5d83 Merge tag 'apparmor-pr-2024-01-18' of git://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor
556e2d17cae6 Merge tag 'ceph-for-6.8-rc1' of https://github.com/ceph/ceph-client
ec2d264ae4bb Merge tag 'xfs-6.8-merge-4' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
8cb1bb178cdb Merge tag '6.8-rc-smb-server-fixes-part2' of git://git.samba.org/ksmbd
16df6e07d6a8 Merge tag 'vfs-6.8.netfs' of gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs
70a46e1fda3b drm/doc/rfc: Removing missing reference to xe.rst
78e727e58e54 cifs: update iface_last_update on each query-and-update
f591062bdbf4 cifs: handle servers that still advertise multichannel after disabling
ce09f8d8a713 cifs: new mount option called retrans
49fe25ce8381 cifs: reschedule periodic query for server interfaces
66c9314b61ed smb: client: don't clobber ->i_rdev from cached reparse points
f83709b9e0eb smb: client: get rid of smb311_posix_query_path_info()
858e74876c5c smb: client: parse owner/group when creating reparse points
76025cc2285d smb: client: fix parsing of SMB3.1.1 POSIX create context
cfb7a13399be cifs: update known bugs mentioned in kernel docs for cifs
f24a70106dc1 lib: checksum: Fix build with CONFIG_NET=n
286c4dcf6cc6 Documentation/gpu: Reference articles on Linux graphics stack
71fee48fb772 tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
92b47c3b8b24 drm/i915: Replace a memset() with zero initialization
94501c3ca640 drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT
06af1954aecc drm/xe: Do not flood dmesg with guc log
ef175b29a242 of: Stop circularly including of_device.h and of_platform.h
527eb67e0cfb clk: qcom: gcc-x1e80100: Replace of_device.h with explicit includes
ed7dafcc5364 thermal: loongson2: Replace of_device.h with explicit includes
5e6c3454b405 net: can: Use device_get_match_data()
61c2ef4b6cb0 sparc: Use device_get_match_data()
f87f5ea43959 drm/xe/xe_debugfs: Print skip_guc_pc in xe info
cb95a4fa50bb dmaengine: dw-edma: increase size of 'name' in debugfs code
6386f6c995b3 dmaengine: fsl-qdma: increase size of 'irq_name'
404290240827 dmaengine: shdma: increase size of 'dev_id'
9c0155b652bf drm/xe: constify engine class sysfs attributes
480ea9e306c7 drm/xe: make gpuvm_ops const
3cacf808c9d8 drm/xe: make hwmon_info const
c96baaa83993 drm/xe: make heci_gsc_irq_chip const
2fe36db5fd24 drm/xe: make xe_ttm_funcs const
f829bca2e294 dmaengine: xilinx: xdma: Fix kernel-doc warnings
62b68a887959 dmaengine: usb-dmac: Avoid format-overflow warning
dbc153fd3c14 net/smc: fix illegal rmb_desc access in SMC-D connection dump
e626cb02ee83 futex: Prevent the reuse of stale pi_state
8ea8c918e7db drm/xe: Modify the cfb size to be page size aligned for FBC
c4d6dcb3b625 dmaengine: sh: rz-dmac: Avoid format-overflow warning
98373a211593 dmaengine: imx-sdma: fix Excess kernel-doc warnings
620a7e4c1f03 dmaengine: xilinx: xdma: Fix initialization location of desc in xdma_channel_isr()
fe0d495e759c dmaengine: xilinx: xdma: Fix operator precedence in xdma_prep_interleaved_dma()
b93216d3be55 Merge tag 'dmaengine-6.8-rc1' into fixes
99fe83ab3bb0 sh: vsyscall: Remove unnecessary $(foreach ...)
6a9531c3a880 memblock: fix crash when reserved memory is not added to memory
180a8f12c21f Input: goodix - accept ACPI resources with gpio_count == 3 && gpio_int_idx == 0
2095d5071d60 drm/panel: novatek-nt36672e: Include <linux/of.h>
2f862fdc0fd8 drm: panel-orientation-quirks: Add quirk for GPD Win Mini
d87123aa9a79 sh: ecovec24: Rename missed backlight field from fbdev to dev
009f0a64f9cc Merge tag 'drm-xe-next-fixes-2024-01-16' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
cacea81390fd nouveau/vmm: don't set addr on the fail path to avoid warning
4d0e8f9a361b KVM: riscv: selftests: Add Zfa extension to get-reg-list test
41182cc6f507 RISC-V: KVM: Allow Zfa extension for Guest/VM
1216fdd99be1 KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
f46300285926 RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
1a3bc507821d KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
ab6da9cdc3f3 RISC-V: KVM: Allow Zihintntl extension for Guest/VM
496ee21a17ce KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
f3901ece5b38 RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
2ddf79070f7e KVM: riscv: selftests: Add vector crypto extensions to get-reg-list test
afd1ef3adfbc RISC-V: KVM: Allow vector crypto extensions for Guest/VM
14d70de562df KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list test
f370b4e668f0 RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
ac396141308d KVM: riscv: selftests: Add Zbc extension to get-reg-list test
367188297254 RISC-V: KVM: Allow Zbc extension for Guest/VM
7f738527a7a0 cifs: new nt status codes from MS-SMB2
268b8b5797be cifs: pick channel for tcon and tdis
936eba9cfb5c cifs: open_cached_dir should not rely on primary channel
d7851dc13d87 smb3: minor documentation updates
9d1694dc91ce Merge tag 'for-6.8/block-2024-01-18' of git://git.kernel.dk/linux
e9a5a78d1ad8 Merge tag 'for-6.8/io_uring-2024-01-18' of git://git.kernel.dk/linux
6f3625006b15 Merge tag 'erofs-for-6.8-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
04ae3eb470e5 drm/lima: fix a memleak in lima_heap_alloc
b5f66ba2d071 Merge tag 'kbuild-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
2a668d217676 Merge tag 'kgdb-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux
736b5545d39c Merge tag 'net-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
ed8d84530ab0 Merge tag 'i2c-for-6.8-rc1-rebased' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
378de6df1980 Merge tag 'rtc-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux
0f289bdd4102 Merge tag 'input-for-v6.8-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
33a9caa49938 Merge tag 'phy-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
4d5d604cc48a Merge tag 'soundwire-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire
345513583974 Merge tag 'gpio-fixes-for-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
5c9350698362 Merge tag 'pwm/for-6.8-2' of gitolite.kernel.org:pub/scm/linux/kernel/git/ukleinek/linux
21c91bb93677 Merge tag 'backlight-next-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight
17e232b6d2fe Merge tag 'dma-mapping-6.8-2024-01-18' of git://git.infradead.org/users/hch/dma-mapping
77c9622d87d2 Merge tag 'memblock-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
0b7359ccddaa Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
da3c45c721e2 Merge tag 'hwmon-for-v6.8-p2' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
db5ccb9eb231 Merge tag 'cxl-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
0a1123c7b9f1 Merge tag 'amd-drm-fixes-6.8-2024-01-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
17d49b7e47a1 power: supply: bq24190_charger: Fix "initializer element is not constant" error
244aefb1c64a Merge tag 'vfio-v6.8-rc1' of https://github.com/awilliam/linux-vfio
c44d4ef47fda drm/i915/xelpg: Extend some workarounds/tuning to gfx version 12.74
84bf82f4f866 drm/i915/xelpg: Extend driver code of Xe_LPG to Xe_LPG+
86c4d58a99ab Merge tag 'for-linus-iommufd' of git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd
bddacdf4861c drm/i915: Add additional ARL PCI IDs
0dde2bf67bcf Merge tag 'iommu-updates-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
e7ded27593bf Merge tag 'percpu-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu
24f3a63e1fc3 Merge tag 'eventfs-v6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
43d48379c939 drm/xe: correct the calculation of remaining size
7f2d219e78e9 btrfs: scrub: limit RST scrub to chunk boundary
f546c4282673 btrfs: scrub: avoid use-after-free when chunk length is not 64K aligned
4525462dd0db riscv: lib: Check if output in asm goto supported
1e61b8c672ab btrfs: don't unconditionally call folio_start_writeback in subpage
2018ef1d9ac3 btrfs: use the original mount's mount options for the legacy reconfigure
a208b3f132b4 btrfs: don't warn if discard range is not aligned to sector
f398e70dd69e btrfs: tree-checker: fix inline ref size in error messages
1e7f6def8b23 btrfs: zstd: fix and simplify the inline extent decompression
6a69631ec9b1 btrfs: lzo: fix and simplify the inline extent decompression
a2ded784cd7f Merge tag 'trace-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
2c25716dcc25 btrfs: zlib: fix and simplify the inline extent decompression
5b890ad456b1 Merge tag 'probes-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
302d18586544 Merge tag 's390-6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
66f962d8939f riscv: Fix build error on rv32 + XIP
aa0901a9008e drm/amdgpu: Enable GFXOFF for Compute on GFX11
b2139c96dc95 drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL check for writeback requests.
fb1c93c2e960 drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"
3c4e4eb5d872 drm/amdkfd: init drm_client with funcs hook
b4442cadca2f Merge tag 'x86_tdx_for_6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
05638ff6dd6f drm/amd/display: Fix a switch statement in populate_dml_output_cfg_from_stream_state()
bc03c02cc199 drm/amdgpu: Fix the null pointer when load rlc firmware
bfe79f5fff13 drm/amd/display: Align the returned error code with legacy DP
d3579f5df053 drm/amd/display: Fix DML2 watermark calculation
3ba2a0bfd8cf drm/amd/display: Clear OPTC mem select on disable
4b56f7d47be8 drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
8a51cc097dd5 drm/amd/display: Add logging resource checks
aa36d8971fcc drm/amd/display: Init link enc resources in dc_state only if res_pool presents
3bb9b1f958c3 drm/amd/display: Fix late derefrence 'dsc' check in 'link_set_dsc_pps_packet()'
ba7dd8570dc8 Merge tag 'x86_sgx_for_6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
0cd2bc06de72 drm/amd/pm: enable amdgpu smu send message log
a9e4f61df1cc drm/amdgpu: update error condition check for umc_v12_0_query_error_address
601429cca96b drm/amdgpu: Skip do PCI error slot reset during RAS recovery
2c7a1560e8a6 drm/amdgpu: Show deferred error count for UMC
776b0953aba8 drm/amdgpu: Enable GFXOFF for Compute on GFX11
7ed97155b258 drm/amdgpu: fix UBSAN array-index-out-of-bounds for ras_block_string[]
b5387349cadd drm/amd/amdgpu: Update RLC_SPM_MC_CNT by ring wreg in guest
b2f26f49e84b drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL check for writeback requests.
925781a471d8 Merge tag 'nf-24-01-18' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
5394fb2a5bd5 drm/amdgpu: Remove unnecessary NULL check
087a3e13ec49 drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"
8a1f7fddabe1 drm/amdgpu: Remove usage of the deprecated ida_simple_xx() API
733965a90f88 drm/amdkfd: init drm_client with funcs hook
ab762f937db9 drm/amd/display: Fix a switch statement in populate_dml_output_cfg_from_stream_state()
bf14cd4f2e9a drm/radeon/ni_dpm: Clean up errors in nislands_smc.h
a87076d37598 drm/radeon/evergreen_cs: Clean up errors in evergreen_cs.c
ce136e15e0f8 drm/radeon: Clean up errors in si.c
17c31edfa2e4 drm/radeon: Clean up errors in radeon.h
c435ebd0c661 drm/radeon: Clean up errors in ci_dpm.h
6080a591bfaf drm/radeon/dpm: Clean up errors in evergreen_smc.h
4a93a7c92779 drm/radeon: Clean up errors in clearstate_cayman.h
b1baf42f8523 drm/radeon: Clean up errors in clearstate_ci.h
6d01359dfd61 drm/radeon/kms: Clean up errors in radeon_pm.c
3af3497f335c drm/radeon/kms: Clean up errors in smu7.h
93709fa06d5b drm/radeon/kms: Clean up errors in smu7_fusion.h
848da1928b7b drm/radeon: Clean up errors in r600_dpm.c
a62b1547e028 drm/radeon: Clean up errors in rv515.c
15711063f827 drm/radeon: Clean up errors in radeon_mode.h
f63686ce2f5e drm/radeon: Clean up errors in evergreen_reg.h
8be4f5312e80 drm/radeon: Clean up errors in kv_smc.c
40d89a92f1c7 gpu/drm/radeon: Clean up errors in evergreen.c
c40bc91776b9 drm/radeon: Clean up errors in evergreen.c
c6ebd422a6eb drm/radeon: Clean up errors in rv770_smc.h
63373186aa1b drm/radeon/ci_dpm: Clean up errors in ci_dpm.c
cc588e799549 drm/radeon: Clean up errors in r600.c
f11562434778 drm/radeon: Clean up errors in rs600.c
6e4362dd21f4 drm/radeon: Clean up errors in si_dpm.h
50958960c443 drm/radeon: Clean up errors in radeon_audio.c
ab2533d4fd0f drm/radeon: Clean up errors in rs400.c
9f9a40852e29 drm/radeon: Clean up errors in radeon_audio.h
3e9156fb5555 drm/radeon: Clean up errors in uvd_v1_0.c
22dfe0aedb56 drm/radeon: Clean up errors in radeon_asic.c
25157b1bc12e drm/radeon/kms: Clean up errors in rv6xx_dpm.h
3013edd68ea7 drm/radeon/btc_dpm: Clean up errors in btc_dpm.c
1b5a5e4055f5 drm/radeon/dpm: Clean up errors in trinity_dpm.h
e0353ea0da61 drm/radeon/rv770: Clean up errors in rv770_dpm.c
d93eb053b240 drm/radeon: Clean up errors in smu7_discrete.h
007cded6014f drm/radeon: Clean up errors in ni_dpm.c
b8cbb7defe76 drm/radeon/ni_dpm: Clean up errors in ni_dpm.c
30d30e0f1523 drm/radeon/dpm: Clean up errors in sumo_dpm.c
765290661cfa drm/radeon: Clean up errors in ni.c
236ff5f967bb drm/radeon: Clean up errors in r600_dpm.h
1e68ffdcd182 drm/radeon/r100: Clean up errors in r100.c
c4769ac4d594 drm/radeon: Clean up errors in radeon_atpx_handler.c
328f63b158f8 drm/radeon: Clean up errors in trinity_dpm.c
54a5d71723ac drm/radeon/trinity_dpm: Clean up errors in trinity_dpm.c
b42eecdfa3a9 drm/radeon: Clean up errors in si_dpm.c
9c7fdfa396a9 drm/amd/include/vega20_ip_offset: Clean up errors in vega20_ip_offset.h
296cce5d4ebb drm/amd/display: Clean up errors in renoir_ip_offset.h
70debdf217e8 drm/amd/amdgpu: Clean up errors in beige_goby_ip_offset.h
58479e2126fd drm/amdgpu: Clean up errors in v10_structs.h
e1fe442fec46 drm/amd/include/navi14_ip_offset: Clean up errors in navi14_ip_offset.h
a0caeabb96f2 drm/amdgpu: Clean up errors in cgs_common.h
aca4300ab2b2 drm/amd/include/sienna_cichlid_ip_offset: Clean up errors in sienna_cichlid_ip_offset.h
1ef4fd9278c7 drm/amd/include/vangogh_ip_offset: Clean up errors in vangogh_ip_offset.h
78a855f95420 drm/amdgpu: Clean up errors in dimgrey_cavefish_ip_offset.h
eadf484e6bad drm/amd/pp: Clean up errors in dm_pp_interface.h
882c82b9ac66 drm/amd: Clean up errors in vega10_ip_offset.h
3c642f34e9c6 drm/amd/include/vega10_ip_offset:Clean up errors in vega10_ip_offset.h
577fa1be30e6 drm/amdgpu: Clean up errors in kgd_pp_interface.h
84900320970d drm/amdgpu: Clean up errors in navi12_ip_offset.h
522f878a0c26 drm/amdgpu: Clean up errors in atom-bits.h
142e2227582e drm/amd/include: Clean up errors in arct_ip_offset.h
7937b6f63f89 drm/amdgpu: Clean up errors in umc_v6_0.c
ac4d654f3daf drm/amdgpu: Clean up errors in clearstate_si.h
e28b0359587f bcachefs: Replace strlcpy() with strscpy()
4503538d3066 MAINTAINERS: use proper email for my I2C work
90f9b1406236 i2c: stm32f7: add support for stm32mp25 soc
a058b24c0802 i2c: stm32f7: perform I2C_ISR read once at beginning of event isr
bf12998e1a68 dt-bindings: i2c: document st,stm32mp25-i2c compatible
33a00d919253 i2c: stm32f7: simplify status messages in case of errors
e6103cd45ef0 i2c: stm32f7: perform most of irq job in threaded handler
a51e224c2f42 i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq
2f189493ae32 i2c: i801: Add lis3lv02d for Dell XPS 15 7590
6d9450464ce1 i2c: i801: Add lis3lv02d for Dell Precision 3540
bb7c0209c4fe i2c: wmt: Reduce redundant: REG_CR setting
4c541c6a66df i2c: wmt: Reduce redundant: function parameter
7108ecf3cbc7 i2c: wmt: Reduce redundant: clock mode setting
8a22991a48f2 i2c: wmt: Reduce redundant: wait event complete
462e9804d2c9 i2c: wmt: Reduce redundant: bus busy check
a8355235dbd5 i2c: mux: reg: Remove class-based device auto-detection support
94959c0e796e i2c: make i2c_bus_type const
614ef4d30fe7 dt-bindings: at24: add ROHM BR24G04
2b0eee4f6add eeprom: at24: use of_match_ptr()
e535af5c4225 i2c: cpm: Remove linux,i2c-index conversion from be32
db63eacdf61d i2c: imx: Make SDA actually optional for bus recovering
13e3a512a290 i2c: smbus: Support up to 8 SPD EEPROMs
92a85b7c6262 i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
187432b82173 i2c: s3c24xx: add support for atomic transfers
990489e1042c i2c: s3c24xx: fix transferring more than one message in polling mode
0d9cf23ed55d i2c: s3c24xx: fix read transfers in polling mode
d0520eb3ed54 i2c: rcar: add FastMode+ support for Gen4
2b523c46e81e i2c: rcar: introduce Gen4 devices
e19e1abc9ce4 i2c: npcm7xx: move to per-adapter debugfs directory
c66520c02c2f i2c: gpio: move to per-adapter debugfs directory
73febd775bdb i2c: create debugfs entry per adapter
f79ad78a2584 staging: greybus: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
8cd210d200ad media: netup_unidvb: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
c1cc7ccb0ff7 i2c: stub: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
9fd12f385720 i2c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
f21682b362b6 drm/amd/pm: Remove I2C_CLASS_SPD support
b60db383e2ba include/linux/i2c.h: remove I2C_CLASS_DDC support
754bd2fffc91 fbdev: remove I2C_CLASS_DDC support
e965a7072767 drm: remove I2C_CLASS_DDC support
b0d326da462e Merge tag 'sched-urgent-2024-01-18' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
8c94ccc7cd69 Merge tag 'usb-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
bd736f38c014 Merge tag 'tty-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
80fe58cc176f Merge tag 'timers-v6.8-rc1' of http://git.linaro.org/people/daniel.lezcano/linux into timers/core
eb08104f90fc drm/xe/gsc: add support for GSC proxy interrupt
997a55caa1c3 drm/xe/gsc: Initialize GSC proxy
18f14afe2816 powerpc/64s: Increase default stack size to 32KB
e38f734add21 Merge tag 'staging-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
6af7ee08279c drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
a54e016ace26 drm/xe/guc: Return CTB HXG response DATA0 if no buffer provided
c3365ced1375 Update MAINTAINERS email address
0b549c4f5941 cifs: minor comment cleanup
d8392c203e84 smb3: show beginning time for per share stats
4349efc52b83 Merge tag 'for-netdev' of https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf
9cfd3b502153 i40e: Include types.h to some headers
2e7ef287f07c ipv6: mcast: fix data-race in ipv6_mc_down / mld_ifc_work
80955ae955d1 Merge tag 'driver-core-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
bc9291dea7ec Merge branch 'mlxsw-miscellaneous-fixes'
b34f4de6d30c selftests: mlxsw: qos_pfc: Adjust the test to support 8 lanes
40cc674bafd5 selftests: mlxsw: qos_pfc: Remove wrong description
62bef63646c1 mlxsw: spectrum_router: Register netdevice notifier before nexthop
483ae90d8f97 mlxsw: spectrum_acl_tcam: Fix stack corruption
efeb7dfea8ee mlxsw: spectrum_acl_tcam: Fix NULL pointer dereference in error path
6d6eeabcfaba mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
34e9d836f9d0 drm/xe: Mark internal gmdid mappings as const
f0e54b6087de ext4: remove 'needed' in trace_ext4_discard_preallocations
2ffd2a6ad1d3 ext4: remove unnecessary parameter "needed" in ext4_discard_preallocations
20427949b9b5 ext4: remove unused return value of ext4_mb_release_group_pa
820c280896ea ext4: remove unused return value of ext4_mb_release_inode_pa
908177175a2a ext4: remove unused return value of ext4_mb_release
97c32dbffce1 ext4: remove unused ext4_allocation_context::ac_groups_considered
11fd1a5d6423 ext4: remove unneeded return value of ext4_mb_release_context
438a35e72d09 ext4: remove unused parameter ngroup in ext4_mb_choose_next_group_*()
133de5a0d8f8 ext4: remove unused return value of __mb_check_buddy
c5f3a3821de4 ext4: mark the group block bitmap as corrupted before reporting an error
832698373a25 ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
4530b3660d39 ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
993bf0f4c393 ext4: avoid dividing by 0 in mb_update_avg_fragment_size() when block bitmap corrupt
2331fd4a4986 ext4: avoid bb_free and bb_fragments inconsistency in mb_free_blocks()
c9b528c35795 ext4: regenerate buddy after block freeing failed if under fc replay
172202152a12 ext4: do not trim the group with corrupted block bitmap
55583e899a53 ext4: fix double-free of blocks due to wrong extents moved_len
b2e792ae883a Documentation: block: ioprio: Update schedulers
baa7d536077d loop: fix the the direct I/O support check when used on top of block devices
7a8e9cdf9405 seq_buf: Make DECLARE_SEQ_BUF() usable
c5a06c9169f3 drm/xe/guc: Enable WA 14018913170
0991abeddefa exfat: fix zero the unwritten part for dio read
bcbc84af1183 wifi: mac80211: fix race condition on enabling fast-xmit
cf4a0d840ecc wifi: iwlwifi: fix a memory corruption
b01a74b3ca6f wifi: mac80211: fix potential sta-link leak
26490da5a71d wifi: cfg80211/mac80211: remove dependency on non-existing option
a6e4f85d3820 wifi: cfg80211: fix missing interfaces when dumping
f1172f3ee3a9 ethtool: netlink: Add missing ethnl_ops_begin/complete
1b20d0486a60 arm64: Fix silcon-errata.rst formatting
dc7eb8755797 arm64/sme: Always exit sme_alloc() early with existing storage
8410186ca480 arm64/fpsimd: Remove spurious check for SVE support
84b5ece64477 drm/i915: Drop -Wstringop-overflow
6992eb815d08 Revert "drm/i915/dsi: Do display on sequence later on icl+"
b7c510d04904 arm64/ptrace: Don't flush ZA/ZT storage when writing ZA via ptrace
da59f1d051d5 arm64: entry: simplify kernel_exit logic
832dd634bd1b arm64: entry: fix ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
dd2d40acdbb2 selftests: bonding: Add more missing config options
39369c9a6e09 selftests: netdevsim: add a config file
556857aa1d08 wifi: ath11k: rely on mac80211 debugfs handling for vif
79f8eacbdf9d drm/xe: Use a NULL pointer instead of 0.
e2dc52f849f8 drm/xe/dmabuf: Make xe_dmabuf_ops static
a99d453d2459 drm/i915/opregion: remove unused lid_state
4d695869d3fb selftests/hid: wacom: fix confidence tests
35ac085a94ef Merge branch 'tighten-up-arg-ctx-type-enforcement'
76ec90a996e3 libbpf: warn on unexpected __arg_ctx type when rewriting BTF
989410cde819 selftests/bpf: add tests confirming type logic in kernel for __arg_ctx
0ba971511d16 bpf: enforce types for __arg_ctx-tagged arguments in global subprogs
66967a32d3b1 bpf: extract bpf_ctx_convert_map logic and make it more reusable
01b55f4f0cd6 libbpf: feature-detect arg:ctx tag support in kernel
080c4324fa5e riscv: optimize ELF relocation function in riscv
102434010592 RISC-V: Implement archrandom when Zkr is available
55ca8d7aa2af riscv: Optimize hweight API with Zbb extension
c4db7ff7a9ed riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi
3074e8b17538 Merge patch series "riscv: ftrace: Miscellaneous ftrace improvements"
629291dd8499 samples: ftrace: Add RISC-V support for SAMPLE_FTRACE_DIRECT[_MULTI]
196c79f19a92 riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
35e61e8827ee riscv: ftrace: Make function graph use ftrace directly
b546d6363af4 riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
448857ec53a4 Merge patch series "RISC-V: Disable DWARF5 with known broken LLVM versions"
a4426641f00c lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name
ae84ff9a14a5 riscv: Restrict DWARF5 when building with LLVM to known working versions
55b71d2ce133 riscv: Hoist linker relaxation disabling logic into Kconfig
c64086849110 Merge patch series "riscv: Add fine-tuned checksum functions"
6f4c45cbcb00 kunit: Add tests for csum_ipv6_magic and ip_fast_csum
a04c192eabfb riscv: Add checksum library
e11e367e9fe5 riscv: Add checksum header
2ce5729fce8f riscv: Add static key for misaligned accesses
1e7196fa5b03 asm-generic: Improve csum_fold
0de65288d75f RISC-V: selftests: cbo: Ensure asm operands match constraints
296455ade1fd Merge tag 'char-misc-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
e1aa9df44018 Merge tag 'pci-v6.8-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
a3f4a07b5027 Merge tag 'i3c/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux
14688f1a91e1 rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
f5334aa88345 rtc: da9063: Use dev_err_probe()
4b60c32e979a rtc: da9063: Use device_get_match_data()
8681de6457aa rtc: da9063: Make IRQ as optional
dd7fe5d9fd6a rtc: max31335: Fix comparison in max31335_volatile_reg()
b7d450d98b0f rtc: max31335: use regmap_update_bits_check
590b1d19d739 rtc: max31335: remove unecessary locking
ed6c23b17547 Merge tag 'pinctrl-v6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
5d197e97fb10 Merge tag 'hsi-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
75afd029e607 Merge tag 'mailbox-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox
08df80a3c516 Merge tag 'leds-next-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds
2385018a4e5e Merge tag 'mfd-next-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
a2ec2071cad8 Merge tag 'hwlock-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
e88481f74fee Merge tag 'rproc-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
2a43434675b2 Merge tag 'rpmsg-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
8893a6bfff31 Merge tag 'drm-next-2024-01-15-1' of git://anongit.freedesktop.org/drm/drm
d8e6ba025f5e Merge tag 'thermal-6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
7f369a8f5ba9 Merge tag 'acpi-6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
7b5bcf9b8420 Merge tag 'pm-6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
1d9cabe2817e SUNRPC: use request size to initialize bio_vec in svc_udp_sendto()
82fd5ee9d8a5 Merge tag 'for-linus-6.8-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
49e60333d743 blk-mq: Remove the hctx 'run' debugfs attribute
09d1c6a80f2c Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
5aa1c96e8ef3 Merge branch 'master' into mm-hotfixes-stable
fe33c0fbed75 Merge branch 'master' into mm-hotfixes-stable
a20f1b02bafc drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in the error case
7d1ae55ffed0 scsi: MAINTAINERS: Update ibmvscsi_tgt maintainer
1b1934dbbdcf Merge tag 'docs-6.8-2' of git://git.lwn.net/linux
e6f3799de2f2 scsi: initio: Remove redundant variable 'rb'
d6b75ba52189 scsi: virtio_scsi: Remove duplicate check if queue is broken
bce3b5d6764b Merge tag 'parisc-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
658365c6b085 scsi: isci: Fix an error code problem in isci_io_request_build()
47ce834fbb6c Merge tag 'xtensa-20240117' of https://github.com/jcmvbkbc/linux-xtensa
c4c6044d35f0 Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm
284a4ddeed35 Merge tag 'microblaze-v6.8' of git://git.monstr.eu/linux-2.6-microblaze
096f286ee3fa Merge tag 'mips_6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
4331f070267a Merge tag 'riscv-for-linus-6.8-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
6cff79f4b90a Merge tag 'uml-for-linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
0c6bc3725592 Merge tag 'ubifs-for-linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs
eebe75827b73 Merge tag 'fscrypt-for-linus' of git://git.kernel.org/pub/scm/fs/fscrypt/linux
c2459ce011f6 Merge tag 'vfs-6.8-rc1.fixes' of gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs
7f5e47f78514 Merge tag 'mm-hotfixes-stable-2024-01-12-16-52' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
26db46bc9c67 drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disable()
4f41d30cd6dc kdb: Fix a potential buffer overflow in kdb_local()
fb3c007fde80 ALSA: hda/realtek: Enable headset mic on Lenovo M70 Gen5
b4bc35cf8704 io_uring: combine cq_wait_nr checks
e8c407717b48 io_uring: clean *local_work_add var naming
d381099f980b io_uring: clean up local tw add-wait sync
dc12d1799ce7 io_uring: adjust defer tw counting
baf59771343d io_uring/register: guard compat syscall with CONFIG_COMPAT
05ae67d95bad drm/i915: Drop -Wstringop-overflow
78fbb92af27d nbd: always initialize struct msghdr completely
b9bd10c43456 s390/vfio-ap: do not reset queue removed from host config
f009cfa46655 s390/vfio-ap: reset queues associated with adapter for queue unbound from driver
f848cba767e5 s390/vfio-ap: reset queues filtered from the guest's AP config
774d10196e64 s390/vfio-ap: let on_scan_complete() callback filter matrix and update guest's APCB
16fb78cbf56e s390/vfio-ap: loop over the shadow APCB when filtering guest's AP configuration
850fb7fa8c68 s390/vfio-ap: always filter entire AP matrix
8f54fca3f8fc s390/net: add Thorsten Winkler as maintainer
dc524d05974f Revert "drm/i915/dsi: Do display on sequence later on icl+"
d6938c1c76c6 ipvs: avoid stat macros calls from preemptible context
113661e07460 netfilter: nf_tables: reject NFT_SET_CONCAT with not field length description
6b1ca88e4bb6 netfilter: nf_tables: skip dead set elements in netlink dump
3ce67e3793f4 netfilter: nf_tables: do not allow mismatch field size and set key length
b1db244ffd04 netfilter: nf_tables: check if catch-all set element is active in next generation
9874808878d9 netfilter: bridge: replace physindev with physinif in nf_bridge_info
a54e72197037 netfilter: propagate net to nf_bridge_get_physindev
aeaa44075f8e netfilter: nf_queue: remove excess nf_bridge variable
c3f9fd54cd87 netfilter: nfnetlink_log: use proper helper for fetching physinif
91a139cee120 netfilter: nft_limit: do not ignore unsupported flags
3c13725f43dc netfilter: nf_tables: bail out if stateful expression provides no .clone
65b3bd600e15 netfilter: nf_tables: validate .maxattr at expression registration
0617c3de9b40 netfilter: nf_tables: reject invalid set policy
ea937f772083 net: netdevsim: don't try to destroy PHC on VFs
c0f5aec28edf mptcp: relax check on MPC passive fallback
c2945c435c99 net: stmmac: Prevent DSA tags from breaking COE
2e722c868b3a drm/tests: managed: Add a simple test for drmm_managed_release
8ec16a7a9a74 drm/tests: managed: Extract device initialization into test init
a1c73a3b7940 drm/tests: managed: Add comments about test intent
dd0ce02f9897 drm/tests: managed: Rename the suite name to match other DRM tests
42d6196f6a94 drm/managed: Add drmm_release_action
aabf5c412f04 drm/rockchip: inno_hdmi: Explicitly include drm_atomic.h
3eb791c891aa drm/tests: mm: Call drm_mm_print in drm_test_mm_debug
efb8235bfdbe gpiolib: revert the attempt to protect the GPIO device list with an rwsem
0103b4496087 drm/i915/perf: Update handling of MMIO triggered reports
3d9e9020b922 drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
0a8c1feed387 drm/ttm: allocate dummy_read_page without DMA32 on fail
6e441fa3ac47 MAINTAINERS: Add BPF JIT for LOONGARCH entry
fc562925f51c LoongArch: Update Loongson-3 default config file
36a87385e31c LoongArch: BPF: Prevent out-of-bounds memory access
21c5ae5cc1ee LoongArch: BPF: Support 64-bit pointers to kfuncs
91af17cd7d03 LoongArch: Fix definition of ftrace_regs_set_instruction_pointer()
78de91b45860 LoongArch: Use generic interface to support crashkernel=X,[high,low]
c2396651309e LoongArch: Fix and simplify fcsr initialization on execve()
ce68ff3528e6 LoongArch: Let cores_io_master cover the largest NR_CPUS
d23b77953f5a LoongArch: Change SHMLBA from SZ_64K to PAGE_SIZE
9499daeade0e LoongArch: Add a missing call to efi_esrt_init()
44a01f1f726a LoongArch: Parsing CPU-related information from DTS
2905844f6828 LoongArch: dts: DeviceTree for Loongson-2K2000
30a5532a3206 LoongArch: dts: DeviceTree for Loongson-2K1000
0f66569c8594 LoongArch: dts: DeviceTree for Loongson-2K0500
5f346a6e5970 LoongArch: Allow device trees be built into the kernel
db8ce2407090 dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check warning for interrupt-names
aaeebb3ea4f2 dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check warning for reg-names
ec6b36edf0ce dt-bindings: loongarch: Add Loongson SoC boards compatibles
8e07e0e3964c dt-bindings: loongarch: Add CPU bindings for LoongArch
90868ff9cade LoongArch: Enable initial Rust support
f58b0abae839 scripts/min-tool-version.sh: Raise minimum clang version to 18.0.0 for loongarch
2772ae4d66d1 modpost: Ignore relaxation and alignment marker relocs on LoongArch
e9ce7ededf14 selftests: rtnetlink: use setup_ns in bonding test
97eb5d51b4a5 net: sfp-bus: fix SFP mode detect from bitrate
776dac5a6627 net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
8ca5d2641be2 cifs: remove redundant variable tcon_exist
1057066009c4 eventfs: Use kcalloc() instead of kzalloc()
852e46e239ee eventfs: Do not create dentries nor inodes in iterate_shared
7bed6f3d08b7 block: Fix iterating over an empty bio with bio_for_each_folio_all
53c41052ba31 eventfs: Have the inodes all for files and directories all be the same
58f65f9db7e0 Input: atkbd - use ab83 as id when skipping the getid command
935024212daf dt-bindings: don't anchor DT_SCHEMA_FILES to bindings directory
85f3b79fb578 drm/xe: Group normal kunit tests in a single module
be50df31c4e2 block: bio-integrity: fix kcalloc() arguments order
e06964205920 Merge tag 'asoc-fix-v6.8-merge-window' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
33772ff3b887 selftests/bpf: Add test for alu on PTR_TO_FLOW_KEYS
22c7fa171a02 bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
ddc3c0877e16 drm/xe: Use kstrdup while creating snapshot
a894e8ed09c6 Merge patch series "riscv: support kernel-mode Vector"
2080ff949307 riscv: vector: allow kernel-mode Vector with preemption
bd446f5df5af riscv: vector: use kmem_cache to manage vector context
5b6048f2ff71 riscv: vector: use a mask to write vstate_ctrl
d6c78f1ca3e8 riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
a93fdaf18312 riscv: fpu: drop SR_SD bit checking
c2a658d41924 riscv: lib: vectorize copy_to_user/copy_from_user
7df56cbc27e4 riscv: sched: defer restoring Vector context for user
c5674d00cacd riscv: Add vector extension XOR implementation
956895b9d8f7 riscv: vector: make Vector always available for softirq context
ecd2ada8a5e0 riscv: Add support for kernel mode vector
03fb8565c880 selftests: bonding: add missing build configs
a05f7279307b ASoC: hdmi-codec: drop drm/drm_edid.h include
5b5268cd49d2 Merge branches 'pnp', 'acpi-resource' and 'acpica'
4697381bd076 selftests: netdevsim: correct expected FEC strings
dd75558b2d0b Merge branches 'thermal-core' and 'thermal-intel'
9223614ea760 Merge branches 'pm-sleep', 'pm-cpufreq' and 'pm-qos' into pm
2c4ca7977298 selftests: netdevsim: sprinkle more udevadm settle
e37617c8e53a sched/fair: Fix frequency selection for non-invariant case
a52c854a29bb drm/i915/opregion: make struct intel_opregion opaque
2619861c470d drm/i915/gvt: use local INTEL_GVT_OPREGION_SIZE
9eb4826f2856 drm/i915/opregion: abstract ASLE presence check
37e2100312b1 drm/i915/opregion: abstract getting the opregion VBT
bb94644716cf drm/i915/opregion: move i915_opregion debugfs to intel_opregion.c
b018cee73698 ALSA: hda/realtek: Enable mute/micmute LEDs and limit mic boost on HP ZBook
30ef2627b207 drm/i915/bios: move i915_vbt debugfs to intel_bios.c
bc7863d18677 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq2xxx
3fc6c76a8d20 drm/bridge: sii902x: Fix audio codec unregistration
08ac6f132dd7 drm/bridge: sii902x: Fix probing race issue
a23aa0404218 net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls
ddb17dc880ee fs/ntfs3: Use kvfree to free memory allocated by kvmalloc
915805b50585 Merge branch 'selftests-net-small-fixes'
49078c1b80b6 selftests: forwarding: Remove executable bits from lib.sh
c2518da8e6b0 selftests: bonding: Change script interpreter
762343f79e43 drm/amdgpu: Clean up errors in amdgpu.h
f5e1f90b67b8 drm/amdgpu: Clean up errors in amdgpu_gmc.c
0b0fb6da9b01 drm/amdgpu: Clean up errors in jpeg_v2_5.c
7230ebeb0a9b drm/amdgpu: Clean up errors in gfx_v9_4.c
b679566bf0c1 drm/amdgpu: Clean up errors in amdgpu_drv.c
995d629f7476 drm/amd: Clean up errors in amdgpu_vkms.c
849e133c973c drm/amdgpu: Fix the null pointer when load rlc firmware
4e2965bd3bdd drm/amdgpu: Centralize ras cap query to amdgpu_ras_check_supported
0e14eb0cefd9 drm/amdgpu: Query ras capablity from psp v2
bcee21a437ab drm/amd/display: 3.2.267
3b84525544be drm/amd/display: Align the returned error code with legacy DP
14656c4fde65 drm/amd/display: Allow Z8 for multiplane configurations on DCN35
aa4e18d30076 drm/amd/display: Set default Z8 minimum residency for DCN35
e6f82bd44b40 drm/amd/display: Rework DC Z10 restore
5950efe25ee0 drm/amd/display: Enable Panel Replay for static screen use case
12f72a1599dc drm/amd/display: Add DP audio BW validation
d451b534e0b4 drm/amd/display: Fix dml2 assigned pipe search
f0ec30549a2b drm/amd/display: Ensure populate uclk in bb construction
038c53234641 drm/amd/display: Update P010 scaling cap
2254ab45dab2 drm/amd/display: Fix DML2 watermark calculation
b4e05bb1dec5 drm/amd/display: Clear OPTC mem select on disable
3fc394111ea7 drm/amd/display: Floor to mhz when requesting dpp disp clock changes to SMU
6c605f44086a drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
012fe0674af0 drm/amd/display: Add logging resource checks
73888bad4d1f drm/amdgpu: Clean up errors in amdgpu_rlc.c
1ed8ccf26877 drm/amd: Clean up errors in sdma_v2_4.c
32a0a398fc78 drm/amd/amdgpu: Clean up errors in amdgpu_umr.h
2bb012138d72 drm/amdgpu: Clean up errors in amdgpu_atomfirmware.h
05ec62314720 drm/amdgpu: Clean up errors in clearstate_gfx9.h
2763da27f93f drm/amdgpu: Clean up errors in navi10_ih.c
f7a16fa37694 drm/radeon: check PS, WS index
4630d5031cd8 drm/amdgpu: check PS, WS index
a25dea474a24 drm/amd/display: Add Replay IPS register for DMUB command table
ca25a2b5f841 drm/amd/display: Init link enc resources in dc_state only if res_pool presents
ac9c748362fd drm/amd/display: Allow IPS2 during Replay
166225e79ccc drm/amd/display: Fix late derefrence 'dsc' check in 'link_set_dsc_pps_packet()'
81d4b9706845 drm/amdkfd: Fix variable dereferenced before NULL check in 'kfd_dbg_trap_device_snapshot()'
30df05fb74f6 drm/amdgpu: Align ras block enum with firmware
1714a1ffafcb drm/amdgpu: replace MCA macro with ACA for XGMI
46e2231ce03b drm/amdgpu: Log deferred error separately
9c97bf88f4a7 drm/amdgpu: Do bad page retirement for deferred errors
bbcbfd4363e9 drm/amdgpu: add xgmi v6.4.0 ACA support
f45e6f2b5c79 drm/amdgpu: add mmhub v1.8 ACA support
373e970a4a2a drm/amdgpu: add sdma v4.4.2 ACA support
0f3cd24e96b8 drm/amdgpu: add gfx v9.4.3 ACA support
e372baeb3d33 drm/amdgpu: Check extended configuration space register when system uses large bar
f38765de8385 drm/amdgpu: add umc v12.0 ACA support
37973b69eab4 drm/amdgpu: add aca sysfs support
04c4fcd2630d drm/amdgpu: add amdgpu ras aca query interface
0c54e457ac58 drm/amd/pm: add aca smu backend support for smu v13.0.6
26405ff4306a drm/amdgpu: move kiq_reg_write_reg_wait() out of amdgpu_virt.c
d3f452f3a01e drm/amdgpu: add new INFO IOCTL query for input power
d4b9cfe2c725 drm/amdgpu: Query boot status if boot failed
33dcda51e9bd drm/amdgpu: add ACA bank dump debugfs support
0599849c3276 drm/amdgpu: add ACA kernel hardware error log support
c8cb7e09db90 drm/amdgpu: Query boot status if discovery failed
cce4febb274c drm/amdgpu: Add ras helper to query boot errors v2
f5e4cc8461c4 drm/amdgpu: implement RAS ACA driver framework
ad390542ec48 drm/amdgpu: Init pcie_index/data address as fallback (v2)
ea0f6dfeecab drm/amdgpu: drop psp v13 query_boot_status implementation
ac3ff8a90637 drm/amdgpu: Replace DRM_* with dev_* in amdgpu_psp.c
4cabb2174d2c drm/amdkfd: Bump KFD ioctl version
50661eb1a2c8 drm/amdgpu: Auto-validate DMABuf imports in compute VMs
d7643fe6fb76 drm/amd/display: Avoid enum conversion warning
a992c90d8ed3 drm/amd/pm: Fix smuv13.0.6 current clock reporting
91739a897c12 drm/amd/pm: Add error log for smu v13.0.6 reset
d7a254fad873 drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
c3d5e297dcae drm/amdgpu: drop exp hw support check for GC 9.4.3
51258acdc475 drm/amdgpu: move debug options init prior to amdgpu device init
d20e1aec8862 drm/amdgpu: add debug flag to place fw bo on vram for frontdoor loading
6c5683bd9eca Revert "drm/amdgpu: add param to specify fw bo location for front-door loading"
7073934f5d73 drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
2b9a073b7304 drm/amdgpu: update regGL2C_CTRL4 value in golden setting
8a44fdd3cf91 drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
8e8272f0dc22 drm/amdgpu: Fix unsigned comparison with less than zero in vpe_u1_8_from_fraction()
fac4ebd79fed drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
30d8dffab7d0 drm/amdgpu: Do not program VM_L2_CNTL under SRIOV
6616b5e19991 drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
c9edcc1864f8 drm/amdgpu: update ATHUB_MISC_CNTL offset for athub v3.3
8f8cb7124e86 drm/amdgpu: update headers for nbio v7.11
6127d7df4a5b drm/amdgpu/pm: clarify debugfs pm output
d02069850fc1 drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
25852d4b9757 drm/amdgpu: fix avg vs input power reporting on smu7
02eed83abc13 drm/amdkfd: fixes for HMM mem allocation
dedaf03b99d6 rtc: max31335: add driver support
5905777847b5 dt-bindings: rtc: max31335: add max31335 bindings
62b38f30a00f gpio: EN7523: fix kernel-doc warnings
83c0711453e5 rtc: rv8803: add wakeup-source support
eea7615b684f rtc: ac100: remove misuses of kernel-doc
5f4c01f1e3c7 spinlock: Fix failing build for PREEMPT_RT
bf3ff145df18 drm/xe: display support should not depend on EXPERT
7119ca35ee4a Merge branch 'pci/misc'
9946bbb3edae Merge branch 'pci/dt-bindings'
eddcaefa5fec Merge branch 'pci/remove-old-api'
d43e4239f09c Merge branch 'pci/endpoint'
dc14155d46b5 Merge branch 'pci/irq-clean-up'
eb30ad414169 Merge branch 'pci/controller/remove-void-return'
fd286a1de5dd Merge branch 'pci/controller/xilinx'
161d42df9acf Merge branch 'pci/controller/vmd'
67b9ef22c68c Merge branch 'pci/controller/rcar'
1b6069f51ef0 Merge branch 'pci/controller/mediatek'
1800c660b08f Merge branch 'pci/controller/layerscape'
921e097ede90 Merge branch 'pci/controller/kirin'
186ce88c9063 Merge branch 'pci/controller/keystone'
787c72b1d45b Merge branch 'pci/controller/dwc'
78fe51fcb435 Merge branch 'pci/controller/cadence'
6f77f0ac5ee2 Merge branch 'pci/controller/broadcom'
c94df6214681 Merge branch 'pci/virtualization'
d6f5bcc2d098 Merge branch 'pci/switchtec'
5a4af2ca48b8 Merge branch 'pci/resource'
18c3850f313e Merge branch 'pci/p2pdma'
564af7a5363f Merge branch 'pci/enumeration-logging'
78e5ad791fae Merge branch 'pci/enumeration'
996e337f4d33 Merge branch 'pci/ecam'
f04e5285efb0 Merge branch 'pci/aer'
2db6b72c9897 PCI: Fix kernel-doc issues
832b371097eb gpiolib: Fix scope-based gpio_device refcounting
ea489a3d983b drm/ci: add sc7180-trogdor-kingoftown
d315a68e94a7 drm/ci: uprev mesa version: fix kdl commit fetch
1bafe1e62f82 drm/ci: Update xfails for newly added msm tests
8eab35e764c8 drm/ci: Add msm tests
04036d49c44b virtio_blk: remove duplicate check if queue is broken in virtblk_done
2b872b0f466d erofs: Don't use certain unnecessary folio_*() functions
2a965d1b15d2 ceph: get rid of passing callbacks in __dentry_leases_walk()
f6fb21b22fbe ceph: d_obtain_{alias,root}(ERR_PTR(...)) will do the right thing
0f4cf64eabc6 ceph: fix invalid pointer access if get_quota_realm return ERR_PTR
b36b03344f5f ceph: remove duplicated code in ceph_netfs_issue_read()
6df89bf220fd ceph: send oldest_client_tid when renewing caps
66207de308df ceph: rename create_session_open_msg() to create_session_full_msg()
9c896d6bc3df ceph: select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
b493ad718b1f ceph: fix deadlock or deadcode of misusing dget()
aaefabc4a5f7 ceph: try to allocate a smaller extent map for sparse read
b79e4a0aa902 libceph: remove MAX_EXTENTS check for sparse reads
f48e0342a74d ceph: reinitialize mds feature bit even when session in open
cbcb358b744b ceph: skip reconnecting if MDS is not ready
8049e3954aea drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
7425c43c268f drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
ec32f4f1bed8 drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
616576df3519 drm/xe/selftests: Fix an error pointer dereference bug
ffd915e41a4a drm/xe/device: clean up on error in probe()
190db3b1da8f drm/xe: Fix build bug for GCC 11
23ca3d2fe367 drm/xe: Check skip_guc_pc before setting SLPC flag
19c022252424 drm/xe: Fix modifying exec_queue priority in xe_migrate_init
fef257eb6dcb drm/xe: Fix guc_exec_queue_set_priority
98949068eb55 drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
5c63e7574739 drm/xe: Annotate multiple mmio pointers with __iomem
77232e6a2844 drm/xe: Annotate xe_mem_region::mapping with __iomem
3ec276d06698 drm/xe: Use __iomem for the regs pointer
457f44398334 drm/xe/vm: Fix an error path
56c253daabc8 drm/xe: Fix exec IOCTL long running exec queue ring full condition
7b1a8a5fcee4 drm/xe: Fix definition of intel_wakeref_t
5c7fa5c8ad79 sbitmap: remove stale comment in sbq_calc_wake_batch
521277d12b5a block: Correct a documentation comment in blk-cgroup.c
ab09fb9c629e ASoC: SOF: ipc4-loader: remove the CPC check warnings
848c8f563dad ASoC: SOF: ipc4-pcm: remove log message for LLP
1f1626ac0428 drm/ttm: fix ttm pool initialization for no-dma-device drivers
19adbe96d3e3 ALSA: hda: generic: Remove obsolete call to ledtrig_audio_get
3787ffdd13de ALSA: scarlett2: Fix yet more -Wformat-truncation warnings
a9f1da09c69f HID: hid-steam: Fix cleanup in probe()
a96681699611 HID: hid-steam: remove pointless error message
d460e9c20751 gpio: mlxbf3: add an error code check in mlxbf3_gpio_probe
314c020c4ed3 dt-bindings: gpio: xilinx: Fix node address in gpio
c8fb5a52b977 gpio: rtd: Fix signedness bug in probe
de8ac5696ebc drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
0ea5c948cb64 Merge drm/drm-next into drm-intel-next
7c65aa3cc072 dma-debug: fix kernel-doc warnings
205e18c13545 nouveau/gsp: handle engines in runl without nonstall interrupts.
78d49aaa36bd drm/i915/psr: CAN_PSR and CAN_PANEL_REPLAY can be now local defines
a480dd59fe25 drm/i915/display: No need for full modeset due to psr
77bebd186442 ksmbd: only v2 leases handle the directory
9caaeb090174 Merge tag 'drm-misc-next-fixes-2024-01-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
4fa0888f6f3e i3c: document hotjoin sysfs entry
e8aaca57f9d9 Merge tag 'drm-intel-next-fixes-2024-01-11' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
34d946b723b5 i3c: master: fix kernel-doc check warning
05599b5f56b7 Merge power-supply fixes for 6.7 cycle
38d20c62903d ksmbd: fix UAF issue in ksmbd_tcp_new_connection()
92e470163d96 ksmbd: validate mech token in session setup
fdfd6dde4328 ksmbd: update feature status in documentation
e327b2372bc0 net: ravb: Fix dma_addr_t truncation in error case
2539b15d504c hwmon: (npcm750-pwm-fan) Fix crash observed when instantiating nuvoton,npcm750-pwm-fan
95931a245b44 null_blk: Remove usage of the deprecated ida_simple_xx() API
c061be1bd5e7 MAINTAINERS: eth: mvneta: update entry
5ef7f6b308bb Merge branch 'tls-splice-hint-fixes'
034ea1305e65 net: tls, add test to capture error on large splice
dc9dfc8dc629 net: tls, fix WARNIING in __sk_msg_free
e2a2501af13c Merge branch 'next' into for-linus
cd795fb0c352 mailbox: mtk-cmdq: Add CMDQ driver support for mt8188
df71f7818fb2 mailbox: mtk-cmdq: Sort cmdq platform data by compatible name
060177644136 mailbox: mtk-cmdq: Rename gce_plat variable with SoC name postfix
171c8a20850f dt-bindings: mailbox: qcom-ipcc: document the X1E80100 Inter-Processor Communication Controller
cdf179a9d3e4 mailbox: zynqmp-ipi: Convert to platform remove callback returning void
ab572ab44b04 mailbox: tegra-hsp: Convert to platform remove callback returning void
b8e346bd8fb9 mailbox: sun6i-msgbox: Convert to platform remove callback returning void
0a902f502e39 mailbox: stm32-ipcc: Convert to platform remove callback returning void
d3a0021c4132 mailbox: qcom-ipcc: Convert to platform remove callback returning void
ce42b93c6370 mailbox: qcom-apcs-ipc: Convert to platform remove callback returning void
67785923d3f5 mailbox: omap: Convert to platform remove callback returning void
e89c7c3766dc mailbox: mtk-cmdq: Convert to platform remove callback returning void
bf562bc5a86b mailbox: mailbox-test: Convert to platform remove callback returning void
a0c313d08d15 mailbox: imx: Convert to platform remove callback returning void
74701ffbf7db mailbox: bcm-pdc: Convert to platform remove callback returning void
d0a724d419cc mailbox: bcm-flexrm: Convert to platform remove callback returning void
b3734a8291ad mailbox: zynqmp-ipi: fix an Excess struct member kernel-doc warning
7f923ab20faa dt-bindings: mailbox: add Versal IPI bindings
0a49b66c7413 dt-bindings: mailbox: zynqmp: extend required list
ee01c0b4384d mailbox: arm_mhuv2: Fix a bug for mhuv2_sender_interrupt
a71c8424e309 mailbox: qcom-apcs-ipc: re-organize compatibles with fallbacks
1e9cb7e007dc dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks
24583bd204d5 dt-bindings: mailbox: qcom,apcs-kpss-global: drop duplicated qcom,ipq8074-apcs-apps-global
8e33d5db7d01 Merge branch 'bpf-fix-backward-progress-bug-in-bpf_iter_udp'
dbd7db7787ba selftests/bpf: Test udp and tcp iter batching
2242fd537fab bpf: Avoid iter->offset making backward progress in bpf_iter_udp
19ca0823f6ea bpf: iter_udp: Retry with a larger batch size without going back to the previous bucket
894d7508316e net: netdev_queue: netdev_txq_completed_mb(): fix wake condition
9181d6f8a2bb net: add more sanity check in virtio_net_hdr_to_skb()
118a8cf504d7 erofs: fix inconsistent per-file compression format
e18405d0be80 net: sched: track device in tcf_block_get/put_ext() only for clsact binder types
482521d8e0c6 udp: annotate data-races around up->pending
08300adac3b8 net: stmmac: Fix ethool link settings ops for integrated PCS
ba5afb9a84df fs: rework listmount() implementation
7b4f36cd22a6 block: ensure we hold a queue reference when using queue limits
c919330dd578 f2fs: fix double free of f2fs_sb_info
68d27badef62 Merge branch 'mptcp-better-validation-of-mptcpopt_mp_join-option'
724b00c12957 mptcp: refine opt_mp_capable determination
66ff70df1a91 mptcp: use OPTION_MPTCP_MPJ_SYN in subflow_check_req()
be1d9d9d38da mptcp: use OPTION_MPTCP_MPJ_SYNACK in subflow_finish_connect()
c1665273bdc7 mptcp: strict validation before using mp_opt->hmac
89e23277f9c1 mptcp: mptcp_parse_option() fix for MPTCPOPT_MP_JOIN
052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat
f16ab99c2eba Merge tag 'pull-bcachefs-fix' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
1acc24b300bf Merge tag 'pull-simple_recursive_removal' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
cbdd50ec8b1d net: liquidio: fix clang-specific W=1 build warnings
23a80d462c67 Merge tag 'rcu.release.v6.8' of https://github.com/neeraju/linux
5d4747a6cc8e userfaultfd: avoid huge_zero_page in UFFDIO_MOVE
aa8f91910bf5 MAINTAINERS: add entry for shrinker
00bcfcd47a52 selftests: mm: hugepage-vmemmap fails on 64K page size systems
11684134140b mm/memory_hotplug: fix memmap_on_memory sysfs value retrieval
55f958c55c2f mailmap: switch email for Tanzir Hasan
0b8f128da761 mailmap: add old address mappings for Randy
4e87ff59cebb kernel/crash_core.c: make __crash_hotplug_lock static
7ea6ec4c2529 efi: disable mirror feature during crashkernel
7bb943806ff6 kexec: do syscore_shutdown() in kernel_kexec
327b4603c0b2 mailmap: update entry for Manivannan Sadhasivam
4cccb6221cae fs/proc/task_mmu: move mmu notification mechanism inside mm lock
ea52f71598f3 mm: zswap: switch maintainers to recently active developers and reviewers
efbd63983533 scripts/decode_stacktrace.sh: optionally use LLVM utilities
cc478e0b6bdf kasan: avoid resetting aux_lock
aaa2c9a97c22 lib/Kconfig.debug: disable CONFIG_DEBUG_INFO_BTF for Hexagon
65cc86800cf2 MAINTAINERS: update LTP maintainers
4a693ce65b18 kdump: defer the insertion of crashkernel resources
38814330fedd Merge tag 'devicetree-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
42bff4d0f9b9 Merge tag 'pwm/for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
73bf93edeeea cxl/core: use sysfs_emit() for attr's _show()
fef018d81996 Merge tag 'hid-for-linus-2024010801' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
d97a78423c33 Merge tag 'fbdev-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
61da593f4458 Merge tag 'media/v6.8-2' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
a3cc31e75185 Merge tag 'libnvdimm-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
20077583ccdd Merge tag 'mmc-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
0c4b09cb542f Merge tag 'pmdomain-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm
bf9ca811bbad Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
141d9c6e003b Merge tag 'firewire-updates-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
645f910ff61d Merge tag 'gnss-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/gnss
c736c9a9553f Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
576db7342430 Merge tag 'gpio-updates-for-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
61f4c3e67114 Merge tag 'linux-watchdog-6.8-rc1' of git://www.linux-watchdog.org/linux-watchdog
5dfec3cf3efb Merge tag 'hwmon-for-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
7912a6391f3e Merge tag 'sound-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
cf65598d5909 Merge tag 'drm-next-2024-01-10' of git://anongit.freedesktop.org/drm/drm
1c7531f50eaa drm/xe: display support should not depend on EXPERT
52e3fa3e3ea3 drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()
9320fc509b87 pwm: jz4740: Don't use dev_err_probe() in .request()
a297d07b9a1e pwm: Fix out-of-bounds access in of_pwm_single_xlate()
ca630876aa98 drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to 510
678164a5f0ec pwm: bcm2835: Remove duplicate call to clk_rate_exclusive_put()
454abb80e26a ALSA: hda: Properly setup HDMI stream
309ce6741430 blk-mq: rename blk_mq_can_use_cached_rq
25c1772a0493 block: print symbolic error name instead of error code
5266caaf5660 blk-mq: fix IO hang from sbitmap wakeup race
7afc0e7f681e MAINTAINERS: pwm: Thierry steps down, Uwe takes over
6dcb35088e26 thermal/debugfs: Unlock on error path in thermal_debug_tz_trip_up()
97566d09fd02 thermal: intel: hfi: Add syscore callbacks for system-wide PM
e95fa7404716 thermal: gov_power_allocator: avoid inability to reset a cdev
fd881eac3af6 thermal: helpers: Rearrange thermal_cdev_set_cur_state()
11fde9393148 thermal: netlink: Rework notify API for cooling devices
57a427c81c32 thermal: core: Use kstrdup_const() during cooling device registration
7ef01f228c9f thermal/debugfs: Add thermal debugfs information for mitigation episodes
755113d76786 thermal/debugfs: Add thermal cooling device debugfs information
7ea26f9460c6 fsnotify: compile out fsnotify permission hooks if !FANOTIFY_ACCESS_PERMISSIONS
301bda18ac73 ASoC: audio-graph-card2: fix index check on graph_parse_node_multi_nm()
813c2f2925ee ASoC: SOF: icp3-dtrace: Revert "Fix wrong kfree() usage"
3046a1091137 s390/pai_ext: split function paiext_push_sample
0dade41d1613 s390/pai_ext: rework function paiext_copy argments
cb1259b7b574 s390/pai: rework paiXXX_start and paiXXX_stop functions
0578a54110ff s390/pai_crypto: split function paicrypt_push_sample
8d0e8a8aa3a1 s390/pai: rework paixxxx_getctr interface
45017df3033e dma-buf/dma-fence: fix spelling
f730d43afb21 dma-buf/dma-resv: fix spelling
a7983eefb642 drm/doc: internals: remove section on PCI legacy support
c95d67a63c7e drm: Clean-up superfluously selecting VT_HW_CONSOLE_BINDING
f827bcdafa2a arm64: errata: Add Cortex-A510 speculative unprivileged load workaround
546b7cde9b1d arm64: Rename ARM64_WORKAROUND_2966298
3931261ecf46 arm64: fpsimd: Bring cond_yield asm macro in line with new rules
8c5a19cb17a7 arm64: scs: Work around full LTO issue with dynamic SCS
b95df3bd1ea3 arm64: irq: include <linux/cpumask.h>
907ee6681788 net: fill in MODULE_DESCRIPTION()s for wx_lib
689237ab37c5 fbdev/intelfb: Remove driver
c25a19afb81c fbdev/hyperv_fb: Do not clear global screen_info
df67699c9cb0 firmware/sysfb: Clear screen_info state after consuming it
0aa0838c84da fbdev/hyperv_fb: Remove firmware framebuffers with aperture helpers
778e73d2411a drm/hyperv: Remove firmware framebuffers with aperture helper
7452b319bd30 fbdev/sis: Remove dependency on screen_info
29328fb06cee video/logo: use %u format specifier for unsigned int values
e2e0b838a184 video/sticore: Remove info field from STI struct
ca6c080eef42 arch/parisc: Detect primary video device from device instance
b362179731f0 fbdev/stifb: Allocate fb_info instance with framebuffer_alloc()
12b8de566fa9 video/sticore: Store ROM device in STI struct
33cd6ea9c067 fbdev: flush deferred IO before closing
15e4c1f46227 fbdev: flush deferred work in fb_deferred_io_fsync()
dee56ccb468a fbdev: amba-clcd: Delete the old CLCD driver
d9f25b59ed85 fbdev: Remove support for Carillo Ranch driver
a03cfad512ac ALSA: oxygen: Fix right channel of capture volume mixer
e398822c4751 net: phy: micrel: populate .soft_reset for KSZ9131
acd66c2126eb net: micrel: Fix PTP frame parsing for lan8841
1113e52ffee7 drm/xe: Fix potential deadlock in __fini_dbm
33ff1f21bd2f drm/xe: Allow to exclude part of GGTT from allocations
9f78b3ae051d drm/panel: Simplify with dev_err_probe()
ea4f9975625a drm/panel: Add support for Novatek NT36672E panel driver
30cc664f0962 dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
589830b13ac2 drm/panel/raydium-rm692e5: select CONFIG_DRM_DISPLAY_DP_HELPER
62b143b5ec4a drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02
420186db1483 drm/panel: Add driver for BOE TH101MB31IG002-28A panel
baae3a0b10c4 dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
c3ba13a0ed3d drm: panel: simple: convert LG LB070WV8 fixed mode into display timings
45dd7df26cee drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
d4978a67ae97 drm/xe/guc: Use HXG definitions on HXG messages
cdac6e1f7164 ALSA: aloop: Introduce a function to get if access is interleaved mode
70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
6a31658aa1c0 Merge tag '6.8-rc-smb-server-fixes' of git://git.samba.org/ksmbd
488926926a16 Merge tag 'pull-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
499aa1ca4eb6 Merge tag 'pull-dcache' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
bf4e7080aeed Merge tag 'pull-rename' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
2f444347a8d6 Merge tag 'pull-minix' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
5b9b41617bf3 Merge tag 'docs-6.8' of git://git.lwn.net/linux
a03cd7602a09 xtensa: don't produce FDPIC output with fdpic toolchain
83ab68168a3d scsi: target: core: Add TMF to tmr_list handling
6df0e077d76b scsi: core: Kick the requeue list after inserting when flushing
38945c2b006b scsi: fnic: unlock on error path in fnic_queuecommand()
567a1e852e87 scsi: fcoe: Fix unsigned comparison with zero in store_ctlr_mode()
173431b274a9 btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
3324d0547861 btrfs: avoid copying BTRFS_ROOT_SUBVOL_DEAD flag to snapshot of subvolume being deleted
7081929ab257 btrfs: don't abort filesystem when attempting to snapshot deleted subvolume
b18f3b60b35a btrfs: zoned: fix lock ordering in btrfs_zone_activate()
d967c914a633 btrfs: fix unbalanced unlock of mapping_tree_lock
f03e274a8b29 btrfs: ref-verify: free ref cache before clearing mount opt
6ff09b6b8c2f btrfs: fix kvcalloc() arguments order in btrfs_ioctl_send()
02444f2ac26e btrfs: zoned: optimize hint byte for zoned allocator
b271fee9a41c btrfs: zoned: factor out prepare_allocation_zoned()
bec161add35b amt: do not use overwrapped cb area
66cee759ffa3 Merge branch 'net-ethernet-ti-am65-cpsw-allow-for-mtu-values'
64e47d8afb5c net: ethernet: ti: am65-cpsw: Fix max mtu to fit ethernet frames
e3fe8d28c67b virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
a0cb76a77008 octeontx2-af: CN10KB: Fix FIFO length calculation for RPM2
3722a98752b4 Merge branch 'rtnetlink-allow-to-enslave-with-one-msg-an-up-interface'
a159cbe81d3b selftests: rtnetlink: check enslaving iface in a bond
ec4ffd100ffb Revert "net: rtnetlink: Enslave device before bringing it up"
8722014311e6 rxrpc: Fix use of Don't Fragment flag
844f104790bd net: dsa: fix netdev_priv() dereference before check on non-DSA netdevice events
b33fb5b801c6 net: qualcomm: rmnet: fix global oob in rmnet_policy
e689a8769698 selftests/net/tcp-ao: Use LDLIBS instead of LDFLAGS
b3739fb3a9e6 wangxunx: select CONFIG_PHYLINK where needed
f9678f5825dd MAINTAINERS: ibmvnic: drop Dany from reviewers
bd93edbfd70c MAINTAINERS: mark ax25 as Orphan
0bfcdce867f7 MAINTAINERS: Bluetooth: retire Johan (for now?)
384a35866f3a MAINTAINERS: eth: mark Cavium liquidio as an Orphan
009a98bca634 MAINTAINERS: eth: mvneta: move Thomas to CREDITS
b59d8485fe7f MAINTAINERS: eth: mt7530: move Landen Chao to CREDITS
da14d1fed9c1 MAINTAINERS: eth: mtk: move John to CREDITS
5ecba0101dfe Merge branch 'fix-module_description-for-net-p1'
c155eca07647 net: fill in MODULE_DESCRIPTION()s for s2io
ade98756128a net: fill in MODULE_DESCRIPTION()s for ds26522 module
d8610e431fe5 net: fill in MODULE_DESCRIPTION()s for Sun RPC
95c236cc5fc9 net: fill in MODULE_DESCRIPTION()s for NFC
417d8c571cb4 net: fill in MODULE_DESCRIPTION()s for HSR
e1b1d282d5cc net: fill in MODULE_DESCRIPTION()s for SLIP
22d29f1112c8 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
4c72e2b8c42e Merge tag 'for-6.8/io_uring-2024-01-08' of git://git.kernel.dk/linux
716089b417cf of: unittest: Fix of_count_phandle_with_args() expected value message
01d550f0fcc0 Merge tag 'for-6.8/block-2024-01-08' of git://git.kernel.dk/linux
22439cf4d1ca dt-bindings: fpga: altera: Convert bridge bindings to yaml
36a7c96b3f26 dt-bindings: fpga: Convert bridge binding to yaml
9defbb1bcf97 dt-bindings: vendor-prefixes: Add smi
d05e626603d5 Merge tag 'ata-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
893e2f9eac9e Merge tag 'dma-mapping-6.8-2024-01-08' of git://git.infradead.org/users/hch/dma-mapping
457e4f99765c Merge tag 'auxdisplay-6.8' of https://github.com/ojeda/linux
2518f39af6ba Merge tag 'clang-format-6.8' of https://github.com/ojeda/linux
b6964fe2398c Merge tag 'rust-6.8' of https://github.com/Rust-for-Linux/linux
3f302388d458 io_uring/rsrc: improve code generation for fixed file assignment
5bad490858c3 Merge tag 'soc-defconfig-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
d898c2e55593 drm/xe/guc: Return CTB response length
47f2bd2ff382 iommufd/selftest: Check the bus type during probe
f6f3721244a8 iommu/vt-d: Add iotlb flush for nested domain
fb249b275c59 Merge tag 'soc-arm-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
f6597d17069a Merge tag 'soc-drivers-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
c4101e55974c Merge tag 'soc-dt-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
3c01e0121402 drm/xe/guc: Treat non-response message after BUSY as unexpected
88cbf8502023 drm/xe: Split GuC communication initialization
3e7aeb78ab01 Merge tag 'net-next-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
60a031b64984 media: i2c: thp7312: select CONFIG_FW_LOADER
ba69655fffdb s390/ptrace: remove leftover comment
74ca89611353 s390/fpu: remove __load_fpu_regs() export
d124e484691a s390/mm,fault: remove not needed tsk variable
80df7d6af7f6 s390/pci: fix max size calculation in zpci_memcpy_toio()
0130a0d3a618 s390/kexec: do not automatically select KEXEC option
77ed045e88e5 s390/compat: change default for CONFIG_COMPAT to "n"
393a5778b72a iommufd: Add data structure for Intel VT-d stage-1 cache invalidation
bf26eb83fd3b iommufd/selftest: Add coverage for IOMMU_HWPT_INVALIDATE ioctl
e1fa6640d58e iommufd/selftest: Add IOMMU_TEST_OP_MD_CHECK_IOTLB test op
ac8691203c07 iommufd/selftest: Add mock_domain_cache_invalidate_user support
77785117f9c7 iommu: Add iommu_copy_struct_from_user_array helper
8c6eabae3807 iommufd: Add IOMMU_HWPT_INVALIDATE
f35b88b66fbb iommu: Add cache_invalidate_user op
ead8467f96d6 docs, kprobes: Add loongarch as supported architecture
b65a6b44f0ea docs, kprobes: Update email address of Masami Hiramatsu
54a2ffe9524f docs: admin-guide: hw_random: update rng-tools website
22160b08d888 Documentation/core-api: fix spelling mistake in workqueue
c48a7c44a1d0 docs: kernel_feat.py: fix potential command injection
1f4cac0f7465 Documentation: constrain alabaster package to older versions
5379c646960e fbdev: hgafb: fix kernel-doc comments
af1563f256e2 fbdev: mmp: Fix typo and wording in code comment
75dda3f04ae7 fbdev: fsl-diu-fb: Fix sparse warning due to virt_to_phys() prototype change
d6dfcdaa4e6e fbdev: imxfb: add '*/' on a separate line in block comment
cb892e5dfed3 fbdev: imxfb: use __func__ for function name
77bf5df43348 fbdev: imxfb: Fix style warnings relating to printk()
62c82a47cbf8 fbdev: imxfb: add missing spaces after ','
f11025059b59 fbdev: imxfb: drop ftrace-like logging
df937b8bb604 fbdev: imxfb: add missing SPDX tag
da119a074d77 fbdev: imxfb: replace some magic numbers with constants
b0e05872f7ae fbdev: imxfb: use BIT, FIELD_{GET,PREP} and GENMASK macros
b85f17367990 fbdev: imxfb: move PCR bitfields near their offset
5758844105f7 fbdev: imxfb: fix left margin setting
d4abde52b4b1 Merge patch series "riscv: mm: Fixup & Optimize COMPAT code"
97b7ac69be2e riscv: mm: Fixup compat arch_get_mmap_end
5f449e245e5b riscv: mm: Fixup compat mode boot failure
adb1f95d388a riscv: Fix an off-by-one in get_early_cmdline()
9b1d9abe24b1 Merge patch series "tools: selftests: riscv: Fix compiler warnings"
12c16919652b tools: selftests: riscv: Fix compile warnings in mm tests
e1baf5e68ed1 tools: selftests: riscv: Fix compile warnings in vector tests
b250c9089841 tools: selftests: riscv: Add missing include for vector test
ac7b2a02d62f tools: selftests: riscv: Fix compile warnings in cbo
b91c26fdb0e8 tools: selftests: riscv: Fix compile warnings in hwprobe
54d7431af73e riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
ff172d4818ad riscv: Use hugepage mappings for vmemmap
e3b3ec967a7d ASoC: mediatek: sof-common: Add NULL check for normal_link string
d3e591a38c98 dt-bindings: riscv: Document cbop-block-size
2e605741e9dd Merge patch series "riscv: errata: thead: use riscv_nonstd_cache_ops for CMO"
07df87c0f881 dt-bindings: riscv: permit numbers in "riscv,isa"
a452816132d6 dt-bindings: riscv: cpus: Clarify mmu-type interpretation
951df4eb817c Merge patch series "RISC-V SBI debug console extension support"
4dc4af9ce326 riscv: sbi: Introduce system suspend support
3a58275099b9 Merge patch series "riscv: modules: Fix module loading error handling"
17f2c308051f Merge patch series "riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS"
18a1ee9d716d ARM: dts: usr8200: Fix phy registers
502756e23360 drm/v3d: Show the memory-management stats on debugfs
2ad62d16cd24 drm/v3d: Free the job and assign it to NULL if initialization fails
b9bc05495174 drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
5ee0d47dcf33 drm/vc4: don't check if plane->state->fb == state->fb
cbe7cea7eece drm/edid: Clean up errors in drm_edid.c
e2596dcf1e9d PCI: brcmstb: Configure HW CLKREQ# mode appropriate for downstream device
14b15aeb3628 dt-bindings: PCI: brcmstb: Add property "brcm,clkreq-mode"
3c1e5abcda64 MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
89c4b588d11e MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
1d5911d43cab Merge tag 'netfs-lib-20240109' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into vfs.netfs
989cd9fd1ffe wifi: p54: fix GCC format truncation warning with wiphy->fw_version
e3977e0609a0 Revert "kernfs: convert kernfs_idr_lock to an irq safe raw spinlock"
ef51d7542d14 drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
c2dba4d19f65 ARM: defconfig: remove dead platform options
114854438def ARM: defconfig: remove CONFIG_SLUB references
183a967ad19c ARM: defconfig: remove CONFIG_NET_ETHERNET references
984893f80e0f ARM: defconfig: remove sysfs-deprecated entries
23a7fa9c08e8 ARM: defconfig: reorder config lines
67df5b47a946 arm64: defconfig reorder config lines
d61b40bf15ce xfs: fix backwards logic in xfs_bmap_alloc_account
cf46019e8550 drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
88ec23528b32 drm/xe/selftests: Fix an error pointer dereference bug
c10da95afa68 drm/xe/device: clean up on error in probe()
de927f6c0b07 Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
c29901006179 Merge tag 'asm-generic-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
4cd083d53108 Merge tag 'modules-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux
5b202c250acd dt-bindings: power: Clarify wording for wakeup-source property
a05aea98d405 Merge tag 'sysctl-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux
78273df7f646 Merge tag 'header_cleanup-2024-01-10' of https://evilpiepirate.org/git/bcachefs
999a36b52b1b Merge tag 'bcachefs-2024-01-10' of https://evilpiepirate.org/git/bcachefs
84e9a2d5517b Merge tag 'v6.8-rc-part1-smb-client' of git://git.samba.org/sfrench/cifs-2.6
587217f9706a Merge tag 'nfs-for-6.8-1' of git://git.linux-nfs.org/projects/anna/linux-nfs
0d19d9e14687 Merge tag 'ext4_for_linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4
6bd593bc743d Merge tag 'unicode-next-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode
7c0f97cb62dc drm/xe: Invert access counter queue head / tail
d0ca70c03398 drm/xe: Add build on bug to assert access counter queue works
1fd77ceaf0d8 drm/xe: Invert page fault queue head / tail
86f41f4333e3 drm/xe: Add build on bug to assert page fault queue works
801e8c7ed670 drm/xe: Remove set_job_timeout_ms() from exec_queue_ops
25ce7c5063b3 drm/xe: Finish refactoring of exec_queue_create
6ae24344e2e3 drm/xe: Add exec_queue.sched_props.job_timeout_ms
6e144a7d6f8a drm/xe: Refactor __xe_exec_queue_create()
b2da197565d7 Merge tag 'nvme-6.8-2024-1-10' of git://git.infradead.org/nvme into for-6.8/block
78f70c02bdbc vfio/virtio: fix virtio-pci dependency
31deaeb11ba7 nvmet-rdma: avoid circular locking dependency on install_queue()
07a29b134ce8 nvmet-tcp: avoid circular locking dependency on install_queue()
acc657692aed keys, dns: Fix size check of V1 server-list header
d11dc7aa98e5 drm/doc/rfc: Remove Xe's pre-merge plan
0cb552aa9784 Merge tag 'v6.8-p1' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
284781470de2 drm/i915/gt: Use rc6.supported flag from intel_gt for rc6_enable sysfs
3e999770ac1c PM: sleep: Restore asynchronous device resume optimization
6434eade5dd5 Merge tag 'tpmdd-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd
120a201bd2ad Merge tag 'hardening-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
68da4c44b994 ext4: fix inconsistent between segment fstrim and full fstrim
1f6bc02f1848 ext4: fallback to complex scan if aligned scan doesn't work
4d5cdd757d0c ext4: convert ext4_da_do_write_end() to take a folio
7c784d624819 ext4: allow for the last group to be marked as trimmed
72116efd6307 Merge tag 'pstore-v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
4d925f60578a Merge tag 'ovl-update-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
fe80eb15dea5 io_uring/rw: cleanup io_rw_done()
0507d2526f84 Merge tag 'erofs-for-6.8-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
06c59d427017 nvme-pci: set doorbell config before unquiescing
17b9e388c619 Merge tag 'fscrypt-for-linus' of git://git.kernel.org/pub/scm/fs/fscrypt/linux
49f4810356f7 Merge tag 'nfsd-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
d8c8e595dc31 Merge tag 'dlm-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm
0c59ae129074 Merge tag 'afs-fix-rotation-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs
032500abc5dc Merge tag 'jfs-6.8' of github.com:kleikamp/linux-shaggy
f16d65124380 vdpa/mlx5: Add mkey leak detection
a06bd11b18fd vdpa/mlx5: Introduce reference counting to mrs
f756dd3e2a4c vdpa/mlx5: Use vq suspend/resume during .set_map
60c43b3f6b4e vdpa/mlx5: Mark vq state for modification in hw vq
9b23417825df vdpa/mlx5: Mark vq addrs for modification in hw vq
145096937b8a vdpa/mlx5: Introduce per vq and device resume
651cdaa9c028 vdpa/mlx5: Allow modifying multiple vq fields in one modify command
ef067191f73c vdpa/mlx5: Expose resumable vq capability
a09483c4065f vdpa: Block vq property changes in DRIVER_OK
c7e194402be3 vdpa: Track device suspended state
95e7249691f0 scsi: virtio_scsi: Add mq_poll support
35967bdcff32 virtio_pmem: support feature SHMEM_REGION
b12fbc3f787e virtio_balloon: stay awake while adjusting balloon
3690492612ec riscv: errata: thead: use pa based instructions for CMO
a4ff64edf9ed riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
bfed9a92940b Merge tag 'gfs2-v6.7-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2
affc5af36bbb Merge tag 'for-6.8-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
a109d1999229 drm/xe: Fix build bug for GCC 11
12958e9c4c8e Merge tag 'xfs-6.8-merge-3' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
32720aca900b Merge tag 'fsnotify_for_v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
9963327f8e57 Merge tag 'fs_for_v6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
748dc0b65ec2 block: fix partial zone append completion handling in req_bio_endio()
742e324a0679 block/iocost: silence warning on 'last_period' potentially being unused
50942ad6ddb5 RISC-V: Enable SBI based earlycon support
88ead68e764c tty: Add SBI debug console support to HVC SBI driver
c77bf3607a0f tty/serial: Add RISC-V SBI debug console based earlycon
f43fabf444ca RISC-V: Add SBI debug console helper routines
f503b167b660 RISC-V: Add stubs for sbi_console_putchar/getchar()
a35551c7244d riscv: Fix relocation_hashtable size
4b38b36bfbd8 riscv: Correctly free relocation hashtable on error
78996eee79eb riscv: Fix module loading free order
03c305861c70 Documentation: admin-guide: PM: Fix two typos
bde4f5ff8295 cpufreq: intel_pstate: Update hybrid scaling factor for Meteor Lake
e70b8dd26711 ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link
24406f6794aa interconnect: qcom: sm8550: Enable sync_state
85e985a4f46e interconnect: qcom: sc8180x: Mark CO0 BCM keepalive
aa12a790d31b erofs: make erofs_{err,info}() support NULL sb parameter
496530c7c1df erofs: avoid debugging output for (de)compressed data
6185d32170b6 kbuild: deb-pkg: use debian/<package> for tmpdir
1b5e94657320 kbuild: deb-pkg: move 'make headers' to build-arch
284d16c456e5 mfd: ti_am335x_tscadc: Fix TI SoC dependencies
64fe64f920f0 dt-bindings: mfd: sprd: Add support for UMS9620
3208bcef366a mfd: ab8500-sysctrl: Drop ancient charger
d505a16e00c3 drm/i915/perf: reconcile Excess struct member kernel-doc warnings
af3cfcad492f drm/i915/guc: reconcile Excess struct member kernel-doc warnings
53cd65a9c951 drm/i915/gt: reconcile Excess struct member kernel-doc warnings
30e18a89fb1f drm/i915/gem: reconcile Excess struct member kernel-doc warnings
986c20bb3e67 firewire: core: fill model field in modalias of unit device for legacy layout of configuration ROM
5465b0a591ed drm/hisilicon: include drm/drm_edid.h only where needed
c3c33a139a88 drm/nouveau: include drm/drm_edid.h only where needed
584ebbefd122 drm/i915/dp: Fix the max DSC bpc supported by source
11809687954a drm/i915: don't make assumptions about intel_wakeref_t type
ae8986e681e9 drm/i915/dp: Fix the PSR debugfs entries wrt. MST connectors
a4a9779d7642 drm/i915/display: Fix C20 pll selection for state verification
52c4e5985a73 Input: driver for Adafruit Seesaw Gamepad
dc5b56241cf3 dt-bindings: input: bindings for Adafruit Seesaw Gamepad
2d2db7d40254 xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
26ba1bf310f0 cifs: update internal module version number for cifs.ko
d0fdc20b0429 riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
b6da6cbe13eb riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
cb51bfee7f62 Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support"
3359866b40a9 riscv: hwprobe: export Zicond extension
154a37061229 riscv: hwprobe: export Zacas ISA extension
188a2122c827 riscv: add ISA extension parsing for Zacas
cd7be4d02f41 dt-bindings: riscv: add Zacas ISA extension description
5b4d64a819c0 riscv: hwprobe: export Ztso ISA extension
1ec9f381e848 riscv: add ISA extension parsing for Ztso
62694797f56b use linux/export.h rather than asm-generic/export.h
2bf8acbf542b Merge patch series "Fix XIP boot and make XIP testable in QEMU"
a7565f4d068b riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
5c89186a3270 Merge remote-tracking branch 'palmer/fixes' into for-next
869436dae72a riscv; fix __user annotation in save_v_state()
ca0e433b41a6 riscv: fix __user annotation in traps_misaligned.c
cfbc4f81c9d0 riscv: Select ARCH_WANTS_NO_INSTR
5634d9c280d2 Merge patch series "riscv: CPU operations cleanup"
b7b4e4d79fc7 riscv: Remove obsolete rv32_defconfig file
7a4749739c5f Merge patch series "RISC-V: hwprobe: Introduce which-cpus"
25742aeb135c ring-buffer: Remove stale comment from ring_buffer_size()
6c4a2f6329f0 riscv: Allow disabling of BUILTIN_DTB for XIP
5daa37264102 riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
66f1e6809397 riscv: Make XIP bootable again
3601311593eb Merge branch 'for-6.8/cxl-cper' into for-6.8/cxl
8fb7b723924c ksmbd: Add missing set_freezable() for freezable kthread
b76c01f1d950 Merge tag 'drm-intel-gt-next-2023-12-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
c8300953ba8e Merge tag 'md-6.8-20240109' of https://git.kernel.org/pub/scm/linux/kernel/git/song/md into for-6.8/block
ab27740f7665 Merge tag 'linux_kselftest-next-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
8cf9bedfc3c4 ksmbd: free ppace array on error in parse_dacl
41daf06ea14f Merge tag 'linux_kselftest-kunit-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
5d09f61e505a Merge tag 'linux_kselftest-nolibc-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
a7e4c6cf5bbb Merge tag 'efi-next-for-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
7c6a3fc925b6 Merge tag 'for-linus-6.8-1' of https://github.com/cminyard/linux-ipmi
5fda5698c289 Merge tag 'platform-drivers-x86-v6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
b9b56eb28045 Merge tag 'tag-chrome-platform-firmware-for-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux
3efcce4a9ec0 Merge tag 'tag-chrome-platform-for-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux
7da71072e1d6 Merge tag 'pm-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
7f73ba68cf67 Merge tag 'thermal-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
bd012f3a5b02 Merge tag 'acpi-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
dc97f6344f20 cxl/pci: Register for and process CPER events
ced085ef369a PCI: Introduce cleanup helpers for device reference counts and locks
671a794c33c6 acpi/ghes: Process CXL Component Events
f9c683386f5b cxl/events: Create a CXL event union
35f11a3710cd Merge tag 'mtd/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
6eade110754c cxl/events: Separate UUID from event structures
207a1f82301d cxl/events: Remove passing a UUID to known event traces
4c115c9c1f81 cxl/events: Create common event UUID defines
7dab24554ded md/raid1: Use blk_opf_t for read and write operations
301940020a92 Merge tag 'spi-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
69cac0a8f3ef drm/xe: Check skip_guc_pc before setting SLPC flag
4ae3aeab32d7 drm/xe: Add vram frequency sysfs attributes
9ccc1318cf4b PCI: mediatek-gen3: Fix translation window size calculation
4e11c29873a8 PCI: mediatek: Clear interrupt status before dispatching handler
da96801729b4 Merge tag 'regulator-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
83130ff423d6 Merge tag 'regmap-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap
a8004af338f6 drm/xe: Fix modifying exec_queue priority in xe_migrate_init
b16483f9f812 drm/xe: Fix guc_exec_queue_set_priority
6c1dd1fe5d8a Merge tag 'integrity-v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
e9b4c5890858 Merge tag 'landlock-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux
063a7ce32ddc Merge tag 'lsm-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
7075893d1d68 drm/amd/display: cleanup inconsistent indenting in amdgpu_dm_color
50e60184bfe7 drm/amdgpu: make a correction on comment
c2ab9ce0ee72 Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"
c147ddc68e74 drm/amdkfd: Fix sparse __rcu annotation warnings
2a9de42e8d3c drm/amdkfd: Fix lock dependency warning with srcu
73cb81dc548f drm/amdgpu: Packed socket_id to ras feature mask
fb1e91719983 drm/amdgpu: Support poison error injection via ras_ctrl debugfs
f4a94dbb6dc0 drm/amdgpu: correct the cu count for gfx v11
90bd01471d1c drm/amdgpu: Drop unnecessary sentences about CE and deferred error.
d32156a07575 drm/amd/display: 3.2.266
ab76bd72ee12 drm/amd/display: Dpia hpd status not in sync after S4
2476bf4328d1 drm/amd/display: Update z8 latency
bf282eb92b84 Revert "drm/amd/display: Fix conversions between bytes and KB"
5f3bce13266e drm/amd/display: Request usb4 bw for mst streams
a465536ebff8 drm/amd/display: revert "Optimize VRR updates to only necessary ones"
51c7e6ac2410 drm/amd/display: revert "for FPO & SubVP/DRR config program vmin/max"
7bdbfb4e36e3 drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled
17e74e11ac2b drm/amd/display: To adjust dprefclk by down spread percentage
47bf0f83fc86 drm/amdkfd: Fix lock dependency warning
9f9310bf8734 Merge tag 'selinux-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux
eab23bc8a807 Merge tag 'audit-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit
4f964cfef39d Merge branch 'clk-rs9' into clk-next
a4dcb2f84be4 Merge branches 'clk-zynq', 'clk-xilinx' and 'clk-stm' into clk-next
23bd8c4ad182 Merge branches 'clk-imx', 'clk-qcom', 'clk-amlogic' and 'clk-mediatek' into clk-next
8066514dc53d Merge branches 'clk-versa', 'clk-silabs', 'clk-samsung', 'clk-starfive' and 'clk-sophgo' into clk-next
76a2ee33762e Merge branches 'clk-renesas', 'clk-rockchip', 'clk-allwinner' and 'clk-cleanup' into clk-next
9f2a63523582 Merge tag 'mm-nonmm-stable-2024-01-09-10-33' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
fb46e22a9e38 Merge tag 'mm-stable-2024-01-08-15-31' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
b8b2711336f0 riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC
749b94b08005 riscv: Fix module_alloc() that did not reset the linear mapping permissions
c29fc621e1a4 riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
420370f3ae3d riscv: Check if the code to patch lies in the exit section
3fc74c65b367 ksmbd: send lease break notification on FILE_RENAME_INFORMATION
d592a9158a11 ksmbd: don't allow O_TRUNC open on read-only share
4dde83569832 of: Fix double free in of_parse_phandle_with_args_map
8d99c1131d9d ksmbd: vfs: fix all kernel-doc warnings
b4068f1ef36d ksmbd: auth: fix most kernel-doc warnings
ebfee7ad2722 ksmbd: Remove usage of the deprecated ida_simple_xx() API
b6e9a44e9960 ksmbd: don't increment epoch if current state and request state are same
6fc0a265e1b9 ksmbd: fix potential circular locking issue in smb2_set_ea()
bb05367a66a9 ksmbd: set v2 lease version on lease upgrade
516b3eb8c806 ksmbd: validate the zero field of packet header
9fbedddfc900 drm/xe/xe2_lpg: Add Wa_16018610683
d30e51aa7b1f Merge tag 'slab-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
0e00a8814eec drm/i915/guc: Avoid circular locking issue on busyness flush
f9cfe7e7f96a md: Fix md_seq_ops() regressions
632ca3c92f38 drm/nouveau/disp: switch to use kmemdup() helper
2f2cc53b5fe7 drm/i915/guc: Close deregister-context race against CT-loss
5e83c060e95b drm/i915/guc: Flush context destruction worker at suspend
89fe46019a62 drm/v3d: Fix support for register debugging on the RPi 4
ca077ff8cac5 drm/bridge: Fixed a DP link training bug
dcddb6f0b06d drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
9d612ee52c60 drm/xe: Annotate multiple mmio pointers with __iomem
20855b62a305 drm/xe: Annotate xe_mem_region::mapping with __iomem
9d03bf30e786 drm/xe: Use __iomem for the regs pointer
5e3ef4546819 dt-bindings: ignore paths outside kernel for DT_SCHEMA_FILES
09c49315f4c7 drivers: of: Fixed kernel doc warning
3f4cc70d8909 dt-bindings: tpm: Document Microsoft fTPM bindings
cd6366c0c999 dt-bindings: tpm: Convert IBM vTPM bindings to DT schema
d3b8b0855a11 dt-bindings: tpm: Convert Google Cr50 bindings to DT schema
26c9d152ebf3 dt-bindings: tpm: Consolidate TCG TIS bindings
4ec295efef1a dt-bindings: display: rockchip,inno-hdmi: Document RK3128 compatible
76156d06769b dt-bindings: arm: Add remote etm dt-binding
30e0bbf50a70 dt-bindings: mmc: sdhci-pxa: Fix 'regs' typo
a1499b7541cc media: dt-bindings: samsung,s5p-mfc: Fix iommu properties schemas
9de97e2a4e3a dt-bindings: display: panel: Add synaptics r63353 panel controller
ff5912b96f03 dt-bindings: arm: merge qcom,idle-state with idle-state
9d0c1c5618be drm/xe/vm: Fix an error path
3dc2f209208d swiotlb: check alloc_size before the allocation of a new memory pool
a7fe0881d9b7 Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
5030e16140b6 drm/xe/guc: Only take actions in CT irq handler if CTs are enabled
97d0047cbb17 drm/xe: Fix exec IOCTL long running exec queue ring full condition
f4e8ab468fc6 drm/xe/exec: reserve fence slot for CPU bind
29f424eb8702 drm/xe/exec: move fence reservation
3be8fb1bc6fc ACPICA: MADT: Add new MADT GICC/GICR/ITS non-coherent flags handling
cb1210a7c03c ACPICA: MADT: Add GICC online capable bit handling
e315e8692f79 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1502CGA
fd38dd6abda5 kselftest/alsa - conf: Stringify the printed errno in sysfs_get()
f77a255e74c3 kselftest/alsa - mixer-test: Fix the print format specifier warning
3f47c1ebe5ca kselftest/alsa - mixer-test: Fix the print format specifier warning
8c51c13dc63d kselftest/alsa - mixer-test: fix the number of parameters to ksft_exit_fail_msg()
dcaca1b5f0d4 ALSA: hda/tas2781: annotate calibration data endianness
d2aaf1996504 ACPI: resource: Add DMI quirks for ASUS Vivobook E1504GA and E1504GAB
2fb7e4dd35c5 PNP: make pnp_bus_type const
022e6f5184ff PM: QoS: Use kcalloc() instead of kzalloc()
f3c2031db7df drm/i915/psr: Disable early transport by default
467e4e061c44 drm/i915/psr: Enable psr2 early transport as possible
3291bbb93e16 drm/i915/psr: Configure PIPE_SRCSZ_ERLY_TPT for psr2 early transport
7f85883e4a7b drm/i915/psr: Calculate and configure CUR_POS_ERLY_TPT
86b26b6aeac7 drm/i915/psr: Carry su area in crtc_state
1bff93b8bc27 drm/i915/psr: Extend SU area to cover cursor fully if needed
9962c25ac41b drm: Add eDP 1.5 early transport definition
e2bdb5272f43 netfs: Fix wrong #ifdef hiding wait
3d1d4aa0cc13 cachefiles: Fix signed/unsigned mixup
219a1f49094f drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
9b26d5c044d6 drm/panel: nt35510: move hardwired parameters to configuration
9676bee4afb1 dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
2f521890aa5b thermal: netlink: Pass thermal zone pointer to notify routines
4ae535f37d0e thermal: netlink: Drop thermal_notify_tz_trip_add/delete()
f52557edf064 thermal: netlink: Pass pointers to thermal_notify_tz_trip_up/down()
7e72fc41d424 thermal: netlink: Pass pointers to thermal_notify_tz_trip_change()
f1479f0a4f53 xen/xenbus: client: fix kernel-doc comments
125c0a646a25 xen: update PV-device interface headers
8ead196be219 apparmor: Fix memory leak in unpack_profile()
2b6fad7a900d tpm: cr50: fix kernel-doc warning and spelling
a4c7d794ac16 tpm: nuvoton: Use i2c_get_match_data()
dd1d4bd6e5cf ARM: multi_v7_defconfig: Enable STM32 IPCC mailbox driver
40974ee421b4 ARM: davinci: always select CONFIG_CPU_ARM926T
6db359b5eef5 soc: pxa: ssp: fix casts
cd7b0b2dd3d9 drm/i915/dp: Fix the max DSC bpc supported by source
a3f763fdcb2f cifs: remove unneeded return statement
8d606c311b75 cifs: make cifs_chan_update_iface() a void function
9f8413c4a66f Merge tag 'cgroup-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
bfe8eb3b85c5 Merge tag 'sched-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
c12ca110c613 PCI: keystone: Fix race condition when initializing PHYs
aac4de465af0 Merge tag 'perf-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
0bdf0621f89f Merge tag 'irq-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
9b0f51097147 lan78xx: remove redundant statement in lan78xx_get_eee
5733d139a674 lan743x: remove redundant statement in lan743x_ethtool_get_eee
1c835c81eb5c Merge branch 'bnxt_en-ntuple-filter-fixes'
d8214d0f0135 bnxt_en: Fix RCU locking for ntuple filters in bnxt_rx_flow_steer()
fd7769798de8 bnxt_en: Fix RCU locking for ntuple filters in bnxt_srxclsrldel()
1ef4cacaae2f bnxt_en: Remove unneeded variable in bnxt_hwrm_clear_vnic_filter()
b59db45d7eba tcp: Revert no longer abort SYN_SENT when receiving some ICMP
f24dc33f8e0a Merge tag 'timers-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
46a08b4d4836 Merge tag 'smp-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
cdc202281a5d Merge tag 'core-entry-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
ab9517fa9aab Merge tag 'core-debugobjects-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
669d089a7fe1 Merge tag 'objtool-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
6cbf5b3105f3 Merge tag 'locking-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
f0a78b3e2a0c arm64: Update __NR_compat_syscalls for statmount/listmount
2fdbcf715a1b Merge tag 'x86-entry-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
33677aef32cf Merge tag 'x86-core-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
b51cc5d02834 Merge tag 'x86-cleanups-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
42c371f8ec42 Merge tag 'x86-build-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
f73857ece4d8 Merge tag 'x86-boot-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
106b88d7a91e Merge tag 'x86-asm-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
33034c4f9497 Merge tag 'x86-apic-2024-01-08' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
571c7ed0baa9 dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo
c3a11c0ec66c cifs: delete unnecessary NULL checks in cifs_chan_update_iface()
ab5f3fcb7c72 Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
3cf1d6a5fbf3 Merge tag 'm68k-for-v6.8-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k
968b80332432 Merge tag 'powerpc-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
3edbe8afb617 Merge tag 'ras_core_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
bef91c28f28f Merge tag 'x86_cpu_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
e900042f0484 Merge tag 'x86_sev_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
5e0a760b4441 mm, treewide: rename MAX_ORDER to MAX_PAGE_ORDER
fd37721803c6 mm, treewide: introduce NR_PAGE_ORDERS
e54478fbdad2 Merge tag 'amd-drm-next-6.8-2024-01-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
024b32db43a3 drm/bridge: parade-ps8640: Wait for HPD when doing an AUX transfer
fa78e188d8d1 drm/xe/dgfx: Release mmap mappings on rpm suspend
fc5e5c592340 Merge tag 'x86_paravirt_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
49ddab089611 drm/panel-edp: use put_sync in unprepare
41a80ca4ae2d Merge tag 'x86_misc_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
6e0b939180fc Merge tag 'x86_microcode_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
1dee7f509db2 Merge tag 'edac_updates_for_v6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras
4d4e1b6319e5 ASoC: mediatek: mt8192: Check existence of dai_name before dereferencing
d988c9f511af MAINTAINERS: Add Namhyung as tools/perf/ co-maintainer
0b43615af197 Merge branch 'for-6.8/wacom' into for-linus
53eb93563881 Merge branch 'for-6.8/steam' into for-linus
333b217c151c Merge branch 'for-6.8/sensor-hub' into for-linus
1cb09b552b1a Merge branch 'for-6.8/selftests' into for-linus
f54a651c5794 Merge branch 'for-6.8/nintendo' into for-linus
e9d29f4f6f5c Merge branch 'for-6.8/mcp2221' into for-linus
4dc8c87a96ee Merge branch 'for-6.8/mcp2200' into for-linus
f60c35260e56 Merge branch 'for-6.8/intel-ish' into for-linus
ff18ab5a4562 Merge branch 'for-6.8/i2c-hid' into for-linus
82a18fc3aafe Merge branch 'for-6.8/hid-bus-type-const' into for-linus
39e7facbe5ea Merge branch 'for-6.8/elan' into for-linus
6b93f350e55f Merge branch 'for-6.8/amd-sfh' into for-linus
ddb5bade29de drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
b837a816b36f MAINTAINERS: update unicode maintainer e-mail address
5db8752c3b81 Merge tag 'vfs-6.8.iov_iter' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
cd72c7ef5fed ecryptfs: Reject casefold directory inodes
53889bcaf536 block: make __get_task_ioprio() easier to read
3b7cb745473a block: move __get_task_ioprio() into header file
26458409a9b1 Merge tag 'vfs-6.8.cachefiles' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
bb93c5ed457f Merge tag 'vfs-6.8.rw' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
8c9440fea774 Merge tag 'vfs-6.8.mount' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
935e486b718f drm/i915/cdclk: Re-use bxt_cdclk_ctl() when sanitizing
ebb9c4240dea drm/i915/cdclk: Reorder bxt_sanitize_cdclk()
7af2f3e55c1e drm/i915/cdclk: Extract bxt_cdclk_ctl()
bdb7a38a8f40 drm/i915/xe2lpd: Update bxt_sanitize_cdclk()
3f6984e7301f Merge tag 'vfs-6.8.super' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
2d179e8ac02e MAINTAINERS: use tabs for indent of CONFIDENTIAL COMPUTING THREAT MODEL
c604110e662a Merge tag 'vfs-6.8.misc' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
4f1991a92cfe tracing histograms: Simplify parse_actions() function
be8755a0a818 drm/xe/kunit: Drop xe_wa tests for pre-production DG2
9a1abc24850e nvmet-tcp: Fix the H2C expected PDU len calculation
45c36f04f1be nvme-tcp: enhance timeout kernel log
a5c1a87ce087 nvme-rdma: enhance timeout kernel log
172fb49600c2 nvme-pci: enhance timeout kernel log
251ba4583f75 drm/nouveau: uapi: fix kerneldoc warnings
1ab33c03145d asm-generic: make sparse happy with odd-sized put_unaligned_*()
2324be17b5e0 PCI: xilinx-xdma: Fix error code in xilinx_pl_dma_pcie_init_irq_domain()
eeb8e8d9f124 drm/nouveau/volt/gk20a: don't misuse kernel-doc comments
ce6106ffa9f4 drm/nouveau/gr/gf100: don't misuse kernel-doc comments
607a9b29ef81 drm/nouveau: don't misuse kernel-doc comments
648c3814dcf6 drm/nouveau/disp: don't misuse kernel-doc comments
5f807f00b5f5 drm/nouveau/bios/init: drop kernel-doc notation
1c6d984f523f x86/kvm: Do not try to disable kvmclock if it was not enabled
83303a4c776c KVM: s390: fix cc for successful PQAP
d544d000a3cb drm/i915/dp: Abort AUX on disconnected native DP ports
2e4b90fbe755 drm/i915: Filter out glitches on HPD lines during hotplug detection
9210e94a5a3b drm/i915: Add intel_digital_port lock/unlock hooks
bab87ef4db9a drm/i915: Disable hotplug detection handlers during driver init/shutdown
cd572b3bb27e drm/i915: Disable hotplug detection works during driver init/shutdown
bd738d859e71 drm/i915: Prevent modesets during driver init/shutdown
1ef28d86bea9 drm/i915: Suspend the framebuffer console earlier during system suspend
f4ed123ae295 drm/i915: Suspend the framebuffer console during driver shutdown
24b412b1bfeb drm/i915: Disable intel HPD poll after DRM poll init/enable
a1a0e8630711 drm/i915: Move audio deinit after disabling polling
f7d16a538ad2 drm/i915: Keep the connector polled state disabled after storm
289d4180bda9 drm/i915: Init DRM connector polled field early
6b3d14b7f9b1 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy X360 13-ay0xxx
264ed178781c drm/xe: Fix spelling mistake "gueue" -> "queue"
587371ed783b block: Treat sequential write preferred zone type as invalid
41c71105a845 hwmon: (gigabyte_waterforce) Mark status report as received under a spinlock
4e33b071bb8e block: remove disk_clear_zoned
6945a1804e5c sd: remove the !ZBC && blk_queue_is_zoned case in sd_read_block_characteristics
8249a0e25dd2 hwmon: (lm75) Fix tmp112 default config
7f26fea9bc08 Merge tag 'kvm-x86-mmu-6.8' of https://github.com/kvm-x86/linux into HEAD
3115d2de39b8 Merge tag 'kvm-x86-xen-6.8' of https://github.com/kvm-x86/linux into HEAD
8c9244af4dc8 Merge tag 'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
8ecb10bcbfa3 Merge tag 'kvm-x86-lam-6.8' of https://github.com/kvm-x86/linux into HEAD
01edb1cfbdb9 Merge tag 'kvm-x86-pmu-6.8' of https://github.com/kvm-x86/linux into HEAD
33d0403fdad8 Merge tag 'kvm-x86-misc-6.8' of https://github.com/kvm-x86/linux into HEAD
0afdfd85e33a Merge tag 'kvm-x86-hyperv-6.8' of https://github.com/kvm-x86/linux into HEAD
fb872da8e720 Merge tag 'kvm-x86-generic-6.8' of https://github.com/kvm-x86/linux into HEAD
5f53d88f10eb Merge tag 'kvmarm-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
783288010035 KVM: x86: add missing "depends on KVM"
3a373e027d8b KVM: fix direction of dependency on MMU notifiers
caadf876bb74 KVM: introduce CONFIG_KVM_COMMON
7aeb25908648 ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140
f55c096f62f1 exfat: do not zero the extended part
11a347fb6cef exfat: change to get file size from DataLength
34939ae005ec exfat: using ffs instead of internal logic
742354604019 exfat: using hweight instead of internal logic
f1e5e4639781 Merge branch 'pm-sleep'
0b055cf44122 Merge branches 'pm-cpuidle', 'pm-cpufreq' and 'pm-devfreq'
3ec71290db4d ASoC: Intel: bxt_rt298: Fix kernel ops due to COMP_DUMMY change
59b946ea3080 ASoC: Intel: bxt_da7219_max98357a: Fix kernel ops due to COMP_DUMMY change
4ee4ffccc01c Merge tag 'opp-updates-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm into pm-opp
cdb3033e191f Merge branch 'sched/urgent' into sched/core, to pick up pending v6.7 fixes for the v6.8 merge window
babebd1dc127 drm/probe-helper: remove unused drm_connector_helper_get_modes_from_ddc()
2e367ad4da33 drm/mgag200: convert get modes to struct drm_edid
d24b923f1d69 RDMA/bnxt_re: Fix error code in bnxt_re_create_cq()
2f9060b1db4a MIPS: Fix typos
f5b6fd4ea320 drm/mgag200: Fix caching setup for remapped


