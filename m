Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57EDCCD19E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E96C10E903;
	Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHjLcE/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471210E901
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=85Ikw3g4Riy5ARHJ6HlLmUMVY99DBVBD91gWF49AeGs=;
 b=dHjLcE/nKw+/88Dan/9RS+WmmWBlIGjBOrGwiDAwWPsRL091NltPYFI9
 Yxlyu5UHHd1NhaC21kxISJeUZYdIYCveScpnzlvBAXy0abkkgi6OKXyU2
 iiFgpGVKtUMPeRI0GayzmOJN3DUX2PX/4jfMXVYEC8xBHnUjkPKxDV5k4
 RsnjwgJzVdcr/Hs5I2Yv/XOgeKUuPrW9M5XBnDbWAfWn4eT8dAIGAGo1w
 WlkIkCgMeqIvwC2J3Hv2Z37aUiz20inHWCSBbaznX2gAoayFGX4hO3lsM
 wXv/E9QK5gMzUUYgdesSxWLPn7OtHcNqkWrYMSoImNC9LMGrzgQBrKsWh A==;
X-CSE-ConnectionGUID: bBcdBfdVS7OR9EcFj+M6CA==
X-CSE-MsgGUID: oc/35b5pR/Ch5CiPpU6TRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794059"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: kbKgYoZVTrCJfuCiYteXew==
X-CSE-MsgGUID: Nf/qo6I7TlOnb9BugFV+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298303"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 14/22] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
Date: Wed, 15 Oct 2025 15:06:29 -0700
Message-ID: <20251015-xe3p-v2-14-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Add support for graphics IP Xe3p_XPC having IP version 35.11.

Bspec: 77979, 77975
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d836fd8e187a6..b4e0e16ad558d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -106,6 +106,13 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe3p_xpc = {
+	XE2_GFX_FEATURES,
+	.hw_engine_mask =
+		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
+		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+};
+
 static const struct xe_media_desc media_xem = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
@@ -138,6 +145,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3003, "Xe3_LPG", &graphics_xe2 },
 	{ 3004, "Xe3_LPG", &graphics_xe2 },
 	{ 3005, "Xe3_LPG", &graphics_xe2 },
+	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
 };
 
 /* Pre-GMDID Media IPs */

-- 
2.51.0

