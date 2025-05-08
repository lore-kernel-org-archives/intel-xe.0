Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA483C3ABC6
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 19:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9E10E012;
	Thu,  8 May 2025 19:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po9ESNRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5BE10E012
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746731278; x=1778267278;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mm+EOlEeTTMdLMdKUeRt0i5SK+BEXT5P7iGwPwl87uo=;
 b=Po9ESNRscBzt6c74yKFev4xwo0D987S92Db2PTF3cOR/GVDBIAIWOUvE
 B1ZBqjdARb2I3wWqXDlRxkWeygrAS0xOe4G/aMX58Gq/TI89AldvLZZfs
 ikX4Db6dy3+0dLOmb+wj5PPfp1YKguiYMrdh2zy+RQKw/+VDbhd1l/Gxp
 5mFDYaox6BAhd9j3weaskYVHv0EginmV9+iC9Iz/HJGdpagXDzZy8ToR7
 V+w8lYHyMeWlXoQ2f3CzklchtfPhUoMjXVG+3cOATQjnYmzKi52jCmrDA
 SPl2UCp+ox8WWBQLMNU5VgIbKD97lKG+bNBH4fIJzsILGOyiNP1TAd+td Q==;
X-CSE-ConnectionGUID: JxoVSvO3SxC347L7Q48jUw==
X-CSE-MsgGUID: SJ7bJxXmR2mjqt54H7B+9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73914725"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="73914725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:07:56 -0700
X-CSE-ConnectionGUID: w9pahP34Q+CUhIh8qhuYZw==
X-CSE-MsgGUID: KDiuancARm6owMpd4VusBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="173570887"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 12:07:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Do not print engine reset message on a killed queue
Date: Thu,  8 May 2025 12:09:20 -0700
Message-Id: <20250508190920.1343610-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

When an app is ctrl-c (killed) any queues running on the GPU have their
preemption timeout set to the minimum value and scheduling is disabled.
If the queue has something active on the GPU it is very likely for the
GuC will trigger an engine reset resulting in the engine reset message
being printed when this is fully expected. Do not print the engine reset
message on queues which have been killed.

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 369be36f7dc5..efff462ddd75 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
-		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+	if (!exec_queue_killed(q))
+		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
+			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_reset(q);
 
-- 
2.34.1

