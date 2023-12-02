Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4246C10DC1
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 15:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913F10E1FA;
	Sat,  2 Dec 2023 15:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6AD10E1FA
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701532698; x=1733068698;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=OEsIjclVQZhRDhlb5InlW1XiWeFsIQSOnWJhkISB2gQ=;
 b=epp+mzSXyU6cJOI9IueZwb4wXckixGyq9JglEvyUPM/3rVdeQ1wxrF70
 se4+CF7Ba3atw/fikQouYpnIsDu+gVMQwojf046RQLzmOPCV7+A69/pwK
 82gcNeDFmCThNm6s6njGywR8Q7mI4OGRrp3ZkMoZB9UWcXT/7d+f1kIIY
 0OMKxbAabMdKJTnhdkgB1VKq2K+vVVvVIiPTcDy/BV9uHBebjlWnm8IRF
 9a90zguizx6tMqEy+8rzMJ5FJ8LeUO+B9oBE9vVFTrkVuANmIezxdVlEN
 zc12uS8mTGZLzp2L7LLIzmZvh1GEqjDhzyjOsGW1yJ8zNHKPAbbgPxA8O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="479804681"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; d="scan'208";a="479804681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2023 07:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="913924319"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; d="scan'208";a="913924319"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 07:58:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r9SNh-0005Oc-1i;
 Sat, 02 Dec 2023 15:58:13 +0000
