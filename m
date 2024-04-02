Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E609ACD128D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8610EDA4;
	Tue,  2 Apr 2024 12:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VK6ZyJhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF310EDA4
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062043; x=1743598043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Al07i2H3JtC5HIqwl/qcu5GaD8+09tTM6RrdhRnmk+o=;
 b=VK6ZyJhQ9SKYTOUFXwChSQDfdpwiqnTpWSoF/nUWi5YofM45Rl6StCre
 eYo2aDJIE7ZYjCmb7vVqUBUr0yLESA6fviG/L2rF5OV8qF7JkSTdPiOW4
 4yQkpBsvNWMbUiCDWlHZHAH46plArLuHovI3dW/IPcNtU7BwhIUCVTFGD
 cgPrwCgpBKveVZ+rvQSIpz7c1j6ietQ9Z5Dt0+KsPrVhCI9UvAgvOtWWC
 a/X3oWKNNMmpfBjo/ezmBG3zoTtlquTZgbeC1ZN9M7q4mB77tdpYWx1co
 iLpPrkIhs83dLhM1d12hVVgg86DerXEZXZPPaAQf+gRVtYIRKMaHCJzs9 w==;
X-CSE-ConnectionGUID: c8p1wuXkQXuT7X0V6Vdt7w==
X-CSE-MsgGUID: vspkFPecQouHs0WZHWg8aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098067"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:23 -0700
X-CSE-ConnectionGUID: Ur7hL6foSVO8/veDbaAANw==
X-CSE-MsgGUID: nSTPinGHSw6+KGzLyojUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111168"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:22 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 02/11] drm/xe/xe2: Recognize Xe2_HPM IP
Date: Tue,  2 Apr 2024 18:17:15 +0530
Message-Id: <20240402124724.1238122-3-balasubramani.vivekanandan@intel.com>
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

Xe2_HPM uses the same general feature flags as Xe2_LPM.  Xe2_HPM is
identified as version 13.01 in the GMD_ID register.

Bspec: 68090, 67163
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6fd0f4258ba2..2d3b18d6404e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -207,7 +207,7 @@ static const struct xe_media_desc media_xelpmp = {
 };
 
 static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM",
+	.name = "Xe2_LPM / Xe2_HPM",
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
 };
@@ -352,6 +352,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 /* Map of GMD_ID values to media IP */
 static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
+	{ 1301, &media_xe2 },
 	{ 2000, &media_xe2 },
 };
 
-- 
2.25.1

