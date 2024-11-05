Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA251D3176C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885DC10E5F2;
	Tue,  5 Nov 2024 17:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTEFNhdG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7E10E5F1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827850; x=1762363850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bWksiK+wkSHQu0DvQkvitzy6DASm51FaxkOYbvZp7KM=;
 b=CTEFNhdGX5W7/Dy2dzyfFYBSEzCIiRvL96vkaH1vRTyWc9F5iALVbtOh
 T8kk8e6myuYZNqVmgZnOR9gEPUkgZDt3aUkcC0kWDuBxR8qgXr/DYzkVG
 YhjVApInKRXIZh9mM/KRO+pOnvXvyYaKv73lbbJgxrQEF5xSLWjOhhjUV
 vtmmrrqTLKoysFJyOu6tYXVYiqgK7y8LY09VI1aZdGzgRkdrlE0th1F9f
 9RKseOo0D9PAvUWzz2JrdXH3CEeAl0nhDo8HwFELP+RKo8dpJz4VttBtJ
 am+7S3iTeOkgKwkIFdbKUiB01Fj4+uJuksEQot7mBxTZAW7uy+hJ0JLOY g==;
X-CSE-ConnectionGUID: d+igCyR4RI+ytsA2//2v1Q==
X-CSE-MsgGUID: rH5CaCXiT7yBs1iAGsowHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48094175"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="48094175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:49 -0800
X-CSE-ConnectionGUID: eMYspNecTZGwXBHEu/FHEA==
X-CSE-MsgGUID: Gb68CST2QzyQI6kOFSOj2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114906275"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:48 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/4] drm/xe/guc: Don't read data from G2H prior to length check
Date: Tue,  5 Nov 2024 18:30:31 +0100
Message-Id: <20241105173032.1947-4-michal.wajdeczko@intel.com>
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

While highly unlikely, incoming G2H message might be too short
so we shouldn't read any data from it prior to checking a length.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4481890be941..147000fd1177 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1885,12 +1885,14 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_exec_queue *q;
-	u32 guc_id = msg[0];
-	u32 runnable_state = msg[1];
+	u32 guc_id, runnable_state;
 
 	if (unlikely(len < 2))
 		return -EPROTO;
 
+	guc_id = msg[0];
+	runnable_state = msg[1];
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
@@ -1924,11 +1926,13 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_exec_queue *q;
-	u32 guc_id = msg[0];
+	u32 guc_id;
 
 	if (unlikely(len < 1))
 		return -EPROTO;
 
+	guc_id = msg[0];
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
@@ -1950,11 +1954,13 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
-	u32 guc_id = msg[0];
+	u32 guc_id;
 
 	if (unlikely(len < 1))
 		return -EPROTO;
 
+	guc_id = msg[0];
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
@@ -2010,11 +2016,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
-	u32 guc_id = msg[0];
+	u32 guc_id;
 
 	if (unlikely(len < 1))
 		return -EPROTO;
 
+	guc_id = msg[0];
+
 	q = g2h_exec_queue_lookup(guc, guc_id);
 	if (unlikely(!q))
 		return -EPROTO;
-- 
2.43.0

