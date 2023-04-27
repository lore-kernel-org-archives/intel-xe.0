Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40569C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 11:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA9C10EB28;
	Thu, 27 Apr 2023 11:46:58 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B74810EB28
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 11:46:56 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Apr 2023 13:46:48 +0200
Message-Id: <20230427114648.35124-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove extra xe_mmio_read32 from
 xe_mmio_wait32
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit 5a2be6ba6ba0 ("drm/xe: Let's return last value read on
xe_mmio_wait32.") mentions that we should return the last value read,
but we never actually return it. This breaks display which depends on
the value being actually returned where needed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 5a2be6ba6ba0 ("drm/xe: Let's return last value read on xe_mmio_wait32.")
---
 drivers/gpu/drm/xe/xe_mmio.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index a36c52bc098b..1a32e0f52261 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -85,9 +85,6 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, u32 reg, u32 val, u32 mask,
 	u32 read;
 
 	for (;;) {
-		if ((xe_mmio_read32(gt, reg) & mask) == val)
-			return 0;
-
 		read = xe_mmio_read32(gt, reg);
 		if ((read & mask) == val) {
 			ret = 0;
-- 
2.37.2

