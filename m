Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028D8C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCC810E7FB;
	Fri, 26 May 2023 12:11:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77D110E7F3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:11:14 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:11:01 +0200
Message-Id: <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
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

We call dma_resv_wait_timeout with MAX_SCHEDULE_TIMEOUT, so it can
never return -ETIME. It will however fail if interrupted, so in that
case return the error.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8735facb1cf9..77ba8492bd90 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -611,8 +611,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						     DMA_RESV_USAGE_BOOKKEEP,
 						     true,
 						     MAX_SCHEDULE_TIMEOUT);
-		if (timeout <= 0) {
-			ret = -ETIME;
+		if (timeout < 0) {
+			ret = timeout;
 			goto out;
 		}
 		ttm_bo_move_null(ttm_bo, new_mem);
-- 
2.34.1

