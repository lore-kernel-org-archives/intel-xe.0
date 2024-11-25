Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A0BD59D68
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 19:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5D10E717;
	Mon, 25 Nov 2024 19:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kB9lokTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AA210E6F8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732564131; x=1764100131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z/AyiM0yB32SL11tRl6FMchlgQNTSffo5BlDhnzPuHA=;
 b=kB9lokTLMfYJOuSaFXv4OI6z5Lc8Sa34na915Q6iD6GC+m6jlrPOb2J1
 WJs9ZcsJU+XTGYXmy529K04z+GTRdlZM53vsREPlmPcWRIUKAuJgJKzB6
 k//+Ds8feuhYJu5sk9uZw3NfoZXvFkD4czH/+8U9tVV1Gi7rBzjBow+Jy
 z8BaxE8EhYhs4PsbgUjREkEcFf+0HqdZaANTHM8Q+Y2OJnlmCRuzg2yiB
 t8c8zQpSp0MeRGnn4/WO/ErW+/S6lfx9lgkLxW66GSmrReyelyzk2zYJw
 n3Z2Mm291XwXaq7FzofmYBGR0m/ny4DogWYXWvl9tvpxibdz6j31v27jK Q==;
X-CSE-ConnectionGUID: nPwXREncRdyT8aQQtP1V2w==
X-CSE-MsgGUID: S3rGLeSWRHqhPaMND6MMNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43351458"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43351458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 11:48:51 -0800
X-CSE-ConnectionGUID: pY5WAbONR0uwANWB2Bjw2Q==
X-CSE-MsgGUID: AjjOkzR6QPmK9kET7sss2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91830954"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 11:48:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Update xe2_graphics name string
Date: Mon, 25 Nov 2024 11:48:39 -0800
Message-ID: <20241125194838.1190599-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.0
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

Since both Xe2 and Xe3 platforms currently use the same set of graphics
IP feature flags, we associate the "graphics_xe2" structure with both IPs.
Update the name string on that IP structure to clarify this and avoid
confusion as Xe3 platforms start going into public CI.

Fixes: 800d75bf20ae ("drm/xe/xe3: Define Xe3 feature flags")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b81e7d00a86..7d146e3e8e21 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -174,7 +174,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 
 static const struct xe_graphics_desc graphics_xe2 = {
-	.name = "Xe2_LPG / Xe2_HPG",
+	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
 
 	XE2_GFX_FEATURES,
 };
-- 
2.47.0

