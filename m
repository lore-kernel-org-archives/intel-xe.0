Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B171C02193
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 18:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C53E10E425;
	Fri, 31 Jan 2025 18:47:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7917910E42D;
 Fri, 31 Jan 2025 18:47:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Don=27t_try_?=
 =?utf-8?q?to_trigger_a_full_GT_reset_if_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 18:47:57 -0000
Message-ID: <173834927749.3259839.15141792181607163948@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131182502.852-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250131182502.852-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Don't try to trigger a full GT reset if VF
URL   : https://patchwork.freedesktop.org/series/144198/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fd354cf99eab3ac9e25ef08c3d5bebf9882d0278
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jan 31 19:25:02 2025 +0100

    drm/xe/vf: Don't try to trigger a full GT reset if VF
    
    VFs don't have access to the GDRST(0x941c) register that driver
    uses to reset a GT. Attempt to trigger a reset using debugfs:
    
     $ cat /sys/kernel/debug/dri/0000:00:02.1/gt0/force_reset
    
    or due to a hang condition detected by the driver leads to:
    
     [ ] xe 0000:00:02.1: [drm] GT0: trying reset from force_reset [xe]
     [ ] xe 0000:00:02.1: [drm] GT0: reset queued
     [ ] xe 0000:00:02.1: [drm] GT0: reset started
     [ ] ------------[ cut here ]------------
     [ ] xe 0000:00:02.1: [drm] GT0: VF is trying to write 0x1 to an inaccessible register 0x941c+0x0
     [ ] WARNING: CPU: 3 PID: 3069 at drivers/gpu/drm/xe/xe_gt_sriov_vf.c:996 xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
     [ ] RIP: 0010:xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
     [ ] Call Trace:
     [ ]  <TASK>
     [ ]  ? show_regs+0x6c/0x80
     [ ]  ? __warn+0x93/0x1c0
     [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
     [ ]  ? report_bug+0x182/0x1b0
     [ ]  ? handle_bug+0x6e/0xb0
     [ ]  ? exc_invalid_op+0x18/0x80
     [ ]  ? asm_exc_invalid_op+0x1b/0x20
     [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
     [ ]  ? xe_gt_sriov_vf_write32+0xc6/0x580 [xe]
     [ ]  ? xe_gt_tlb_invalidation_reset+0xef/0x110 [xe]
     [ ]  ? __mutex_unlock_slowpath+0x41/0x2e0
     [ ]  xe_mmio_write32+0x64/0x150 [xe]
     [ ]  do_gt_reset+0x2f/0xa0 [xe]
     [ ]  gt_reset_worker+0x14e/0x1e0 [xe]
     [ ]  process_one_work+0x21c/0x740
     [ ]  worker_thread+0x1db/0x3c0
    
    Fix that by sending H2G VF_RESET(0x5507) action instead.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4078
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a drm-intel
fd354cf99eab drm/xe/vf: Don't try to trigger a full GT reset if VF
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 [ ] xe 0000:00:02.1: [drm] GT0: VF is trying to write 0x1 to an inaccessible register 0x941c+0x0

-:104: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 45 lines checked


