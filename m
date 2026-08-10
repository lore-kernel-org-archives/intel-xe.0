Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD35C5AD7B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6F10E79D;
	Mon, 10 Aug 2026 10:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5ecVwaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251BC10E7A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356762; x=1817892762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21kyUk9EEJschXchfsS2GcNRFlWY7XCS0vE7LdLjY6A=;
 b=T5ecVwaD3RyXPoAZnF0mpsEl4lfdQLSKIqcci1YTLuYBgSl4VuM8WsFg
 bFv736eHptTppQZu4vsIs5o10IgB2fbLNtgU3NNzeV7dQ/whFPHbbZqjN
 Rzqn9k95tZ1256oTm0DhK887uyBb9LPa3ElClyTzs4SmlebvdGwkgKL7r
 r5CM+c7gXlQmMvoP5/EfYe3OFkIz/8PyT0HCIVeAYKUokfzRQ/3TuDKk+
 7o0KYWYK/XOn/9Tr+yNpVeyJnqyiO3o+NuO1MGuAgOdkOE8FkP+evV9V2
 fd+osd3ysa5O4zAfYEN/TBlQ9mX5C9OpLO9G2k3rjsRkiOqZYnWNCyvtO Q==;
X-CSE-ConnectionGUID: c1lJ2Fh2Td2+id6S9L8uXA==
X-CSE-MsgGUID: VeQ+xZ1DRbmQBhD30HBLag==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893653"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:42 -0700
X-CSE-ConnectionGUID: Xn9ZWEDSSYqzYZf37y9nQA==
X-CSE-MsgGUID: zBXZXt1aT0aKr9GrHV27UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227562"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:41 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 3/6] drm/xe/vf: Add bounds checking for queried context and
 doorbell counts
Date: Mon, 10 Aug 2026 15:44:30 +0530
Message-ID: <20260810101428.1009573-11-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for context and doorbells which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- Fixed review comments (Michal W).

V3 -> V4:
 - New commit
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 339ea0d3344c..81d68fe5ad7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -15,6 +15,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "abi/guc_relay_actions_abi.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -581,6 +582,11 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	if (num_ctxs > GUC_ID_MAX) {
+		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
+		return -EPROTO;
+	}
+
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
@@ -607,6 +613,11 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	if (num_dbs > GUC_NUM_DOORBELLS) {
+		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
+		return -EPROTO;
+	}
+
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
-- 
2.53.0

