Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB81CD37B1
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 23:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B179510E62C;
	Tue,  3 Sep 2024 23:25:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C861410E62C;
 Tue,  3 Sep 2024 23:25:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Kill_missing_ou?=
 =?utf-8?q?ter_runtime_PM_protection_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 23:25:20 -0000
Message-ID: <172540592080.930845.5081235222421130377@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240903223822.380841-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Kill missing outer runtime PM protection warning
URL   : https://patchwork.freedesktop.org/series/138165/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 83d049cd62d55101afc78d2d19549f2c52137fe4
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Sep 3 18:38:22 2024 -0400

    drm/xe: Kill missing outer runtime PM protection warning
    
    This message was very useful to ensure that Xe was taking all
    the needed outer runtime pm references. However, at this point
    it is only a false positive. So, remove it.
    
    False positive cases:
    
    1:
    [184.983389] xe ...: [drm] Missing outer runtime PM protection
    [snip]
    [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
    [snip]
    [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
    
    In this case the underflow is the problem since we are sure that
    the ioctl is protected. But something else is abusing the 'put'
    calls.
    
    2:
    rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
    console:              xe_bo_evict_all (called from suspend)
    xe_sched_job_create:  dev=0000:03:00.0, ...
    xe_sched_job_exec:    dev=0000:03:00.0, ...
    xe_pm_runtime_put:    dev=0000:03:00.0, ...
    xe_sched_job_run:     dev=0000:03:00.0, ...
    rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
    rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
    rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
    console:              xe 0000:03:00.0: [drm] Missing outer runtime
                                                         PM protection
    console:               xe_guc_ct_send+0x15/0x50 [xe]
    console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
    [snip]
    console:               drm_sched_run_job_work+0x649/0xc20
    
    At this point, BOs are getting evicted from VRAM with rpm
    usage-counter = 2, but rpm status = SUSPENDING.
    The xe->pm_callback_task won't be equal 'current' because this call is
    coming from a work queue.
    
    So, pm_runtime_get_if_active() will be called and return 0 because rpm
    status != ACTIVE (but equal SUSPENDING).
    
    The only way out is to just grab the reference and move on.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e159ed9ab3ec08042286fb8af2560dbc540beccb drm-intel
83d049cd62d5 drm/xe: Kill missing outer runtime PM protection warning


