Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C66CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEC710E1D0;
	Tue,  2 Sep 2025 12:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwPPb26/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FB410E1D0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756817342; x=1788353342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q9asgVZ7C3cb4Ae6vo1kwQUWJ7TNeoAlxpfybFICIlo=;
 b=hwPPb26/fX/J0M/oZWJx0zG7o+sC7ftws7qXeAUA/8Ru6Vgi74jn3/U8
 FiSRWcmDH8VC8igFponmrKWXtqBrbwjn7gs76NHgCWVLfpSGPMk+HNWgo
 4Eph1RnrcpSIO85BVobiLD/Ov65EEE3jSK/+kmFsHSxw9QZAIUHJty7Fq
 ol8ck/WTPF10FD0B4eZ8g6YmiQ8DRojSdq4MQnXfzNJYKEyqSAyJRv4pm
 wAr0ALJMZAVbvRIAPUJVATqUrFPiTCcR2t9PLdKt0HgBmk+cFAx2bw699
 V6z5mJqNBsoTIxZxCEKPPFcXSQXiMy9GpEF94teU2XVYmf/BVI0P6kZRZ g==;
X-CSE-ConnectionGUID: J6BH1V3bSaCd8VyWgAINGg==
X-CSE-MsgGUID: mVr7ZpEOQf2IOz1E7qI+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81672008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81672008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:49:01 -0700
X-CSE-ConnectionGUID: fHy/EvdgRAqzqvenlpgyyQ==
X-CSE-MsgGUID: 7cEbHEc4TYKD3Dn2oTEg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="172109444"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:48:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Set upper limit of H2G retries over CTB
Date: Tue,  2 Sep 2025 14:48:50 +0200
Message-ID: <20250902124850.5040-1-michal.wajdeczko@intel.com>
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

The GuC communication protocol allows GuC to send NO_RESPONSE_RETRY
reply message to indicate that due to some interim condition it can
not handle incoming H2G request and the host shall resend it.

But in some cases, due to errors, this unsatisfied condition might
be final and this could lead to endless retries as it was recently
seen on the CI:

 [drm] GT0: PF: VF1 FLR didn't finish in 5000 ms (-ETIMEDOUT)
 [drm] GT0: PF: VF1 resource sanitizing failed (-ETIMEDOUT)
 [drm] GT0: PF: VF1 FLR failed!
 [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
 [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
 [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
 [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0

To avoid such dangerous loops allow only limited number of retries
(for now 100) and add some delays to slow down the rate of resending
this repeated request.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e431ff73227c..9738888531e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1079,11 +1079,15 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 	return true;
 }
 
+#define GUC_SEND_RETRY_LIMIT	100
+#define GUC_SEND_RETRY_MSLEEP	5
+
 static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			    u32 *response_buffer, bool no_fail)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct g2h_fence g2h_fence;
+	unsigned int retries = 0;
 	int ret = 0;
 
 	/*
@@ -1148,6 +1152,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
 			  action[0], g2h_fence.reason);
 		mutex_unlock(&ct->lock);
+		if (++retries > GUC_SEND_RETRY_LIMIT) {
+			xe_gt_err(gt, "H2G action %#x reached retry limit=%u, aborting\n",
+				  action[0], GUC_SEND_RETRY_LIMIT);
+			return -ELOOP;
+		}
+		msleep(GUC_SEND_RETRY_MSLEEP * retries);
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-- 
2.47.1

