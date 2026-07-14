Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE79C4450B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 16:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09AD10EDF7;
	Tue, 14 Jul 2026 16:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="UsL3X29G";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7218F10E9DA;
 Tue, 14 Jul 2026 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784046460;
 bh=8Yj+XzhBkj+3eDFn41zxHZ0OWUysDQ+VJqoDx4Rq6Fw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UsL3X29GkH4LIiIQKgtsan56ZvgJBW2MSkmlf1VYRkwzcOKJwBV64FLgXsAnc/lFf
 oekTmzbtxnOE8h2cwQLZdQqiMfGa18W8aUE9VKq9Kiu54imrQVzvg6h80aDCNWjaAO
 ozyRM6Srr6SVln71Rl2vGRV1zup+jWcid30mVP3/++fIP2IhgyW5s/aej8JmigNvrh
 eWCqgRVHIGRxtGqPzq2V6ocCI+ESyEBo1pqW665yDAHUp4Qvno1q2AkUyXKuJlTUio
 ovxAdI0Ro0i/Aqwxq+MO6ePNiWZQb/1aoZprxRwVvGF4BCPNjBdI9y+8I/gwHTEU2Q
 ocVwL7lFFKD8w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 5/7] drm/xe/display: Use the correct calculation for phys_base
 on integrated
Date: Tue, 14 Jul 2026 18:28:22 +0200
Message-ID: <20260714162824.2063637-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
References: <20260714162824.2063637-1-dev@lankhorst.se>
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

The code originally assumed there was a 1:1 mapping between
stolen and GGTT offset. This is no longer true as of MTL, so
perform the correct calculations, similar to how they're
performed for the DGFX case.

Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 8127384fa5bdf..275cfb13fbbd0 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -101,7 +101,7 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
-		phys_base = base;
+		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-- 
2.53.0

