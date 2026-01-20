Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E899CD26284
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A6910E647;
	Tue, 20 Jan 2026 18:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKRNBYFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FAA10E220
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768935063; x=1800471063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=24C1GwrwN5+pxgIXaIdvbRQ6Wrnt9kvnHTnoUpt58GM=;
 b=XKRNBYFuRY4BwmQD0iSY9YvQfc9HcAUCBDZuHqA/FF3xCQQ/53heeE+n
 tIepBqcefQ/avHiQItFFoZGh1nQyFUgYJu7IEb0tDfrd8RkG1FXHkNE04
 ElUD3SeHHPznwikFMRJLVHGGwp+LkvCj2Zdn0c7Kk2okdzXnn4nYMRncl
 k3htzOtKA0RWz1bG5M3EPGFed8BYEwBqSuovcg/ssp1u8UKVZ257LXpEE
 ljRhe9Z/50lXPFn55PDiBOqCRws8dehdLIkL+raWLBMkBuJAuwCbJANMM
 NfqV1Xc7GpyB9GdF6zn/hJDz7UgBGb3tPZFhxeBuSZfk/J5aPPkgjSZ0Y g==;
X-CSE-ConnectionGUID: Xal8UyFeQCyyWOc9cj0JNQ==
X-CSE-MsgGUID: /1byq980SpCw2EUIIVqn/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70245728"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70245728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:51:03 -0800
X-CSE-ConnectionGUID: XmbGCdHySNiUsry4v+A6Hg==
X-CSE-MsgGUID: GO93+k9lTT+sAOtRLBozhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243776634"
Received: from amedve1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:51:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Allow second H2G retry on FLR
Date: Tue, 20 Jan 2026 19:50:47 +0100
Message-ID: <20260120185047.593-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120185047.593-1-michal.wajdeczko@intel.com>
References: <20260120185047.593-1-michal.wajdeczko@intel.com>
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

During VF FLR the scratch registers could be cleared both by the
GuC and by the PF driver. Allow to retry more times once we find
out that the HXG header was cleared and wait at least 256ms before
resending the same message again to the GuC.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ba0ea015611..f99716f4084c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1388,6 +1388,9 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
+#define MAX_RETRIES_ON_FLR	2
+#define MIN_SLEEP_MS_ON_FLR	256
+
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
@@ -1398,7 +1401,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
 	unsigned int sleep_period_ms = 1;
-	bool lost = false;
+	unsigned int lost = 0;
 	u32 header;
 	int ret;
 	int i;
@@ -1434,10 +1437,15 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &header, false);
 	if (ret) {
 		/* scratch registers might be cleared during FLR, try once more */
-		if (!header && !lost) {
+		if (!header) {
+			if (++lost > MAX_RETRIES_ON_FLR) {
+				xe_gt_err(gt, "GuC mmio request %#x: lost, too many retries %u\n",
+					  request[0], lost);
+				return -ENOLINK;
+			}
 			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
-			lost = true;
-			goto retry;
+			sleep_period_ms = max(sleep_period_ms, MIN_SLEEP_MS_ON_FLR);
+			goto sleep_and_retry;
 		}
 timeout:
 		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
@@ -1481,6 +1489,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		xe_gt_dbg(gt, "GuC mmio request %#x: retrying after %u ms, reason %#x\n",
 			  request[0], sleep_period_ms, reason);
 
+sleep_and_retry:
 		msleep(sleep_period_ms);
 		if (sleep_period_ms < 1024)
 			sleep_period_ms <<= 1;
-- 
2.47.1

