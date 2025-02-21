Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24E1C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 11:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26010E2D7;
	Fri, 21 Feb 2025 11:26:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92510E2D7;
 Fri, 21 Feb 2025 11:26:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PMU_support_for_engine_ac?=
 =?utf-8?q?tivity_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 11:26:04 -0000
Message-ID: <174013716410.456819.15100919780634906046@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221105908.1966738-1-riana.tauro@intel.com>
In-Reply-To: <20250221105908.1966738-1-riana.tauro@intel.com>
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

Series: PMU support for engine activity (rev4)
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
commit e4eb39e531fa5f15a8f6f7f9e440d228cd020014
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Feb 21 16:29:07 2025 +0530

    drm/xe/xe_pmu: Acquire forcewake on event init for engine events
    
    When the engine events are created, acquire GT forcewake to read gpm
    timestamp required for the events and release on event destroy. This
    cannot be done during read due to the raw spinlock held my pmu.
    
    v2: remove forcewake counting (Umesh)
    v3: remove extra space (Umesh)
    v4: use event pmu private data (Lucas)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch a22ac320a08377d760e73fa530c27782f0b68b6d drm-intel
4798ee654a76 drm/xe: Add engine activity support
-:76: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#76: 
new file mode 100644

-:538: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#538: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 2 warnings, 0 checks, 491 lines checked
99ada07c8353 drm/xe/trace: Add trace for engine activity
-:66: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#66: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:83: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#83: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 84 lines checked
067b1c32eace drm/xe/guc: Expose engine activity only for supported GuC version
e4440f8a45d5 drm/xe/xe_pmu: Add PMU support for engine activity
-:275: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#275: FILE: drivers/gpu/drm/xe/xe_pmu.c:370:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                            ^

-:275: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#275: FILE: drivers/gpu/drm/xe/xe_pmu.c:370:
+XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
                                   ^

-:276: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#276: FILE: drivers/gpu/drm/xe/xe_pmu.c:371:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                            ^

-:276: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#276: FILE: drivers/gpu/drm/xe/xe_pmu.c:371:
+XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
                                  ^

total: 0 errors, 0 warnings, 4 checks, 252 lines checked
e4eb39e531fa drm/xe/xe_pmu: Acquire forcewake on event init for engine events


