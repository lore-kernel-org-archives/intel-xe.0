Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D6FC072A2
	for <intel-xe@archiver.kernel.org>; Sun, 19 Nov 2023 17:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059810E377;
	Sun, 19 Nov 2023 17:37:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26CD10E01F
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Nov 2023 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700415423; x=1731951423;
 h=date:from:to:cc:subject:message-id;
 bh=lfOoU81GH+VpcP1ZfsMKNAvvjarOos9Qdloqys2p51s=;
 b=lymt2fhkyi825rJ8CIYwK1SRIagie6Lyu9EZn4XLvquLKZsh5DPXFtk5
 cUYe2SUXCrZmJ6zznMvjhgYXP/Z7oFzM8gvY6F9NbfoHmj3MLMh7g5pXP
 mqCBi6ApU9hFq019pVB2uxkQQKsyXUMUwMFEaPWR0DZXh4gWAsMEodLaK
 /fXIuxpMbL27lFOhr59576zeSOqaRCRcyTd8uW7a0gaK13YvctrHi6IF2
 UhvhfBlE+O4IO6AahncddwJ8msm2r1EXMcfvo9YwxeuOzbM3Eftg1WT2k
 LYO83nkAZBv+9do4R0+RCw56fgxM/pEjMFcTTfQSn6pForGxPlxPIZwaF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10176349"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; d="scan'208";a="10176349"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 09:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889719641"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; d="scan'208";a="889719641"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 19 Nov 2023 09:36:59 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r4lj7-0005Mh-09;
 Sun, 19 Nov 2023 17:36:57 +0000
Date: Mon, 20 Nov 2023 01:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <202311200123.ll7ZKCf7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD REGRESSION
 b25aa17bffa88c86fec716e40bdb3848eea17b23
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
branch HEAD: b25aa17bffa88c86fec716e40bdb3848eea17b23  drm/xe/guc: Use valid scratch register for posting read

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311041602.YYfF0B6U-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311041742.3dzKbpfj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311152128.2R0TGUKs-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311152249.gjSKciOA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311152257.LwV3M3aC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311180240.w7IngNSe-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

