Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69ECD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E769C10F543;
	Fri, 19 Jun 2026 11:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFRIbukJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5EC10F543;
 Fri, 19 Jun 2026 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869361; x=1813405361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vIzbeQrtWE5qIRQSSEhX/A+ooyiPoznkmGkQUg9Ezds=;
 b=fFRIbukJOJYCJ6QTUHdvqNw47OOedg2fXC/xqbr6nu2ek3JODoAVMoC2
 5E5Tr/Sla4GoBnCfqG/sjAv7H5cnUHeye51P3p9HuYUosFHWOmZFd2XdK
 pTWQIak9wQM7M6ZNk55tdmlY2PsMperAY4C1+TN/tG0U2aXsiynSvCFh5
 we539Lo/qJDmTsPUIfYezVtjXXIJlp7ZJd3+0Dz7gB7+QUf/DdMTGdEty
 loHk5tnaqA3N8zYASWWDq2Rtja2St28MCCckI2XicIuUKgFaqIlsOmOrx
 6GaQ+MxYifE17C+4JqDv7r+zOG7Y1a6mSodYQX6OzRrRS9X8KFnRitcLW A==;
X-CSE-ConnectionGUID: pfBy1r+LTb+F2rb7no3s2g==
X-CSE-MsgGUID: T64P9FNARTCj+U7HAvKwWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229415"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:41 -0700
X-CSE-ConnectionGUID: kg5KmiSOTPmLFEzeT01XHA==
X-CSE-MsgGUID: fxRdFh5lSSalkTiRc5EgiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286738208"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 04:42:39 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/4] drm/dp: Add DP_DSC_MAX_BPP_DELTA register
Date: Fri, 19 Jun 2026 17:09:02 +0530
Message-Id: <20260619113905.1413453-2-nemesa.garg@intel.com>
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

The dsc max bpp delta masks were incorrectly placed
under the DP_DSC_BITS_PER_PIXEL_INC(0x06F) register.
Move these under correct DP_DSC_MAX_BPP_DELTA(0x06E)
register.

v2: Separate patch for correcting register. [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 829e4d98d61c..f34161078622 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -354,9 +354,11 @@
 # define DP_DSC_20_PER_DP_DSC_SINK          (1 << 1)
 # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
 
-#define DP_DSC_BITS_PER_PIXEL_INC           0x06F
+#define DP_DSC_MAX_BPP_DELTA_VERSION_1		0x06E
 # define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
 # define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
+
+#define DP_DSC_BITS_PER_PIXEL_INC           0x06F
 # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
 # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
 # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
-- 
2.25.1

