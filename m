Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779E1C05023
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3E1122C9;
	Mon, 15 Apr 2024 08:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkwh+h+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D5810F9E9;
 Mon, 15 Apr 2024 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713168841; x=1744704841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7MTGvd7sEhKpPbKVFZKujbDv6FDvpgsslWEY82JM0JI=;
 b=Wkwh+h+nygmbaTjMtX5ApwLpgOCBFrItncJ5XKcxaZf6C1dJ3SQs8XiP
 r77rRSH6od7nBcfl/+0MId9M9xItUymT6+eW3p+SPm2nQCv1BiEcKJBKk
 CsKIXNz1Qa2vLbE2rZX3p3OqhqDB4YT3TK+LaJSpaKzYik36RonSxP1RR
 vzlWRG8Sckz+kbYWC0VN6EM3qpxnjrQNQemc7aGg6Vz6VHjgZz5IZWW3i
 zlTiH/KRpfrsKmv1HG+poHJE/p+uhrF4rSjuTdLjFnMzQnOBprVB0h/oO
 fKpePuQ5Qo5AxXPxM8T6usjO4ynsTFnIJr5k7MKiTT6M2FjRQCwlCotOX g==;
X-CSE-ConnectionGUID: d6SEg2wsQBGwRh9ML/lvig==
X-CSE-MsgGUID: wmIBH+LIQIWdxplpUSuymA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9096323"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="9096323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:14:01 -0700
X-CSE-ConnectionGUID: 5hGmlEElQRGxAxtESDoM5A==
X-CSE-MsgGUID: T1JZgUtHScup1vwumaCY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26400136"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:13:59 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 02/21] drm/i915/display: Enable RM timeout detection
Date: Mon, 15 Apr 2024 13:44:04 +0530
Message-Id: <20240415081423.495834-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
References: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
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

From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Enable RM timeout interrupt to detect any hang during display engine
register access.
Current default timeout is 2ms.

v2:
* Modified the IP version check to apply on all versions starting from
  14
* Improved the print log

Bspec: 50110
CC: Suraj Kandpal <suraj.kandpal@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 10 ++++++++++
 drivers/gpu/drm/i915/i915_reg.h                  |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index c337e0597541..9c65e9e32fca 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -852,6 +852,13 @@ gen8_de_misc_irq_handler(struct drm_i915_private *dev_priv, u32 iir)
 {
 	bool found = false;
 
+	if (iir & GEN8_DE_RM_TIMEOUT) {
+		u32 val = intel_uncore_read(&dev_priv->uncore,
+				RMTIMEOUTREG_CAPTURE);
+		drm_warn(&dev_priv->drm, "Register access timeout for offset = 0x%x\n", val);
+		found = true;
+	}
+
 	if (DISPLAY_VER(dev_priv) >= 14) {
 		if (iir & (XELPDP_PMDEMAND_RSP |
 			   XELPDP_PMDEMAND_RSPTOUT_ERR)) {
@@ -1667,6 +1674,9 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 			de_port_masked |= DSI0_TE | DSI1_TE;
 	}
 
+	if (DISPLAY_VER(dev_priv) >= 14)
+		de_misc_masked |= GEN8_DE_RM_TIMEOUT;
+
 	de_pipe_enables = de_pipe_masked |
 		GEN8_PIPE_VBLANK |
 		gen8_de_pipe_underrun_mask(dev_priv) |
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3f34efcd7d6c..a8cdabd07b04 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4225,6 +4225,8 @@
 #define RM_TIMEOUT		_MMIO(0x42060)
 #define  MMIO_TIMEOUT_US(us)	((us) << 0)
 
+#define RMTIMEOUTREG_CAPTURE	_MMIO(0x420e0)
+
 /* interrupts */
 #define DE_MASTER_IRQ_CONTROL   (1 << 31)
 #define DE_SPRITEB_FLIP_DONE    (1 << 29)
@@ -4411,6 +4413,7 @@
 #define GEN8_DE_MISC_IMR _MMIO(0x44464)
 #define GEN8_DE_MISC_IIR _MMIO(0x44468)
 #define GEN8_DE_MISC_IER _MMIO(0x4446c)
+#define  GEN8_DE_RM_TIMEOUT		REG_BIT(29)
 #define  XELPDP_PMDEMAND_RSPTOUT_ERR	REG_BIT(27)
 #define  GEN8_DE_MISC_GSE		REG_BIT(27)
 #define  GEN8_DE_EDP_PSR		REG_BIT(19)
-- 
2.25.1

