Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F2C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 00:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9010E455;
	Tue, 10 Jun 2025 00:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyCQE7hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C48810E455
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 00:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749514975; x=1781050975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQxeeGhpGKcfRI0Hol3eRQ01XwdY0dUvJvzUjRzJsDk=;
 b=JyCQE7hfCg2400cHOIC8jJ8WwarqMbC69pwIk6CrCsNwj/0401Ml2hZK
 Jua2an6qL8BIqZgibGOvp5OfPFAjrQwlDEoKBLtiyj9xODMEohbyOPYmu
 4ltsYdbWLVLlHcs54G4ttIlchYGfarfSU4kRGeXhYeHboUkVjALvDA/q5
 qgUdlbY0/nAtdP2UNRXb3ccds53Ny+NjUxhII3a29faxXuycbpqpnvEJ+
 fU0YPJCXys1FNhYpnHhIO7l/06SJ5RXCG5k9e0H8E48do6KZBKpTWZYpF
 DvMdDy7ZpE6G69iLcODGhboRNVv4zeX7UqMCdfesHFOOQPrjaQehoauba A==;
X-CSE-ConnectionGUID: x86OyF+FS2yHcIqzcSQOCA==
X-CSE-MsgGUID: 4TlKd844S8eiggKgIkzI0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51752949"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="51752949"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:22:55 -0700
X-CSE-ConnectionGUID: 1mPenWweSUGCUq3MGiEEtw==
X-CSE-MsgGUID: I/Ho6OyDRuqhVsqBeTTYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="147599128"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:22:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe: Fix early wedge on GuC load failure
Date: Mon,  9 Jun 2025 17:22:46 -0700
Message-ID: <20250610002245.1056576-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

When the GuC fails to load we declare the device wedged. However, the
very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
before the GT1 GuC objects are initialized, so things go bad when the
wedge code attempts to cleanup GT1. To fix this, check the initialization
status in the functions called during wedge.

Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
Requires: 1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 7 +++++--
 drivers/gpu/drm/xe/xe_guc_ct.h              | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 3 +++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..e1362e608146 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -137,6 +137,14 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 	int pending_seqno;
 
+	/*
+	 * we can get here before the CTs are even initialized if we're wedging
+	 * very early, in which case there are not going to be any pending
+	 * fences so we can bail immediately.
+	 */
+	if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
+		return;
+
 	/*
 	 * CT channel is already disabled at this point. No new TLB requests can
 	 * appear.
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 822f4c33f730..e303fec18174 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -517,6 +517,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
  */
 void xe_guc_ct_stop(struct xe_guc_ct *ct)
 {
+	if (!xe_guc_ct_initialized(ct))
+		return;
+
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
 	stop_g2h_handler(ct);
 }
@@ -788,7 +791,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	u16 seqno;
 	int ret;
 
-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	xe_gt_assert(gt, !g2h_len || !g2h_fence);
 	xe_gt_assert(gt, !num_g2h || !g2h_fence);
 	xe_gt_assert(gt, !g2h_len || num_g2h);
@@ -1424,7 +1427,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	u32 action;
 	u32 *hxg;
 
-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5649bda82823..99c5dec446f2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -24,6 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
 
+static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
+{
+	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+}
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct->state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b61d017eeca..7170e78e5b8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1776,6 +1776,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!guc->submission_state.initialized)
+		return 0;
+
 	/*
 	 * Using an atomic here rather than submission_state.lock as this
 	 * function can be called while holding the CT lock (engine reset
-- 
2.43.0

