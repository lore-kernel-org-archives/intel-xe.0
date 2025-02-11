Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD66AC021A7
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 10:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5B310E65C;
	Tue, 11 Feb 2025 10:49:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BEB10E65B;
 Tue, 11 Feb 2025 10:49:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PMU_support_for_engine_ac?=
 =?utf-8?q?tivity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 10:49:11 -0000
Message-ID: <173927095135.864439.17961848771730919013@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211100952.322303-1-riana.tauro@intel.com>
In-Reply-To: <20250211100952.322303-1-riana.tauro@intel.com>
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

Series: PMU support for engine activity (rev2)
URL   : https://patchwork.freedesktop.org/series/144408/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc85c921545a2b5cf1b165c9fdcea27f7f9e7c6e
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Feb 11 15:39:50 2025 +0530

    drm/xe/pf: Enable per-function engine activity stats
    
    Enable per-function engine activity stats when VF's are enabled
    and disable when VF's are disabled
    
    v2: fix commit message
        remove reset stats from pf config (Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 27f9e4e3866556a4498e3b4ddebc27d4f6d0ae2f drm-intel
1ecc77b8d4b6 drm/xe: Add engine activity support
-:76: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#76: 
new file mode 100644

-:538: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#538: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 2 warnings, 0 checks, 491 lines checked
011eaf11fbda drm/xe/trace: Add trace for engine activity
-:66: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#66: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:83: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#83: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 84 lines checked
e798a36469d2 drm/xe/guc: Expose engine activity only for supported GuC version
7dfd55cd965b drm/xe/xe_pmu: Add PMU support for engine activity
-:299: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#299: FILE: drivers/gpu/drm/xe/xe_pmu.c:373:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                            ^

-:299: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#299: FILE: drivers/gpu/drm/xe/xe_pmu.c:373:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                                   ^

-:300: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#300: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                            ^

-:300: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#300: FILE: drivers/gpu/drm/xe/xe_pmu.c:374:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                                  ^

total: 0 errors, 0 warnings, 4 checks, 277 lines checked
44cf5249ce4e drm/xe/xe_pmu: Acquire forcewake on event init for engine events
bd3bb15d5290 drm/xe: Add support for per-function engine activity
66b16f519461 drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
bc85c921545a drm/xe/pf: Enable per-function engine activity stats


