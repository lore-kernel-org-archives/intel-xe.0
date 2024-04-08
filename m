Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C442CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68E112774;
	Mon,  8 Apr 2024 16:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP5A9Efd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5362112772
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593745; x=1744129745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dN6Sp6uwKv0Hq81hJsP0iR3a0eIvWlEEYGtMI3wCkkk=;
 b=ZP5A9EfdjgJq13iCp2vqpp0UFEXKz++hphmJeSsriKThpFO5/6Fg/cX1
 kSTqR0e2wuJPrdzcNhXlGu6i/bR3Ai9eZxAaiKqNo2Luezp8ZDbKqIKvi
 MqiaiXXNP3tF+/B2C2K6Ya5TQ3EjbN4POkFriLhofrA86dAKv+oAMOTzt
 mHt9XnQFMpAKEoxBr0Q/el/6C+bYm6TV+6Qw/WPC/T4n9RzDtlyWQVqdY
 9sGRIsCl3a7BWhnQy3gH/010wWzTvmr/NcH3xLwGzxXVZfDADfgihs15s
 6FNLMxom6Dcudk/OnTHcJ6WHjkBmtndalEKra0gnXWpdEAbcSyt5gqwit w==;
X-CSE-ConnectionGUID: ybAXimGMR0K1owWlPgUI9g==
X-CSE-MsgGUID: AMEOv2vkTjWq8vDUV6w4zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024944"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:05 -0700
X-CSE-ConnectionGUID: gJv1ADDuQMW9Rg29zkwELQ==
X-CSE-MsgGUID: Uu4JiJnIRuGCwIxhYYfzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683392"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:02 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 02/11] drm/xe/xe2: Recognize Xe2_HPM IP
Date: Mon,  8 Apr 2024 21:59:01 +0530
Message-Id: <20240408162916.3767771-5-balasubramani.vivekanandan@intel.com>
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

Xe2_HPM uses the same general feature flags as Xe2_LPM.  Xe2_HPM is
identified as version 13.01 in the GMD_ID register.

Bspec: 68090, 67163
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

