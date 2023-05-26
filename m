Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4AAC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0985110E1EB;
	Fri, 26 May 2023 19:06:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1857A10E1EB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685127981; x=1716663981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bGOtQBeaurhwAfkdtYCxhlCbo8gWMmXbm9a6fZEF8YM=;
 b=cgvN0FFryt/oPB8jN4b1ttgD812IyDh35pA9Qf6ZBkswDygpKCfMhIR8
 N2JY89I7sViVejFRdeaRwJ/CzDk/YCcddXpQVNEBZGzefkCslFXhejNa/
 Fws1bIp/KufrQwza1AKu3iTCQP2W/h+G68i/tgni+Vh2UMZVpOneEF1U6
 5rV4+GMWQ102TXxdClSPL9go3ipde0YrjokY8nA1+4MJMQmlPvIZfpfg6
 C93KaeJ9jMq3GhHtWCFok6qQ1niDqeoFatYeJ4CM5jJi8Ekq5uO7KHwfm
 paO5nNOG0EZrV1GWULrXRa/uKVmjsvuuvQJjM+6T16fJHSlXhUnYs6Uue A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440636655"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440636655"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817047"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817047"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:18 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 12:06:07 -0700
Message-Id: <20230526190609.61529-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
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

All the Xe users of dma_resv_wait_timeout() also disable the
interruptable wait.
And doing so this avoids DRM_IOCTL_XE_EXEC fails when under memory
pressure.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0db9c05097d07..6ed7e08269e82 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -609,7 +609,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	    new_mem->mem_type == XE_PL_SYSTEM) {
 		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
 						     DMA_RESV_USAGE_BOOKKEEP,
-						     true,
+						     false,
 						     MAX_SCHEDULE_TIMEOUT);
 		if (timeout <= 0) {
 			ret = -ETIME;
-- 
2.40.1

