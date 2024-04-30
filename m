Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39EAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 08:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5F10E16A;
	Tue, 30 Apr 2024 08:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFkn7gbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A08210E16A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714466605; x=1746002605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bR0ZMfoyucWlaaq2wPZVu4YpJ7FVLlBSvN9NwmVx9DE=;
 b=GFkn7gbqTFujVhmACQ7kouBPd3o8Ccbo+TIVQHqjrT98I+SZIb7bpkS/
 /XABKRfFwqLwxkWonAr4Zc3pAOPgk/S1r4lYsjAwG9GflD6MFK+J/oKXn
 LoIQY2DNW130YrHtfmdbsOJbYPER8tbxjajNAf6/OHswxY1WdG2r88r6U
 YOpGzveIjC/GOd09Tfm+tTxIO1m4gX/LspPjdwxTrGU/yPLWZY+1oU1Xv
 z4dO+g9zZbKEe9+y+GDZFKi7do/KMo34GTKqEzvhwSHVbBR/VDz8aHCUv
 ay97YlUaxLgaEOQ38cKRJHr8euIk9dikWiehFt+1NRRB2XfNBDjMSB0/B g==;
X-CSE-ConnectionGUID: W1PLpod1QoWKx0Jly4TD7Q==
X-CSE-MsgGUID: 0D0BPe2wRJqDWg+gwXDpNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10330466"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10330466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 01:43:24 -0700
X-CSE-ConnectionGUID: JK4S5D6LTWCm0QcaRNa3lg==
X-CSE-MsgGUID: qQP/ThJLQRGIC8Q4O3HOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26380523"
Received: from acihodar-mobl.ger.corp.intel.com (HELO 3ca5614cab40.intel.com)
 ([10.252.33.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 01:43:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/gt: Fix assert in L3 bank mask generation
Date: Tue, 30 Apr 2024 08:43:09 +0000
Message-Id: <20240430084309.7-1-francois.dugast@intel.com>
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
from the comparison.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index af841d801a8f..a8aee4b3fc65 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -108,7 +108,8 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
 {
 	unsigned long bit;
 
-	xe_assert(xe, fls(mask) <= patternbits);
+	xe_assert(xe, patternbits > find_last_bit(pattern,
+						  XE_MAX_L3_BANK_MASK_BITS));
 	for_each_set_bit(bit, &mask, 32) {
 		xe_l3_bank_mask_t shifted_pattern = {};
 
-- 
2.34.1

