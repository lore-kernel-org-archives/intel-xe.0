Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D0C49EA1
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC0710E62B;
	Wed, 31 Jul 2024 14:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gya3Lg20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13110E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435846; x=1753971846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYxpsV8GLXYOtbglV72nW/2wf+k1UHMAqKfRqtc42Tc=;
 b=gya3Lg20AVbKpP6D8e+tRRhZ9BwzfiLnYMQu0Sqq+gRB91HZgp47OYF6
 9DFoXMMDf4dfLJxr/RjU/jb+yKj3ihJY6Rd9Len/Up205uSlLFO0D2kZv
 X/ah7v6CEv/4ou3/d8WMdKhD08D5/J4Ka6Cv+DG3HDN8niqw5EH4aQU/k
 UjVOf/47bnUInhQM5k/2CqC/5q2MKU1FHZSfWjBmM2LG9KNy2mrkoudyw
 sKJwy0/Q4MLj4ZMVyhM7jWlH6eqb7ADmTv2id1RwhyCZj4h/jolXzNuta
 EgTKM4ynWEQv9T17SUtDGvodDTFeR+bTrKMr0KdyiOXciamvWM3fG6IiH w==;
X-CSE-ConnectionGUID: uqMybE6GRWuPORkA8/N0rQ==
X-CSE-MsgGUID: UqG6gc+XQ3qAAqMvXAc0mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469179"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:06 -0700
X-CSE-ConnectionGUID: 4vn6yMafS92k9VouIathKQ==
X-CSE-MsgGUID: 5BDDgEmARB+RBVrYGGy0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59500970"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 02/13] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Wed, 31 Jul 2024 16:21:36 +0200
Message-ID: <20240731142349.4101307-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Rely on wait_event_interruptible_timeout() to put the process to sleep
with TASK_INTERRUPTIBLE. It allows using this function in interruptible
context.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..50013e1e7455 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1603,11 +1603,11 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
-	ret = wait_event_timeout(q->guc->suspend_wait,
-				 !READ_ONCE(q->guc->suspend_pending) ||
-				 exec_queue_killed(q) ||
-				 guc_read_stopped(guc),
-				 HZ * 5);
+	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
+					       !READ_ONCE(q->guc->suspend_pending) ||
+					       exec_queue_killed(q) ||
+					       guc_read_stopped(guc),
+					       HZ * 5);
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
-- 
2.43.0

