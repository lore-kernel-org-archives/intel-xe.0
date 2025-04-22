Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3929FC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83510E391;
	Tue, 22 Apr 2025 19:00:19 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8D10E391;
 Tue, 22 Apr 2025 19:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_CFI_violati?=
 =?utf-8?q?on_when_accessing_sysfs_files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevaka Prabu Badrappan" <jeevaka.badrappan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 19:00:19 -0000
Message-ID: <174534841915.26875.16450710958439723607@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422171852.85558-1-jeevaka.badrappan@intel.com>
In-Reply-To: <20250422171852.85558-1-jeevaka.badrappan@intel.com>
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

Series: drm/xe: Fix CFI violation when accessing sysfs files
URL   : https://patchwork.freedesktop.org/series/148095/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcc3b1941dd8be7e1ba5622b848b568602c28516
Author: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Date:   Tue Apr 22 17:18:52 2025 +0000

    drm/xe: Fix CFI violation when accessing sysfs files
    
    When an attribute group is created with sysfs_create_group() or
    sysfs_create_files() the ->sysfs_ops() callback is set to
    kobj_sysfs_ops, which sets the ->show() callback to kobj_attr_show().
    kobj_attr_show() uses container_of() to get the ->show() callback
    from the attribute it was passed, meaning the ->show() callback needs
    to be the same type as the ->show() callback in 'struct kobj_attribute'.
    
    However, cur_freq_show() has the type of the ->show() callback in
    'struct device_attribute', which causes a CFI violation when opening the
    'id' sysfs node under gtidle/freq/throttle. This happens to work because
    the layout of 'struct kobj_attribute' and 'struct device_attribute' are
    the same, so the container_of() cast happens to allow the ->show()
    callback to still work.
    
    Changed the type of cur_freq_show() and few more functions to match the
    ->show() callback in 'struct kobj_attributes' to resolve the CFI
    violation.
    
    CFI failure seen while accessing sysfs files under
    /sys/class/drm/card0/device/tile0/gt*/gtidle/*
    /sys/class/drm/card0/device/tile0/gt*/freq0/*
    /sys/class/drm/card0/device/tile0/gt*/freq0/throttle/*
    
    [ 2599.618075] RIP: 0010:__cfi_cur_freq_show+0xd/0x10 [xe]
    [ 2599.624452] Code: 44 c1 44 89 fa e8 03 95 39 f2 48 98 5b 41 5e 41 5f 5d c3 c9
    [ 2599.646638] RSP: 0018:ffffbe438ead7d10 EFLAGS: 00010286
    [ 2599.652823] RAX: ffff9f7d8b3845d8 RBX: ffff9f7dee8c95d8 RCX: 0000000000000000
    [ 2599.661246] RDX: ffff9f7e6f439000 RSI: ffffffffc13ada30 RDI: ffff9f7d975d4b00
    [ 2599.669669] RBP: ffffbe438ead7d18 R08: 0000000000001000 R09: ffff9f7e6f439000
    [ 2599.678092] R10: 00000000e07304a6 R11: ffffffffc1241ca0 R12: ffffffffb4836ea0
    [ 2599.688435] R13: ffff9f7e45fb1180 R14: ffff9f7d975d4b00 R15: ffff9f7e6f439000
    [ 2599.696860] FS: 000076b02b66cfc0(0000) GS:ffff9f80ef400000(0000) knlGS:00000
    [ 2599.706412] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [ 2599.713196] CR2: 00005f80d94641a9 CR3: 00000001e44ec006 CR4: 0000000100f72ef0
    [ 2599.721618] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    [ 2599.730041] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
    [ 2599.738464] PKRU: 55555554
    [ 2599.741655] Call Trace:
    [ 2599.744541] <TASK>
    [ 2599.747017] ? __die_body+0x69/0xb0
    [ 2599.751151] ? die+0xa9/0xd0
    [ 2599.754548] ? do_trap+0x89/0x160
    [ 2599.758476] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
    [ 2599.768315] ? handle_invalid_op+0x69/0x90
    [ 2599.773167] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
    [ 2599.783010] ? exc_invalid_op+0x36/0x60
    [ 2599.787552] ? fred_hwexc+0x123/0x1a0
    [ 2599.791873] ? fred_entry_from_kernel+0x7b/0xd0
    [ 2599.797219] ? asm_fred_entrypoint_kernel+0x45/0x70
    [ 2599.802976] ? act_freq_show+0x70/0x70 [xe b37985c94829727668bd7c5b33c1d9998]
    [ 2599.812301] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
    [ 2599.822137] ? __kmalloc_node_noprof+0x1f3/0x420
    [ 2599.827594] ? __kvmalloc_node_noprof+0xcb/0x180
    [ 2599.833045] ? kobj_attr_show+0x22/0x40
    [ 2599.837571] sysfs_kf_seq_show+0xa8/0x110
    [ 2599.842302] kernfs_seq_show+0x38/0x50
    
    Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
+ /mt/dim checkpatch 2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402 drm-intel
fcc3b1941dd8 drm/xe: Fix CFI violation when accessing sysfs files
-:87: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#87: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:72:
 }
+static struct kobj_attribute attr_act_freq = __ATTR_RO(act_freq);

-:103: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#103: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:90:
 }
+static struct kobj_attribute attr_cur_freq = __ATTR_RO(cur_freq);

-:119: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#119: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:105:
 }
+static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);

-:135: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#135: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:120:
 }
+static struct kobj_attribute attr_rpe_freq = __ATTR_RO(rpe_freq);

-:151: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#151: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:135:
 }
+static struct kobj_attribute attr_rpa_freq = __ATTR_RO(rpa_freq);

-:164: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#164: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:145:
 }
+static struct kobj_attribute attr_rpn_freq = __ATTR_RO(rpn_freq);

-:193: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#193: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:184:
 }
+static struct kobj_attribute attr_min_freq = __ATTR_RW(min_freq);

-:222: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#222: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:223:
 }
+static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);

-:266: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#266: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:266:
 }
+static struct kobj_attribute name_attr = __ATTR_RO(name);

-:281: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#281: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:282:
 }
+static struct kobj_attribute idle_status_attr = __ATTR_RO(idle_status);

-:292: CHECK:LINE_SPACING: Please don't use multiple blank lines
#292: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:297:
 
+

-:305: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#305: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:312:
 }
+static struct kobj_attribute idle_residency_attr = __ATTR_RO(idle_residency_ms);

-:338: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#338: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:126:
 }
+static struct kobj_attribute attr_status = __ATTR_RO(status);

-:353: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#353: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:137:
 }
+static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);

-:368: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#368: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:148:
 }
+static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);

-:383: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#383: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:159:
 }
+static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);

-:398: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#398: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:170:
 }
+static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);

-:413: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#413: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:181:
 }
+static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);

-:428: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#428: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:192:
 }
+static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);

-:443: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#443: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:203:
 }
+static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);

-:458: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#458: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:214:
 }
+static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);

-:481: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 21 checks, 389 lines checked


