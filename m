Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B9CCD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 19:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129E888C3D;
	Fri,  8 May 2026 19:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGbos3Fy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D5C88C3D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778269477; x=1809805477;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iYtJhNK3Bx0P6l1k41wx72mSUutgGcNnafuSlPZdvbU=;
 b=UGbos3Fyb0pCSRDP+66BsuQT/vRcbQsI0j3X3z5z93WefKJorMl4zud0
 ZPeSGJL6AX985gwMgHqmpjME2XI6M6neYmGz7n855BkIY5IR0CQOwd/4h
 br2DFnX9w8I0e1TwaTUBB95QKmsQeYnt+pcEwzkdMnvv6TAVIYVdeRiVZ
 Jwn1MF2wsS825tK58Qibrrywsb2bxRd4eJgo8NQndixDJu+jge73kRKV1
 S89eezTY2QAs3kIMfhhpvyFHXw8s4XWH8ZcIl6K73T5Ik2gzlSfMVMobL
 zsW3falRYoszNtPzMq+0P9zd0vfTNtUguxc8ghtQAfNhsQjYknaqbjmOv Q==;
X-CSE-ConnectionGUID: jX+uChW5TyylyK2xiG/WHA==
X-CSE-MsgGUID: s18Oh9qXS2uM//ajP50pzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66776802"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="66776802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
X-CSE-ConnectionGUID: In4okdnlRnqlAzNTj3LtcA==
X-CSE-MsgGUID: P8bcDONKRiGFAawQ45BTTA==
X-ExtLoop1: 1
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/multi_queue: Remove redundant assignment in
 guc_exec_queue_run_job
Date: Fri,  8 May 2026 12:44:28 -0700
Message-ID: <20260508194428.61819-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
References: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
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

The 'killed_or_banned_or_wedged = true' assignment is redundant
since the variable is never read after that point.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b1222b42174c..104e65913dff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1216,10 +1216,8 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 		if (xe_exec_queue_is_multi_queue_secondary(q)) {
 			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
 
-			if (exec_queue_killed_or_banned_or_wedged(primary)) {
-				killed_or_banned_or_wedged = true;
+			if (exec_queue_killed_or_banned_or_wedged(primary))
 				goto run_job_out;
-			}
 
 			if (!exec_queue_registered(primary))
 				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
-- 
2.43.0

