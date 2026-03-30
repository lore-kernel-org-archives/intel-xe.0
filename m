Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD331061B1F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC4910E808;
	Mon, 30 Mar 2026 20:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecFWnk2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B0710E807
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903272; x=1806439272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THaXDTR+zotigPpAMZp/tD3MAylVTObAzMx111KrWo8=;
 b=ecFWnk2ehBYjv9a5kN4X0zcJJ3cWoMu3Pu+SsdaUE4gB98h2qxVVre71
 PEP9g60CC2NNN2gj9apwKn7Yt+cQHFpgfYxSf7nH7x93bBd+RFC/4xXqj
 5c45O1eNUzHNvT1GHWFltxW4dg+n1W8M1BHeonZ5XKm3hjMQ9vWVgcH7w
 cn6XApztUl7G2OI7ZYR540wjMxDlOxL7xaM6dk/X2RhKvElJhlfxpComw
 tMwwh1tiaPap4EKI9lGaR0M/jIcxwNyabdWcbcwaPN1Etrkc/uevvdltL
 oifDEy7kd692j157PmB+ikKfZtJkpwj5VMcHX0B65ZTnouH3FS3WeRwig Q==;
X-CSE-ConnectionGUID: dd0zGRjeQCahjPL5cKVgKg==
X-CSE-MsgGUID: YBL7MJHJTumxL8YCbwPK1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923715"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:12 -0700
X-CSE-ConnectionGUID: VyGb1GgzTZO3vJwR6pjwNQ==
X-CSE-MsgGUID: SpsYg7JIRGKsRu+yvVT/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329442"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/13] drm/xe/pf: Extract helper to show which VFs are
 provisioned
Date: Mon, 30 Mar 2026 22:40:42 +0200
Message-ID: <20260330204046.567-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

In upcoming patches we will want to show which VFs were already
provisioned with resources other than LMEM(VRAM). Convert code
from the LMEM reporting function into a more generic helper that
can handle both u32 and u64 resources and can report also PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e673e96a147a..680ea73d1ce3 100644
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

