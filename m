Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABDBCF0433
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 03:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A4010E849;
	Thu, 10 Oct 2024 03:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXfwIcsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B5910E846
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728532149; x=1760068149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mx2Ftyy9Aabfa4Y7Uv9YUwIm/imAyqku5rfWXEv39hs=;
 b=lXfwIcsv1c0BQv3XvHRv2qyeeCHEiReSsYiPrDZaptrk3nHpUty9/PFF
 geRY5tJfXv3fdOUx5uA7+9xQaDfss/+Bz4JScrrpzMdJWUdW5uXbKzfGw
 tKaodAbB7bhT0BwO+opl2TjHGNW1RuOPqp8fMGi+CE14+6wmxxXSpBx7T
 eHU2PoA26VsxSFaA92o9KPfap5TlKYl0jmuYQCDv+77NI6sW+NqPhJDTq
 o61pDGuw2g0La9wcWowDpvOC+0dNaR7XZzImLLVXHOXq956MA4ljfrEqR
 LuNapna469ll33eB/zc45rZ7U09eR4iFDyHDx648ZM/xr391YxGe9LASG w==;
X-CSE-ConnectionGUID: NrMwu04WT+OiKs+Kqa+KNA==
X-CSE-MsgGUID: 4jXX2oYmSF6KO1EtkOZB1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39260300"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="39260300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:09 -0700
X-CSE-ConnectionGUID: 4UkWHi/6TF2sfTLezJK5Cg==
X-CSE-MsgGUID: iU3Ou6YcTTq9Teibh8k7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="76353491"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:49:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/3] drm/xe/query: Increase timestamp width
Date: Wed,  9 Oct 2024 20:48:45 -0700
Message-ID: <20241010034847.389734-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
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

Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
the 36 bit that was available before. Although 36 should be sufficient
for any reasonable delta calculation (for Xe2, of about 30min), it's
surprising to userspace to get sommething truncated. Also if the
timestamp being compared to is coming from the GPU and the application
is not careful enough to apply the width there, a delta calculation
would be wrong.

Extend it to full 64-bits for non-media engines starting with Xe2.

Bspec: 60411
Cc: Szymon Morek <szymon.morek@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 158629971eab3..a1f4cc25bea68 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	resp.width = 36;
+
+	if (!xe_gt_is_media_type(gt) && GRAPHICS_VER(xe) >= 20)
+		resp.width = 64;
+	else
+		resp.width = 36;
 
 	/* Only write to the output fields of user query */
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
-- 
2.46.2

