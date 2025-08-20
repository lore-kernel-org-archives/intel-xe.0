Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12728CA0EF8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 09:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAFF10E35F;
	Wed, 20 Aug 2025 09:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZVXNxUuo";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F5D10E6C7
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sNoSrCtA1lLEaZFc5bA63Q0znJHXfriyAqlF1jmyJVQ=; b=ZVXNxUuoGIulXx1EsJiFO17Ekf
 RhoY7kS3SQrkQO9+3Vk2KVXc5Pdsq3nqaFHGkSoBT199aum3vG4JBuT5kf+1VjI4cU/Y4Zxg3fRE6
 5yGruYf430ApIT0byPEJRbQJ6Zppz13mKF5MBOmi/VX2wYMJs6VGzLmL7ryo4OytmNjrAg0fnl+AY
 NK9uFFQ8T/jrjr27b9MYp5J5ffT29VNvXDpRViaAS7UVfxjZKRQGKNKAj5eqRPZhaBhwdWaWa+Izl
 Fegqv+CJW0eQM9aYLUBpnea4UJ/k0HDm7AomjzEucvAnGqssOlMHuhlnGjnDokYZLQ5zUBXjfE18F
 LxszHynw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoeyZ-00GhXh-SM
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 11:19:23 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 13/13] no dpt stolen
Date: Wed, 20 Aug 2025 10:19:12 +0100
Message-ID: <20250820091913.18588-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
References: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index dc912864407e..2921dca55959 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -214,13 +214,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_PAGETABLE,
 						      alignment);
 	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = ERR_PTR(-EINVAL);
+
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
 						      dpt_size,  ~0ull,
-- 
2.48.0

