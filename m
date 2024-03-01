Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F21C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 22:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AE610ED73;
	Fri,  1 Mar 2024 22:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mlbpmkok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBA310ED6E;
 Fri,  1 Mar 2024 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333352; x=1740869352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrXy3/HMqneGquGtKBpQ1rrLkPt9qOmW7CvwNEfyaH4=;
 b=MlbpmkoklQju4spCmxFXFAT98vuwD0tzPgKCkQszhSUZ9JM5qHAe5eHr
 37/oJmNV/TgJrjTaIejOhiMBE8KdIetKajbPR+Ol6OBU9tlalduPdImp9
 AWidxdvSGoN1tdQ8CBZlnwTagKhdjAaKxlFLej3l5pCF/KzaNjKioBVpt
 TE9sbDs23/sXyBhw8I+DnpKDQ1HvzlgTxGxDMS5zZxsnh/3u1KLFmNRDx
 95w/rEKf09oLqw5Khum+c9WhJyJ93xegpC2Gu5q6ooYLC+BBxvNBsy1gs
 j+eVIbHqZ4URfWc6UmQCoMh0WbVMKNCZC21i/pxF7wImAffVsYl8UFM8k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752202"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870693"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 1/4] drm/xe: Remove used xe_sync_entry_wait
Date: Fri,  1 Mar 2024 14:49:16 -0800
Message-Id: <20240301224919.271153-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301224919.271153-1-matthew.brost@intel.com>
References: <20240301224919.271153-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 8 --------
 drivers/gpu/drm/xe/xe_sync.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..c836a5f3a1ea 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -200,14 +200,6 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
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
index 0fd0d51208e6..cb88715ac9af 100644
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

