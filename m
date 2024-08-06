Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23468C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4F710E3EA;
	Tue,  6 Aug 2024 19:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WutZHlxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7610E3E9
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972480; x=1754508480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYxpsV8GLXYOtbglV72nW/2wf+k1UHMAqKfRqtc42Tc=;
 b=WutZHlxqqAkvq6mTRSBH+DEr+sm3zf2cHrnCXVuCx769w3Z/vF9d8IBL
 V/I00j99sgl3pKsJXFcrQUH4/lDcBI+WMczaFStODmuXYbUnTQzHfGGZk
 imMaFLo809xN4vTblP6U4zN/iMT6vyrVHLkhzeSRwzS+KJkqsy4z/067r
 62aWZ25rbv1KEnBqXM05LLOBCOeW7QL6TQBWGrvyaAlkuPMHgCFS59UKI
 d/72S6zb+WDriXUwV9WCld/mymA8IetS9aWInQjXJkHt+JQ9eesD0SAUF
 16qj4B/VXW2NO8WXFnl1OwPvLUprg+Hht6aUCnj8p+M60IJpFkSXqIwbt w==;
X-CSE-ConnectionGUID: fLNCWn5PRc+NvXCg+MIPkA==
X-CSE-MsgGUID: bpmTfI8PSFOLvQHeXe0yWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682122"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:00 -0700
X-CSE-ConnectionGUID: p+4GLeX4S/ikDYzVnY2CHg==
X-CSE-MsgGUID: zI0MjV2gTqC/DUkPidWxCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585020"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:27:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 02/13] drm/xe/guc_submit: Make suspend_wait interruptible
Date: Tue,  6 Aug 2024 21:27:00 +0200
Message-ID: <20240806192739.1076344-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
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

