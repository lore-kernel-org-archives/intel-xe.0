Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D23CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821110F1AB;
	Wed, 20 May 2026 23:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bPvl419N";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC0210F18E;
 Wed, 20 May 2026 23:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gNTNgK8EaqPSEyGVF68qIxBXTqBnS0ydl149a62pCv8=; b=bPvl419Nnxxea0ggA6Tp793aVh
 0yc2Ge38L//SQb6lPxC+/vkBUI4emQFLaWrzNlk7/FhJfGCF5FZBJFjpzUImjcRemZ2l5nInAlnuS
 Bo5YZ+Weod5CYhGPGAK4k49Ep8QTxd88d0zbmkDb1VTTisnK7xIJT1nYiOs7aFFeW9NbC7nkqzEYQ
 zns0CroktR94RnsBunEXtTIk8QlLwoyLLTxyEOS8rzIao7WsPgPPqt6oybQmFQxmAm+LjwMS1x2PN
 ZmhgtdHmcMuhGb1zWpfSsjfJoYJwkfJVuDi8OeAAtYeFhwnZbLnGLlKXKZRWp7UEUAZog004Eo2vt
 z29WSYTg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqpB-00456i-Oq; Thu, 21 May 2026 01:59:42 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 4/9] drm/i915/display: Add writeback transcoder offsets for
 DG2 family
Date: Wed, 20 May 2026 16:58:15 -0700
Message-ID: <20260520235820.2313192-5-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

From: Rodrigo Siqueira <siqueira@igalia.com>

Add the transcoder offsets for writeback for DG2 class devices.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 129b1c561847..578f6ff0d663 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1343,18 +1343,23 @@ static const struct platform_desc dg2_desc = {
 		[TRANSCODER_B] = PIPE_B_OFFSET,					\
 		[TRANSCODER_C] = PIPE_C_OFFSET,					\
 		[TRANSCODER_D] = PIPE_D_OFFSET,					\
+		[TRANSCODER_WD_0] = PIPE_WD0_OFFSET,				\
+		[TRANSCODER_WD_1] = PIPE_WD1_OFFSET,				\
 	},									\
 	.trans_offsets = {							\
 		[TRANSCODER_A] = TRANSCODER_A_OFFSET,				\
 		[TRANSCODER_B] = TRANSCODER_B_OFFSET,				\
 		[TRANSCODER_C] = TRANSCODER_C_OFFSET,				\
 		[TRANSCODER_D] = TRANSCODER_D_OFFSET,				\
+		[TRANSCODER_WD_0] = TRANSCODER_WD0_OFFSET,			\
+		[TRANSCODER_WD_1] = TRANSCODER_WD1_OFFSET,			\
 	},									\
 	TGL_CURSOR_OFFSETS,							\
 										\
 	.__runtime_defaults.cpu_transcoder_mask =				\
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
-		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),				\
+		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |				\
+		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_1),			\
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B),	\
 	.__runtime_defaults.has_dmc = 1,					\
 	.__runtime_defaults.has_dsc = 1,					\
-- 
2.43.0

