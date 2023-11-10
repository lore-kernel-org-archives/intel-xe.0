Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7873C4167D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 23:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D8A10E242;
	Fri, 10 Nov 2023 23:28:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F23210E242
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699658914; x=1731194914;
 h=date:from:to:cc:subject:message-id;
 bh=F0msVpZuxztFYBhgcuypYwqix/YyLBo2Fq3AzPrWAs4=;
 b=kFX7AwQkM0uN1NoFdjhE5tOnrN4w39UNAxVYRSwRw6zmtl714DHZTMAO
 QmqnPpldah39GplGhWUU+RDJdwrDVIxp4V1/nBZqjOhrex6AbSGcGmGIK
 5xkr0jZZos1vxjs+JPL6DaIe7wkIi2f5+VK1Dz+DGY7Hhb3qlpll+bfLL
 y5kUZVRuEnwvcWSrr4a9jIZyIMpRhtJbPr9RZvjvBKHqQEiFBPHGDO8El
 d9qqJb5ftjUpAX2Ycqlyux5wov1EZHMfI60fKLw7+AcMPEjZ578cNlAY2
 mYF7LdNW+EQT1diSGO3WTLW1VRYDBZJVBLUS4LNBCfgq94r5Q/Wvrh/t4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3229322"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="3229322"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 15:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="907562324"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="907562324"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2023 15:28:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1avN-000A1Y-1s;
 Fri, 10 Nov 2023 23:28:29 +0000
