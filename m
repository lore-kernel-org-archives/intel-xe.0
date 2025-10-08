Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85FCCCD194
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF7F10E8FC;
	Wed,  8 Oct 2025 21:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXGBMchH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C90C10E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959941; x=1791495941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kiz+jerG8Hx1DiGBkWQWSS6oHpKcTCE/T9d9vU2nJ8M=;
 b=UXGBMchH7sjTVzKTL0iZVE7VgA4D+wvSyE/QcSqZUqe8m6P+pL9aag7G
 giND1lWeLQ9sz31vWQ2f4bMZSWKTXCxx7DJcBHfL183AYnnYq+7OwgzhQ
 F4gwvBVOZpF5T+YKtnXVhEjhEPx2tkqUd1FOmH9zbguU7GmnZAufWWaaR
 VGEv/VG78lxJnoeB6rM0lNLK6eqm4jXdGmn3/yXY4eHStLWLxRX4UHgVE
 xxMx8Zsg0BdLbf+Sm51w9FKrstat9CbVHA322fh9d0TKw0c6HwmbiiEDU
 KyX2CRkL/WrfNbZtBk5ntmasdtT6cyTCV1Z9KjB/aC8W9B8C8dGNnM27J Q==;
X-CSE-ConnectionGUID: flEsfhMGTsybBdj+Ai5LIg==
X-CSE-MsgGUID: DYvkbpb9T0+sCMNlr8zXWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726852"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:40 -0700
X-CSE-ConnectionGUID: reMk+8VjTTO2zUoLGH57yw==
X-CSE-MsgGUID: az/R4WEbTgCD+m5iO07HHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635190"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 10/34] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Wed,  8 Oct 2025 14:45:08 -0700
Message-Id: <20251008214532.3442967-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

While VF post-migration recovery is in progress, abort H2G sends with
-ECANCEL. These messages are treated as lost, and TLB invalidation
errors are suppressed. During this phase, the H2G channel is down, and
VF recovery requires the CT lock to proceed.

v3:
 - Use xe_gt_recovery_inprogress (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..9f0090ae64a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -851,7 +851,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
-	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u16 seqno;
 	int ret;
 
@@ -872,7 +872,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+	if (ct->state == XE_GUC_CT_STATE_STOPPED || xe_gt_recovery_pending(gt)) {
 		ret = -ECANCELED;
 		goto out;
 	}
-- 
2.34.1

