Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91057CCD18D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237710E532;
	Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx/7NiaZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4110E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IK9V7AwwHJ95cxRAn4RIwIvFCmhkFxParrZxoUu/ZjQ=;
 b=Qx/7NiaZlp/aY+5FFFNZz9B7Ejcv7dWSiTvG8X6ENdt6OCh/Aqcsf9Xx
 IVH/rCfIreOvNpZRZWdhr5R5kAC8JqnNx4PM/r4YSMj5hVhw/0e9on82Y
 OKC607N6FMhhQ7DLAhxLP899Q/7t6AVRdxQMWKrAytU6iPL2kT1fi9pYB
 dBCXe1n9FFFZ9RIeBBlrYhDYBNACVq18en0FC4nVsOgi2RANX4p7HVOLd
 4fcgSbUvyIs2UOXFq5nNEo4tBfxwkx2bTbHGmXC68W3kSulcqj7w9TYJW
 FdzvndhYdiZA33D+5s5Sq18ZlZ1S7ZDFCqIMgZQCTtva9qnSuK+PYOlrY A==;
X-CSE-ConnectionGUID: bw23+YUoRkms/DlzKjEkIg==
X-CSE-MsgGUID: H58+Nyv5TFqRMZ0iLOqFTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414881"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414881"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: 4ewLUwg5S5y4RsVZ1dHF3Q==
X-CSE-MsgGUID: pyO5f7TaQQCUAkMDjXkNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567317"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
Date: Mon, 13 Oct 2025 20:24:49 -0700
Message-ID: <20251013-xe3p-v1-17-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index aa8359a4c5594..83e5e0c314a42 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -119,6 +119,15 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe3p_xpc = {
+	XE2_GFX_FEATURES,
+	.hw_engine_mask =
+		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
+		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.va_bits = 57,
+	.has_flat_ccs = false,
+};
+
 static const struct xe_media_desc media_xem = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
@@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3003, "Xe3_LPG", &graphics_xe2 },
 	{ 3004, "Xe3_LPG", &graphics_xe2 },
 	{ 3005, "Xe3_LPG", &graphics_xe2 },
+	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
 };
 
 /* Pre-GMDID Media IPs */

-- 
2.51.0

