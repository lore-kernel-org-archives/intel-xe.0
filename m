Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EF6D64077
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6610EA24;
	Fri,  8 Nov 2024 17:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjN4psJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727E710E28B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087764; x=1762623764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=scI+7zHazztgR2/aL8ApyicgcJTanbQd/sFF0nwhb5s=;
 b=LjN4psJ7tcGPEYqHG3h2U/0MXz4X5Dg42bOfxS4opDrmU3gCQH00eRs+
 ZdMBZJ5mKWOqMN78jGHjyVpa2XXdEdHXznvCsn1IS1DHrAE4EHUOtMXyh
 wUDRXeS36KOO8kUO9e0KLaAfJ20TvfYfWl1TDsaCv+c9gKP40awGggTcc
 9KWWuQlPevTXcZSEth1UQxCCXAYifZHgy0geAoWebSOECsW/VKuABZoUO
 B3uzVvgO5NPj1OM6oj+CJMLVhsCcWuS3k3ccO3H7dCWIJ9O3dHVDMH9M5
 dAND6p9BSdRsHbqioC3qvpb8jNBHIxSiSNmrTXbPPnlX7FgMu11qe8Kzi Q==;
X-CSE-ConnectionGUID: OJebiuJbTUOp4OiZtuqVYg==
X-CSE-MsgGUID: lWMcYGEeTBeAqnlWkTOAvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598611"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: FHlgxmveRDK0d3PL3GoKMw==
X-CSE-MsgGUID: C8MLPmyZRvOGTX67C5qxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001294"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 4/7] drm/xe: Improve schedule disable response failure
Date: Fri,  8 Nov 2024 09:43:09 -0800
Message-Id: <20241108174312.272792-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108174312.272792-1-matthew.brost@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
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

Print Guc ID and take devcoredump on schedule disable response failure.
GuC ID is useful information and a schedule disable response failure is
possible the LRC state is corrupted so a devcoredump is helpful to debug.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e7257c681278..2cf4750bc24d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1129,7 +1129,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (!ret || xe_guc_read_stopped(guc)) {
 trigger_reset:
 			if (!ret)
-				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
+				xe_gt_warn(guc_to_gt(guc),
+					   "Schedule disable failed to respond, guc_id=%d",
+					   q->guc->id);
+			xe_devcoredump(q, job);
 			set_exec_queue_extra_ref(q);
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
-- 
2.34.1

