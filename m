Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0317C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244E10F6E7;
	Thu,  3 Sep 2026 16:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNleeg/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B67410F6E7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452184; x=1819988184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OXyXSWhif0E+K2vFJGyhVxMGUACuYeOW5H/UcYxBgHk=;
 b=eNleeg/XLbRQH31IiKldeMA1dZLjfvdOn3yt8WfrKntFR9k7DqBuJrFB
 G651hKan8hVezWrq2S2h1hkt97BOOt/DFt6+fiht3VpZ7w8Bh4UgfEcAZ
 NLplwRzJzUxXlyxd8CAk4B1KLjQE7fqQ/1qv7mf5/khIO0WbwGAN44XIl
 iTrW1syg7BbHmP7Gl7aJOhR4yIyShZQtVb1s7Dcw1GDuujwhb9rL6pnfh
 xfgfd9d2XUfMijnyEcycIoPmua/zFT/YBiecFls1Fl4SLGKtI03xPTJe2
 8zggLb+WMuG429E3+wmwUmJdVTpL8ukoc78luOr1ZhJRv4LGmdTYN81Tr w==;
X-CSE-ConnectionGUID: +4pFcnHfTh6Pw84siIeJmQ==
X-CSE-MsgGUID: Auczb4EySFiXnI2e/oTZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114487017"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="114487017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:24 -0700
X-CSE-ConnectionGUID: DCRjNWFpRe+M3HZHEkWn4g==
X-CSE-MsgGUID: RXrtl4fGSCqGpWvksEsp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268461474"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:16:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V21 05/15] drm/xe/bo: Make xe_bo_is_user() public
Date: Thu,  3 Sep 2026 21:45:58 +0530
Message-ID: <20260903161553.528932-22-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

Export xe_bo_is_user() so it can be used by the VRAM page offline
code to distinguish user-created BOs from kernel BOs when deciding
whether a faulty page can be safely purged or requires a full reset.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d30a8411d2a3..c255327669da 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -161,7 +161,13 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
 	return !list_empty(&bo->ttm.base.gpuva.list);
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+/**
+ * xe_bo_is_user - Check if BO is user-created
+ * @bo: The BO
+ *
+ * Returns: true if @bo was created by userspace
+ */
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 90b15fff36c7..eede678ad303 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -601,6 +601,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

