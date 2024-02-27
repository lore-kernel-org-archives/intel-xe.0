Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F21C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 06:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1535E10E871;
	Tue, 27 Feb 2024 06:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jdn48pFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09A10E107;
 Tue, 27 Feb 2024 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709015766; x=1740551766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wm2IeWsqWrB4ahIZakVkmmGYLPIb8c+hTWMPeGaOSP0=;
 b=Jdn48pFEL6zq5W13kiSYarZlheiaNjm42/ctkabXhyT13xvaE20Uoewx
 sxYil2WpAz++o/HKFO63nuOJ2d1PORLINlVW2WXVrikboipf1ZEboTY6w
 tFXp0TvDr0yb5CnkepwZXaz6TEy/kouBsdJC1fhIT2kZkuhVk4uFer3Ih
 5jaUgSwjkxvb8FkKWZp5w3CV2wPoPGHOK3idnnEtpoc+F0GaFhqpESekf
 xzCHVHVu6c4jFG/cCxSzzqd+C/dJf9rFALMZeQ+gRBtnfk+k4YuQIavhU
 LHkmhBro53fZjknP2kxRTd1c7996bchsrlll0lgPdlwni6ZsgaQEPQbYV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14781596"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="14781596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 22:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7140868"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 22:35:25 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/4] drm/i915/hdcp: Move intel_hdcp_gsc_message def away from
 header file
Date: Tue, 27 Feb 2024 12:03:31 +0530
Message-ID: <20240227063330.1775323-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227053204.1748920-2-suraj.kandpal@intel.com>
References: <20240227053204.1748920-2-suraj.kandpal@intel.com>
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

Move intel_hdcp_gsc_message definition into intel_hdcp_gsc.c
so that intel_hdcp_gsc_message can be redefined for xe as needed.

--v2
-Correct commit message to reflect what patch is actually doing [Arun]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h | 7 +------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 302bff75b06c..35823e1f65d6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -13,6 +13,12 @@
 #include "intel_hdcp_gsc.h"
 #include "intel_hdcp_gsc_message.h"
 
+struct intel_hdcp_gsc_message {
+	struct i915_vma *vma;
+	void *hdcp_cmd_in;
+	void *hdcp_cmd_out;
+};
+
 bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915)
 {
 	return DISPLAY_VER(i915) >= 14;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
index eba2057c5a9e..5f610df61cc9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
@@ -10,12 +10,7 @@
 #include <linux/types.h>
 
 struct drm_i915_private;
-
-struct intel_hdcp_gsc_message {
-	struct i915_vma *vma;
-	void *hdcp_cmd_in;
-	void *hdcp_cmd_out;
-};
+struct intel_hdcp_gsc_message;
 
 bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915);
 ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_in,
-- 
2.43.2

