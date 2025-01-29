Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215EAC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 11:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE5410E7BA;
	Wed, 29 Jan 2025 11:39:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0DF10E7BA;
 Wed, 29 Jan 2025 11:39:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PMU_Support_for_per-engin?=
 =?utf-8?q?e-class_activity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 11:39:03 -0000
Message-ID: <173815074323.2353200.3984974915021714252@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129101653.1976699-1-riana.tauro@intel.com>
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
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

Series: PMU Support for per-engine-class activity (rev2)
URL   : https://patchwork.freedesktop.org/series/143138/
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
commit 242d060ad87b12b2a73e32f11093802d44542b0b
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Jan 29 15:46:51 2025 +0530

    drm/xe/pf: Enable per-function per-engine-class activity stats
    
    Enable per-function per-engine-class activity stats when
    sriov_numvfs are set and disable when sriov_numvfs
    are set to 0.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 683350734da38bc7332a3b87c9f2faf6bbeeb5a3 drm-intel
a22e3df22e12 drm/xe: Add per-engine-class activity support
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
Engine Active Ticks(engine-active-ticks) - number of active ticks for engine

-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

-:529: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#529: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 3 warnings, 0 checks, 487 lines checked
f88f555a0275 drm/xe/trace: Add trace for engine activity
-:67: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#67: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:84: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#84: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 84 lines checked
e93bf99b5dbb drm/xe/guc: Expose engine activity only for supported GuC version
124a70a5b15b drm/xe/xe_pmu: Add PMU support for per-engine-class activity
-:141: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#141: FILE: drivers/gpu/drm/xe/xe_pmu.c:78:
+#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS ^I0x03$

-:272: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#272: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                            ^

-:272: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#272: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                                   ^

-:273: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#273: FILE: drivers/gpu/drm/xe/xe_pmu.c:375:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                            ^

-:273: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#273: FILE: drivers/gpu/drm/xe/xe_pmu.c:375:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                                  ^

total: 0 errors, 1 warnings, 4 checks, 256 lines checked
3c262b0c3548 drm/xe/guc: Bump minimum required GuC version to v70.36.0
68eb772e5f75 drm/xe: Add support for per-function engine activity
b5de7ca45317 drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
242d060ad87b drm/xe/pf: Enable per-function per-engine-class activity stats


