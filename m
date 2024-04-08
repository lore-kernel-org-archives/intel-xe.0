Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE9CCD1299
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B0112776;
	Mon,  8 Apr 2024 16:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUMMrMvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D88112772
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593741; x=1744129741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XPwr/rc1yu0i8HIPehhijaxzL7/+oi+tnhW1Ww1eAQ=;
 b=VUMMrMvNJHBO+Ebvr1ZPuD9Ejf/qgIvkha/ocrkDsaJuGvSoWtjUzK1x
 No9YRWk3RaPM7x57FryJapKvlqNtQTeSbpvJbGXozsZAaK1TrnxcZuJwZ
 0G4j52z9aAOAAM4ROaMlX5Cn4fznIgq/Pf7+lOl2tPdwNTBeFZqKVa/Tj
 d6Dt36OWkly/sGEt2FDdN9xXhY6BfCVx87/pEQgBpKi0NMujfQyP9Cb2l
 zEoplEtVALH33VQd2iUzNIYPa4T9z6tszWfizl/S8B0AjPTLwRQMAuv9U
 P/YzA2ryNTgUw0LocbvT8cyY01cnW0F9sPgZe7CJfWS/yfUPIiudPV3+v g==;
X-CSE-ConnectionGUID: XX5I4ZYBTZ+QIzHoj7eflg==
X-CSE-MsgGUID: vGEixDsQSR2EFXEcUq1riA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024941"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:01 -0700
X-CSE-ConnectionGUID: UGz3tknMS468dwm4+LTVMA==
X-CSE-MsgGUID: OgvvEMgqRaapFIi3OkfPhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683341"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:28:58 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 01/11] drm/xe/xe2: Recognize Xe2_HPG IP
Date: Mon,  8 Apr 2024 21:58:59 +0530
Message-Id: <20240408162916.3767771-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

