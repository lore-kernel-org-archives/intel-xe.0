Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C62CF9C6E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47710E155;
	Mon, 23 Sep 2024 12:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGr3Mmky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C41A10E155
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727096329; x=1758632329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dhota6ZRa8gSMVvg6L1pExd2OHSp/ITitwGX9WjVgdw=;
 b=oGr3Mmky5IoIZTJQoT3+3fMgdkSp08R/t7bfVtbl/MDqsG1S2ISurIsv
 uPuK9haUWLwnBeMxPH6cNt/nPfkwh8xSexJwFGAbyA0eteSKClQqks0wY
 lCDuMzIFqoHHKDXlxGjqgmBENvCYjISJdqEM1XfW8bpFOi8FRL9GHfOvw
 NHKkT7Zhy6qmyJ/YyGBlz2ur/2jn4150sc/eFuIuibFRo3ojXXbL1wJj/
 d5cLLxjA7DicMLt8OtHnlsMlJ12KMpTc1aRsniF8kVhlMdJ2WKlhm1oGk
 HNygaXcEPLgGxX+hkfLvNHqgIASjKuZ6m3Dgyt2wDsXZ/diKa+ZYb7527 Q==;
X-CSE-ConnectionGUID: ai+FL+N9S7qIdLPk1wpxJA==
X-CSE-MsgGUID: ComiZz04Sk6LIRAdN9kryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26160081"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26160081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:58:49 -0700
X-CSE-ConnectionGUID: I3qxIMHYSmiLZzEMg4cK4w==
X-CSE-MsgGUID: p4vE7sh7TKqsJF5rd0OnKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101910412"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:58:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/queue: move xa_alloc to prevent UAF
Date: Mon, 23 Sep 2024 13:57:35 +0100
Message-ID: <20240923125733.62883-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923125733.62883-3-matthew.auld@intel.com>
References: <20240923125733.62883-3-matthew.auld@intel.com>
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

Evil user can guess the next id of the queue before the ioctl completes
and then call queue destroy ioctl to trigger UAF since create ioctl is
still referencing the same queue. Move the xa_alloc all the way to the end
to prevent this.

Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7f28b7fc68d5..a1d4b9b0726e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -635,6 +635,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	q->xef = xe_file_get(xef);
+
+	/* user id alloc must always be last in ioctl to prevent UAF */
 	mutex_lock(&xef->exec_queue.lock);
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
@@ -642,7 +645,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
-	q->xef = xe_file_get(xef);
 
 	return 0;
 
-- 
2.46.1