asus_wmi_sensors.c:(.exit.text+0x8): undefined reference to `wmi_driver_unregister'
asus_wmi_sensors.c:(.init.text+0x14): undefined reference to `__wmi_driver_register'
asus_wmi_sensors.c:(.text+0xf4): undefined reference to `wmi_evaluate_method'
base.c:(.text+0x1e0): undefined reference to `wmi_has_guid'
base.c:(.text+0x7c): undefined reference to `wmi_evaluate_method'
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:13:25: warning: no previous prototype for 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:13:25: warning: no previous prototype for function 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:68:5: warning: no previous prototype for 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:68:5: warning: no previous prototype for function 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: warning: no previous prototype for 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: warning: no previous prototype for function 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:5: warning: no previous prototype for 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:5: warning: no previous prototype for function 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
hp-wmi-sensors.c:(.exit.text+0x8): undefined reference to `wmi_driver_unregister'
hp-wmi-sensors.c:(.init.text+0x14): undefined reference to `__wmi_driver_register'
hp-wmi-sensors.c:(.text+0x10ac): undefined reference to `wmi_query_block'
hp-wmi-sensors.c:(.text+0x1f18): undefined reference to `wmi_instance_count'
hp-wmi-sensors.c:(.text+0x26f8): undefined reference to `wmi_install_notify_handler'
hp-wmi-sensors.c:(.text+0x7c0): undefined reference to `wmi_remove_notify_handler'
hp-wmi-sensors.c:(.text+0xc08): undefined reference to `wmi_get_event_data'
include/drm/drm_print.h:456:39: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
include/trace/../../drivers/gpu/drm/xe/xe_trace.h:34:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
surface3-wmi.c:(.text+0x260): undefined reference to `wmi_query_block'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included more than once.
drivers/gpu/drm/xe/xe_module.c: xe_module.h is included more than once.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-001-20231119
|   |-- arch-arc-kernel-devtree.c:warning:variable-dt_root-set-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arc-randconfig-002-20231119
|   `-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|-- arm-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-randconfig-003-20231119
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm64-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-003-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-004-20231119
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- i386-allmodconfig
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- i386-allnoconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-allyesconfig
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- i386-buildonly-randconfig-001-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-buildonly-randconfig-002-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-buildonly-randconfig-003-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-buildonly-randconfig-004-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- i386-buildonly-randconfig-005-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-buildonly-randconfig-006-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   `-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|-- i386-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-001-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-002-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-003-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-004-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-randconfig-005-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-randconfig-006-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-011-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-012-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-013-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-014-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-015-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-016-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|   |-- asus_wmi_sensors.c:(.exit.text):undefined-reference-to-wmi_driver_unregister
|   |-- asus_wmi_sensors.c:(.init.text):undefined-reference-to-__wmi_driver_register
|   |-- asus_wmi_sensors.c:(.text):undefined-reference-to-wmi_evaluate_method
|   |-- base.c:(.text):undefined-reference-to-wmi_evaluate_method
|   |-- base.c:(.text):undefined-reference-to-wmi_has_guid
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- hp-wmi-sensors.c:(.exit.text):undefined-reference-to-wmi_driver_unregister
|   |-- hp-wmi-sensors.c:(.init.text):undefined-reference-to-__wmi_driver_register
|   |-- hp-wmi-sensors.c:(.text):undefined-reference-to-wmi_get_event_data
|   |-- hp-wmi-sensors.c:(.text):undefined-reference-to-wmi_install_notify_handler
|   |-- hp-wmi-sensors.c:(.text):undefined-reference-to-wmi_instance_count
|   |-- hp-wmi-sensors.c:(.text):undefined-reference-to-wmi_query_block
|   |-- hp-wmi-sensors.c:(.text):undefined-reference-to-wmi_remove_notify_handler
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- surface3-wmi.c:(.text):undefined-reference-to-wmi_query_block
|-- loongarch-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- m68k-allmodconfig
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
|-- m68k-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-allyesconfig
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
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- mips-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
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
|-- nios2-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- openrisc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- parisc-randconfig-001-20231119
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- parisc64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- powerpc-randconfig-001-20231119
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc64-randconfig-001-20231119
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc64-randconfig-002-20231119
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc64-randconfig-003-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- riscv-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- riscv-randconfig-001-20231119
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- riscv-rv32_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- sh-randconfig-001-20231119
|   |-- arch-sh-boot-compressed-cache.c:warning:no-previous-prototype-for-cache_control
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
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
|-- sh-randconfig-002-20231119
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
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
|-- sparc-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-randconfig-002-20231119
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-002-20231119
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- um-randconfig-001-20231119
|   `-- arch-um-os-Linux-umid.c:warning:__builtin___sprintf_chk-may-write-a-terminating-nul-past-the-end-of-the-destination
|-- um-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- x86_64-allnoconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-i915-display-intel_fb.c:intel_frontbuffer.h-is-included-more-than-once.
|   `-- drivers-gpu-drm-xe-xe_module.c:xe_module.h-is-included-more-than-once.
|-- x86_64-allyesconfig
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-edac-skx_common.c:warning:_DIMM-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-intel_fbdev_fb_fill_info
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
|-- x86_64-buildonly-randconfig-001-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- drivers-edac-skx_common.c:warning:_DIMM-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-buildonly-randconfig-002-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- x86_64-buildonly-randconfig-003-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- x86_64-buildonly-randconfig-004-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- x86_64-buildonly-randconfig-005-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- x86_64-buildonly-randconfig-006-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- x86_64-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-001-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-002-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-003-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-004-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
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
|-- x86_64-randconfig-005-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-006-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-011-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-edac-skx_common.c:warning:_DIMM-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-012-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-013-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- x86_64-randconfig-014-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- x86_64-randconfig-015-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-016-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-071-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-072-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-073-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
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
|-- x86_64-randconfig-074-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-075-20231119
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_free_lru-A-least-recently-used-list-of-free-RMIDs
|   |-- arch-x86-kernel-cpu-resctrl-monitor.c:warning:Cannot-understand-rmid_limbo_count-count-of-currently-unused-but-(potentially)
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-buf-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-nbytes-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-of-not-described-in-rdt_bit_usage_show
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-off-not-described-in-rdtgroup_mode_write
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-rdtgrp-not-described-in-rdtgroup_mode_test_exclusive
|   |-- arch-x86-kernel-cpu-resctrl-rdtgroup.c:warning:Function-parameter-or-member-s-not-described-in-rdtgroup_size_show
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- x86_64-randconfig-076-20231119
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
`-- xtensa-randconfig-001-20231119
    |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
    |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
    |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
    |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
    |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
    |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
    `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
clang_recent_errors
|-- hexagon-randconfig-001-20231119
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   `-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|-- hexagon-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   `-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|-- mips-allnoconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_alloc
|   `-- drivers-gpu-drm-xe-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_fill_info
|-- s390-randconfig-001-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|-- s390-randconfig-002-20231119
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
`-- x86_64-rhel-8.3-rust
    |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
    |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
    |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_alloc
    |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_fill_info
    |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
    |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
    `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep

