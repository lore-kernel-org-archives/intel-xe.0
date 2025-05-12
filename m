Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B97CC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 08:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206410E2FC;
	Mon, 12 May 2025 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M5nLi2AM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B08C10E2FC
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y62ZmP4kfFAF4BOBOj+WQjgGDb3EePE++10NHRYxTY8=; b=M5nLi2AMTyVkwcLz7JgXxOd61u
 6H87Z8Qq5yHyrwoXBNPwEw+m9IDggJ46vJudE/y9LTo3bw78HCMVtGspAXBq4QBQ4iBoTHQkHR69m
 6Zh8X33DYIyYizVV9olIsD2UIR8klLZzoyQPEHuuxUYns6qZqUOztvjaCgxoPP3dRf4BqikrUDjl1
 JmLY14cYKOT96kiJixpdMiU29DHn61c/n8Fa+Dvhn6sOjjNUh4ovP+7jIGL4pJOmkgbVYooMGvtg9
 p6IK3r3WqwJJVopme66eCegr2TvRsVrxyPqgy4D/kB3bSUGR3MTone3C0R4VvhuG8aNllJwBfsJsl
 blryUxBQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEO1e-006xfe-I8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 10:01:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Reduce DPT table alignment as in i915
Date: Mon, 12 May 2025 09:01:55 +0100
Message-ID: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

There is some magic going on with DPT alignment values which are
multiplied by 512, and then for specifically pinning the DPT table
scaled back down.

Make xe do it in the same way as i915.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d918ae1c8061..ce6595be2442 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -327,7 +327,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 	vma->bo = bo;
 	if (intel_fb_uses_dpt(&fb->base))
-		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
+		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment / 512);
 	else
 		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
 	if (ret)
-- 
2.48.0

