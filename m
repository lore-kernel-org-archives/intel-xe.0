Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691E6CCD18E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2913210E146;
	Mon, 13 Oct 2025 16:03:34 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD85210E146;
 Mon, 13 Oct 2025 16:03:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id CBC653F0F9;
 Mon, 13 Oct 2025 18:03:29 +0200 (CEST)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v2] drm/ttm: Avoid NULL pointer deref for evicted BOs
Date: Tue, 14 Oct 2025 01:02:51 +0900
Message-ID: <20251013160311.548207-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aOw1FA4j522F3yTr@lstrano-desk.jf.intel.com>
References: <aOw1FA4j522F3yTr@lstrano-desk.jf.intel.com>
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

It is possible for a BO to exist that is not currently associated with a
resource, e.g. because it has been evicted.

When devcoredump tries to read the contents of all BOs for dumping, we need
to expect this as well -- in this case, ENODATA is recorded instead of the
buffer contents.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271
Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b47020fca199..a101ff95b234 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -434,6 +434,12 @@ int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
 	if (ret)
 		return ret;
 
+	if (!bo->resource) {
+		ret = -ENODATA;
+		goto unlock;
+	}
+
 	switch (bo->resource->mem_type) {
 	case TTM_PL_SYSTEM:
 		fallthrough;
@@ -448,6 +454,7 @@ int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
 			ret = -EIO;
 	}
 
+unlock:
 	ttm_bo_unreserve(bo);
 
 	return ret;
-- 
2.47.3

