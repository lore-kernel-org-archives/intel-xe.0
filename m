Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B76FC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEB01128B9;
	Mon,  8 Apr 2024 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUSVdar+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC141128C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595929; x=1744131929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dN6Sp6uwKv0Hq81hJsP0iR3a0eIvWlEEYGtMI3wCkkk=;
 b=KUSVdar+TJTU+uvSrCW9uwXRJnjytUH0Xq0+XqufUsIOIyBYMbL4f39g
 oNynxAO0wd3apI7FwCcpY2fNP1xncj7N6nsjRI/R1c+X7ELIaVFDdQf3p
 Cv80NSUD7rkRkmHgqRMMzALw/sr4Jo5ce8miDVeMC60La3kfNuCqe9586
 ItuFU7mYbilSC26p8wF8WSRLLJqhy750DcRRyoICedpkUEVNMVSwdwmrA
 UZhRQ2vK/9HfjrOVkntW2FVCqpHFkUHqe++O107N5DQ/mcPlGdQT6bAsQ
 8piaI380vcOxoh1z1+BEQ/Jo6uhwRQmha2QBelPGbrtTQpwoEQxDNyJDJ A==;
X-CSE-ConnectionGUID: p2Xhj3EPTZimGsNR13vU6g==
X-CSE-MsgGUID: sN/l7zucRXCcIzFl6EfbWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679139"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:29 -0700
X-CSE-ConnectionGUID: mLVUB34xSjWSmpdJvpS8mA==
X-CSE-MsgGUID: B8+s9XMuQDKY6f3weB7zyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733842"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:27 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 02/11] drm/xe/xe2: Recognize Xe2_HPM IP
Date: Mon,  8 Apr 2024 22:35:36 +0530
Message-Id: <20240408170545.3769566-3-balasubramani.vivekanandan@intel.com>
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

