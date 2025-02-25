Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FAC021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4B10E68E;
	Tue, 25 Feb 2025 13:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7cprKZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57610E68E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489841; x=1772025841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CbJq1zjbjbpkdsZ1FbRt1rTOjX2qAcGGwxJayZWDUtE=;
 b=m7cprKZadZHOE5OEZxBk73cVv1HuvCHfShul9ZlQo7vrH7pj7NKxRYcH
 Hw+j+MJ+wfE+R1mw2L2jXAtNXGTESqiLsBJkSOlJwTFBriMu28HIAvqzl
 XdwLy7eA1dkKamr+4Thp6l7W8HCqVuOQiitKH3R6J+E0DfPGVKmBzroRg
 tqkuaPXBZvvcE4X0t3TTidwDmtrfYjAof89p3bZBTpnHF1eKLHbbVVX3P
 gxm7shwhfwSym/ny7/eUl/DvfvgQd3qJiHmS71+ZJcuzFqfVZyCCBk0Ui
 vCR69oZl8i7j6m35JYhRmQWWnSP6c9VhZs+1w46px/fNncLDlscxbD6MN A==;
X-CSE-ConnectionGUID: EjEiDQLsQXSTqZTsjgzKAQ==
X-CSE-MsgGUID: 1gPuT+QxQSKO61Jr3tbisw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40530497"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40530497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:24:01 -0800
X-CSE-ConnectionGUID: UWR8qFAcR5CCp75CK7vxxA==
X-CSE-MsgGUID: Knsjw2aWQHSgMUNs272cDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="120998300"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:59 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
Date: Tue, 25 Feb 2025 14:23:37 +0100
Message-Id: <20250225132337.6508-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250225132337.6508-1-lukasz.laguna@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
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

The VF driver has already negotiated the ABI version with GuC. What
remains is to populate the generic xe_uc_fw struct with the version
before initializing submission.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc1ff0a4e1e7..7b38447d902c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
 
 static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_uc_fw_version ver;
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
+	xe_gt_assert(gt, !err);
+
+	xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
+
+	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
 	if (err)
 		return err;
 
-- 
2.40.0

