Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E8CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6499D1128C5;
	Mon,  8 Apr 2024 17:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PC3lxGa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CBE1128B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595927; x=1744131927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XPwr/rc1yu0i8HIPehhijaxzL7/+oi+tnhW1Ww1eAQ=;
 b=PC3lxGa43TxBLx0X3bgf49GCgnu71dn2fFrkZY30RILcVIrAUGBrjvcZ
 R8MbAbNL17XTooMEXiCtgA9ga4Y/2d1b1mUiBpwdUUAO2twHY55t103O3
 XQ1Cb5TBCFlEd2RywEgV4Y9hUt4LDN25YcA58g2rHHMVih1Q5GG+Ub++B
 8ObRoA2kXcErTYYHIQzGL5Apt2PY4Md3rfbYeB6O2Cl5AHLZ5G42BA3RH
 tYw+OWDcl9kibHJ96oncy+rlWd7oc+Ue1zz7f8erzj8qNTHdVdpBEovIE
 3Nf+kyKokZRwBFwT3TDNWj1QgXGIzYTcP/fL6RbtspNncoN/87Z7zUo9s Q==;
X-CSE-ConnectionGUID: 4qDllrnvR/+YBik299vbnw==
X-CSE-MsgGUID: mu1yy8WTSS2s/D7RhZtlaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679134"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:27 -0700
X-CSE-ConnectionGUID: aeTrvPgwQ8erOWweP2MdBQ==
X-CSE-MsgGUID: x+zhE8uTQNK+OjCvamU78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733839"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:25 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 01/11] drm/xe/xe2: Recognize Xe2_HPG IP
Date: Mon,  8 Apr 2024 22:35:35 +0530
Message-Id: <20240408170545.3769566-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe2_HPG uses the same general feature flags as Xe2_LPG.  Xe2_HPG is
identified as version 20.01 in the GMD_ID register.

Bspec: 68090
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c47ab4b67467..6fd0f4258ba2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -174,7 +174,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 
 static const struct xe_graphics_desc graphics_xe2 = {
-	.name = "Xe2_LPG",
+	.name = "Xe2_LPG / Xe2_HPG",
 
 	XE2_GFX_FEATURES,
 };
@@ -345,6 +345,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
+	{ 2001, &graphics_xe2 },
 	{ 2004, &graphics_xe2 },
 };
 
-- 
2.25.1

