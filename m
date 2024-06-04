Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050CBC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 21:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CAF10E2A0;
	Tue,  4 Jun 2024 21:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwfxTi0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CBB10E2A0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717536165; x=1749072165;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=M8qYVuvJRJhrkcaV2ukaaNT4sfAY+wCcHHY3/Gq+ra8=;
 b=kwfxTi0AVA7hUTYBcD3857o6W7j5K7B1M677Dxsi+USTMChxCoGNIB0J
 1EnCB0VjxRXGiVvni6PxrBHqF+yOoxDORbGZUk6cp6CRfuKud76gbpfpD
 fsjXU4qAtU8nH+n94OhJX4W+PhhmEN0zIBYx6K5zPjnGnQ83aohx8pS7O
 BM/t55I5yGH6upQnSA9ASqPYGMBha/tI433OFHKnJCDH44rMHNud4rPk3
 X8wHiuGx3dCDBFuvDH4hw3J33phTs04aJsgjcp5iP8GfeUJqZnUEUggVS
 6GJ10FPukKzEUk/HIgMmjC4B/W66Dq1QZOoNn090/SUfQ2cTnmW9htopR Q==;
X-CSE-ConnectionGUID: wsWg4CXBQA6nHZM3LyXoUw==
X-CSE-MsgGUID: PeK4rZ2bRzOAENxCbehVAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13996099"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13996099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:45 -0700
X-CSE-ConnectionGUID: 7ZhvwNPYSy6qfQ9tbvRYtw==
X-CSE-MsgGUID: 1nM9JoX6TnGZYPRjKVUDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41799418"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 14:22:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/vf: Custom GT restart
Date: Tue,  4 Jun 2024 23:22:31 +0200
Message-Id: <20240604212231.1416-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240604212231.1416-1-michal.wajdeczko@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
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

Only few steps from the GT restart phase are applicable for the
VF drivers, as initialization of PAT, WOPCM, MOCS or CCS mode can
be done only by the native or PF drivers. Use custom GT restart
function if running in VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4e11662b78bd..57d84751e160 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -611,12 +611,34 @@ static int do_gt_reset(struct xe_gt *gt)
 	return err;
 }
 
+static int vf_gt_restart(struct xe_gt *gt)
+{
+	int err;
+
+	err = xe_uc_sanitize_reset(&gt->uc);
+	if (err)
+		return err;
+
+	err = xe_uc_init_hw(&gt->uc);
+	if (err)
+		return err;
+
+	err = xe_uc_start(&gt->uc);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int do_gt_restart(struct xe_gt *gt)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return vf_gt_restart(gt);
+
 	xe_pat_init(gt);
 
 	xe_gt_mcr_set_implicit_defaults(gt);
-- 
2.43.0

