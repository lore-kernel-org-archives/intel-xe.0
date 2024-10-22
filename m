Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E192D17151
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 01:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392D410E5D1;
	Tue, 22 Oct 2024 01:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/aqkF2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D09610E5D1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 01:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729558885; x=1761094885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h7rQsUt2Ag5fvhrq3cAfpvuORTT9u+hCwVvSf/9qVU8=;
 b=U/aqkF2+paIus3aC+9n/W38yPFKfRcLKZixEFkltLniogdL8PZirkh2P
 AujGhIhA03BNp5kCpaDgqUpMMjoYHBEeRXxtH0uLHR2J/4qjUGWfwKYky
 k/SMGWi4Op1UbDoOTQN6q+1LwstSTvyl2s7QMhTk/Tx/jLdjLksAwblAo
 YYldyQ+rHFryRzivt1P549yevRYlkqGTvxM9I4xEiaggWNbuRNG90fwW9
 VzKMCFGMxDmwpbTfW6DfZB9U7aFt3lQ+y51z8daQvnZ6QpNfngFAWEpm+
 CTHaehYHK6dBMbGSGRnE4eShZpS1WPVCDZVn3FCNCaUgwQocXJLHorYd/ w==;
X-CSE-ConnectionGUID: dh2S9OfWS0SKOpOiaonUBg==
X-CSE-MsgGUID: ywHirqOkQqq5XEumMXvjnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29168484"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29168484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 18:01:24 -0700
X-CSE-ConnectionGUID: 3M9BTQUuQmCB7RQMUwNkiA==
X-CSE-MsgGUID: Lsw8s0w1TgOnT67UsT/buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79622273"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 18:01:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 1/1] drm/xe/guc: Prevent GuC register capture running on VF
Date: Mon, 21 Oct 2024 18:01:16 -0700
Message-Id: <20241022010116.342240-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022010116.342240-1-zhanjun.dong@intel.com>
References: <20241022010116.342240-1-zhanjun.dong@intel.com>
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

GuC based register capture is not supported by VF, thus prevent it
running on VF.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..8b6cb786a2aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1590,6 +1590,9 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 	u16 guc_id = 0;
 	u32 lrca = 0;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	new = guc_capture_get_prealloc_node(guc);
 	if (!new)
 		return;
@@ -1820,7 +1823,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe))
+	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
@@ -1876,6 +1879,9 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
 		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
-- 
2.34.1

