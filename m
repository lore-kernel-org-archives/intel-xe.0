Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32161E7716A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Dec 2024 17:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651510E013;
	Sun, 15 Dec 2024 17:54:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB5010E013;
 Sun, 15 Dec 2024 17:54:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 15 Dec 2024 17:54:40 -0000
Message-ID: <173428528070.2940567.4456326556899881318@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241215174234.2857485-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241215174234.2857485-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev9)
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
commit 32bc97c92bd36df8f67197a2846efc2ec9e3540e
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Sun Dec 15 09:42:34 2024 -0800

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
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 drm-intel
cebcce9b640c drm/xe/pmu: Enable PMU interface
-:115: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#115: 
new file mode 100644

-:509: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#509: FILE: drivers/gpu/drm/xe/xe_pmu.c:390:
+			pmu_iter = add_pmu_attr(pmu_iter, str,
+							events[i].unit);

total: 0 errors, 1 warnings, 1 checks, 775 lines checked
225d9cd7cb56 drm/xe: Add locks in gtidle code
ba2754284b1e drm/xe/pmu: Add GT C6 events
32bc97c92bd3 drm/xe/pmu: Add GT frequency events


