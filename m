Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B0C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF53610E356;
	Mon, 26 May 2025 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsjAYoOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119E310E34A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261141; x=1779797141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDxAY40fZG0hlx2yCC15l+Na+ZJjf1gGJMCSSGjMoLo=;
 b=TsjAYoOfI8Dp5r99Vvd7Zz9AKHxdAedRazurMwCz/My6J6C8Z2by1BwI
 RprDe7mIyv0yCAIito1L9Tb8Ar+m9RbFTh+luqp0lmmXZQeX+Zydl5UUP
 NbuTL0SZoKrJYJKYCVLF/nIFLMfLkzLrkN7oSvXUOadNUVzxOw2YxQ7Z6
 UTC8B+YNri9l9+KBVuzpFpoiw4hRrP37sLkSmU3AkTHWnhT2Z1UHWG84R
 I6m9Yz/6PBGxP9V8V7Evo+puGoKSw2iWtX2AqHrLvWJGy6onDShNb4ChT
 MmNoYaVQtA8HALuPfvtM4HmJsyomtlt1xhU1dLVjz0yLHp0gDyDiyHK8L A==;
X-CSE-ConnectionGUID: 1pp8U+9DSmOrilGQSUgjFw==
X-CSE-MsgGUID: R1oBpDp8QmeZVjbEhfrMCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492296"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:40 -0700
X-CSE-ConnectionGUID: Boet9m77QCeZFWLaHJWbqQ==
X-CSE-MsgGUID: I7XxuoG7Sjqz8h1GwpxxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576046"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 06/12] drm/i915/psr: Add interface to check if AUXLess ALPM
 is needed by PSR
Date: Mon, 26 May 2025 15:05:06 +0300
Message-ID: <20250526120512.1702815-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we spread ugly PSR details into ALPM code to check if AUXLess
ALPM is needed. Prepare to hide these details to PSR code by adding new
interface for checking if AUXLess ALPM is needed.

v2: remove kerneldoc comment

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 1072549649cd..38535e0d2496 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4246,3 +4246,9 @@ bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_sta
 	return intel_dp_is_edp(intel_dp) && (crtc_state->has_sel_update ||
 					     crtc_state->has_panel_replay);
 }
+
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state)
+{
+	return intel_dp_is_edp(intel_dp) && crtc_state->has_panel_replay;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 73c3fa40844b..0cf53184f13f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -77,5 +77,7 @@ int intel_psr_min_vblank_delay(const struct intel_crtc_state *crtc_state);
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.43.0

