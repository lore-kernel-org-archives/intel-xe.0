Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1C606A887
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=WrCJsyMI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F84010E2FB;
	Mon, 16 Nov 2026 12:27:36 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6F10EFD7
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832043;
 bh=hJ9lSw9i8Ky8d3yO36Y8A68CZwrAJuvwlL5PUqXi6Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WrCJsyMIlmy4L9h3seogPSjYejFyziuV+BcHnXnrqUjrq08qPJxpTz8HthNUNyG++
 qCfk1u24ZzQSpvpBskiibvEs5Ih7Qs+bYCemQFwWLDgZfLSUlqh9mTH2qFuV3VUy1c
 dRgt/35ep4nXpNocDvpaVvqaUm9CYnRj2QnCCCa0gMuVj+5W2BN9kTH3BDKPiqqtns
 cb5vJmroyf4YN0s3WlyoRCVIMjC0v7k+JRbut5B+iq98aFEm56g4/NIyOcwoV4s7yl
 HUw25JagHjGKGuW/Q5cerR1vnxbwdKXWivKscsJXb3rPehWw0O17cuqgyydMOG1wtf
 Ye7mBoaEEXWXg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 4/6] drm/xe/display: Use the correct calculation for
 phys_base on integrated
Date: Mon, 16 Nov 2026 13:28:33 +0100
Message-ID: <20261116122828.266113-12-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116122828.266113-8-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index a100ad23be2a0..451c24a4ed8d5 100644
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
2.55.0

