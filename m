Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88291D597AF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597C10E674;
	Tue, 12 Nov 2024 21:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fY5GFMey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA26610E670
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448523; x=1762984523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HD94aRZNHHzBQgyHfHawtfzy1h9kEF3BGBpM5A/mjrM=;
 b=fY5GFMeyuIQDAOuiajNJD+DrE6fJxiRnVeYsS+TgA96+R5LiKYeOebcL
 XnSNh2QnscmIeqX9ihff/aCNGJES7JDFYAURTC46u8oxilsYnvx2Iwope
 MLLb5F7UgQ47GOs4xVJombj4LwblNgW3S2QBK9O24OYfWzUvMTDRICUWu
 Myl9Bj7nQvIScMFbnjN9tOF0tqOYgrry1PU8NXxHfMe7LO5VUEaHDur17
 lMHaSmR4s7lMj00ozOM9hvc4VjjFhaU7+ucT8ETUXrsQ0UzBrulUW2Bpl
 HL/avYNT7mMrlECidgyun/LBN8TYTE12Z130vo2LhgTpxehZMHvSoHHmZ Q==;
X-CSE-ConnectionGUID: NRv7cR15QZ6SpHWcOXf7Xg==
X-CSE-MsgGUID: iAF+oSLzT8Cdbkx4zYueXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190112"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: MDvug9h0TDaaLbsntqJGzQ==
X-CSE-MsgGUID: oT8746V6TSKO954TGjEuiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050236"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/xe: Improve schedule disable response failure
Date: Tue, 12 Nov 2024 13:55:51 -0800
Message-Id: <20241112215553.1369146-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112215553.1369146-1-matthew.brost@intel.com>
References: <20241112215553.1369146-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 663ad4d97b34..3d61c650c0d2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1124,7 +1124,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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

