Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6227EC52D6D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D24110E965;
	Thu,  1 Aug 2024 12:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uz9mDEI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED5F10E965
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517109; x=1754053109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9EPgmcOoww9zrLQzfm0C4sNRIlStiPEColufS96cx8=;
 b=Uz9mDEI0C4ZkuTJAfYjL5jNaJl8DWc2org7cQvCVPKT2WhsdNOiwSy/C
 48qCbERKvakNuoKR22fa22wWxk/45ep5xXoOV/K86EF00GeNcKKC/siYx
 YfYjEGwGaRl9xOIZORr6pIkaD/gRV5wXK9EKtqa86aJbAClxHsIDKJ8aG
 uI6mi7Mhixts+s80G2hlRMaQSWY7dKUBxdIfVbjgCKaa5oPk6Zi22GYEy
 f9TNZJI06FDb/nkGiFIeW/CtiWzZpQJ7hbdgRWwztnC8KiEzHHUKL6i4T
 VumUJ/Uv+xAwqDMQplr5qY7Ml+vGwR4rFjGVxHZPKxqUlRjpLUMIN9S5Y g==;
X-CSE-ConnectionGUID: gp9G7Lo1QueqRdJ+LB+9RQ==
X-CSE-MsgGUID: 33kLXcV/QsSp90s0qRMlpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357161"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:23 -0700
X-CSE-ConnectionGUID: TQd0X4KPT62G3Lb/XPId7g==
X-CSE-MsgGUID: e0objxQ7R3WPp5zMDjE2cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110112"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:22 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Date: Thu,  1 Aug 2024 14:56:51 +0200
Message-ID: <20240801125748.355078-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
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

Make it safe to have multiple calls to guc_exec_queue_resume() for the
same exec queue. This allows the use of this function from a context where
knowledge about prior calls is missing. In this case the function does
nothing but at least it does not fail on assert.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 50013e1e7455..782561b21d24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !q->guc->suspend_pending);
+	if (q->guc->suspend_pending)
+		return;
 
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
-- 
2.43.0

