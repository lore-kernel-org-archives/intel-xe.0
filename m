Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D05C02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E29610E369;
	Thu,  6 Feb 2025 10:41:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EF110E369;
 Thu,  6 Feb 2025 10:41:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PMU_support_for_engine_ac?=
 =?utf-8?q?tivity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 10:41:16 -0000
Message-ID: <173883847647.1970708.17160516953437456431@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206104358.3436519-1-riana.tauro@intel.com>
In-Reply-To: <20250206104358.3436519-1-riana.tauro@intel.com>
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

Series: PMU support for engine activity
URL   : https://patchwork.freedesktop.org/series/144408/
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
commit c16b474886df2075cc0d04da08ea4b97ae6cbf44
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Feb 6 16:13:57 2025 +0530

    drm/xe/pf: Enable per-function engine activity stats
    
    Enable per-function engine activity stats when
    sriov_numvfs are set and disable when sriov_numvfs
    are set to 0.
    
    Also restart engine stats when VF's are reprovisioned
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch cc0ddf9cae27ac39b4c0e69872e6a9412cb673f7 drm-intel
62056f6afe92 drm/xe: Add engine activity support
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

-:529: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#529: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 2 warnings, 0 checks, 487 lines checked
5b4369b3ef0d drm/xe/trace: Add trace for engine activity
-:67: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#67: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:84: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#84: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 84 lines checked
5bb2adadb86d drm/xe/guc: Expose engine activity only for supported GuC version
b6fd81e28a46 drm/xe/xe_pmu: Add PMU support for engine activity
-:298: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#298: FILE: drivers/gpu/drm/xe/xe_pmu.c:373:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                            ^

-:298: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#298: FILE: drivers/gpu/drm/xe/xe_pmu.c:373:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                                   ^

-:299: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#299: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                            ^

-:299: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#299: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                                  ^

total: 0 errors, 0 warnings, 4 checks, 277 lines checked
7280c5ab16c3 drm/xe/xe_pmu: Acquire forcewake on event init for engine events
b929c1e4ddca drm/xe: Add support for per-function engine activity
ae1f9ba4ef39 drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
c16b474886df drm/xe/pf: Enable per-function engine activity stats


