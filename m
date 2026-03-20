Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31541099B25
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D86910EA0F;
	Fri, 20 Mar 2026 17:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EiBX3bUG";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9FF10EAFA
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xx3+8tSTQJqmDBQtxFmGi9pVySeekP6amr9tdATHjW4=; b=EiBX3bUGpDk6PB7ZUSVnKXlxW0
 LR8oSqUZ+KZeR2+847W+kpjieoO43PKTZhYwaXCEcz5yrlV1ReL5CZA2eFEhHZLS/FTxaxcA4mM/Q
 ltyGGt6S+he1vhXm1weC9Cbw58zfOdiFewDhTQAy8yK/4n4eTi0EifHmihPzDmY8qkY8MWztic8xc
 +CcQqiUFeOpwH/5bWitKBUtrDkbQmoi5KWONqZ32oMQ5/7ZSrvuM/U8cwxeWU5K+pzbrJD0mNArF/
 WqQQqtHyFjdvkWdpdC3D5rrsSiySPLtWQ9C8GwtydDwZ9D1+sb/4YoOnPdt0wZINQXA8mHKbTl8zg
 69mr35OQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w3dEv-003trH-Ul; Fri, 20 Mar 2026 18:02:26 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v24 02/12] drm/xe: Use write-combine mapping when populating
 DPT
Date: Fri, 20 Mar 2026 17:02:12 +0000
Message-ID: <20260320170222.88625-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320170222.88625-1-tvrtko.ursulin@igalia.com>
References: <20260320170222.88625-1-tvrtko.ursulin@igalia.com>
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

The fallback case for DPT backing store is a buffer object in system
memory buffer, which by default use a write-back CPU caching policy.

If this fallback gets triggered, and since there is currently no flushing,
the DPT writes made when pinning a buffer to display are not guaranteed to
be seen by the display engine.

To fix this, since both the local memory and the stolen memory DPT
placements already use write-combine, let us make the system memory option
follow suit by passing down the appropriate flag.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d4a9eb550cae..df7d305c6fcd 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -122,7 +122,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						   ttm_bo_type_kernel,
 						   XE_BO_FLAG_SYSTEM |
 						   XE_BO_FLAG_GGTT |
-						   XE_BO_FLAG_PAGETABLE,
+						   XE_BO_FLAG_PAGETABLE |
+						   XE_BO_FLAG_FORCE_WC,
 						   alignment, false);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
-- 
2.52.0

