Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34542E9D800
	for <intel-xe@archiver.kernel.org>; Sun,  5 Apr 2026 15:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8BA10E179;
	Sun,  5 Apr 2026 15:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LaDYnW/r";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1810E179
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Apr 2026 15:47:14 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so3621155e9.2
 for <intel-xe@lists.freedesktop.org>; Sun, 05 Apr 2026 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775404033; x=1776008833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lB+a99wJ5dswQkzQkoOsmekXtXL1XOz/X3cfxAbGqiM=;
 b=LaDYnW/rpoTNyZHDJt1Gqeua2qqwK2ekrpzVQvQMHYsMUKrYA9URoRRAYSs0jikty+
 17Y027gbwXfSU2d2RraTQkl8BAISxynu5itTB5vxZqS4uVeZi1eswaFj/44hBggqQ4fW
 6Ff1aanVe9+wSlidBLWixdbvs/Qg0mlv2hyi45ZTDjTS3U5HH7MvXnehYNEWljs4Awff
 7aOsxbAP8ZIek7OM0DGKR90GJDTKHfgVaDC7uijnzKi7fzj6Wzpm+nfSg2X+qXST9QDf
 CgQt4+pW+WsWPiLhntvqTPXhApN7ymVSyWxpzBArU9IVDYMvfAYNoPHwYTuNOa2XzFNx
 B2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775404033; x=1776008833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lB+a99wJ5dswQkzQkoOsmekXtXL1XOz/X3cfxAbGqiM=;
 b=SgVqI2dOvgai6CgPkbc/+jYt6G+qPcEXYGPqbUC7XfJbNnfKZ7QPCyTXCF4W36dJkX
 3dcCqMf06QlPBlegXYLaOA3r2OTW15rlsUN5p3o/PXHCS0WOGsIushCv0OvlWrCHkq28
 Lx4vdbYsR5CW4dzm54DjLN3eIebEbzpn0duBfu65D/AsEOsySNn3ufU04nrHqK0Ye9Xg
 b9a41L2eB/MqGQ/5hcYweTiwftrzN2BC4wc2+pZD33AmfRpEW4LhIKYipDduBggRzd5I
 JeQnWTCDyCYOcQpFmQEhre+EYHbEu3aRYHx1KF3zKT5+/EqAFAqTN0O1xeMEz1zlAomH
 ONqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8AA9IelELrTjkmx7rYG5M1ouoswfPK4x+lUDEI5WgCkNdaMRsleQ+vO7v0Jh/GRxCXFcCK6oE6g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+ojPaQfyOO2ckxUqHYQH3+96k2bnwpsGzcG1FsbEZeQYT3IE8
 SyFgDlu7vSwbG8Kjqy/b+JYj3+Gfu4n3LBnZjwsk+A/7thIPxDVhZuXR
X-Gm-Gg: AeBDieuwVOjdzPIHpT0MYoyWmcE/THd/OLf1ZN1X3bG1HDqtXz0CuIBWwbBf8qCordS
 JFIKw70fcEa5RsgfzsADym7D67XHCwnGh4GSPYhMhaGjAjrrcjZ5+HiB4/sWnPM+TKuv5jGsNNk
 6cHU/0C8JQwqDex2GtQpOpk1ykojOe31LzfK2U9WAsp7ryFVaK64TY0JG1Y6wT7S+1tnL+3mIog
 WJDVHaU6pA1+6W+SzQBDceS+23dWg10Pgtb/Wf+EyBHB/U3UckKcZ8TdR+rhBRnHjPOOTMLUQve
 v+dQrUMHLwTTfuUUt0lcJNkO59wOijnfWVr9kmFFebBeaH2zUFUb/cRM21i5vShdPbQQKarmv2l
 7vX5jLDWhCTdNcCFHHXj8ZzpWRQKB1mEivpo/K0t87/vk102gFGNB4D3WdsVP9crsuezno2cRKH
 yHNRA5X6PAgcmI5zso0vDAI4HiofY3m1At6Sw7HOlzUTGiNCQlmryqOxJoxK/F7EbT/0WltXDjW
 Xb5Qs3A6rBZ
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id
 5b1f17b1804b1-488996df052mr128364685e9.8.1775404032826; 
 Sun, 05 Apr 2026 08:47:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f52easm34255338f8f.36.2026.04.05.08.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2026 08:47:12 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] drm: use get_random_u64() where appropriate
Date: Sun,  5 Apr 2026 16:47:10 +0100
Message-ID: <20260405154710.4638-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Use the typed random integer helpers instead of
get_random_bytes() when filling a single integer variable.
The helpers return the value directly, require no pointer
or size argument, and better express intent.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/gpu/drm/i915/i915_hdcp_gsc.c | 2 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hdcp_gsc.c b/drivers/gpu/drm/i915/i915_hdcp_gsc.c
index 168b9ccbef3e..a0510f5ab25c 100644
--- a/drivers/gpu/drm/i915/i915_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/i915_hdcp_gsc.c
@@ -196,7 +196,7 @@ static ssize_t intel_hdcp_gsc_msg_send(struct intel_hdcp_gsc_context *gsc_contex
 
 	memset(header_in, 0, msg_size_in);
 	memset(header_out, 0, msg_size_out);
-	get_random_bytes(&host_session_id, sizeof(u64));
+	host_session_id = get_random_u64();
 	intel_gsc_uc_heci_cmd_emit_mtl_header(header_in, HECI_MEADDRESS_HDCP,
 					      msg_size_in, host_session_id);
 	memcpy(gsc_context->hdcp_cmd_in + sizeof(*header_in), msg_in, msg_in_len);
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index 08082b596501..195f99e6c3a8 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -49,7 +49,7 @@ u64 xe_gsc_create_host_session_id(void)
 {
 	u64 host_session_id;
 
-	get_random_bytes(&host_session_id, sizeof(u64));
+	host_session_id = get_random_u64();
 	host_session_id &= ~HOST_SESSION_CLIENT_MASK;
 	return host_session_id;
 }
-- 
2.53.0

