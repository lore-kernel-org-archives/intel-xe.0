Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D20CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 19:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66110E0FC;
	Wed, 24 Jun 2026 19:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tpo2NtAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F3910E0FC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782330775; x=1813866775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cy1H7wMfm0SZHFZPs8o9jtO6MXaqC/M+55bGHu6WgaA=;
 b=Tpo2NtAC0Kx0Jg1nv7dkB7pFzobBdhKgSavjx8yt2OXswcETmqblTcSA
 KFi+6oODgZV2WRC0E0kAKMrUG0rfCg1myEQASpY36ssbhZSU61SPiJ5mJ
 IXJF78eMhBeuydHMwVP84ZIc2yogVx2W8KJ1ea0R87XyxSIabxbnUSt7D
 Rt+bC8/oyHV5WBGZeuHBgmXf9oCBaCVhjoU+oaYHFpGAdZbE8bJ1MpwBF
 QCgq3VLLNofjaIJVzIVdIzNWxMzCJ+wdBMSaYd6JqNTgNNbFJNdBRXUk1
 bD/O3MIgJ3rOoPcBgGZoMHJpMr2utTReBHtkhuDqicP8e+WC4fJFLRXk3 A==;
X-CSE-ConnectionGUID: 7FpKRz7RTDu97acxqqlSGg==
X-CSE-MsgGUID: 78CG39xmSBie9pkADnSHXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83107533"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="83107533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:55 -0700
X-CSE-ConnectionGUID: N7J+OHDaT7WVCH1D6sVNQg==
X-CSE-MsgGUID: 3oF4ZSxyQDGy8b5IQnmCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="247074796"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:52 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Date: Thu, 25 Jun 2026 01:16:20 +0530
Message-ID: <20260624194618.2793571-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624194618.2793571-4-sk.anirban@intel.com>
References: <20260624194618.2793571-4-sk.anirban@intel.com>
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

The CT layer returns -ECANCELED regardless of whether cancellation
is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
on wedge so callers don't need xe_device_wedged() checks
to suppress spurious error logs.
Also document the return codes of xe_guc_ct_send() in kernel-doc form.

v2: Fix -ECANCELED description (Matt)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21e0dad9a481..8ca7d37c79b6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1065,6 +1065,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
+	if (xe_device_wedged(ct_to_xe(ct))) {
+		ret = -ENOTRECOVERABLE;
+		goto out;
+	}
+
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
@@ -1236,6 +1241,36 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 }
 
+/**
+ * xe_guc_ct_send - Send an HXG message to the GuC over CT
+ * @ct: the &xe_guc_ct
+ * @action: dword array with the HXG message (can't be NULL)
+ * @len: length of the HXG message in dwords (can't be 0)
+ * @g2h_len: G2H response space to reserve in dwords, or 0
+ * @num_g2h: number of G2H messages expected, or 0
+ *
+ * Return codes from the non-blocking send helpers are:
+ *
+ * * -ENOTRECOVERABLE: the xe device is wedged. Stop submitting new GuC work; the
+ *   request cannot make progress until the device is recovered.
+ * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
+ *   CT is restarted, which clears the broken flag.
+ * * -ENODEV: the CT channel is disabled, messages not expected in this state.
+ *   Don't retry until it is enabled again.
+ * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
+ *   message was dropped. Often benign. Cancel-tolerant callers (e.g. TLB
+ *   invalidations, GuC submission) rely on the stop/start flow to recover;
+ *   others should retry once the CT is re-enabled or the reset/recovery
+ *   completes.
+ * * -EDEADLK: no CTB room and the wait for space timed out. The send helpers
+ *   have already requested an async GT reset before returning this error.
+ *
+ * -ENOMEM may also be returned if an internal allocation fails; the blocking
+ * xe_guc_ct_send_recv() path retries that allocation. -EBUSY and
+ * -EAGAIN are internal flow-control results handled by the send helpers.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
 int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		   u32 g2h_len, u32 num_g2h)
 {
@@ -1388,7 +1423,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = -ECANCELED;
+			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1724,6 +1759,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
+	if (xe_device_wedged(xe))
+		return -ENOTRECOVERABLE;
+
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
-- 
2.43.0