Date: Sat, 02 Dec 2023 23:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Jouni =?utf-8?Q?H=C3=B6gander"?= <jouni.hogander@intel.com>
Message-ID: <202312022306.7CGAT6A0-lkp@intel.com>
User-Agent: s-nail v14.9.24
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [Intel-xe] [drm-xe:drm-xe-next] BUILD REGRESSION
 38dc2e0d8c28a817f2c727402e2638f3ea2accb4
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
branch HEAD: 38dc2e0d8c28a817f2c727402e2638f3ea2accb4  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- arc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arc-axs103_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arc-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arc-randconfig-002-20231202
|   |-- arch-arc-kernel-disasm.c:warning:variable-ins_ptr-set-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-gemini_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- arm-pxa3xx_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- csky-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- i386-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-011-20231202
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-012-20231202
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- i386-randconfig-013-20231202
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
|-- i386-randconfig-014-20231202
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
|-- i386-randconfig-015-20231202
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
|-- i386-randconfig-016-20231202
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
|-- loongarch-allmodconfig
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
|-- loongarch-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- loongarch-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
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
|-- m68k-m5272c3_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-mvme147_defconfig
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
|-- nios2-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- nios2-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- openrisc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- openrisc-virt_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- parisc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_tile_sysfs.c:warning:format-llu-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- include-drm-drm_print.h:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-resource_size_t-aka-unsigned-int
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
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
|   |-- include-trace-..-..-drivers-gpu-drm-xe-xe_trace.h:warning:cast-from-pointer-to-integer-of-different-size
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- parisc-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- powerpc-asp8347_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-ep88xc_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-mgcoge_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-allyesconfig
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
|-- riscv-nommu_k210_sdcard_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- s390-allmodconfig
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
|-- s390-allyesconfig
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
|-- s390-randconfig-001-20231202
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|-- s390-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
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
|-- sh-apsh4ad0a_defconfig
|   |-- arch-sh-boot-compressed-cache.c:warning:no-previous-prototype-for-cache_control
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-arch_ftrace_ops_list_func
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-decompress_kernel
|   |-- arch-sh-boot-compressed-misc.c:warning:no-previous-prototype-for-ftrace_stub
|   |-- arch-sh-kernel-cpu-init.c:warning:no-previous-prototype-for-l2_cache_init
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_raise
|   |-- arch-sh-kernel-cpu-sh4-fpu.c:warning:no-previous-prototype-for-float_rounding_mode
|   |-- arch-sh-kernel-disassemble.c:warning:variable-lastsp-set-but-not-used
|   |-- arch-sh-kernel-hw_breakpoint.c:warning:no-previous-prototype-for-arch_bp_generic_fields
|   |-- arch-sh-kernel-machvec.c:warning:variable-mv_comma-set-but-not-used
|   |-- arch-sh-kernel-return_address.c:warning:no-previous-prototype-for-return_address
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
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-randconfig-001-20231202
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
|-- sh-randconfig-002-20231202
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
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sh-sh7763rdp_defconfig
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
|-- sparc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
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
|-- sparc-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-xe-display-ext-i915_utils.c:warning:no-previous-prototype-for-__i915_inject_probe_error
|   |-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
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
|   |-- drivers-gpu-drm-xe-xe_lrc.c:warning:CTX_VALID-redefined
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
|-- sparc64-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- sparc64-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   `-- stdin:warning:warning-syscall-clone3-not-implemented
|-- x86_64-allnoconfig
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-curr1_crit-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-energy1_input-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-in0_input-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_crit-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_max-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_max_interval-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- Warning:sys-devices-...-hwmon-hwmon-i-power1_rated_max-is-defined-times:.-Documentation-ABI-testing-sysfs-driver-intel-xe-hwmon-.-Documentation-ABI-testing-sysfs-driver-intel-i915-hwmon
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-gpu-drm-i915-display-intel_fb.c:intel_frontbuffer.h-is-included-more-than-once.
|-- x86_64-defconfig
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-001-20231202
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-002-20231202
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-003-20231202
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
|-- x86_64-randconfig-004-20231202
|   |-- arch-x86-lib-insn-eval.c:warning:Excess-function-parameter-regoff-description-in-get_eff_addr_sib
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- x86_64-randconfig-005-20231202
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
|-- x86_64-randconfig-006-20231202
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
|-- xtensa-audio_kc705_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
`-- xtensa-randconfig-002-20231202
    |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
    |-- include-linux-kern_levels.h:warning:s-directive-argument-is-null
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
    |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
    `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
clang_recent_errors
|-- arm-mvebu_v5_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm-randconfig-002-20231202
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm-randconfig-003-20231202
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- arm-randconfig-004-20231202
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- arm64-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|   |-- fs-smb-server-vfs.c:warning:Excess-function-parameter-attrs-description-in-ksmbd_vfs_getattr
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-p_id-not-described-in-ksmbd_vfs_fsync
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-path-not-described-in-ksmbd_vfs_remove_file
|   |-- fs-smb-server-vfs.c:warning:Function-parameter-or-member-work-not-described-in-ksmbd_vfs_link
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- arm64-randconfig-003-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-char-tpm-tpm_ftpm_tee.c:warning:expecting-prototype-for-ftpm_tee_shutdown().-Prototype-was-for-ftpm_plat_tee_shutdown()-instead
|-- arm64-randconfig-004-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- hexagon-allmodconfig
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
|-- hexagon-allyesconfig
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
|-- hexagon-randconfig-001-20231202
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- hexagon-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
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
|-- i386-randconfig-141-20231202
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
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- powerpc-mpc512x_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   `-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|-- powerpc-mpc834x_itxgp_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-randconfig-001-20231202
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-randconfig-003-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_add_fields
|   `-- kernel-trace-trace_kprobe.c:warning:Excess-function-parameter-args-description-in-__kprobe_event_gen_cmd_start
|-- powerpc64-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-bucket-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-outpos-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_to_leaf-not-described-in-crush_choose_indep
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-recurse_tries-not-described-in-crush_choose_indep
|   `-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
|-- powerpc64-randconfig-002-20231202
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc64-randconfig-003-20231202
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-nommu_virt_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- riscv-randconfig-001-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- riscv-randconfig-002-20231202
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   `-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|-- riscv-rv32_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
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
|-- um-allyesconfig
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
|   |-- fs-select.c:warning:stack-frame-size-()-exceeds-limit-()-in-core_sys_select
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- lib-maple_tree.c:warning:stack-frame-size-()-exceeds-limit-()-in-mas_wr_modify
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|-- um-randconfig-001-20231202
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
|   |-- include-asm-generic-io.h:warning:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior
|   |-- kernel-irq_work.c:warning:no-previous-prototype-for-function-arch_irq_work_raise
|   |-- mm-slub.c:warning:variable-partial_slabs-set-but-not-used
|   |-- net-ipv4-igmp.c:warning:variable-changerec-set-but-not-used
|   |-- usr-bin-ld:init-main.o:warning:relocation-in-read-only-section-ref.text
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms1-has-a-LOAD-segment-with-RWX-permissions
|   |-- usr-bin-ld:warning:.tmp_vmlinux.kallsyms2-has-a-LOAD-segment-with-RWX-permissions
|   `-- usr-bin-ld:warning:creating-DT_TEXTREL-in-a-PIE
|-- um-randconfig-002-20231202
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
|-- x86_64-randconfig-161-20231202
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
|   |-- net-ceph-crush-mapper.c:warning:Function-parameter-or-member-tries-not-described-in-crush_choose_indep
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

