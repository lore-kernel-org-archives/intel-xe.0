Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DDCA0EF4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 14:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00E10E462;
	Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r9g0lFw6";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CBF10E459
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9jVnDYH17fNlWJ+oMfOnkTqjuPqKGk4UXbfFsfsVJPA=; b=r9g0lFw6lrh4bs/6OyZxElfL9k
 ZKlQ32znCrzmviTPgyom66uokdwEV6FKmygYHW0S3j6PAzgMPeoyLOZ1wvP2d4cguf+Vn3f4Uq6ht
 yszooFZLADP1j6V13onT9JACiLtzrD9irHF/H52VjhTvXTjxy8SOLwdUx16WCXgEctyP8S5MDgv3i
 36H+sUTdZzKO6m+4I3yMNzBHAYNVbE0kptMRN2EakJEKRuGEPJK46xpZicq5K75dQabMDs1WLMDok
 rGGS4RWpIBqY56i7hP1ad3aGeQ5I54bJ0uf2QPQX/Buoihei+grTI36ZgEpHrJ7Q4Q1ae4woDsDYH
 sEppozcg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uo0Vo-00Fs0e-M5
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:00 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 09/14] drm/xe: Handle DPT in system memory
Date: Mon, 18 Aug 2025 15:06:45 +0100
Message-ID: <20250818140653.86787-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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
index 460e330676b3..5819895f5a48 100644
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

