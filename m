Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC36C021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C710E2CD;
	Fri, 21 Feb 2025 10:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/Gmup/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886C10E2CC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740135102; x=1771671102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TC890aBRDpC4hulHG6Qw/LanWuSsMnWDYwRmIg1hZKg=;
 b=M/Gmup/dvMlMOQOtlfTGu3C7URpft5zvJzv9JDDPCNz99ESF1SRvZ3Io
 8Kda+jiUYeac3cHrOITHU/V2XvgWW8H/3l+CMKdrvESnSJhkjTjGH79Lm
 hxXSN0UHofKYnk/jdnDvzABTPfoXqWIpU6Ym8MrMGwHykDwpTB4+BglAf
 w5brz00ba13UHcU4DwFjCZGqZen5doYVIsYz1/YStZvn/ePVDun0sphhL
 t5c+ZGVyqIqK9s8nTw9fc4MD1mMAWLkgmJvV55k159BMDaCtKw5BYwqKf
 6A95LqxkINeZFuIXC3UPF5a6up7wO98HEnyAtc6NRXJRCvqIOV65HLWld Q==;
X-CSE-ConnectionGUID: ROEAa+GGS4KYiYffilwF7w==
X-CSE-MsgGUID: GvQ8dkWBTwaAPSu0JmaQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41217051"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="41217051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:51:42 -0800
X-CSE-ConnectionGUID: iFhL3EjaSZmEmwQmsDdvUg==
X-CSE-MsgGUID: hJfErxo8SYm/+yJ7zv2eVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115532591"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 02:51:40 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Date: Fri, 21 Feb 2025 16:37:12 +0530
Message-Id: <20250221110712.29994-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250221110712.29994-1-satyanarayana.k.v.p@intel.com>
References: <20250221110712.29994-1-satyanarayana.k.v.p@intel.com>
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

