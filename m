Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB2DCD8CBE
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E83410E2AF;
	Tue,  9 Jun 2026 12:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAtkm2LS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EB810E280;
 Tue,  9 Jun 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006622; x=1812542622;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VmcQaHb6xA2nqfW1arTyx0g9HIoMIwFSdMLXUiXUWOs=;
 b=HAtkm2LSz94ZtWRMDaizvA/nxFesR3nsqHNrZ7AGf/Std08zAcpcHSrX
 gVBGVoEjNflYS6BPJqmQVLQzFCBZ+9oORYxMtgBnd9Zdul8YFnWQ/iBW4
 2E913r45dCvLbul0nwoQZFWMDVoQCO24NdxiYYOC87CfR+2N/hs1rIHki
 O/ZvqS0SQdql41oTC2gMxazDm5dCMw6c0Nh5J/RefddPQgLJHHy9oxgG8
 /rd2AEMossgBhwpV8yZhse4HTpHrWpFAeglfbzBhtKeeDWrD0znsmYxAh
 ZOnAQUvFgD9R5+T1ZLsIJubv180sTsWvkP03DSTNUZPTheCdERS+2cn+/ w==;
X-CSE-ConnectionGUID: tP+VWAJ3TRqIm8Tqyo2H4A==
X-CSE-MsgGUID: wCn2P65fS5yJZe6pE6qmCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340297"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:41 -0700
X-CSE-ConnectionGUID: IaAVOZNXSpyiOeExW6RouA==
X-CSE-MsgGUID: T8aPiLOZTiCYZQlU8TsU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988230"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:41 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 01/36] drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
Date: Tue,  9 Jun 2026 17:32:15 +0530
Message-ID: <20260609120250.867750-2-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Animesh Manna <animesh.manna@intel.com>

CMTG is supported on transcoder A and transcoder B with EDP,
so add a separate helper intel_cmtg_is_allowed() to check the
prerequisites for enabling CMTG. CMTG will be enabled only in
specific use cases such as PSR2, PR-ALPM, and LOBF, and will be
used in conjunction with the DC3CO feature. DC3co will be enabled
in a separate patch.

Note: Use-case-specific checks and transcoder-port compatibility
validation will be handled part of DC3co feature implementation.

v2:
- Remove separate flag for DC3co from crtc_state. [Uma, Dibin]

v3:
- Do not access power domain members directly. [Jani]

v4:
- Remove check for DC3co state now. if needed add Dc3co allow check
later once Dc3co patches are merged. [Uma]

Bspec: 68915
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 14 +++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index e1fdc6fe9762..a279f3dcd1ec 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/string_choices.h>
-#include <linux/types.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
@@ -16,6 +15,7 @@
 #include "intel_display_device.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
+#include "intel_display_types.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -185,3 +185,15 @@ void intel_cmtg_sanitize(struct intel_display *display)
 
 	intel_cmtg_disable(display, &cmtg_config);
 }
+
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
+	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
+		return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index ba62199adaa2..ed540581738f 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -6,8 +6,12 @@
 #ifndef __INTEL_CMTG_H__
 #define __INTEL_CMTG_H__
 
+#include <linux/types.h>
+
 struct intel_display;
+struct intel_crtc_state;
 
 void intel_cmtg_sanitize(struct intel_display *display);
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
-- 
2.43.0