Date: Sat, 11 Nov 2023 07:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <202311110740.1ESqKaXk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD REGRESSION
 b3890fb4386dcef68a96888141c4cc773f6241ce
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: b3890fb4386dcef68a96888141c4cc773f6241ce  drm/xe: Drop EXECLIST_CONTROL from error state dump

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310302310.8sINH2Pc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311041602.YYfF0B6U-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311041742.3dzKbpfj-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/v3d/v3d_sched.c:403:30: error: 'ULL' undeclared (first use in this function)
drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
include/drm/drm_print.h:456:39: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
include/trace/../../drivers/gpu/drm/xe/xe_trace.h:33:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- alpha-allnoconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- alpha-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- alpha-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- arc-allmodconfig
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- arch-arc-kernel-kprobes.c:warning:no-previous-prototype-for-arc_kprobe_handler
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arc-allnoconfig
|   |-- arch-arc-kernel-devtree.c:warning:variable-dt_root-set-but-not-used
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arc-allyesconfig
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- arch-arc-kernel-kprobes.c:warning:no-previous-prototype-for-arc_kprobe_handler
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arc-defconfig
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- arch-arc-kernel-kprobes.c:warning:no-previous-prototype-for-arc_kprobe_handler
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- arc-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arc-randconfig-002-20231110
|   |-- arch-arc-kernel-devtree.c:warning:variable-dt_root-set-but-not-used
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arm-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-randconfig-003-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-randconfig-004-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arm64-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm64-randconfig-002-20231110
|   `-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|-- arm64-randconfig-003-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-004-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- csky-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- csky-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- csky-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- csky-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   `-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   `-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|-- i386-buildonly-randconfig-002-20231110
|   `-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|-- i386-randconfig-141-20231111
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-allnoconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- loongarch-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-randconfig-002-20231110
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- m68k-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- m68k-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- microblaze-allmodconfig
|   |-- arch-microblaze-kernel-entry.S:Error:unknown-opcode-suspend
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- microblaze-allnoconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- microblaze-allyesconfig
|   |-- arch-microblaze-kernel-entry.S:Error:unknown-opcode-suspend
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- microblaze-defconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- mips-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- mips-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- mips-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- nios2-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-allnoconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- openrisc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- openrisc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- openrisc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- parisc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- parisc-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- parisc-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- parisc64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc64-randconfig-001-20231110
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc64-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- powerpc64-randconfig-003-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- riscv-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- riscv-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- riscv-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- riscv-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- riscv-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- riscv-rv32_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- s390-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- s390-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- s390-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- s390-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- s390-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- s390-randconfig-002-20231110
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- sh-allmodconfig
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-kprobes.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-arch_copy_kprobe
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-trampoline_probe_handler
|   |-- arch-sh-kernel-kprobes.c:warning:variable-p-set-but-not-used
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh2.c:warning:no-previous-prototype-for-sh2_cache_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kunmap_coherent
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-allnoconfig
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh2.c:warning:no-previous-prototype-for-sh2_cache_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kunmap_coherent
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-allyesconfig
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-kprobes.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-arch_copy_kprobe
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-trampoline_probe_handler
|   |-- arch-sh-kernel-kprobes.c:warning:variable-p-set-but-not-used
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh2.c:warning:no-previous-prototype-for-sh2_cache_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kunmap_coherent
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-defconfig
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_raise
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_rounding_mode
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-kprobes.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-arch_copy_kprobe
|   |-- arch-sh-kernel-kprobes.c:warning:no-previous-prototype-for-trampoline_probe_handler
|   |-- arch-sh-kernel-kprobes.c:warning:variable-p-set-but-not-used
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-smp.c:warning:no-previous-prototype-for-setup_profiling_timer
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh4.c:warning:no-previous-prototype-for-sh4_cache_init
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-end-set-but-not-used
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-start-set-but-not-used
|   |-- arch-sh-mm-cache-shx3.c:warning:no-previous-prototype-for-shx3_cache_init
|   |-- arch-sh-mm-flush-sh4.c:warning:no-previous-prototype-for-sh4__flush_region_init
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_alloc
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_ctor
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_free
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pmd_alloc_one
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pmd_free
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pud_populate
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   |-- fs-ext4-readpage.c:warning:the-frame-size-of-bytes-is-larger-than-bytes
|   |-- fs-mpage.c:warning:the-frame-size-of-bytes-is-larger-than-bytes
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_read_lock
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_read_lock_bh
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_read_lock_irq
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_read_lock_irqsave
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_spin_lock
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_spin_lock_bh
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_spin_lock_irq
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_spin_lock_irqsave
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_write_lock
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_write_lock_bh
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_write_lock_irq
|   |-- kernel-locking-spinlock.c:warning:no-previous-prototype-for-__raw_write_lock_irqsave
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-randconfig-001-20231110
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh2.c:warning:no-previous-prototype-for-sh2_cache_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kunmap_coherent
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-randconfig-002-20231110
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh2.c:warning:no-previous-prototype-for-sh2_cache_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kmap_coherent_init
|   |-- arch-sh-mm-nommu.c:warning:no-previous-prototype-for-kunmap_coherent
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-allnoconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-002-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-xe_display_misc.c:warning:no-previous-prototype-for-intel_gmch_vga_set_decode
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- um-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- um-i386_defconfig
|   |-- arch-um-os-Linux-umid.c:warning:__builtin___sprintf_chk-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- arch-x86-um-os-Linux-task_size.c:warning:variable-original-set-but-not-used
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- um-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- um-randconfig-002-20231110
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- um-x86_64_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|   `-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|-- x86_64-buildonly-randconfig-003-20231110
|   `-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|-- x86_64-buildonly-randconfig-006-20231110
|   `-- drivers-gpu-drm-v3d-v3d_sched.c:error:ULL-undeclared-(first-use-in-this-function)
|-- xtensa-randconfig-001-20231110
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
`-- xtensa-randconfig-002-20231110
    |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
    `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
clang_recent_errors
|-- um-allmodconfig
|   |-- arch-um-kernel-kmsg_dump.c:warning:no-previous-prototype-for-function-kmsg_dumper_stdout_init
|   |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-pgd_alloc
|   |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-uml_kmalloc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-__switch_to
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_align_stack
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_cpu_idle
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-clear_user_proc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-copy_to_user_proc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-fork_handler
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-get_using_sysemu
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-make_proc_sysemu
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-pid_to_processor_id
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-set_using_sysemu
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_restart
|   |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-destroy_context
|   |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-init_new_context
|   |-- arch-um-kernel-skas-process.c:warning:no-previous-prototype-for-function-start_uml
|   |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm_range
|   |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-force_flush_all
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-read_initrd
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke_sync
|   |-- arch-um-os-Linux-drivers-ethertap_kern.c:warning:no-previous-prototype-for-function-ethertap_setup
|   |-- arch-um-os-Linux-drivers-tuntap_kern.c:warning:no-previous-prototype-for-function-tuntap_setup
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_calloc
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_free
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_malloc
|   |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-check_tmpexec
|   |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-kasan_map_memory
|   |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-sig_handler
|   |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-timer_alarm_handler
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-__switch_mm
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-wait_stub_done
|   |-- arch-um-os-Linux-start_up.c:warning:no-previous-prototype-for-function-parse_iomem
|   |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_check_bugs
|   |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_examine_signal
|   |-- arch-x86-um-fault.c:warning:no-previous-prototype-for-function-arch_fixup
|   |-- arch-x86-um-os-Linux-mcontext.c:warning:no-previous-prototype-for-function-get_regs_from_mc
|   |-- arch-x86-um-os-Linux-prctl.c:warning:no-previous-prototype-for-function-os_arch_prctl
|   |-- arch-x86-um-os-Linux-registers.c:warning:no-previous-prototype-for-function-get_thread_reg
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-is_syscall
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-peek_user
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-poke_user
|   |-- arch-x86-um-shared-sysdep-kernel-offsets.h:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-signal.c:warning:no-previous-prototype-for-function-sys_rt_sigreturn
|   |-- arch-x86-um-syscalls_64.c:warning:no-previous-prototype-for-function-arch_switch_to
|   |-- arch-x86-um-user-offsets.c:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_clock_gettime
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_getcpu
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_gettimeofday
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_time
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   |-- fs-select.c:warning:stack-frame-size-()-exceeds-limit-()-in-core_sys_select
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- lib-maple_tree.c:warning:stack-frame-size-()-exceeds-limit-()-in-mas_wr_modify
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:init-main.o:warning:relocation-in-read-only-section-ref.text
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:creating-DT_TEXTREL-in-a-PIE
|-- um-allnoconfig
|   |-- arch-um-kernel-kmsg_dump.c:warning:no-previous-prototype-for-function-kmsg_dumper_stdout_init
|   |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-pgd_alloc
|   |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-uml_kmalloc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-__switch_to
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_align_stack
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_cpu_idle
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-clear_user_proc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-copy_to_user_proc
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-fork_handler
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-get_using_sysemu
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-make_proc_sysemu
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-pid_to_processor_id
|   |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-set_using_sysemu
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_restart
|   |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-destroy_context
|   |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-init_new_context
|   |-- arch-um-kernel-skas-process.c:warning:no-previous-prototype-for-function-start_uml
|   |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm_range
|   |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-force_flush_all
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-read_initrd
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke
|   |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke_sync
|   |-- arch-um-os-Linux-drivers-ethertap_kern.c:warning:no-previous-prototype-for-function-ethertap_setup
|   |-- arch-um-os-Linux-drivers-tuntap_kern.c:warning:no-previous-prototype-for-function-tuntap_setup
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_calloc
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_free
|   |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_malloc
|   |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-check_tmpexec
|   |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-kasan_map_memory
|   |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-sig_handler
|   |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-timer_alarm_handler
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-__switch_mm
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-wait_stub_done
|   |-- arch-um-os-Linux-start_up.c:warning:no-previous-prototype-for-function-parse_iomem
|   |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_check_bugs
|   |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_examine_signal
|   |-- arch-x86-um-fault.c:warning:no-previous-prototype-for-function-arch_fixup
|   |-- arch-x86-um-os-Linux-mcontext.c:warning:no-previous-prototype-for-function-get_regs_from_mc
|   |-- arch-x86-um-os-Linux-prctl.c:warning:no-previous-prototype-for-function-os_arch_prctl
|   |-- arch-x86-um-os-Linux-registers.c:warning:no-previous-prototype-for-function-get_thread_reg
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-is_syscall
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-peek_user
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-poke_user
|   |-- arch-x86-um-shared-sysdep-kernel-offsets.h:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-signal.c:warning:no-previous-prototype-for-function-sys_rt_sigreturn
|   |-- arch-x86-um-syscalls_64.c:warning:no-previous-prototype-for-function-arch_switch_to
|   |-- arch-x86-um-user-offsets.c:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_clock_gettime
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_getcpu
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_gettimeofday
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_time
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   |-- fs-select.c:warning:stack-frame-size-()-exceeds-limit-()-in-core_sys_select
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- lib-maple_tree.c:warning:stack-frame-size-()-exceeds-limit-()-in-mas_wr_modify
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:init-main.o:warning:relocation-in-read-only-section-ref.text
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:creating-DT_TEXTREL-in-a-PIE
`-- um-allyesconfig
    |-- arch-um-kernel-kmsg_dump.c:warning:no-previous-prototype-for-function-kmsg_dumper_stdout_init
    |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-pgd_alloc
    |-- arch-um-kernel-mem.c:warning:no-previous-prototype-for-function-uml_kmalloc
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-__switch_to
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_align_stack
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-arch_cpu_idle
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-clear_user_proc
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-copy_to_user_proc
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-fork_handler
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-get_using_sysemu
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-make_proc_sysemu
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-pid_to_processor_id
    |-- arch-um-kernel-process.c:warning:no-previous-prototype-for-function-set_using_sysemu
    |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_halt
    |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_power_off
    |-- arch-um-kernel-reboot.c:warning:no-previous-prototype-for-function-machine_restart
    |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-destroy_context
    |-- arch-um-kernel-skas-mmu.c:warning:no-previous-prototype-for-function-init_new_context
    |-- arch-um-kernel-skas-process.c:warning:no-previous-prototype-for-function-start_uml
    |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm_range
    |-- arch-um-kernel-tlb.c:warning:no-previous-prototype-for-function-force_flush_all
    |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-read_initrd
    |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke
    |-- arch-um-kernel-um_arch.c:warning:no-previous-prototype-for-function-text_poke_sync
    |-- arch-um-os-Linux-drivers-ethertap_kern.c:warning:no-previous-prototype-for-function-ethertap_setup
    |-- arch-um-os-Linux-drivers-tuntap_kern.c:warning:no-previous-prototype-for-function-tuntap_setup
    |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_calloc
    |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_free
    |-- arch-um-os-Linux-main.c:warning:no-previous-prototype-for-function-__wrap_malloc
    |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-check_tmpexec
    |-- arch-um-os-Linux-mem.c:warning:no-previous-prototype-for-function-kasan_map_memory
    |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-sig_handler
    |-- arch-um-os-Linux-signal.c:warning:no-previous-prototype-for-function-timer_alarm_handler
    |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-__switch_mm
    |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-wait_stub_done
    |-- arch-um-os-Linux-start_up.c:warning:no-previous-prototype-for-function-parse_iomem
    |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_check_bugs
    |-- arch-x86-um-bugs_64.c:warning:no-previous-prototype-for-function-arch_examine_signal
    |-- arch-x86-um-fault.c:warning:no-previous-prototype-for-function-arch_fixup
    |-- arch-x86-um-os-Linux-mcontext.c:warning:no-previous-prototype-for-function-get_regs_from_mc
    |-- arch-x86-um-os-Linux-prctl.c:warning:no-previous-prototype-for-function-os_arch_prctl
    |-- arch-x86-um-os-Linux-registers.c:warning:no-previous-prototype-for-function-get_thread_reg
    |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-is_syscall
    |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-peek_user
    |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-poke_user
    |-- arch-x86-um-shared-sysdep-kernel-offsets.h:warning:no-previous-prototype-for-function-foo
    |-- arch-x86-um-signal.c:warning:no-previous-prototype-for-function-sys_rt_sigreturn
    |-- arch-x86-um-syscalls_64.c:warning:no-previous-prototype-for-function-arch_switch_to
    |-- arch-x86-um-user-offsets.c:warning:no-previous-prototype-for-function-foo
    |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_clock_gettime
    |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_getcpu
    |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_gettimeofday
    |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_time
    |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
    |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
    |-- fs-select.c:warning:stack-frame-size-()-exceeds-limit-()-in-core_sys_select
    |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
    |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
    |-- lib-maple_tree.c:warning:stack-frame-size-()-exceeds-limit-()-in-mas_wr_modify
    |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
    |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
    `-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions

elapsed time: 1450m

configs tested: 165
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231110   gcc  
arc                   randconfig-002-20231110   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231110   gcc  
arm                   randconfig-002-20231110   gcc  
arm                   randconfig-003-20231110   gcc  
arm                   randconfig-004-20231110   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231110   gcc  
arm64                 randconfig-002-20231110   gcc  
arm64                 randconfig-003-20231110   gcc  
arm64                 randconfig-004-20231110   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231110   gcc  
csky                  randconfig-002-20231110   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231110   gcc  
i386         buildonly-randconfig-002-20231110   gcc  
i386         buildonly-randconfig-003-20231110   gcc  
i386         buildonly-randconfig-004-20231110   gcc  
i386         buildonly-randconfig-005-20231110   gcc  
i386         buildonly-randconfig-006-20231110   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231110   gcc  
i386                  randconfig-002-20231110   gcc  
i386                  randconfig-003-20231110   gcc  
i386                  randconfig-004-20231110   gcc  
i386                  randconfig-005-20231110   gcc  
i386                  randconfig-006-20231110   gcc  
i386                  randconfig-011-20231110   gcc  
i386                  randconfig-012-20231110   gcc  
i386                  randconfig-013-20231110   gcc  
i386                  randconfig-014-20231110   gcc  
i386                  randconfig-015-20231110   gcc  
i386                  randconfig-016-20231110   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231110   gcc  
loongarch             randconfig-002-20231110   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231110   gcc  
nios2                 randconfig-002-20231110   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231110   gcc  
parisc                randconfig-002-20231110   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231110   gcc  
powerpc               randconfig-002-20231110   gcc  
powerpc               randconfig-003-20231110   gcc  
powerpc64             randconfig-001-20231110   gcc  
powerpc64             randconfig-002-20231110   gcc  
powerpc64             randconfig-003-20231110   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231110   gcc  
riscv                 randconfig-002-20231110   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231110   gcc  
s390                  randconfig-002-20231110   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231110   gcc  
sh                    randconfig-002-20231110   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231110   gcc  
sparc                 randconfig-002-20231110   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231110   gcc  
sparc64               randconfig-002-20231110   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231110   gcc  
um                    randconfig-002-20231110   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231110   gcc  
x86_64       buildonly-randconfig-002-20231110   gcc  
x86_64       buildonly-randconfig-003-20231110   gcc  
x86_64       buildonly-randconfig-004-20231110   gcc  
x86_64       buildonly-randconfig-005-20231110   gcc  
x86_64       buildonly-randconfig-006-20231110   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231110   gcc  
x86_64                randconfig-002-20231110   gcc  
x86_64                randconfig-003-20231110   gcc  
x86_64                randconfig-004-20231110   gcc  
x86_64                randconfig-005-20231110   gcc  
x86_64                randconfig-006-20231110   gcc  
x86_64                randconfig-011-20231110   gcc  
x86_64                randconfig-012-20231110   gcc  
x86_64                randconfig-013-20231110   gcc  
x86_64                randconfig-014-20231110   gcc  
x86_64                randconfig-015-20231110   gcc  
x86_64                randconfig-016-20231110   gcc  
x86_64                randconfig-071-20231110   gcc  
x86_64                randconfig-072-20231110   gcc  
x86_64                randconfig-073-20231110   gcc  
x86_64                randconfig-074-20231110   gcc  
x86_64                randconfig-075-20231110   gcc  
x86_64                randconfig-076-20231110   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231110   gcc  
xtensa                randconfig-002-20231110   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
