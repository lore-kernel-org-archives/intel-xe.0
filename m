Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD87BD3176E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D52010E5F3;
	Tue,  5 Nov 2024 17:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHdxzXAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE04E10E5F3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827851; x=1762363851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZiV3NYzGMB0l1+OwmQhHayN86P+REpBTy6v24TW/LM=;
 b=FHdxzXAxiqBeljUPT1/q64xpU6KtSPIxfwcLHDLTRoYwhCDL09EaZ5/f
 48mPoCNrHjCiFgnjfPqMYP8jB3mIfcVZ+efaitz0uKq3vbBC4rcSbTync
 lkEv1AyCR62izKCIBnsV4XOuMiwnXacYaITE1FUVGLGmJDKhKoDJdZa0O
 lblr+b9Nhl7e1DeIH4LYY8FlOJvAUGPoqSxygPCVL85dvC5l0vdBxm8JD
 PBfs/pVhvd6TjlmKmJsGmbiQJpea1NJaqLibO2LV6G2C0JlPaq2/reoId
 f2DrZl/xOn5Yg5Drqikx1TXTjvsLSQmA3VwWnWmaopWopvCdGCuN90gNg w==;
X-CSE-ConnectionGUID: +EfJ9yssRhiKpMEK4Dk/mA==
X-CSE-MsgGUID: tjLbOEagTiyyjkeVAu/kOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48094187"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="48094187"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:51 -0800
X-CSE-ConnectionGUID: YiZT5AabQK6dAjCE6Vna0Q==
X-CSE-MsgGUID: BItjvGmwQdSzCpYGBhadJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114906282"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:49 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 4/4] drm/xe/guc: Don't treat GuC generic CAT error as protocol
 error
Date: Tue,  5 Nov 2024 18:30:32 +0100
Message-Id: <20241105173032.1947-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241105173032.1947-1-michal.wajdeczko@intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
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

GuC uses GUC_ID_MAX if it can not map the CAT fault to any PF/VF
context. We shouldn't treat that as G2H protocol error that would
justify a GT reset, as it may happen due to some VF activity.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 147000fd1177..696f8884040a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2023,6 +2023,15 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	guc_id = msg[0];
 
+	if (guc_id == GUC_ID_MAX) {
+		/*
+		 * GuC uses GUC_ID_MAX if it can not map the CAT fault to any PF/VF
+		 * context. Only PF will be notified about that.
+		 */
+		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		return 0;
+	}
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
-- 
2.43.0

