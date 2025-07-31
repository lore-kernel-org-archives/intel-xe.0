Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB3BC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 10:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A8710E75C;
	Thu, 31 Jul 2025 10:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPKjYR4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497D210E75C;
 Thu, 31 Jul 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753956330; x=1785492330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cg6AzsTJsUcsr9WGB6go4byJh/GNsbyJM4cG3cEpuJw=;
 b=TPKjYR4BTmMsmEkKbGgg2qXFuJhayj6TfnpXblZlvmMbkU9thgJJl5wR
 Kbl+9xmwmqv9dY5o2a/VGMigdE3ULTuXMXaGzs2XaELWiNNV09rBK1DMi
 yOYhC2+Rs1hSXlDvyCmwI0MFI1T6CJsylvp6jPH8e7mBrcniw/cXaHbsO
 913KwfNZ0+wkuMj8A+iJySqgclfaalc6Nopmubh0UbuAW9hpG80vfaLOz
 3S/CsIC+RCXBin2rWnP0L6YKbpblRKFC4oFgDPU5Y5tY5YeHTB6cjrJKI
 Wh6bB7UTQr1ZIsq7eyRNLtySaNpC4cNOVlOPyCEb1vrcFVjRauaaXgNzx Q==;
X-CSE-ConnectionGUID: AlztznWFQlKpv+RLA0fMHw==
X-CSE-MsgGUID: rv6k5gXuT36kxUZd4kpkng==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="59922971"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="59922971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 03:05:30 -0700
X-CSE-ConnectionGUID: VgpzztSiQ/Oy2PTTP8IZWA==
X-CSE-MsgGUID: Ko2DxWNkQECL0t/wQ9uvaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="167456268"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 03:05:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 2/7] drm/i915/ddi: use intel_de_wait_custom() instead of
 wait_for_us()
Date: Thu, 31 Jul 2025 13:05:09 +0300
Message-Id: <232a554db6a327974c06f2491311b28f865467b9.1753956266.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1753956266.git.jani.nikula@intel.com>
References: <cover.1753956266.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Prefer the register read specific wait function over i915 wait_for_us().

v2: Wait for bits to clear in mtl_ddi_disable_d2d()

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 0405396c7750..866ed3e46664 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2561,6 +2561,7 @@ mtl_ddi_enable_d2d(struct intel_encoder *encoder)
 	enum port port = encoder->port;
 	i915_reg_t reg;
 	u32 set_bits, wait_bits;
+	int ret;
 
 	if (DISPLAY_VER(display) < 14)
 		return;
@@ -2576,7 +2577,11 @@ mtl_ddi_enable_d2d(struct intel_encoder *encoder)
 	}
 
 	intel_de_rmw(display, reg, 0, set_bits);
-	if (wait_for_us(intel_de_read(display, reg) & wait_bits, 100)) {
+
+	ret = intel_de_wait_custom(display, reg,
+				   wait_bits, wait_bits,
+				   100, 0, NULL);
+	if (ret) {
 		drm_err(display->drm, "Timeout waiting for D2D Link enable for DDI/PORT_BUF_CTL %c\n",
 			port_name(port));
 	}
@@ -3058,6 +3063,7 @@ mtl_ddi_disable_d2d(struct intel_encoder *encoder)
 	enum port port = encoder->port;
 	i915_reg_t reg;
 	u32 clr_bits, wait_bits;
+	int ret;
 
 	if (DISPLAY_VER(display) < 14)
 		return;
@@ -3073,7 +3079,11 @@ mtl_ddi_disable_d2d(struct intel_encoder *encoder)
 	}
 
 	intel_de_rmw(display, reg, clr_bits, 0);
-	if (wait_for_us(!(intel_de_read(display, reg) & wait_bits), 100))
+
+	ret = intel_de_wait_custom(display, reg,
+				   wait_bits, 0,
+				   100, 0, NULL);
+	if (ret)
 		drm_err(display->drm, "Timeout waiting for D2D Link disable for DDI/PORT_BUF_CTL %c\n",
 			port_name(port));
 }
-- 
2.39.5

