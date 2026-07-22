Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322A7C44532
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 23:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667BF10E307;
	Wed, 22 Jul 2026 23:45:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6D10E307;
 Wed, 22 Jul 2026 23:45:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LNL=5FFLUSH=5F*_enhanceme?=
 =?utf-8?q?nts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 23:45:14 -0000
Message-ID: <178476391432.218011.18283861955797257365@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722215935.1369012-1-matthew.brost@intel.com>
In-Reply-To: <20260722215935.1369012-1-matthew.brost@intel.com>
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

Series: LNL_FLUSH_* enhancements
URL   : https://patchwork.freedesktop.org/series/170939/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89dd63e4a198e087671b347d7471084fc60f2e9b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 22 14:59:35 2026 -0700

    drm/xe: Add DRM_XE_DEBUG_FLUSH_WA to force the CPU flush workaround on
    
    Add a DRM_XE_DEBUG_FLUSH_WA debug Kconfig option, depending on
    DRM_XE_DEBUG, that unconditionally forces xe->info.needs_flush_wa on
    regardless of the detected host CPU. This lets driver developers
    exercise the LNL_FLUSH_WORKQUEUE()/xe_guc_ct_flush_g2h_worker() code
    paths (including the new best-effort scheduling-delay detection and
    warnings) on CPUs that aren't otherwise affected.
    
    Cc: Tales A. Mendonça <talesam@gmail.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-5
+ /mt/dim checkpatch aff95d2d4b516f1618e3fb1cdb5850b6e1b19bb9 drm-intel
2e593f65da22 drm/xe: Scope LNL_FLUSH_* workaround to affected CPUs, not GPU platform
-:45: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#45: 
Assisted-by: GitHub Copilot:claude-sonnet-5

-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

-:263: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#263: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:2025:
+	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL) {

-:273: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#273: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:2035:
+		xe_gt_warn(ct_to_gt(ct),
+			  "G2H worker woken w/o PM ref, dropping pending G2H\n");

-:309: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#309: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:2088:
+		xe_gt_warn(ct_to_gt(ct),
+			  "G2H worker not queued/running, CPU flush WA engaging\n");

total: 0 errors, 2 warnings, 3 checks, 331 lines checked
89dd63e4a198 drm/xe: Add DRM_XE_DEBUG_FLUSH_WA to force the CPU flush workaround on
-:19: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#19: 
Assisted-by: GitHub Copilot:claude-sonnet-5

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


