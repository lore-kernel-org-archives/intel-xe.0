Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D8CF532F8
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635FA10E5B1;
	Tue, 24 Mar 2026 08:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iUY7T0Sa";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5A10E5FF
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ufZU168DJz3ckg42QNE6SHLTZWK/zFjjQ0MDo2BQh4g=; b=iUY7T0SazobgsSl5GpV2FmHPUg
 OneWyMQWyfiUz62NhEZy0a0w2PXrvIDKRlA9bqUCKHZDs0eyumGyA1d0Rg3riAQd/XTyHeuj0KPQJ
 815eRiZN3Rgx49KtYzb3SDeVF5qN3PBPuwwq0Zebq4EVOiHTPCbP6vxySS7r4UZR3wVbmJm0KDBV4
 53vociEGcJo1S6HRd/1G8+javHEBEaNv+gZXDbmo8LyDtbIdbVpuJ658r0e2aeVoML4TcWRVZxWyX
 /xu727IrGAuCOOxJ5GQWcqYw5DBVcQzV8xc1BVSWw5xC5Or1CFggHAzkVA1qg1tC0R4aK+oKM3XvD
 QOSiR5yw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w4xJY-005FX7-H6; Tue, 24 Mar 2026 09:40:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v25 11/12] drm/xe/display: Add support for AuxCCS
Date: Tue, 24 Mar 2026 08:40:17 +0000
Message-ID: <20260324084018.20353-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
References: <20260324084018.20353-1-tvrtko.ursulin@igalia.com>
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

Add support for mapping the auxiliary CCS buffer into the DPT page tables.

This will allow for better power efficiency by enabling the render
compression frame buffer modifiers such as
I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 28 +++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 23a7ec41f01d..e45a1e7a4670 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -56,6 +56,29 @@ write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int pad)
 	return dest + pad * sizeof(u64);
 }
 
+static unsigned int
+write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
+			  unsigned int dest,
+			  const struct intel_remapped_plane_info *plane)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	unsigned int offset = plane->offset * XE_PAGE_SIZE;
+	unsigned int size = plane->size;
+
+	while (size--) {
+		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+
+		iosys_map_wr(map, dest, u64, addr | pte);
+		dest += sizeof(u64);
+		offset += XE_PAGE_SIZE;
+	}
+
+	return dest;
+}
+
 static unsigned int
 write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
 			 unsigned int dest,
@@ -109,7 +132,10 @@ write_dpt_remapped(struct xe_bo *bo,
 			dest = write_dpt_padding(map, dest, pad);
 		}
 
-		dest = write_dpt_remapped_tiled(bo, map, dest, plane);
+		if (plane->linear)
+			dest = write_dpt_remapped_linear(bo, map, dest, plane);
+		else
+			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
 	}
 }
 
-- 
2.52.0

