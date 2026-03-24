Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52AFF532F6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443B10E603;
	Tue, 24 Mar 2026 08:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z6xYztdV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2F10E5FF
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 08:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hzZcZKATQuyXkFOSLSfrAT6RV2YpUCGcxlmrcXi6fH4=; b=Z6xYztdVvOqiyuve0dFFIHJ0AW
 AeDE9MSAc2jlqXRYf0bfypvtBEdsRP9lXuSq+iiJvrOqDFX9P5po5l1HwAfh+wHVedcHnOMgjjeQM
 s3D9MShiVZ4qW6D9Wv6L/foBGRjgwVhwBp0jHBa9IZyLUIlSNYZbqKdQgaJFg7yfT+s8IuoRt90zI
 0Q/fAoljDfbfvYOcVDnd6BB/86NsE84slEtix+oGyZEuCaS2DtOf2IKPYgT/OmlGxcJvW4GUYmJwp
 aZ+1lDo/8lynq0Y83ljFTCusccVkf/utc2ax8G0+UHX3EPkvWeOI2nmjnwGgheYG7eSMQ4BwR4Bc0
 I9plIe0w==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w4xJX-005FWz-QK; Tue, 24 Mar 2026 09:40:39 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v25 10/12] drm/xe/display: Respect remapped plane alignment
Date: Tue, 24 Mar 2026 08:40:16 +0000
Message-ID: <20260324084018.20353-11-tvrtko.ursulin@igalia.com>
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

Instead of assuming PAGE_SIZE alignment between the remapped planes
respect the value set in the struct intel_remapped_info.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ead70ee48028..23a7ec41f01d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -83,9 +83,6 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
 					 plane->dst_stride - plane->width);
 	}
 
-	/* Align to next page */
-	dest = ALIGN(dest, XE_PAGE_SIZE);
-
 	return dest;
 }
 
@@ -100,6 +97,18 @@ write_dpt_remapped(struct xe_bo *bo,
 		const struct intel_remapped_plane_info *plane =
 				&remap_info->plane[i];
 
+		if (!plane->linear && !plane->width && !plane->height)
+			continue;
+
+		if (dest && remap_info->plane_alignment) {
+			const unsigned int index = dest / sizeof(u64);
+			const unsigned int pad =
+				ALIGN(index, remap_info->plane_alignment) -
+				index;
+
+			dest = write_dpt_padding(map, dest, pad);
+		}
+
 		dest = write_dpt_remapped_tiled(bo, map, dest, plane);
 	}
 }
-- 
2.52.0

