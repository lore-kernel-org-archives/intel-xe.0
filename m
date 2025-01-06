Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B9E77199
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 08:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288910E5AE;
	Mon,  6 Jan 2025 08:29:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936E110E5AE;
 Mon,  6 Jan 2025 08:29:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PMU_Support_for_per-engin?=
 =?utf-8?q?e-class_activity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 08:29:11 -0000
Message-ID: <173615215159.92255.7684511028612254969@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106075600.852080-1-riana.tauro@intel.com>
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
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

Series: PMU Support for per-engine-class activity
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
commit 5a64d5dce99f0fbf62ac5954077beb7e68229d6e
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jan 6 13:25:59 2025 +0530

    drm/xe/guc: Bump minimum required GuC version to v70.36.0
    
    The VF API version for this release is 1.17.1
    
    Bump the minimum required version to v70.36.0 to support
    engine activity.
    
    Suggested-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 03abdf4d5729aa0b6006be1933160754cc734b30 drm-intel
3213f10cdfa7 drm/xe/pmu: Enable PMU interface
-:118: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#118: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 775 lines checked
b5994a2e9c6a drm/xe: Add locks in gtidle code
97b0e5126035 drm/xe/pmu: Add GT C6 events
84c64020e1f7 drm/xe/pmu: Add GT frequency events
61578afc0d19 drm/xe/xe_pmu: add fixes for base PMU
99cdcdb48d1e drm/xe: Add per-engine-class activity support
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
Engine Active Ticks(engine-active-ticks) - number of active ticks for engine

-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

-:531: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#531: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 3 warnings, 0 checks, 492 lines checked
316c262de2a8 drm/xe/trace: Add trace for engine activity
-:64: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#64: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:109:
+	    TP_STRUCT__entry(

-:81: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#81: FILE: drivers/gpu/drm/xe/xe_trace_guc.h:126:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 84 lines checked
4e07126728b8 drm/xe/guc: Expose engine activity only for supported GuC version
f2e5095afd8f drm/xe/pmu: Add PMU support for per-engine-class activity
5a64d5dce99f drm/xe/guc: Bump minimum required GuC version to v70.36.0


