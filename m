Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BB5CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 07:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421710EBB9;
	Fri, 12 Sep 2025 07:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TBgggMvn";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAB810EBB9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 07:44:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso10886625e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757663058; x=1758267858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
 b=TBgggMvnQnfKtcVg8xCgzl9TtKMZy9U5c+e0rt+Kwc3dbW7jQHUkfQLSpCXibmHE8b
 rC6zk093z6zqbqmgDspCxLOWJ1lXpzdt8i9cYCFcyiqmUnNXL3Fu2uw/dCLY3Sx4nwkX
 st3f7LebN487qnqMoDWvip0GuBbrrI2zgj3Ot+x+QD7mGtM7sjiUMBz7BsWXN2g///df
 Tt5Kmkr+O5YnlJw9mtEJFOCSJ7m9FxEJd62nxCeuNHF4t+xj0ukgz0cIVYp5Y8t7/U4y
 AqG6x90697FZ2TO3eD8xWfE3d0L9wZiMnvttMYVwOSNM9LhJmg0lbrVRylrS30+gGAch
 mqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757663058; x=1758267858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
 b=AQAOynQzSywGDzQeD/JfL54MWu7fk5xdh06A1q2orG8iJqQm41u0ppYqsbeLmaVAeF
 NQc4Wnb2RipfNNmsEq/3mZxzTOO+Kkycr8oCLpn6F0gJsHrtRmGZ3VLp3hLYfDXSzww8
 nxCg0NkKTXHOIUzCapnrcTab6L5kv3+O8UzYxUSvMmI5UhnUnVerch7xJD/vgLQocO7Q
 Ez5a8ulMK0yYKkCtTjCYgeA+CQLboTr9JO9cI1HZ9kgpWF90+QRR8o0T1pr+MGTRJcSH
 7gPaofDzA+KX6jL2Nr4EsRbkfx/uWqpyHJblMt4yLzjRKuTogvSqH5lm3ks3njqO/jtu
 v7OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVckHLMhrQ2TmC6HWJ9YXaOu5wLu7zKz1eMlevdbrNhYLO2QCBHPh+4w+UtbP5gWQDB6SIXCd51IA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/UNp3ay46UEX6l+hZHDXc6rKgIqRieDBZl4GL5a78uMsRL+7Z
 EgMb7p8LnSjOr1MappjpbH0Md4y8CKz26JwASzTk76NnX/Ah2Ipu3drO
X-Gm-Gg: ASbGncuRyAXu798X0CASQtwCw4CzT6lVz/hxtq5AO4QM5gK7X0qhFu92pA2rKW0QXIo
 yJ+v0nEIwqtSfNsjiG0471x072CkddbToGj6WixMn7v8pxcTsdJXYvdgAkltMpq4H8bq6SI8PLW
 r0qqZGc7X6MQ46Xb7JoMGGu9Q8tCbRTE4Kdrzp/4a+XEi7LgTylL8353qhtDpscxIL1QBJSjjjP
 s+tVIk1yM4dCDJctnERF3u5vigwQQ7mAffYWaPrk0XbFc1uxNZpckI+JP8PMZXrdWST26OvuPKL
 Vtlq3npTyYWxTFuh6xLK4TKrJW6pVZoCFbG3IQExY3nAgoJIH7x2LEK3vog9gYs76NRbhYtglax
 /nidcHyvWHzG6bhE6FKO+
X-Google-Smtp-Source: AGHT+IGcBRTRyBh6Cwu5iI4hTdWjgTJRmHmc3IyNU0i7I6eC8AyH4njMSzoX7KbtbrF08N3PuQ7bhQ==
X-Received: by 2002:a05:600c:3209:b0:45c:b55f:466a with SMTP id
 5b1f17b1804b1-45f211efac2mr13603635e9.15.1757663058119; 
 Fri, 12 Sep 2025 00:44:18 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e03719235sm51823045e9.1.2025.09.12.00.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 00:44:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix spelling mistake "sheduling" ->
 "scheduling"
Date: Fri, 12 Sep 2025 08:43:30 +0100
Message-ID: <20250912074330.1275279-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a xe_gt_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a465594b61dc..8cb8b93a37a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -355,7 +355,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
 		ret = xe_guc_ct_send_block(&guc->ct, data, count);
 		if (ret < 0) {
 			xe_gt_err(guc_to_gt(guc),
-				  "failed to enable GuC sheduling policies: %pe\n",
+				  "failed to enable GuC scheduling policies: %pe\n",
 				  ERR_PTR(ret));
 			return ret;
 		}
-- 
2.51.0

