Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DC1C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 12:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455EE10E058;
	Thu,  2 May 2024 12:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMTB6IER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7010E058
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714653824; x=1746189824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RodEzeZzu+Lzlt5ZftnkzemgqcQ5BRwps79oknxHnfs=;
 b=OMTB6IERsgSinuPF5CngKcTtCepCkFk2R3CjMSZlsWbKPqGVWya7iq6t
 wDWXULRrbu+EZbgDZAfSCFPp7nqXRDGhBeuiC/2UH8/5lqL4GDSMmP/5K
 Sfq5JH6FjFjnd8a2iBXAzMk01E16upWZkKkM3sMoO+jLkb4fJMICQwrnZ
 M3ngUcOO6yaTzI5nrvgvJbIHpVGyVVdJACy4h7vaH1j9szOWT5z4VWYOd
 TuVI2CY6aatxHxr6/KvTVZ/hE/3BDV6+anmda2Bj6KP1hdj+ucUmtYTf4
 27AXZgpq8yNOdx8ZPduCKNndPP0mPFnYerKNBNGcSK8gjSX8Dt23OGI9A Q==;
X-CSE-ConnectionGUID: 9BIUIIdfT5+MifVNpGzQPQ==
X-CSE-MsgGUID: 5/y1iYGJTsuK72GEK2SrAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21831818"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21831818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 05:43:44 -0700
X-CSE-ConnectionGUID: 81ffN11bRBevmnryFInYBQ==
X-CSE-MsgGUID: 1NSj3CmaR8K01egva5g60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31909346"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fdugast-desk.intel.com) ([10.245.246.136])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 05:43:43 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/gt: Fix assert in L3 bank mask generation
Date: Thu,  2 May 2024 14:43:10 +0200
Message-ID: <20240502124311.159695-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

What needs to be asserted is that the pattern fits in the number
of bits provided by the user in patternbits, otherwise it would
be truncated when replicated according to the mask, which is
likely not the intended use of this function.
The pattern argument is a bitmap so use find_last_bit() instead
of fls(). The bit position starts at index 0 so remove "or equal"
from the comparison. XE_MAX_L3_BANK_MASK_BITS would be the
returned value if the pattern is 0, which can be the case on some
platforms.

v2: Check the result does not overflow the array (Lucas De Marchi)

v3: Use __fls() for long and handle mask == 0  (Lucas De Marchi)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index af841d801a8f..25ff03ab8448 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -108,7 +108,9 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
 {
 	unsigned long bit;
 
-	xe_assert(xe, fls(mask) <= patternbits);
+	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits ||
+		  bitmap_empty(pattern, XE_MAX_L3_BANK_MASK_BITS));
+	xe_assert(xe, !mask || patternbits * (__fls(mask) + 1) <= XE_MAX_L3_BANK_MASK_BITS);
 	for_each_set_bit(bit, &mask, 32) {
 		xe_l3_bank_mask_t shifted_pattern = {};
 
-- 
2.43.0

