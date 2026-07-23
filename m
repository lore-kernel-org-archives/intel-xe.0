Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88692C531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 13:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1291910E3F2;
	Mon, 27 Jul 2026 13:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="swJCnry/";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A8910E476
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 18:46:08 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so989339a91.0
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784832367; x=1785437167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6s5SzAkwTqv2cG0ZEuCiRJMYbGatFZIR2B9nCnRkYh8=;
 b=swJCnry/ty0QL/7YNUuATb9PxZpkBgPmIWNpb3chH//atTMSEaSx9QGco/SI/GX5/c
 8DSV+QpPjLRs/7oIkWBVcUpPREQdHpMooy4jDlwY2rSFjJ8gRFmC/qROH9y3ItOHBD3H
 +Cdkmu1ldYmpdaKpTvFrK2+83mAgQnQlH7Uczexp5KyTcGePjHkySSMQpz2+/yP086wp
 2PTT5xiZjb+UyixmWU67tdAyU+HH7qwx9Ezkawa+AbvMeqkHUH8eXlrHACJPzziiFwCI
 ZGtbQLipg/qAZ+mMuBE4Z+BrP0ykuegOXh++7NJ971g7EXXfav2nVZCnie8s0g9LfGOJ
 DT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784832367; x=1785437167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6s5SzAkwTqv2cG0ZEuCiRJMYbGatFZIR2B9nCnRkYh8=;
 b=jepb6Ha3nfCRTQJblYD4VJR1uGtMQN6X0al/LoUstNc+b5WGWqoB7HLMD8zEAK+JId
 1BQBmlihnDlBgCbNLQtgtM4vMaVn4pkSO0kqZZiFD9QpvaoJrfguFvcv2Lz5546i0p//
 XzpGj0SVn0hz5DWhWkmmqYcE8cvqPAzEHn/3wp3drF41AXKMHYJr0NCz9OXQz7DwogZD
 l+e0su3FPSbtx24yk9JKnsGr2wKm2AE/E2z3GGXwHSi/mpjqQeebe0OVwzftSg0E9tV1
 iBs9/AzX5CubMsFr4OeuHWr8lDhtRgn1XAqjl8K1HjNGhjLyGbzQnlny3+Kk7sAOmlat
 7/2g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2ln4RwMzWRIEcbwbhXZ/PlfWWG5FzDb8trJIEXkB9DhHSq96cd7MxM+NgVte2dS2wXn/Hk/bWLw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgmYNm9DrW2HcBGITW33nMM+96tcPEs/EF0jNOSgriu/5yS4lY
 LUbqudaegPbZoEGeBTAnwI6fCOnCdZYNWFEk+f7qhXSf3KO3x9O07oHU
X-Gm-Gg: AR+sD12iCSGfseDucVMyjELYK+ycEyRkrcz1KbrA+8MLQOBEU4QIyduPkbZ47mPGf1a
 fOzSnXrKKLP9jMoiU3/E6qHA5fQkHvuMaQhq9MCmNBzthggg6INXF6Oo+trYDYCbz5aj9+Xt11/
 St+RsLmMBFv/RQsVxa1JrDuNVB+fOrGiNfSAFmrZAeUz2altZ8t43Uvcr0Bs6EI/lKlW1tNOJ+s
 WcODHaMpZSctUwh403XwsSNT1QbNyJvDM3/+f6fmb6clVqn//NRS7WEVmUq3ol0kwqiJuDG30Zj
 uG9GW8jj+rAhs+5TXaBCqqq0W7ne4CZEQ5LYSHBywJzkLrTRHdpFgF5U9svKfhhselv27UvfYM1
 EwSU6SJep0J3P0TMVXWuNG0L+TRNflpvIincBN+GcAEKiOaP7kKWXOCRxbgshJc7ZEImPRmCS
X-Received: by 2002:a17:90b:4b92:b0:37c:18e0:90dc with SMTP id
 98e67ed59e1d1-38ec697d294mr3808455a91.16.1784832367424; 
 Thu, 23 Jul 2026 11:46:07 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 11:46:06 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cocci@inria.fr, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [PATCH 05/36] drm/i915: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:07 +0900
Message-ID: <20260723184538.3888637-6-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Jul 2026 13:37:32 +0000
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 7 +------
 drivers/gpu/drm/i915/gvt/gtt.c            | 8 ++------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8a019d3574df..90880be63a1e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2658,13 +2658,8 @@ static int
 intel_hdmi_connector_register(struct drm_connector *_connector)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
-	int ret;
 
-	ret = intel_connector_register(&connector->base);
-	if (ret)
-		return ret;
-
-	return ret;
+	return intel_connector_register(&connector->base);
 }
 
 static void intel_hdmi_connector_unregister(struct drm_connector *_connector)
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 5056a5887b31..6bca40128d99 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -725,15 +725,11 @@ static int ppgtt_write_protection_handler(
 {
 	struct intel_vgpu_ppgtt_spt *spt = page_track->priv_data;
 
-	int ret;
-
 	if (bytes != 4 && bytes != 8)
 		return -EINVAL;
 
-	ret = ppgtt_handle_guest_write_page_table_bytes(spt, gpa, data, bytes);
-	if (ret)
-		return ret;
-	return ret;
+	return ppgtt_handle_guest_write_page_table_bytes(spt, gpa, data,
+							 bytes);
 }
 
 /* Find a spt by guest gfn. */
-- 
2.43.0

