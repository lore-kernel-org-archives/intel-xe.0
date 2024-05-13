Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0FC25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 10:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341D710E636;
	Mon, 13 May 2024 10:47:58 +0000 (UTC)
X-Greylist: delayed 618 seconds by postgrey-1.36 at gabe;
 Mon, 13 May 2024 10:47:56 UTC
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D7610E636;
 Mon, 13 May 2024 10:47:56 +0000 (UTC)
Received: from abreu.molgen.mpg.de (g34.guest.molgen.mpg.de [141.14.220.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7B18161E5FE01;
 Mon, 13 May 2024 12:36:59 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/fbc: Add sizes to info message about reducing fb size
Date: Mon, 13 May 2024 12:36:51 +0200
Message-ID: <20240513103652.371721-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.43.0
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

The info message currently does not contain any information, how much
the stolen memory size should be increased.

    [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.

To be more useful to the user, add the sizes to the message.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b453fcbd67da..e4a5d251013f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -801,7 +801,8 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 		goto err_llb;
 	else if (ret > min_limit)
 		drm_info_once(&i915->drm,
-			      "Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.\n");
+			      "Reducing the compressed framebuffer size from %d bytes to %d bytes. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.\n",
+			      min_limit, ret);
 
 	fbc->limit = ret;
 
-- 
2.43.0

