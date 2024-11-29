Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F5FD729E9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133BE10E503;
	Fri, 29 Nov 2024 15:40:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8818910E503;
 Fri, 29 Nov 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Flush_DMC_wakelock_releas?=
 =?utf-8?q?e_work_at_the_end_of_runtime_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 15:40:39 -0000
Message-ID: <173289483955.328974.15102229162932660093@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129151754.22015-1-gustavo.sousa@intel.com>
In-Reply-To: <20241129151754.22015-1-gustavo.sousa@intel.com>
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

Series: Flush DMC wakelock release work at the end of runtime suspend
URL   : https://patchwork.freedesktop.org/series/141931/
State : success

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
commit 99f82964f289a34ab3ab1867a9eefb7109497ba0
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Nov 29 12:17:46 2024 -0300

    drm/xe/display: Flush DMC wakelock release work on runtime suspend
    
    We currently are not calling display runtime suspend functions when
    D3cold is not allowed. Because of that, we endup not disabling dynamic
    DC states (and do not go to DC9). With dynamic DC states enabled, we
    will also have DMC wakelock enabled. Since we use a delayed work to
    release the DMC wakelock, the work might get executed a little too late
    (after the PCI device has been put to D3hot) and we get a timeout
    warning ("DMC wakelock release timed out") because the MMIO for
    releasing the wakelock will be invalid after that point.
    
    To fix that, make sure we flush the release work at the end of
    xe_display_pm_runtime_suspend_late(). We can do that unconditionally
    because, if there is no pending work, that turns into a no-op.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 108f610005f88de624c1a8c4f85d5cab9f530ddb drm-intel
71fd044ac240 drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
c788111562b4 drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
99f82964f289 drm/xe/display: Flush DMC wakelock release work on runtime suspend


