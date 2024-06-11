Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF08C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964910E19B;
	Tue, 11 Jun 2024 14:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rvte4ZWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720810E19B
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116832; x=1749652832;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nH1OI+Gaa6aawJeckmX0v7P2Vr+sFZhmz9cSBW4HZRc=;
 b=Rvte4ZWQRNSnmPOlv9H9ByjhxnHcW7lGJmhvMty02tdoQmjbfYoyOoU1
 WDefO1fxIT3/TRVnH8+3A8rUhsfuchaqgltpaRw77E7MfmcMVDSylRhxq
 kn7//Wh1AOfh8DJ5awPUYbLvxai8mWvz+neqP3oAru/8v7bBq7EgJc5oo
 f1y37XrK2I73580iSUAv6eLGq9iASqOhwS3PU4tJgV2M8tC2IBUMn2dD+
 nd+nKHwEaFkQ5NTCaqO1AzeRSdt8jQFlqWXu0PK/pXzZyIT0JiYG5ZVme
 fy5eabxGvxjiG5cYPJEeXhB8PDEnJ8jRo2tH7Gqlbtvkzsa1nUk7FL8Or w==;
X-CSE-ConnectionGUID: XTvhuhlyS0GTy4KlwJfeQA==
X-CSE-MsgGUID: tZPM/xMIQueL8woaVbg0QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784568"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:21 -0700
X-CSE-ConnectionGUID: +D5cdbPkR/Gm6cJHvZTGWA==
X-CSE-MsgGUID: sJE9wPdqTge2zHKoESnD+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590321"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 09/11] drm/xe: Add pending disable assert to
 handle_sched_done
Date: Tue, 11 Jun 2024 07:40:51 -0700
Message-Id: <20240611144053.2805091-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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

Will help catch bugs in GuC state machine.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 26c27ca51b2e..25240b50a59c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1611,6 +1611,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		wake_up_all(&guc->ct.wq);
 	} else {
 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
+		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
 
 		clear_exec_queue_pending_disable(q);
 		if (q->guc->suspend_pending) {
-- 
2.34.1

