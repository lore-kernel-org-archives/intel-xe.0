Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72762CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312D710F550;
	Fri, 19 Jun 2026 11:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ8sLTVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB62B10F550;
 Fri, 19 Jun 2026 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869365; x=1813405365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLdRSd2ZlQAIMxaFR53Jaxmtn+cZf9yUinQMYBtQbnc=;
 b=CZ8sLTVgJZVWRT1Auu1rYEL4Ie8Hj4+kIf7o16i9dN5lPNtWIj2maoAG
 feiXXUp2Be6KKQmdVeV9WFansx6w1hRYg6aOqljyXEk/YPbLzThV1hGxl
 L8sOy8oIPSLUxmTLCQSIxj7Kkrr8wA9xRy0CiDdApNCKX5O020Zxq3RK/
 qZRWDlAMSB9k1KzA6jiWQBoU4RwMWVqlkLbaPgXW7gwlrWOrNY/UKy2sL
 S3P+CEDDAgHIqizhlGPZuWHXHYoXrPLAnegflLE04Zx7kVYz8PnREFK+j
 jGefJCZy2m+goJTDQCsQtlXJDJdAh9gUB0Jk5vMUSPyfSd9GKg/Tsmala A==;
X-CSE-ConnectionGUID: o3JkiLtfTl6ZQu/lI80stA==
X-CSE-MsgGUID: OYFlCyK1T2iAt/62y6k0OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229416"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229416"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:45 -0700
X-CSE-ConnectionGUID: 4qqBC+PYTaSotdbn0Y70wg==
X-CSE-MsgGUID: 6CxQG45ySVSfytWJp+97LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286738211"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 04:42:43 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/4] drm/dp: Rename YCbCr420 bpp delta mask to native
Date: Fri, 19 Jun 2026 17:09:03 +0530
Message-Id: <20260619113905.1413453-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619113905.1413453-1-nemesa.garg@intel.com>
References: <20260619113905.1413453-1-nemesa.garg@intel.com>
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

Rename DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK to
DP_DSC_NATIVE_YCbCr420_MAX_BPP_DELTA_MASK to align with
the DP DSC specification, where the field represents the
native YCbCr 4:2:0 format.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index f34161078622..57e8143a1374 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -356,7 +356,7 @@
 
 #define DP_DSC_MAX_BPP_DELTA_VERSION_1		0x06E
 # define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
-# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
+# define DP_DSC_NATIVE_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
 
 #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
 # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
-- 
2.25.1

