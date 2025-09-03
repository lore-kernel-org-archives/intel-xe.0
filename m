Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A89CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36E610E953;
	Wed,  3 Sep 2025 22:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4NfnLRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6210E953
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938823; x=1788474823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8FwrgbLqgggCovwgHvABJOKUCB1hzFw4gHrOrRaGjF4=;
 b=E4NfnLRh+iTz+BjZWaocuFNUeLQWh1pnADHcGj+Ny4y3sva+RWee//ar
 gd5TCM4/9Fp73/02Zy1/gSGYXavMQav4k3a/atQyeCfG/oZwDDhEJ0wPe
 QKOhzicB09vwcGMOaLEIhQjFArMfpLZE3hIW50LJXTiqvomg01/U4JqxE
 TLTtkh8OVAd8sRLMg9iZN8hEt6cq2BvT9xhHLfqyvsc5bHYFddZn6bqDh
 XuB0hlAJL9dJRAZHIWXNHhwD2KsP9zx0SKRx5d5XfikDPn9VhaUtC7NqE
 J42PQ3TjCFgoLgCCHeke8wlYWVGLV8tg26Ukh071uOrb+5nMUxBQ4lfEc w==;
X-CSE-ConnectionGUID: SdWmi8maSy64JBggJtuPqw==
X-CSE-MsgGUID: wthcsBOCR8O55LZXGNvk9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69879799"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="69879799"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:33:43 -0700
X-CSE-ConnectionGUID: gS/nAI3NS9S2/T25zxwIMA==
X-CSE-MsgGUID: +TYMXpJAQ06gtnIEqnIu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="172162414"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:33:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2] drm/xe/guc: Set upper limit of H2G retries over CTB
Date: Thu,  4 Sep 2025 00:33:30 +0200
Message-ID: <20250903223330.6408-1-michal.wajdeczko@intel.com>
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
(for now 50) and add some delays (n * 5ms) to slow down the rate of
resending this repeated request.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
v2: use 50 iterations for smaller delay (Julia, Matt)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e431ff73227c..f40543b040d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1079,11 +1079,15 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 	return true;
 }
 
+#define GUC_SEND_RETRY_LIMIT	50
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

