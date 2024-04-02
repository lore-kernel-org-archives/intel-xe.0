Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE802C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD1C10EEB8;
	Tue,  2 Apr 2024 12:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4+u5+d4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65E10FD11
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062042; x=1743598042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlJfbRZ1+KypGvOOjlLwr2PEOvm2CDBlDqsDGMIHWTQ=;
 b=V4+u5+d4/b23ob/4p0ri7mLMCKryIc1I/H7pA1aL3RKAgaKrM3KY9RML
 COUkdFBw13T8pvWxcjJZ0tTeWveK01M86i00NJeSSg3J+OKpb+Aith1sF
 WV1OhI3Rni/JTGhLF8aFN8X5MvvUAoOuwozrnhq+66MP57xS8Djv3o5Rp
 BrPpx5XOV3fMG8Jhjfe4M+NbLur8Fx7UtcqQ3VW7A+VY6ljy396pHC96+
 SKmvNn9nZIeY8VHvhsLwyH2LlsqXBi2sMNruz0S6FMivq7mdsUufQGxSj
 xiCuaSC/LgFQ3LbPg9HpGCuJ3uym3kWLXuLbOPKOGA+PyHi5XzKtOPVtC Q==;
X-CSE-ConnectionGUID: 9MaZAidRQkSHSouE2QDl1w==
X-CSE-MsgGUID: PrzFOdF+Slq50/XCZjz1kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098064"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:21 -0700
X-CSE-ConnectionGUID: W2QmP0k+TR6Oj45UD5V0gQ==
X-CSE-MsgGUID: r2Z/5opnT0i9gu/A6XLZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111161"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:20 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 01/11] drm/xe/xe2: Recognize Xe2_HPG IP
Date: Tue,  2 Apr 2024 18:17:14 +0530
Message-Id: <20240402124724.1238122-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
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

