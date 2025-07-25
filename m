Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0264C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 14:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F0410E44D;
	Fri, 25 Jul 2025 14:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cQZ57ZlC";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDA410E44D
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0mvJVozmOUTHc8gNztEhLXBo4UnefXyXl/22t4eVf/Y=; b=cQZ57ZlCCAr8bW/ouhFwAzS9Wt
 I+DLyE1RwIGcQV1rO4r7YF8dEqXPZ7dcZ2J95C2Bc63ysW9HR3nIhJavgndPdXkqcEYETHZA8GXFT
 cwkxqkakzIJyWTVLCm491NzqTd1pwjYqq1eO/8Ii0g8UfXncOriywOO5HAR9qwrzrye0LPNrF87qR
 VaTuFjARKVX7x8Xj450mfr79pAHYGLvuRBxwzJwhHml1tpQjwfYpmRN0NoIn2hQfzKQZSP+Mv96sA
 JrN6e16G461cIQj81BVB9jRNX8GLNiD/TrPDOcvRB1LWVPvUZfrJ3HfJuMB0IgRyR3QiX2tj5KGtI
 aztVy3Ug==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufJNE-003kME-2f
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 16:26:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 1/1] drm/xe/display: Add support for AuxCCS
Date: Fri, 25 Jul 2025 15:26:11 +0100
Message-ID: <20250725142611.94139-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
References: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
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

debug

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index f1f8b5ab53ef..8c2f404ab303 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -141,7 +141,17 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		const struct intel_remapped_info *remap_info = &view->remapped;
 		u32 i, dpt_ofs = 0;
 
-		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
+		printk("write_dpt_remapped plane_alignment=%x\n",
+		       remap_info->plane_alignment);
+
+		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+			if (remap_info->plane[i].linear)
+				printk("write_dpt_remapped [%u] linear offset=%x size=%x\n",
+				       i, remap_info->plane[i].offset, remap_info->plane[i].size);
+			else
+				printk("write_dpt_remapped [%u] tiled  offset=%x %ux%u src_stride=%u dst_stride=%u\n",
+				       i, remap_info->plane[i].offset, remap_info->plane[i].width, remap_info->plane[i].height, remap_info->plane[i].src_stride, remap_info->plane[i].dst_stride);
+
 			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
 					   remap_info->plane[i].offset,
 					   remap_info->plane[i].width,
@@ -149,6 +159,10 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 					   remap_info->plane[i].src_stride,
 					   remap_info->plane[i].dst_stride);
 
+			printk("write_dpt_remapped [%u] to dest=%x\n",
+			       i, dpt_ofs / 8);
+		}
+
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
-- 
2.48.0

