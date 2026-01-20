Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1FD2628B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AB310E1CF;
	Tue, 20 Jan 2026 18:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsmxB7j4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC62A10E178
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768935060; x=1800471060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QhQmebQ6RYJiB5SgwiTQESBPwKjsvpOlFKJVZBi16JA=;
 b=gsmxB7j47jueErMeq0ktoiGh++v4Cuy6leqJeto2cDh6D1uKuB6fuJ2s
 JXZf+XKS8WrdmCWcggb1DAQr0siL0UZsJaokEzlXZDayz9NNCR11R1xz/
 JhmQwnxZNrAfBtWnGvc/hGaVw26zdUH9o11YRoEJDAmg3uxCDG8j0fNEZ
 GGuxI3H1mFQPy4p0KQRw8Ck4N0PUoCRWObxJcNvxckbxoAur9mn0McJHW
 3i9XhgZMO5MLe+9x8+TTs8mjk1U/LkIe16FfNPIghp3gwUuqfyCkg3D11
 oSGpKHZw8Mkj1dXdOw8H0/+XhvZNCe/aXFrmyVnT7n8Ky9xDUYEWZzg1+ g==;
X-CSE-ConnectionGUID: 4E6ztpqmQdiExQVl5+HoCQ==
X-CSE-MsgGUID: smcOpVd1SJGqL2Pzc1yypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70245723"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70245723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:51:00 -0800
X-CSE-ConnectionGUID: MyBKHaNkQ9ePBR6NZdqdcQ==
X-CSE-MsgGUID: Q65DrYGKQXCTc0lmx19diw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243776618"
Received: from amedve1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:50:58 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Drop redundant register read
Date: Tue, 20 Jan 2026 19:50:45 +0100
Message-ID: <20260120185047.593-2-michal.wajdeczko@intel.com>
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

The xe_mmio_wait32() already returns the last value of the register
for which we were waiting, there is no need read it again.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..2a3b057fc828 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1394,11 +1394,11 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_mmio *mmio = &gt->mmio;
-	u32 header, reply;
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
 	bool lost = false;
+	u32 header;
 	int ret;
 	int i;
 
@@ -1430,21 +1430,20 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
 			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
-			     50000, &reply, false);
+			     50000, &header, false);
 	if (ret) {
 		/* scratch registers might be cleared during FLR, try once more */
-		if (!reply && !lost) {
+		if (!header && !lost) {
 			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
 			lost = true;
 			goto retry;
 		}
 timeout:
 		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
-			  request[0], reply);
+			  request[0], header);
 		return ret;
 	}
 
-	header = xe_mmio_read32(mmio, reply_reg);
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
 		/*
-- 
2.47.1