elapsed time: 1447m

configs tested: 140
configs skipped: 0

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                   randconfig-001-20231202   gcc  
arc                   randconfig-002-20231202   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231202   clang
arm                   randconfig-002-20231202   clang
arm                   randconfig-003-20231202   clang
arm                   randconfig-004-20231202   clang
arm64                            allmodconfig   clang
arm64                 randconfig-001-20231202   clang
arm64                 randconfig-002-20231202   clang
arm64                 randconfig-003-20231202   clang
arm64                 randconfig-004-20231202   clang
csky                             allmodconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20231202   gcc  
csky                  randconfig-002-20231202   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20231202   clang
hexagon               randconfig-002-20231202   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231202   clang
i386         buildonly-randconfig-002-20231202   clang
i386         buildonly-randconfig-003-20231202   clang
i386         buildonly-randconfig-004-20231202   clang
i386         buildonly-randconfig-005-20231202   clang
i386         buildonly-randconfig-006-20231202   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231202   clang
i386                  randconfig-002-20231202   clang
i386                  randconfig-003-20231202   clang
i386                  randconfig-004-20231202   clang
i386                  randconfig-005-20231202   clang
i386                  randconfig-006-20231202   clang
i386                  randconfig-011-20231202   gcc  
i386                  randconfig-012-20231202   gcc  
i386                  randconfig-013-20231202   gcc  
i386                  randconfig-014-20231202   gcc  
i386                  randconfig-015-20231202   gcc  
i386                  randconfig-016-20231202   gcc  
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20231202   gcc  
loongarch             randconfig-002-20231202   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231202   gcc  
nios2                 randconfig-002-20231202   gcc  
openrisc                         allyesconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231202   gcc  
parisc                randconfig-002-20231202   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20231202   clang
powerpc               randconfig-002-20231202   clang
powerpc               randconfig-003-20231202   clang
powerpc64             randconfig-001-20231202   clang
powerpc64             randconfig-002-20231202   clang
powerpc64             randconfig-003-20231202   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20231202   clang
riscv                 randconfig-002-20231202   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231202   gcc  
s390                  randconfig-002-20231202   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                    randconfig-001-20231202   gcc  
sh                    randconfig-002-20231202   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231202   gcc  
sparc64               randconfig-002-20231202   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231202   clang
um                    randconfig-002-20231202   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231202   clang
x86_64       buildonly-randconfig-002-20231202   clang
x86_64       buildonly-randconfig-003-20231202   clang
x86_64       buildonly-randconfig-004-20231202   clang
x86_64       buildonly-randconfig-005-20231202   clang
x86_64       buildonly-randconfig-006-20231202   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231202   gcc  
x86_64                randconfig-002-20231202   gcc  
x86_64                randconfig-003-20231202   gcc  
x86_64                randconfig-004-20231202   gcc  
x86_64                randconfig-005-20231202   gcc  
x86_64                randconfig-006-20231202   gcc  
x86_64                randconfig-011-20231202   clang
x86_64                randconfig-012-20231202   clang
x86_64                randconfig-013-20231202   clang
x86_64                randconfig-014-20231202   clang
x86_64                randconfig-015-20231202   clang
x86_64                randconfig-016-20231202   clang
x86_64                randconfig-071-20231202   clang
x86_64                randconfig-072-20231202   clang
x86_64                randconfig-073-20231202   clang
x86_64                randconfig-074-20231202   clang
x86_64                randconfig-075-20231202   clang
x86_64                randconfig-076-20231202   clang
x86_64                          rhel-8.3-rust   clang
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20231202   gcc  
xtensa                randconfig-002-20231202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
