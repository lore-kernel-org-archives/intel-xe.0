Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC614D6AB00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05710F2EA;
	Thu,  2 Apr 2026 19:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1NIM//s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84410F2FF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157504; x=1806693504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YGbeUjGZX2fGO02JpYyFQ/63E8UHSq4ij/gRpYrG6p0=;
 b=N1NIM//sRYFrTNRZdzhD7EZHg+68ybOL6Ym11mEcX7ArzId16JtSedtL
 SYDWX8Ql2ZKLFxDm57mDJTpKZLjkViuTVBZSt4zOl5nOyhgjG2NBAAN6Z
 orgU2fhX6v19weBhj01F1YQw76KzWq0BcbZTpwnJhcjB59BUrlP9Dhx2S
 SsHvZ5kyklp2ZPzLKChffwLs9O4oae6MhfC1tvCpX7lxJAXFkh5la1W8x
 bCR7MrVFUDM4bHHTUjs2o9GtufD5kFNpesnAYTb6dfne4uLTD8cJfKC89
 Suesqg6nu0Gw6NimkVTecXatpUD0/aWyL91A7WCUM9fLgR8NafIk3Tejz A==;
X-CSE-ConnectionGUID: 5jKPpPyaS3mCLOPZoWZcVA==
X-CSE-MsgGUID: Q+5cRFKtShWj+MxjWl3YZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241110"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:24 -0700
X-CSE-ConnectionGUID: pPPv4hHpQdC3ax8T5ItbGQ==
X-CSE-MsgGUID: 8uutszCYSPyUAuJALm0Zcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213102"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 11/13] drm/xe/pf: Extract helper to show which VFs are
 provisioned
Date: Thu,  2 Apr 2026 21:17:24 +0200
Message-ID: <20260402191726.4932-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In upcoming patches we will want to show which VFs were already
provisioned with resources other than LMEM(VRAM). Convert code
from the LMEM reporting function into a more generic helper that
can handle both u32 and u64 resources and can report also PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index abc6b5e22048..2eda63b69b4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1934,29 +1934,45 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	return ALIGN_DOWN(fair, alignment);
 }
 
-static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
-					unsigned int num_vfs, bool provisioned)
+static void __pf_show_provisioned(struct xe_gt *gt, unsigned int first_vf,
+				  unsigned int num_vfs, bool provisioned,
+				  u32 (*get32)(struct xe_gt *, unsigned int),
+				  u64 (*get64)(struct xe_gt *, unsigned int),
+				  const char *what)
 {
 	unsigned int allvfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt); /* PF plus VFs */
 	unsigned long *bitmap __free(bitmap) = bitmap_zalloc(allvfs, GFP_KERNEL);
 	unsigned int weight;
 	unsigned int n;
+	bool pf;
+
+	xe_gt_assert(gt, get32 || get64);
 
 	if (!bitmap)
 		return;
 
 	for (n = first_vf; n < first_vf + num_vfs; n++) {
-		if (!!pf_get_vf_config_lmem(gt, VFID(n)) == provisioned)
+		if ((get32 && (!!get32(gt, VFID(n)) == provisioned)) ||
+		    (get64 && (!!get64(gt, VFID(n)) == provisioned)))
 			bitmap_set(bitmap, n, 1);
 	}
 
+	pf = test_and_clear_bit(0, bitmap);
 	weight = bitmap_weight(bitmap, allvfs);
-	if (!weight)
+	if (!pf && !weight)
 		return;
 
-	xe_gt_sriov_info(gt, "VF%s%*pbl %s provisioned with VRAM\n",
-			 weight > 1 ? "s " : "", allvfs, bitmap,
-			 provisioned ? "already" : "not");
+	xe_gt_sriov_info(gt, "%s%s%s%s%*pbl %s provisioned with %s\n",
+			 pf ? "PF" : "", pf && weight ? " and " : "",
+			 weight ? "VF" : "", weight > 1 ? "s " : "",
+			 allvfs, bitmap, provisioned ? "already" : "not", what);
+}
+
+static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
+					unsigned int num_vfs, bool provisioned)
+{
+	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
+			      NULL, pf_get_vf_config_lmem, "VRAM");
 }
 
 static void pf_show_all_provisioned_lmem(struct xe_gt *gt)
-- 
2.47.1

