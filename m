Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EBCA0EF1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA3410E45C;
	Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aFOFDuG8";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91A10E456
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ykMsfd91zH+GYum3IgCseGfUTdKByU6Q+oDbh0lHtFs=; b=aFOFDuG8/V4ZjkxUjzRFEY+pGc
 2UqOD2ExPx2FB4hLL7m9E41EQsAidMUK2450oOtJTobXX5sWicgwwkHMCSjyeyJzxxdreww4Nzj7e
 a5CWJP29y1hHWkEFrqPbA57a7QjhopxhxUqciG5NwDdyu8toUh9/mf90L5/0rjA9p6SxBeMNtz/7u
 WVUeKsvxwthhnvBUzoluE30vArOWeCG1XVyyicYkWI9p8sDr8rFCXjxXWlQHvAQFjKOOl7vSrWUMN
 jsGE6auBGuvp5OtYj88nM8iTZTKnAdIQE9yKR+TsXZZgiUn2QuP1oFfzrUQq1DRnzFY0472xlJSGT
 +MK6+cgA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uo0Vs-00Fs0z-9U
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:04 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 14/14] clflush all
Date: Mon, 18 Aug 2025 15:06:50 +0100
Message-ID: <20250818140653.86787-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 56c757bffcea..98972df00894 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -388,7 +388,7 @@ static void xe_bo_clflush_auxccs(struct xe_bo *bo,
 		if (!plane->width && !plane->height && !plane->linear)
 			continue;
 
-		if (!plane->linear)
+		if (0 && !plane->linear)
 			continue;
 
 		mb();
-- 
2.48.0

