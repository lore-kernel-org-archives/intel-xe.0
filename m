Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E221C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055FA10E405;
	Wed, 12 Aug 2026 12:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFPqj9Iq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268DF10E405
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538487; x=1818074487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+DtLcLHcn1Q33YWNrP3hkTpOsGqlCPi1OWoT6t9oVzs=;
 b=cFPqj9IqcAiwG0+vKk07gDNPFlq4zb7DGS142rRPMTcQuxSI1luh4/WG
 3D2ybxOrbiHVIcyuytZavgpHei+sF8oxe5xHil6Y3zY849W4GEB7luf56
 248wbyylfIJlqSrD4oBLTz/vrlaGnPuB97tJ5tN/pBfFXKLOXvMwCqQbc
 +Z6DSiRiOF7t5jWKcV7HkuiOYczRdbtL9WnikU3gucqV13bXRxZxpMXlZ
 8PGUmiJogBkGT7SNxxdeEkvpNvYFk1F1mXmZA6UxUfzitFohI4EE50VNo
 OPUVR43NH0fca5bfxWBV6beeN3XOjQJkdNZvLvjC0o2V2degOnX2rLtDM w==;
X-CSE-ConnectionGUID: aB/twAGMRX+ZguispaGmJA==
X-CSE-MsgGUID: 7BF85nw5RsyjhQNHrkmv0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98238707"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98238707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:41:27 -0700
X-CSE-ConnectionGUID: cvwZcXWkTFaFTXsbtv7+NQ==
X-CSE-MsgGUID: ZjgfXfDnT+q7pCe0IQzN9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263674069"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 05:41:26 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v6 5/7] drm/xe/vf: Add bounds checking for queried GGTT base
 and size
Date: Wed, 12 Aug 2026 18:13:17 +0530
Message-ID: <20260812124313.1377582-14-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for GGTT base and size which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V5 -> V6:
- Updated error codes for unaligned GGTT base and size (Michal W).
- Fixed review comments (Michal W).

V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 81d68fe5ad7c..d805c064377c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -488,6 +488,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
+	u64 alignment = xe_vram_alignment(gt_to_xe(gt));
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size, ggtt_size;
@@ -526,6 +527,18 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 		return -EREMCHG;
 	}
 
+	if (!IS_ALIGNED(start, alignment)) {
+		xe_gt_sriov_err(gt, "Unaligned GGTT base: %llu, expected %llu\n",
+				start, ALIGN(start, alignment));
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(size, alignment)) {
+		xe_gt_sriov_err(gt, "Unaligned GGTT size %llu, expected %llu\n",
+				size, ALIGN(size, alignment));
+		return -EINVAL;
+	}
+
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-- 
2.53.0

