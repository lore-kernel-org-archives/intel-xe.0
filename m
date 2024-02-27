Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35A4C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 02:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7643710F297;
	Tue, 27 Feb 2024 02:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm9hUgB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD7710F298
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709001809; x=1740537809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=llhE7lrpldPBrH40lGfw6qfJxnOBjUcIAuiwEhZeX/8=;
 b=fm9hUgB22PHdcazahHN3Tosq/+6/glxDPhPrMX5claQhz9QV2hDv3Fpj
 TjDZeiFJ1Vg9noH1T6CGe3hvwsI60zfxuJ33uj9FQZDUtS9k9Jg3pmOJY
 Bb+p3/eybFfh0ENder5b+II46wR+F4k3XBvZefdz4kLRGyrKZ/nFsSRxj
 rHWYrQNAho79o7AZJnV+TqY4xDRFu4eFMHvkMNHAifTsLjjXdcEOyVvq1
 WYM74HgxcjneMz6nsnhceextWkq21RsWCkYdHg4KfzuHzRdhZZJEQZM1U
 E6T9rH00D7ci5iW/4CNzHBhyev+uXb8ghBPFVhjan3bdPDKbqfWxutCKa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6275537"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6275537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7094011"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe: Remove used xe_sync_entry_wait
Date: Mon, 26 Feb 2024 18:43:35 -0800
Message-Id: <20240227024337.141585-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227024337.141585-1-matthew.brost@intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
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

xe_sync_entry_wait is no longer used, remove it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 8 --------
 drivers/gpu/drm/xe/xe_sync.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index aab92bee1d7c..da8799bf7237 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -198,14 +198,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	return 0;
 }
 
-int xe_sync_entry_wait(struct xe_sync_entry *sync)
-{
-	if (sync->fence)
-		dma_fence_wait(sync->fence, true);
-
-	return 0;
-}
-
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index f43cdcaca6c5..8c231ce643c4 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -22,7 +22,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags);
-int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
 void xe_sync_entry_signal(struct xe_sync_entry *sync,
-- 
2.34.1

