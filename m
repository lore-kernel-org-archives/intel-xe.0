Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E0C5DF66
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162A210F343;
	Thu, 13 Aug 2026 13:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7iSpoQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5D910F349
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627875; x=1818163875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nG1elh1XPz2i6CE6rmtxQnJ//7WQibhGDcvli+vnTMQ=;
 b=M7iSpoQli7ITbUEF9VZNZFqajqYO2MMP7j6Z819+PrmyFKR8L4qzHf2G
 bJV27Q9ywlcCnG5b9EbcT6gjV8IQ7thki3SL2v/ZMJtgwpLXcSPAzjT/y
 yfoUPa1pK3xwW1/IKPhrkW8zc0952icY02lJFw3U9A11vAumv9M2vHHFk
 73HST2NYeRPfaYnhxkdbx0lFq64BzcqCDacXW5e3+DyfasN5IM5eyGg0C
 dZUzueHRvCKNzO4CwnytB7fL+eIC9okbygPgt7lmJqs1SV1LZuWyINBTA
 UUcLhYro54uNbteQJs9mzOAqtg68rvSwmFxAXyw4uY6RNnTTO0GHtny9N A==;
X-CSE-ConnectionGUID: TxAZUGAxRDCvycttBJxFhw==
X-CSE-MsgGUID: KpxNbK3hSGS+xmMkx2nPaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547715"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547715"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:14 -0700
X-CSE-ConnectionGUID: jpnnTRccSw+hwpv11jqxBA==
X-CSE-MsgGUID: I4AoDnqyQBG9nNeBYoBZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207354"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:13 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 3/6] drm/xe/guc: Print register addresses in capture snapshot
 output
Date: Thu, 13 Aug 2026 19:00:34 +0530
Message-ID: <20260813133037.2912699-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Include register offsets in GuC capture snapshot print output for both
32-bit and 64-bit registers.

When dumping captured engine register state, print each register name
alongside its MMIO offset to make the snapshot output easier to
cross-reference with register definitions and hardware debug
documentation.

This improves postmortem analysis without changing capture contents.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 82df19b304e1..368769857c9b 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1774,7 +1774,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(!low32_ready);
 			low32_ready = false;
 
-			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
+			drm_printf(p, "\t%s (0x%x): 0x%016llx\n", reg_desc->regname,
+				   reg_desc->reg.addr,
+				   value_qw);
 			break;
 		}
 
@@ -1788,10 +1790,11 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			XE_WARN_ON(low32_ready);
 
 			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
-				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
-					   reg_desc->dss_id, value);
+				drm_printf(p, "\t%s[%u] (0x%x): 0x%08x\n", reg_desc->regname,
+					   reg_desc->dss_id, reg_desc->reg.addr, value);
 			else
-				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
+				drm_printf(p, "\t%s (0x%x): 0x%08x\n", reg_desc->regname,
+					   reg_desc->reg.addr, value);
 
 			break;
 		}
-- 
2.43.0

