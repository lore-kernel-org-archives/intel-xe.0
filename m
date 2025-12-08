Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A52D3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E0510E457;
	Mon,  8 Dec 2025 19:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LhTRt3dE";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0A510E457
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 19:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Tmp4j4EeR9gwxtKF5akyG5lm5fke2y/c34xliVCL/0=; b=LhTRt3dEx+I315PLKzPOSR8ZJs
 1iaWZYAIQ75mPzjneQA2iYN9Wak4DA5sRSto8yjhZwA4S5foKoxy6eOG23V9gMiST88OsQcSdgxTh
 RGNknMVm5l+Au2Y9ecUcGXc+A1mIC0k75Jcku9NKW5PR3nsYX0V94fF9UwIhvUTKhKIKfdBAKBrOL
 7pc4mnO4L2UtRPjlLT88vtkWQ36MfaHjPTBoT3B6rzpYwKei/DL0uP3mbZ9fIT0Zevsq1aCT0aW03
 kLKdpI0fojeSpgtElmSdhkLOa5EqQ/ksmjAyqzaFCf+/DoPoHEo32XxYErBbmth29iPBHS6kBYver
 u5phO6jA==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSgjk-00AC7d-Us; Mon, 08 Dec 2025 20:17:33 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Date: Mon,  8 Dec 2025 20:17:17 +0100
Message-ID: <20251208191722.7194-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208191722.7194-1-tursulin@igalia.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

If DPT is allocated from system memory it will be created in the default
write-back cached mode. This means we need to flush it after populating
otherwise nothing works.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a22a9182dadb..89ee68c40329 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo.h>
 
 #include "i915_vma.h"
@@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 					  rot_info->plane[i].dst_stride);
 	}
 
+	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
+		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
+
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node[tile0->id];
 
-- 
2.52.0

