Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB91CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 11:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332C10F2B0;
	Thu, 18 Jun 2026 11:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q19JIGJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9810F28B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781782299; x=1813318299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDxBdX+2epTb7jHo+dv75z3/jpVihst9tSVqyVhVktY=;
 b=Q19JIGJayTOFSaNZnP4af+3hUq2Vh/XzVx0gFcxeOti3CnYQ16AZUhei
 pHHZ4tNWOJKZzvPpn2fPUV8PCzBJdw2gOU+SUjGc84Oa/hfCZUp1Ce5v6
 6DJ3f4++zv1uYKbKs4pd21+lwpaLPY2vEsDdI+uMfdIgcgyOYECUU8gwq
 U18bs0Oqqjq9JBUZIrRM0bPJNuQ0B6CnROQHeGF5Odij8S8O2odV7m3hR
 6MUx9ZOwnwBaiZ3IIoxpfuN2Nj80OQN4OEN/UwUVeaETQ73KT0Y4vL08/
 nR5JXS9fDApI002Ny7aQdnwfJICbAcfG0Z6FFovmkrqTBTmcQ0k0tW+lP Q==;
X-CSE-ConnectionGUID: YLsntQWhTlewRWRfld9LQw==
X-CSE-MsgGUID: cp9PcRzlT+G23KUZUMdD7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86457059"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86457059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:39 -0700
X-CSE-ConnectionGUID: M6dizJC1SeGggOHeVcPsCw==
X-CSE-MsgGUID: 7rPKrsTWTNKuRqpmZMH/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252661912"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:31:36 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Date: Thu, 18 Jun 2026 16:55:30 +0530
Message-ID: <20260618112528.2354371-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618112528.2354371-4-sk.anirban@intel.com>
References: <20260618112528.2354371-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21e0dad9a481..d6d6f930c8e1 100644
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
@@ -1236,6 +1241,34 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
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
+ * * -ECANCELED: the CT channel is stopped, or a GT recovery is
+ *   pending. Retry only after the CT is
+ *   re-enabled or the reset/recovery completes.
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
@@ -1388,7 +1421,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = -ECANCELED;
+			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1724,6 +1757,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
+	if (xe_device_wedged(xe))
+		return -ENOTRECOVERABLE;
+
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
 
-- 
2.43.0

