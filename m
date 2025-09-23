Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF0CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 10:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2A910E5E0;
	Tue, 23 Sep 2025 10:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ISrd4DyC";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316010E5DD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xIvtoM6PaIUwJAw4BDBt6eQnN4IXFyV47EKx0JNGqjU=; b=ISrd4DyC5B/tWcG/fneQIh66jo
 2irgupJv9i0PYfuMVxz+tpkV4C2lFeafzxKP3UmYh2WmB42eDYx2haR04kw3HVeY0oB8R7t9JvBFu
 WefzKJsb5PMIgVZ5YVyne7/QLHPV7cLPWsdymhpmaZFJML5IXuw0WUkJhtv2AlZgvkXyDi8/YZJVD
 bXhnihOiwtOC+zY876wH1oWs8ECGsrxKASrn6BqHVcI2P9WZXb/FzGjulOKjkNjXSLDbM5JUi2To0
 0BTXrDDAZT8p9hu7eIVCqigbfySgRxwJftY8EbuztxJmGNbxGNAKrSzJT5HB0q7YQmJT87NJq7Eo7
 FmujOvBQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0zwb-00GDFU-5D; Tue, 23 Sep 2025 12:08:21 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v12 09/13] drm/xe: Handle DPT in system memory
Date: Tue, 23 Sep 2025 11:08:02 +0100
Message-ID: <20250923100812.88257-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
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

If DPT is allocated from system memory it will be created in the default
write-back cached mode. This means we need to flush it after populating
otherwise nothing works.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 8ee0e6ff323c..fa62312ed9fe 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo.h>
 
 #include "i915_vma.h"
@@ -206,6 +207,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 	if (dpt->vmap.is_iomem && !xe_bo_is_vram(dpt))
 		ggtt_flush_writes(tile0->mem.ggtt);
+	else if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
+		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
 
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node[tile0->id];
-- 
2.48.0

