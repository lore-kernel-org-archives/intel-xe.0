Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9D3CD54AB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 08:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF3710E002;
	Tue, 19 Sep 2023 08:46:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118810E002
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695113199; x=1726649199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ITd8ltr9gs5LnMmK/Uv+iCTZ/IZborX+8N87//icc8M=;
 b=U+P8BsnZBIcKjpi4g7DhOxqmg2nHPCmrpROt/NjuFwaizJpQyx4HyAAl
 NE+J0sa1fWtUvsUwFKiGzULjdHQJ0AlZs7TtUj8UBX1E8SlqDg8v2cOWZ
 bRAcsw20Vg249vrGF/ZfS5D/+SetUTnQ/P8C1yVPV+LFI4EfqivTzwxk2
 pzWpXcozdowbbJwuA7DWxVmGUY6SyJCa/JTYDaptZTlgTGIt+nF75LbYU
 +kqtwjr5byy1Yfc5soJErMc7FhpiAQKgOiqOWbHkl9YqJkrmkLyf5T0dC
 t5oiQy1ywqHJXMftk79KVEliJeS+R4YBGTeXITfm3CetY8gym0PZb5z8O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364934254"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="364934254"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="993083677"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="993083677"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:46:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 10:46:09 +0200
Message-ID: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Disallow pinning dma-bufs in VRAM
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

For now only support pinning in TT memory, for two reasons:
1) Avoid pinning in a placement not accessible to some importers.
2) Pinning in VRAM requires PIN accounting which is a to-do.

Suggested-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 09343b8b3e96..bd8d51e7f93f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -49,13 +49,30 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct xe_device *xe = xe_bo_device(bo);
+	int ret;
 
 	/*
-	 * Migrate to TT first to increase the chance of non-p2p clients
-	 * can attach.
+	 * For now only support pinning in TT memory, for two reasons:
+	 * 1) Avoid pinning in a placement not accessible to some importers.
+	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
 	 */
-	(void)xe_bo_migrate(bo, XE_PL_TT);
-	xe_bo_pin_external(bo);
+	if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
+		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
+		return -EINVAL;
+	}
+
+	ret = xe_bo_migrate(bo, XE_PL_TT);
+	if (ret) {
+		if (ret != -EINTR && ret != -ERESTARTSYS)
+			drm_dbg(&xe->drm,
+				"Failed migrating dma-buf to TT memory: %pe\n",
+				ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = xe_bo_pin_external(bo);
+	xe_assert(xe, !ret);
 
 	return 0;
 }
-- 
2.41.0

