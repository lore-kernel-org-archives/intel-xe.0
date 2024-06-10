Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB9AC27C6E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E5E10E493;
	Mon, 10 Jun 2024 14:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir7oakVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE8910E483
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718029081; x=1749565081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=93JYQmWidhOqURHaWGP9qIgfYTQt2W3nl8OWtjyjqq8=;
 b=Ir7oakVAyxwiHY5Y6m4lRHWy2Z7fvl5KL8NaDRTuOIaLnH8A04IQ9eYr
 7xdWu3c1QJvZITVspYe/NuzPqwUJgbBiH7Fv3cjIJ6ZXt9vTvTlUJ7e9T
 PhScOiRrbfmjznSlc/a07H4MPCHZPrCiFxqnX2Rwx187j65Y8sRDP4SKG
 xK7DV2/lifIQOG34Q5I/W81xPN3pBvRjS0shW2kMwl5rPE0FweAsEnRdL
 MY2iOijzWuLSf8wsUb8GEVdx9hKwjGq2zksoRlgsS6A/4CNUgwDigwl8L
 8/5W0DXuk7UrPDx/s2pDzyudW4UO2ZdbFCxaweppc/fmqzxeT0h5YSKR1 g==;
X-CSE-ConnectionGUID: iCMhuF0xSJOMeJsZb6+Z6g==
X-CSE-MsgGUID: Mu8Fyjr0R0+A9uWfbQxHNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14864874"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14864874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:52 -0700
X-CSE-ConnectionGUID: V4vJb9PATvudPctojWCf5Q==
X-CSE-MsgGUID: avXWbj9LSSKwOsGdQf30aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="70238699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:17:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 09/10] drm/xe: Add killed, banned,
 or wedged as stick bit during GuC reset
Date: Mon, 10 Jun 2024 07:18:22 -0700
Message-Id: <20240610141823.2605496-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610141823.2605496-1-matthew.brost@intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
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

These bits should be persistent across reset, treat them as such.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e1535c2d8f3..3db0aa40535d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1444,7 +1444,9 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
-	atomic_and(EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_SUSPENDED,
+	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
+		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
+		   EXEC_QUEUE_STATE_SUSPENDED,
 		   &q->guc->state);
 	q->guc->resume_time = 0;
 	trace_xe_exec_queue_stop(q);
-- 
2.34.1