elapsed time: 1445m

configs tested: 124
configs skipped: 2

tested configs:
arc                   randconfig-001-20231119   gcc  
arc                   randconfig-002-20231119   gcc  
arm                   randconfig-001-20231119   gcc  
arm                   randconfig-002-20231119   gcc  
arm                   randconfig-003-20231119   gcc  
arm                   randconfig-004-20231119   gcc  
arm64                 randconfig-001-20231119   gcc  
arm64                 randconfig-002-20231119   gcc  
arm64                 randconfig-003-20231119   gcc  
arm64                 randconfig-004-20231119   gcc  
csky                  randconfig-001-20231119   gcc  
csky                  randconfig-002-20231119   gcc  
hexagon               randconfig-001-20231119   clang
hexagon               randconfig-002-20231119   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231119   gcc  
i386         buildonly-randconfig-002-20231119   gcc  
i386         buildonly-randconfig-003-20231119   gcc  
i386         buildonly-randconfig-004-20231119   gcc  
i386         buildonly-randconfig-005-20231119   gcc  
i386         buildonly-randconfig-006-20231119   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231119   gcc  
i386                  randconfig-002-20231119   gcc  
i386                  randconfig-003-20231119   gcc  
i386                  randconfig-004-20231119   gcc  
i386                  randconfig-005-20231119   gcc  
i386                  randconfig-006-20231119   gcc  
i386                  randconfig-011-20231119   gcc  
i386                  randconfig-012-20231119   gcc  
i386                  randconfig-013-20231119   gcc  
i386                  randconfig-014-20231119   gcc  
i386                  randconfig-015-20231119   gcc  
i386                  randconfig-016-20231119   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231119   gcc  
loongarch             randconfig-002-20231119   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231119   gcc  
nios2                 randconfig-002-20231119   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231119   gcc  
parisc                randconfig-002-20231119   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231119   gcc  
powerpc               randconfig-002-20231119   gcc  
powerpc               randconfig-003-20231119   gcc  
powerpc64             randconfig-001-20231119   gcc  
powerpc64             randconfig-002-20231119   gcc  
powerpc64             randconfig-003-20231119   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231119   gcc  
riscv                 randconfig-002-20231119   gcc  
riscv                          rv32_defconfig   gcc  
s390                  randconfig-001-20231119   clang
s390                  randconfig-002-20231119   clang
sh                    randconfig-001-20231119   gcc  
sh                    randconfig-002-20231119   gcc  
sparc64               randconfig-001-20231119   gcc  
sparc64               randconfig-002-20231119   gcc  
um                    randconfig-001-20231119   gcc  
um                    randconfig-002-20231119   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231119   gcc  
x86_64       buildonly-randconfig-002-20231119   gcc  
x86_64       buildonly-randconfig-003-20231119   gcc  
x86_64       buildonly-randconfig-004-20231119   gcc  
x86_64       buildonly-randconfig-005-20231119   gcc  
x86_64       buildonly-randconfig-006-20231119   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231119   gcc  
x86_64                randconfig-002-20231119   gcc  
x86_64                randconfig-003-20231119   gcc  
x86_64                randconfig-004-20231119   gcc  
x86_64                randconfig-005-20231119   gcc  
x86_64                randconfig-006-20231119   gcc  
x86_64                randconfig-011-20231119   gcc  
x86_64                randconfig-012-20231119   gcc  
x86_64                randconfig-013-20231119   gcc  
x86_64                randconfig-014-20231119   gcc  
x86_64                randconfig-015-20231119   gcc  
x86_64                randconfig-016-20231119   gcc  
x86_64                randconfig-071-20231119   gcc  
x86_64                randconfig-072-20231119   gcc  
x86_64                randconfig-073-20231119   gcc  
x86_64                randconfig-074-20231119   gcc  
x86_64                randconfig-075-20231119   gcc  
x86_64                randconfig-076-20231119   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231119   gcc  
xtensa                randconfig-002-20231119   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
