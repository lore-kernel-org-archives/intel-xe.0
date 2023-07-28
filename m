Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63605C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 02:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F0C10E1E8;
	Fri, 28 Jul 2023 02:37:52 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BEA10E1ED
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 02:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690511869; x=1722047869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FIBRBR4uPMal0bk4Maa7X0f3XN3yMQIAWULZd8wuyrc=;
 b=JekHwIrfcO3AMMq880RKL5hwL92ZU2J8t735/5AWpDSyd11jqqEEmhGZ
 ACWE4cMDLUNTzTjnkONFLM4A/XJHYqKeNXZIoNh+RtRFXj1Q+Jn3LcZLq
 Gz+frcQN1rgL2XNOaY4pFjhIv0sKz9/aBDmmc1KkKfbvSND9pCxxxVZEm
 8eM4N2N90iMG3nj0NDm2fK3+tWyuL+VHBRy0XI96Ru11GPrBI7mQPBSvN
 S5tExHgXO28R0t8IOOSlS7Exqw/t2Y0glAi/xJYmrnBmeqf7UbfiC4LXH
 73zR+ErCNjky7s7m8LmeQIhqu99c5SzB/FTfbF5upUXY9LQN5xi3QFrlJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368504244"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="368504244"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797251335"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797251335"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 19:37:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 19:37:42 -0700
Message-Id: <20230728023742.22220-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add define WQ_HEADER_SIZE
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

Previously used a a magic '+ 3', use define instead.

Suggested-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d623cd9f6cc4..5efecbc18836 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -557,8 +557,9 @@ static void wq_item_append(struct xe_engine *e)
 	struct xe_guc *guc = engine_to_guc(e);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
-	u32 wqi[XE_HW_ENGINE_MAX_INSTANCE + 3];
-	u32 wqi_size = (e->width + 3) * sizeof(u32);
+#define WQ_HEADER_SIZE	4	/* Includes 1 LRC address too */
+	u32 wqi[XE_HW_ENGINE_MAX_INSTANCE + (WQ_HEADER_SIZE - 1)];
+	u32 wqi_size = (e->width + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
 	u32 len_dw = (wqi_size / sizeof(u32)) - 1;
 	int i = 0, j;
 
-- 
2.34.1

