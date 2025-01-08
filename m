Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A092AE77199
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 19:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5410E025;
	Wed,  8 Jan 2025 19:38:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B45D10E025;
 Wed,  8 Jan 2025 19:38:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 19:38:25 -0000
Message-ID: <173636510543.1387626.17264514550706451585@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev12)
URL   : https://patchwork.freedesktop.org/series/139121/
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
commit 5afc2486f55d55109cc9fb38ada69aad84655e30
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Jan 8 09:59:23 2025 -0800

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT frequency (actual and requested). This is
    a port from the i915 driver implementation, where an internal timer
    is used to aggregate GT frequencies over certain fixed interval.
    Following PMU events are being added-
    
      xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
    
    Standard perf commands can be used to monitor GT frequency-
      $ perf stat -e xe_0000_00_02.0/requested-frequency,gt_id=0/ -I1000
    
         1.001175175                700 M    xe/requested-frequency,gt_id=0/
         2.005891881                703 M    xe/requested-frequency,gt_id=0/
         3.007318169                700 M    xe/requested-frequency,gt_id=0/
    
    Actual/requested frequencies will be 0 when GT is suspended.
    
    v2: Checkpatch fix, moved timer code to this patch
    v3: Fix kunit issue
    v4: Checkpatch warning fixes
    v5: Make PMU events per device (Lucas)
    v6: Reuse bits from config mask for gt_id (Lucas)
    v7: Fix bug in pmu_enable (Riana)
    v8: Acquire pm runtime ref before pmu lock
    v9: Review comments (Rodrigo)
    v10: Use xe_pm_runtime_suspended (Riana) and review
    comments (Rodrigo)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 drm-intel
3b0f932c288b drm/xe/pmu: Enable PMU interface
-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 775 lines checked
5a830756808f drm/xe: Add locks in gtidle code
0f5be5662097 drm/xe/pmu: Add GT C6 events
5afc2486f55d drm/xe/pmu: Add GT frequency events


