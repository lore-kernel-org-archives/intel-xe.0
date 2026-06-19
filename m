Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A26ECDB466
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C9E10F556;
	Fri, 19 Jun 2026 11:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJFL59yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840BB10E08D;
 Fri, 19 Jun 2026 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869367; x=1813405367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KB20HugIkev5hCQXnL9GWISqBm9YDcNQgif+lzsSDSM=;
 b=GJFL59yp0K0uCgyQ2cNk7E8yWU7AxJ18eufm+7f6PGmFnc1jvb4pfxvo
 h7No1z1jEtq1koiJKJrQySZ4zpfbieNQDnoHbD974LboPtSe/L+xSrngV
 Wx/JXoeuQcLUW+wyiaJpc5rzan7VzS2PGbhvJsPkdBCO4pRmgjxCvF597
 o6h3VxPRPjMeqb3n68txhEtKQkLtlLVdo+tTIpdFay+Xiop4vZ2SwU0i2
 SM3RYmkVt3VohaqFAq8Ykxt9H/gILL+FUeqBxFGaAD0zO6AFJvCcjhMRu
 56M7mLdwlS3YGqKq4LmkYTLAa6VxS3G6eJMYXvJNS6xEHFK3IHS2m+JI9 g==;
X-CSE-ConnectionGUID: 1TSUoT2TQJeplrOTlQ0bcg==
X-CSE-MsgGUID: H6ceo01kRQuRgwBdcy3hbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229419"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:46 -0700
X-CSE-ConnectionGUID: tvVYq4bNT8uo5t4Cdt4djA==
X-CSE-MsgGUID: K6ZIawlhS92hYjSxb8HaxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286738214"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 04:42:45 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/4] drm/dp: Add max bpp delta computation constants
Date: Fri, 19 Jun 2026 17:09:04 +0530
Message-Id: <20260619113905.1413453-4-nemesa.garg@intel.com>
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

Define macros used for decoding DSC max bpp delta values
from the sink DPCD. This includes per-format masks for
RGB/YCbCr444 and YCbCr420, as well as definitions for delta
scaling and the YCbCr420 bit shift. Also add version_1 as
suffix to MAX_DELTA_BPP.

v2: Move constants under 0x6E register. [Ankit]
    Add mask for Native 422 also. [Ankit]
v3: Rename _DSC_NATIVE4222 to _DSC_NATIVE_YCbCr422. [Ankit]
v4: Move Version_1 edit ti patch_1. [Ankit]
    Add shift mask for native also. [sashiko]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 57e8143a1374..7154216e0aff 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -358,6 +358,10 @@
 # define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
 # define DP_DSC_NATIVE_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
 
+# define DP_DSC_BPP_DELTA_444			16
+# define DP_DSC_BPP_DELTA_420			12
+# define DP_DSC_BPP_DELTA_SHIFT_420		5
+
 #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
 # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
 # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
@@ -365,6 +369,9 @@
 # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
 # define DP_DSC_BITS_PER_PIXEL_1_1          0x4
 # define DP_DSC_BITS_PER_PIXEL_MASK         0x7
+# define DP_DSC_NATIVE_YCbCr422_MAX_BPP_DELTA_MASK  0x78
+# define DP_DSC_BPP_DELTA_NATIVE_SHIFT_422	3
+# define DP_DSC_BPP_DELTA_NATIVE_422		16
 
 #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
 # define DP_PSR_IS_SUPPORTED                1
-- 
2.25.1

