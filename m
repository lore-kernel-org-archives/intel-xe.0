Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD1C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740EA10E36E;
	Fri, 24 Nov 2023 18:26:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEB410E36E
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700850366; x=1732386366;
 h=date:from:to:cc:subject:message-id;
 bh=SDG98x/VNeu+70DVWuZv3CUD6w7Wo0WYiHDfN5ovGUs=;
 b=HtIPYqxD8J0jNaJqaY+Ob1+Dh7f4oamIlz6WA860rkUAnI/d9BFW1CQt
 /GLQgqAosJWAryd6fF2+9ma++s6oOPovyVmqGfhSJcwWCmijNnL2fE1Ol
 N9SFYCPoltWfSip0D54WyP9GLQmGPDo+/6isQ4PK3bWhEgrMF9nSUyz2Y
 z9P7LVdiHMfuJJ/ReVq6mutvHcJizMbwrUgCGHnXD8dTILjQKl+uq8GVV
 iuKc5r3q4/zGqNDmK1Psgvvnq++AWoOqG6+7bXDLu30MK5QQR2OVL2LG3
 oX70WhgqsUxCkUAls/IK8pYajUal3OrI1+mcZ/2+nNIPt00F4B+WIxtVp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11139506"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="11139506"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:26:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761021768"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="761021768"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 10:26:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6asL-0003B1-0b;
 Fri, 24 Nov 2023 18:26:01 +0000
