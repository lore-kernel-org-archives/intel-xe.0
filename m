Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0333710EC4B;
	Mon, 29 Apr 2024 15:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8czW/1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7754110E405
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714405495; x=1745941495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9SWNO2dTYCV9h8yaoP+BRHabtRg+aOjV/hw8MGQE1M=;
 b=K8czW/1caAX0+ny+fk84hrbc5CjWreFhYjXchiF+uA1Cp2L+AQXYDRG4
 vpQXj+n8OkVpnBOdMPPTqBjcI1AngPWSFt42jby7A10D7m/HnfonRvS3J
 w8GFmLHKoJF9eNFJjWCWYQ2GJfOJ0RYYWZLU2sMu7Db7cSuvn4htPSelU
 ZLd3ROI1YHvb2PS6XW6817bETr6+p08tdLFNR9viKTajdokymBxSBpBX1
 1Wvv8r0F/h/U3ofA4THPvZK4ua+r+69u7D7px+0tBDrwkz+H+ErpnYUiO
 bSF/w+TVnLyYummUooH9PbZWMRllEyx4DNe0ggppbfUdHEUCq6oIok9Bb w==;
X-CSE-ConnectionGUID: kUlx0dHhQ6uRzNB8Uukqig==
X-CSE-MsgGUID: sUwFQAYZTV6USBAFqs6M4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20688584"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20688584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:44:55 -0700
X-CSE-ConnectionGUID: 0yEPusjqTtmrfHY5lpCIaQ==
X-CSE-MsgGUID: V5urwS85R46Yh4d7rXDUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26138667"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:44:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add engine name to the engine reset and
 cat-err log
Date: Mon, 29 Apr 2024 17:30:18 +0200
Message-ID: <20240429153018.1520-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240429153018.1520-1-nirmoy.das@intel.com>
References: <20240429153018.1520-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add engine name to the engine reset and cat error log
which should be useful while debugging.

v2: Add logical mask and engine class(Matt)
    Use xe_gt_{info|dbg} (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d274a139010b..72aefabebda4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1702,6 +1702,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
@@ -1715,7 +1716,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
+	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
+		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	/* FIXME: Do error capture, most likely async */
 
@@ -1737,6 +1739,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
@@ -1750,7 +1753,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
+	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
+		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+
 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-- 
2.42.0

