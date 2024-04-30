Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CA5C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA19112CE4;
	Tue, 30 Apr 2024 16:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYtCu7Ks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAD0112CE4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495158; x=1746031158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mHNt3X6xk/6SGvQj4+JH/j8Af0a6+1a6b6AYy8BH9GU=;
 b=YYtCu7KsWLMaXQsJY/Hw9HiP75sE/s2iFWFejoNW3GHMCLvkNM7Se92o
 +X3IbiubnqSuE926irPYiyDRXM7ZARwdnUGeRq4q5tU+QL9QykQu4KHqP
 qz7Dh+v2NAZx4fGhPdTZ/Ir4KJFumip5xJI+ndcalPyet58djQxa+qY3y
 BhV3mjWXDGSlFz3GXe+URkEy+hpu+/JEpAQ47djucvusM1/j4JR+KxEPJ
 VfQumdMybccOmvnZmoo8J4KkrG8psRdUsjNATw8rc856jZ0PbrLIA4CPy
 BX8YJAm2zqpk0EJ+5SPOZq8KulE+now4X0hf1iKSxHsy1rGFJ1llWd8Li A==;
X-CSE-ConnectionGUID: YVTkPWpQT1eW4fYteMi3Mw==
X-CSE-MsgGUID: 0degIKoMQ7i8ivpnR0+aHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="13995420"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="13995420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:39:18 -0700
X-CSE-ConnectionGUID: V5zA0G6oQc2JoUwALllPFA==
X-CSE-MsgGUID: Y7ZmnQP0QjWhhjwvkudG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57400216"
Received: from wtcline-desk12.amr.corp.intel.com (HELO 881182325eba.intel.com)
 ([10.245.246.108])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:39:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3] drm/xe/gt: Fix assert in L3 bank mask generation
Date: Tue, 30 Apr 2024 16:39:05 +0000
Message-Id: <20240430163905.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index af841d801a8f..b51f40493123 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -108,7 +108,9 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
 {
 	unsigned long bit;
 
-	xe_assert(xe, fls(mask) <= patternbits);
+	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits ||
+		  bitmap_empty(pattern, XE_MAX_L3_BANK_MASK_BITS));
+	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);
 	for_each_set_bit(bit, &mask, 32) {
 		xe_l3_bank_mask_t shifted_pattern = {};
 
-- 
2.34.1

