Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698A2C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 11:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175ED10E6EE;
	Tue, 30 Apr 2024 11:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzalUAOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAC910E6EE
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714477254; x=1746013254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+1Rvl7HLaksCFWptSekUuLoVlXqBqQzl+Ru5FvJIhWI=;
 b=RzalUAOjNk0a92k+1avNatWwVh6/CMrJpjyc5iIuqejuiB7+vYenQ7aY
 5qNZMMrz2mkLRzm21EqdG9jVUPoggQsguQ0eHjQWEfuA4zOOpTRuPGbMF
 H5hQq0p5mBxnbqQYXFxnJ0wqbSaPP0jqi6lWCDZvgx6vAZMNsFTw/L/Pk
 YewpqBdeUbJdVSKXxlxn9PnbjMd4C4iMj9dHcA49M6x4GOzUHZT3zTl35
 6TEAiSxoAzEotdXQABYmTEzIBNBx8lqTyxi/pQ/rJvccmT21rLYX6yvq4
 0Vb6EUjcx1dahGGsCLpAhiF6/494/ocgEAq0qb0wv5MDW7Famxdr89s5T g==;
X-CSE-ConnectionGUID: x98hU+oEQtKNAciwvuafQw==
X-CSE-MsgGUID: HLx/GSDET/ioVK70lmzLcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10053898"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10053898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 04:40:54 -0700
X-CSE-ConnectionGUID: QStHKi6+TN2IFIp8OKriAQ==
X-CSE-MsgGUID: ohqg54faTLaAHRpzJH0oFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="30912284"
Received: from acihodar-mobl.ger.corp.intel.com (HELO 53dbb48f0968.intel.com)
 ([10.252.33.69])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 04:40:53 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe/gt: Fix assert in L3 bank mask generation
Date: Tue, 30 Apr 2024 11:40:45 +0000
Message-Id: <20240430114045.7-1-francois.dugast@intel.com>
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
from the comparison, and XE_MAX_L3_BANK_MASK_BITS would be the
returned value if the pattern is 0.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index af841d801a8f..efe9e5d6fd52 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -107,8 +107,11 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
 			 unsigned long mask)
 {
 	unsigned long bit;
+	unsigned long last_bit = find_last_bit(pattern,
+					       XE_MAX_L3_BANK_MASK_BITS);
 
-	xe_assert(xe, fls(mask) <= patternbits);
+	xe_assert(xe, last_bit < patternbits ||
+		  last_bit == XE_MAX_L3_BANK_MASK_BITS);
 	for_each_set_bit(bit, &mask, 32) {
 		xe_l3_bank_mask_t shifted_pattern = {};
 
-- 
2.34.1

