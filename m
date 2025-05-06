Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA3C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 14:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF4E10E6C7;
	Tue,  6 May 2025 14:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqLRERJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E445C10E6C5;
 Tue,  6 May 2025 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746543441; x=1778079441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSHt/4U/9C2eh4xmwyJRp6iTJsfREhJsLFs8yR5q9F4=;
 b=DqLRERJo0SCtCNcHmK8rl9RjYTw7zBLLPXpPcXmq9DFCHMZmrTZy8yhn
 Te8oyY2oBoGiQqfPA5CFsJjLuX25F/70/ITTHg0/q5pswWmc83GDAvvWL
 dHDcIHEHB1SLAah1r4YQaq8rRFlQs1S++B8IQ+tfNX399/ZKlG7Sa6WDh
 KD4fj0Jv4oZUS/R2iGb42dia9KSGjfQjpwT/DWqJrvnkrCvLfjh5+pK1G
 i8dVaZBX6LcjT8dv+b8ZtD90HQQSjUuR9I8lqoqYO8MZEhCnspX1J9MmN
 8PBBw3rhTIK0jaXkJXT0Dj6+xFBj/gEexhdAlR23/N/H3f+vfKjDCHvqK g==;
X-CSE-ConnectionGUID: GMC8b8mkT2qOsv7HkP8wmg==
X-CSE-MsgGUID: NEq64R+jRMyZfMIbEWapDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59205986"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59205986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:57:21 -0700
X-CSE-ConnectionGUID: KG/FdoirRBCA+gFyWl49LA==
X-CSE-MsgGUID: 2IovjFqRSWKABKozDKljyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="166572154"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2025 07:57:19 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ville.syrjala@intel.com
Subject: [PATCH v4 04/17] drm/i915/display: Add pipe dmc registers and bits
 for DC Balance
Date: Tue,  6 May 2025 20:25:04 +0530
Message-ID: <20250506145517.4129419-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add pipe dmc registers and  access bits for DC Balance params
configuration and enablement.

--v2:
- Separate register definitions for transcoder and
pipe dmc. (Ankit)
- Use MMIO pipe macros instead of transcoder ones. (Ankit)
- Remove dev_priv use. (Jani, Nikula)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index e16ea3f16ed8..7c4bffce4cf5 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -117,4 +117,50 @@
 #define  DMC_WAKELOCK_CTL_REQ	 REG_BIT(31)
 #define  DMC_WAKELOCK_CTL_ACK	 REG_BIT(15)
 
+#define _PIPEDMC_DCB_CTL_A			0x5F1A0
+#define _PIPEDMC_DCB_CTL_B			0x5F5A0
+#define PIPEDMC_DCB_CTL(pipe)			_MMIO_PIPE((pipe), _PIPEDMC_DCB_CTL_A,\
+							   _PIPEDMC_DCB_CTL_B)
+#define PIPEDMC_ADAPTIVE_DCB_ENABLE		REG_BIT(31)
+
+#define _PIPEDMC_DCB_VBLANK_A			0x5F1BC
+#define _PIPEDMC_DCB_VBLANK_B			0x5F5BC
+#define PIPEDMC_DCB_VBLANK(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_DCB_VBLANK_A,\
+							   _PIPEDMC_DCB_VBLANK_B)
+
+#define _PIPEDMC_DCB_SLOPE_A			0x5F1B8
+#define _PIPEDMC_DCB_SLOPE_B			0x5F5B8
+#define PIPEDMC_DCB_SLOPE(pipe)			_MMIO_PIPE((pipe), _PIPEDMC_DCB_SLOPE_A,\
+							   _PIPEDMC_DCB_SLOPE_B)
+
+#define _PIPEDMC_DCB_GUARDBAND_A		0x5F1B4
+#define _PIPEDMC_DCB_GUARDBAND_B		0x5F5B4
+#define PIPEDMC_DCB_GUARDBAND(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_DCB_GUARDBAND_A,\
+							   _PIPEDMC_DCB_GUARDBAND_B)
+
+#define _PIPEDMC_DCB_MAX_INCREASE_A		0x5F1AC
+#define _PIPEDMC_DCB_MAX_INCREASE_B		0x5F5AC
+#define PIPEDMC_DCB_MAX_INCREASE(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_DCB_MAX_INCREASE_A,\
+							   _PIPEDMC_DCB_MAX_INCREASE_B)
+
+#define _PIPEDMC_DCB_MAX_DECREASE_A		0x5F1B0
+#define _PIPEDMC_DCB_MAX_DECREASE_B		0x5F5B0
+#define PIPEDMC_DCB_MAX_DECREASE(pipe)		_MMIO_PIPE((pipe), _PIPEDMC_DCB_MAX_DECREASE_A,\
+							   _PIPEDMC_DCB_MAX_DECREASE_B)
+
+#define _PIPEDMC_DCB_VMIN_A			0x5F1A4
+#define _PIPEDMC_DCB_VMIN_B			0x5F5A4
+#define PIPEDMC_DCB_VMIN(pipe)			_MMIO_PIPE((pipe), _PIPEDMC_DCB_VMIN_A,\
+							   _PIPEDMC_DCB_VMIN_B)
+
+#define _PIPEDMC_DCB_VMAX_A			0x5F1A8
+#define _PIPEDMC_DCB_VMAX_B			0x5F5A8
+#define PIPEDMC_DCB_VMAX(pipe)			_MMIO_PIPE((pipe), _PIPEDMC_DCB_VMAX_A,\
+							   _PIPEDMC_DCB_VMAX_B)
+
+#define _PIPEDMC_DCB_DEBUG_A			0x5f1c0
+#define _PIPEDMC_DCB_DEBUG_B			0x5f5c0
+#define PIPEDMC_DCB_DEBUG(pipe)			_MMIO_PIPE(pipe, _PIPEDMC_DCB_DEBUG_A,\
+							   _PIPEDMC_DCB_DEBUG_B)
+
 #endif /* __INTEL_DMC_REGS_H__ */
-- 
2.48.1

