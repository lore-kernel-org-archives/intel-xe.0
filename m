Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04C2C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDAE10E0D1;
	Wed,  2 Jul 2025 23:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxqW7veO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3BC10E0D1
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499642; x=1783035642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cSDoG33bIEcs1eowsRc7ccUW6w009+m8KjNBCbK4SpA=;
 b=WxqW7veOaY7ubAACARcXm5f3jUvFTcXRMppYCP3xIyVAzgplFJ5pYfsp
 luoBM7/wr1M/j/eywx1pZbhLhWuFgyttO3mwuVe3DJSNwByLEQtAWfrAG
 ZW2xEnICyZbm2sxcc0ZJ0NqAonIqo22CsBOcw/4Ui/I338bUwuKtDBiQW
 6WQipKDoTmrusmjFsSC3ZJteU0S/0TYQVE3I+KOLxhbYeOScDlgX5tFWO
 vVhFS5XYlHdZ7h2NqegxqxsBV2AvbPKFjxa99hGRK3SLlUW3ynXI/Oo9K
 7V+wnItyWWFC78hdCCwy8AiUfRDoG9o6FQtHtqMMUyfbLrLkeb4Z4Ybiq Q==;
X-CSE-ConnectionGUID: /NOpd2dFRSumay19eQ79FQ==
X-CSE-MsgGUID: QO23wsPaSlOTkqJYkw9PmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489470"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: 6KgeuJ1jSFuOKlp35ci/4Q==
X-CSE-MsgGUID: x4/37gO3SvaLPKUX9wkllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624523"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 1/9] drm/xe: Explicitly mark migration queues with flag
Date: Wed,  2 Jul 2025 16:42:14 -0700
Message-Id: <20250702234222.3278264-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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

Rather than inferring if an exec queue is a migration queue for a flag,
explicitly mark migration queues with a flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c          | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..abdf4a57e6e2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -87,6 +87,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 /* flag to indicate low latency hint to guc */
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+/* for migration (kernel copy, clear, bind) jobs */
+#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0838582537e8..b5f85162b9ed 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -437,12 +437,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
-					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
+					    EXEC_QUEUE_FLAG_MIGRATE, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
-						  EXEC_QUEUE_FLAG_PERMANENT, 0);
+						  EXEC_QUEUE_FLAG_PERMANENT |
+						  EXEC_QUEUE_FLAG_MIGRATE, 0);
 	}
 	if (IS_ERR(m->q)) {
 		xe_vm_close_and_put(vm);
-- 
2.34.1

