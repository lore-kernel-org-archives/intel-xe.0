Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E44107BCC6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502610E469;
	Fri, 13 Mar 2026 16:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3ROHcRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A175F10E46C;
 Fri, 13 Mar 2026 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417777; x=1804953777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ipjIwSaSCkgUDCxXsAr27fWfrWIbgjFsEU/V9qAe/II=;
 b=W3ROHcRcNzoBwB/7g4pWjQf01Uv2nKKOfQHwVSKhDW7ib9D/gXYcXaEq
 7z10E8HEDTmS+4bzsNH7O9T5T2zjshnw6tcaA2L1KI/9PKlykr17m2V+M
 rMkjsloZUxXHOWE+euaLe4NtGBdpGCwUub4BhdUhrD1VHB+v8YK+CaP5u
 2ol2i7JE66nQzYEQhP7PB19sRgENjC4JlbJ0y4Zj2fdKTsRUffEKwKhMf
 RHlXtjvZkpGinTjeTIqzbtyL9sY+ldbKthpqec+N2cPGkCKbon2sf6B3d
 MdHM1/f9Hf+dNu8He5fyMgGEpWPJeSo8EfLI3AjUhiedzIxjDbcTA52JE w==;
X-CSE-ConnectionGUID: 014cAfmbRuqovbwd42r4wg==
X-CSE-MsgGUID: zL3j/pTPTFm9gr4mUMvY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715307"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:02:57 -0700
X-CSE-ConnectionGUID: WMb8pbqdT4yyUlf0Clhqzg==
X-CSE-MsgGUID: aKkCyIGKTP+6BAUw60Q3CA==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:02:54 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 01/12] drm/i915/cmtg: add is_enable_allowed() for cmtg
Date: Fri, 13 Mar 2026 21:02:49 +0530
Message-Id: <20260313153300.3530695-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

Introduce a flag for DC3co. CMTG will be enabled only with DC3co
so add a separate function is_allowed() for cmtg. DC3co flag
will be enabled in a separate patch.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c          | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h          |  2 ++
 .../gpu/drm/i915/display/intel_display_device.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  4 ++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index e1fdc6fe9762..024d753eca55 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -16,6 +16,7 @@
 #include "intel_display_device.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
+#include "intel_display_types.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -185,3 +186,16 @@ void intel_cmtg_sanitize(struct intel_display *display)
 
 	intel_cmtg_disable(display, &cmtg_config);
 }
+
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
+	    HAS_DC3CO(display) && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
+	    crtc_state->dc3co.enable)
+		return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index ba62199adaa2..7692cc98cf87 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -7,7 +7,9 @@
 #define __INTEL_CMTG_H__
 
 struct intel_display;
+struct intel_crtc_state;
 
 void intel_cmtg_sanitize(struct intel_display *display);
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index e84c190dcc4f..35e06fcf794d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -189,6 +189,7 @@ struct intel_display_platforms {
 #define HAS_LRR(__display)		(DISPLAY_VER(__display) >= 12)
 #define HAS_LSPCON(__display)		(IS_DISPLAY_VER(__display, 9, 10))
 #define HAS_LT_PHY(__display)		((__display)->platform.novalake)
+#define HAS_DC3CO(__display)		((__display)->platform.novalake)
 #define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)
 #define HAS_MSO(__display)		(DISPLAY_VER(__display) >= 12)
 #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e189f8c39ccb..8a92ea4f1438 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1434,6 +1434,10 @@ struct intel_crtc_state {
 
 	/* to track changes in plane color blocks */
 	bool plane_color_changed;
+
+	struct {
+		bool enable;
+	} dc3co;
 };
 
 enum intel_pipe_crc_source {
-- 
2.29.0