Date: Sat, 25 Nov 2023 02:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <202311250253.embODLrV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD SUCCESS WITH WARNING
 1832821c7e4c5bd24353183f060f1435b2eb7992
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
branch HEAD: 1832821c7e4c5bd24353183f060f1435b2eb7992  drm/xe: Print virtualization mode during probe

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202311041602.YYfF0B6U-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311041742.3dzKbpfj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311062247.EgHSZqD3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311072341.c0UOmHni-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311152257.LwV3M3aC-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:13:25: warning: no previous prototype for function 'intel_fbdev_fb_alloc' [-Wmissing-prototypes]
drivers/gpu/drm/i915/display/intel_fbdev_fb.c:68:5: warning: no previous prototype for function 'intel_fbdev_fb_fill_info' [-Wmissing-prototypes]
drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for '__i915_inject_probe_error' [-Wmissing-prototypes]
drivers/gpu/drm/xe/xe_mmio.c:128:23: warning: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
drivers/gpu/drm/xe/xe_mmio.c:295:31: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
drivers/gpu/drm/xe/xe_tile_sysfs.c:29:35: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
include/drm/drm_print.h:456:39: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
include/trace/../../drivers/gpu/drm/xe/xe_trace.h:34:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Unverified Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included more than once.
drivers/gpu/drm/xe/xe_module.c: xe_module.h is included more than once.

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-001-20231124
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arc-randconfig-002-20231124
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- arch-arc-kernel-kprobes.c:warning:no-previous-prototype-for-arc_kprobe_handler
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-wpcm450_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- csky-randconfig-001-20231124
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
|-- csky-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- i386-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-011-20231124
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
|-- i386-randconfig-012-20231124
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
|-- i386-randconfig-013-20231124
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
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-randconfig-014-20231124
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
|-- i386-randconfig-015-20231124
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-randconfig-016-20231124
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- loongarch-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- mips-db1xxx_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- mips-rt305x_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- nios2-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-randconfig-002-20231124
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- openrisc-alldefconfig
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
|-- parisc-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-bamboo_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-chrp32_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-mpc837x_rdb_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- riscv-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
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
|-- s390-randconfig-002-20231124
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
|-- sh-edosk7705_defconfig
|   |-- arch-sh-boot-compressed-cache.c:warning:no-previous-prototype-for-cache_control
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_alloc
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_ctor
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_free
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-kfr2r09_defconfig
|   |-- arch-sh-boot-compressed-cache.c:warning:no-previous-prototype-for-cache_control
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_raise
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_rounding_mode
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh4.c:warning:no-previous-prototype-for-sh4_cache_init
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-end-set-but-not-used
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-start-set-but-not-used
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
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-randconfig-001-20231124
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
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
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-ctrlr-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-d-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intsize-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-intspec-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_hwirq-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:Function-parameter-or-member-out_type-not-described-in-intc_evt_xlate
|   |-- drivers-sh-intc-irqdomain.c:warning:expecting-prototype-for-intc_irq_domain_evt_xlate().-Prototype-was-for-intc_evt_xlate()-instead
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-randconfig-002-20231124
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
|-- sh-rts7751r2d1_defconfig
|   |-- arch-sh-boot-compressed-cache.c:warning:no-previous-prototype-for-cache_control
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_raise
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_rounding_mode
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
|   |-- arch-sh-kernel-traps_32.c:warning:no-previous-prototype-for-per_cpu_trap_init
|   |-- arch-sh-mm-cache-sh4.c:warning:no-previous-prototype-for-sh4_cache_init
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-end-set-but-not-used
|   |-- arch-sh-mm-cache-sh4.c:warning:variable-start-set-but-not-used
|   |-- arch-sh-mm-flush-sh4.c:warning:no-previous-prototype-for-sh4__flush_region_init
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_alloc
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_ctor
|   |-- arch-sh-mm-pgtable.c:warning:no-previous-prototype-for-pgd_free
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
|-- sparc-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-001-20231124
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- x86_64-allnoconfig
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_max_interval-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-i915-display-intel_fb.c:intel_frontbuffer.h-is-included-more-than-once.
|   `-- drivers-gpu-drm-xe-xe_module.c:xe_module.h-is-included-more-than-once.
|-- x86_64-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-001-20231124
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-002-20231124
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
|-- x86_64-randconfig-003-20231124
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
|-- x86_64-randconfig-004-20231124
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
|-- x86_64-randconfig-005-20231124
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
|-- x86_64-randconfig-006-20231124
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
`-- xtensa-randconfig-001-20231124
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
|-- arm-omap1_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-clk-clk-asm9260.c:warning:variable-hw-set-but-not-used
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- arm-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-randconfig-003-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-randconfig-004-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-s5pv210_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- arm64-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-001-20231124
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arm64-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-003-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|-- arm64-randconfig-004-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- hexagon-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- hexagon-randconfig-002-20231124
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
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
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_fill_info
|   |-- drivers-gpu-drm-xe-xe_mmio.c:warning:format-specifies-type-unsigned-long-long-but-the-argument-has-type-resource_size_t-(aka-unsigned-int-)
|   |-- drivers-gpu-drm-xe-xe_mmio.c:warning:result-of-comparison-of-constant-with-expression-of-type-resource_size_t-(aka-unsigned-int-)-is-always-false
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-specifies-type-unsigned-long-long-but-the-argument-has-type-resource_size_t-(aka-unsigned-int-)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-allnoconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
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
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_fill_info
|   |-- drivers-gpu-drm-xe-xe_mmio.c:warning:format-specifies-type-unsigned-long-long-but-the-argument-has-type-resource_size_t-(aka-unsigned-int-)
|   |-- drivers-gpu-drm-xe-xe_mmio.c:warning:result-of-comparison-of-constant-with-expression-of-type-resource_size_t-(aka-unsigned-int-)-is-always-false
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-specifies-type-unsigned-long-long-but-the-argument-has-type-resource_size_t-(aka-unsigned-int-)
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-randconfig-141-20231124
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
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- mips-maltaup_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   `-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|-- powerpc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-katmai_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- powerpc-mpc8313_rdb_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- powerpc-mpc836x_rdk_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- powerpc-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc-randconfig-003-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc64-randconfig-001-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- powerpc64-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- powerpc64-randconfig-003-20231124
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-randconfig-002-20231124
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- riscv-rv32_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|-- um-randconfig-001-20231124
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
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-__switch_mm
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-wait_stub_done
|   |-- arch-um-os-Linux-start_up.c:warning:no-previous-prototype-for-function-parse_iomem
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-is_syscall
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-peek_user
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-poke_user
|   |-- arch-x86-um-shared-sysdep-kernel-offsets.h:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-signal.c:warning:no-previous-prototype-for-function-sys_rt_sigreturn
|   |-- arch-x86-um-syscalls_64.c:warning:no-previous-prototype-for-function-arch_switch_to
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_clock_gettime
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_getcpu
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_gettimeofday
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_time
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:init-main.o:warning:relocation-in-read-only-section-ref.text
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:creating-DT_TEXTREL-in-a-PIE
|-- um-randconfig-002-20231124
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
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-__switch_mm
|   |-- arch-um-os-Linux-skas-process.c:warning:no-previous-prototype-for-function-wait_stub_done
|   |-- arch-um-os-Linux-start_up.c:warning:no-previous-prototype-for-function-parse_iomem
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-is_syscall
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-peek_user
|   |-- arch-x86-um-ptrace_64.c:warning:no-previous-prototype-for-function-poke_user
|   |-- arch-x86-um-shared-sysdep-kernel-offsets.h:warning:no-previous-prototype-for-function-foo
|   |-- arch-x86-um-signal.c:warning:no-previous-prototype-for-function-sys_rt_sigreturn
|   |-- arch-x86-um-syscalls_64.c:warning:no-previous-prototype-for-function-arch_switch_to
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_clock_gettime
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_getcpu
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_gettimeofday
|   |-- arch-x86-um-vdso-um_vdso.c:warning:no-previous-prototype-for-function-__vdso_time
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-input-mouse-synaptics.c:warning:unused-variable-smbus_pnp_ids
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:init-main.o:warning:relocation-in-read-only-section-ref.text
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:creating-DT_TEXTREL-in-a-PIE
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
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_alloc
|   |-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c:warning:no-previous-prototype-for-function-intel_fbdev_fb_fill_info
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- x86_64-randconfig-161-20231124
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
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

elapsed time: 1455m

configs tested: 113
configs skipped: 0

tested configs:
arc                   randconfig-001-20231124   gcc  
arc                   randconfig-002-20231124   gcc  
arm                           omap1_defconfig   clang
arm                   randconfig-001-20231124   clang
arm                   randconfig-002-20231124   clang
arm                   randconfig-003-20231124   clang
arm                   randconfig-004-20231124   clang
arm                         s5pv210_defconfig   clang
arm                         wpcm450_defconfig   gcc  
arm64                 randconfig-001-20231124   clang
arm64                 randconfig-002-20231124   clang
arm64                 randconfig-003-20231124   clang
arm64                 randconfig-004-20231124   clang
csky                  randconfig-001-20231124   gcc  
csky                  randconfig-002-20231124   gcc  
hexagon               randconfig-001-20231124   clang
hexagon               randconfig-002-20231124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231124   clang
i386         buildonly-randconfig-002-20231124   clang
i386         buildonly-randconfig-003-20231124   clang
i386         buildonly-randconfig-004-20231124   clang
i386         buildonly-randconfig-005-20231124   clang
i386         buildonly-randconfig-006-20231124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231124   clang
i386                  randconfig-002-20231124   clang
i386                  randconfig-003-20231124   clang
i386                  randconfig-004-20231124   clang
i386                  randconfig-005-20231124   clang
i386                  randconfig-006-20231124   clang
i386                  randconfig-011-20231124   gcc  
i386                  randconfig-012-20231124   gcc  
i386                  randconfig-013-20231124   gcc  
i386                  randconfig-014-20231124   gcc  
i386                  randconfig-015-20231124   gcc  
i386                  randconfig-016-20231124   gcc  
loongarch             randconfig-001-20231124   gcc  
loongarch             randconfig-002-20231124   gcc  
mips                         db1xxx_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                 randconfig-001-20231124   gcc  
nios2                 randconfig-002-20231124   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231124   gcc  
parisc                randconfig-002-20231124   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc               randconfig-001-20231124   clang
powerpc               randconfig-002-20231124   clang
powerpc               randconfig-003-20231124   clang
powerpc64             randconfig-001-20231124   clang
powerpc64             randconfig-002-20231124   clang
powerpc64             randconfig-003-20231124   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231124   clang
riscv                 randconfig-002-20231124   clang
riscv                          rv32_defconfig   clang
s390                  randconfig-001-20231124   gcc  
s390                  randconfig-002-20231124   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20231124   gcc  
sh                    randconfig-002-20231124   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sparc64               randconfig-001-20231124   gcc  
sparc64               randconfig-002-20231124   gcc  
um                    randconfig-001-20231124   clang
um                    randconfig-002-20231124   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231124   clang
x86_64       buildonly-randconfig-002-20231124   clang
x86_64       buildonly-randconfig-003-20231124   clang
x86_64       buildonly-randconfig-004-20231124   clang
x86_64       buildonly-randconfig-005-20231124   clang
x86_64       buildonly-randconfig-006-20231124   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231124   gcc  
x86_64                randconfig-002-20231124   gcc  
x86_64                randconfig-003-20231124   gcc  
x86_64                randconfig-004-20231124   gcc  
x86_64                randconfig-005-20231124   gcc  
x86_64                randconfig-006-20231124   gcc  
x86_64                randconfig-011-20231124   clang
x86_64                randconfig-012-20231124   clang
x86_64                randconfig-013-20231124   clang
x86_64                randconfig-014-20231124   clang
x86_64                randconfig-015-20231124   clang
x86_64                randconfig-016-20231124   clang
x86_64                randconfig-071-20231124   clang
x86_64                randconfig-072-20231124   clang
x86_64                randconfig-073-20231124   clang
x86_64                randconfig-074-20231124   clang
x86_64                randconfig-075-20231124   clang
x86_64                randconfig-076-20231124   clang
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231124   gcc  
xtensa                randconfig-002-20231124   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
