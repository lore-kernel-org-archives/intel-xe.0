Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE4C021B5
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F63B10E3BB;
	Mon, 24 Feb 2025 13:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xw9ANviP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE68A10E120
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740391957; x=1771927957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TC890aBRDpC4hulHG6Qw/LanWuSsMnWDYwRmIg1hZKg=;
 b=Xw9ANviPmha50cMbIK+FnU33L/Jq/tG07iYpe6DdUlcHvtTnuLDJT9mJ
 B2HOqKbFgvn+VINVLRFfY1SJbOeIi8EL6vwyQ3aOBPG5YqfNfurm3xWW1
 3FvpY+g+Qbq6qHG+pk0Bv8MKS78hSCVisdXjdVflVF2gfWiPt2Z7rXRgY
 JT4s4BIOFpDGYC4UjadlbuoaOdpOHdfuiyeu9NhD9ZOLUyHL2hVg1cRb+
 V9qQHjav0vzT3lgxmAOtEpLOOVMf4Lh0RRmyFHrTMVKQ5aU8J3/ohQx1Y
 NOhXRHVV/RlQxXcKK7fyx8ilGThO2n2WwZmUBbW0jLzKPwV0CjwR4EEOQ Q==;
X-CSE-ConnectionGUID: em9sFYh8RvqKjm+7cRGgtA==
X-CSE-MsgGUID: 4uVGl1IoRBKcZTwpM5JEMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41258594"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41258594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:12:37 -0800
X-CSE-ConnectionGUID: Z5GUjHcsSlGPQWa6GQ5pMw==
X-CSE-MsgGUID: 89LGKzBXR1W6kfHZKHcanA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115860908"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 02:12:35 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Date: Mon, 24 Feb 2025 15:58:07 +0530
Message-Id: <20250224102807.11065-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250224102807.11065-1-satyanarayana.k.v.p@intel.com>
References: <20250224102807.11065-1-satyanarayana.k.v.p@intel.com>
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

Add support to allow retrying the sending of MMIO requests
from the VF to the GUC in the event of an error. During the
suspend/resume process, VFs begin resuming only after the PF has
resumed. Although the PF resumes, the GUC reset and provisioning
occur later in a separate worker process.

When there are a large number of VFs, some may attempt to resume
before the PF has completed its provisioning. Therefore, if a
MMIO request from a VF fails during this period, we will retry
sending the request up to GUC_RESET_VF_STATE_RETRY_MAX times,
which is set to a maximum of 10 attempts.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4831549da319..a439261bf4d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -47,12 +47,19 @@ static int guc_action_vf_reset(struct xe_guc *guc)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+#define GUC_RESET_VF_STATE_RETRY_MAX	10
 static int vf_reset_guc_state(struct xe_gt *gt)
 {
+	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
 	struct xe_guc *guc = &gt->uc.guc;
 	int err;
 
-	err = guc_action_vf_reset(guc);
+	do {
+		err = guc_action_vf_reset(guc);
+		if (!err || err != -ETIMEDOUT)
+			break;
+	} while (--retry);
+
 	if (unlikely(err))
 		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
 	return err;
-- 
2.35.3

