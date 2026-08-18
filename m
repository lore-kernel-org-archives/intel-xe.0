Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2545FC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 23:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6B10E095;
	Tue, 18 Aug 2026 23:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHnPot+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B636310E095
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787094705; x=1818630705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0rzsduV/iPHpfhONDybI3nQh+BuM5e3UScm/KqJEj5Q=;
 b=QHnPot+qINFcWPAj2hTJOPx/X069D+RtHASmtZqXjiuHB4ZUModx9cAs
 jsqc8HPIFkXaPYMy/U+CnHDkrjwgMkocpivC+DWgjVh9YGoE6ygclAzM+
 ddsbwXRK6i5VmxlO1VMqE/5wVAnjYGU648cM8zXxNAXRHcUfniH8Pnurf
 dG3Q06ZADojbZ83NVbmx7RsEaBetRl0Qq3C3LDYa41PsZD3Zbn8q/LmYs
 k5/1SiV8VEzCpC5gPut+ZuuTdEseLAoARHKsVtf8sIADccf77w0tGp9/p
 9n1xs9aGFVocTu2PAGQ9SwCxBEQEkaKBCAFSZogiUSZZD5tdsKEBcyEYQ A==;
X-CSE-ConnectionGUID: np9w3xKgRiSNN3idDclJ5Q==
X-CSE-MsgGUID: +W8aAFAIQtiAto6uBt4kWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="104981366"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="104981366"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:11:45 -0700
X-CSE-ConnectionGUID: ufhuZROeQp6W42F60fy/dg==
X-CSE-MsgGUID: EQ72r5RlS06PfNykJwD+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269649166"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:11:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com
Subject: [PATCH] drm/xe/pcode: Use int instead of u32 for mailbox status
Date: Tue, 18 Aug 2026 16:11:41 -0700
Message-ID: <20260818231140.729887-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

Mailbox status is returned as int, but some callers read it as u32
(likely a typo). Use int instead.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: One more place to convert u32 to int (Sashiko)
---
 drivers/gpu/drm/xe/xe_pcode.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index e1b8062541a9..5f7fc61c9b97 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -148,7 +148,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 
 static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 			     u32 request, u32 reply_mask, u32 reply,
-			     u32 *status, bool atomic, int timeout_us, bool locked)
+			     int *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
@@ -196,8 +196,7 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_base_ms)
 {
-	u32 status;
-	int ret;
+	int status, ret;
 
 	xe_tile_assert(tile, timeout_base_ms <= 3);
 
@@ -295,10 +294,10 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
  */
 int xe_pcode_ready(struct xe_device *xe, bool locked)
 {
-	u32 status, request = DGFX_GET_INIT_STATUS;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	long timeout_us = 3 * 60 * USEC_PER_SEC; /* 3 min */
-	int ret;
+	u32 request = DGFX_GET_INIT_STATUS;
+	int status, ret;
 
 	if (xe->info.skip_pcode)
 		return 0;
-- 
2.51.0

