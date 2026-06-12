Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E691ACD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 13:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA40210EA33;
	Fri, 12 Jun 2026 13:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hkLVAASZ";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5064C10E92D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 03:56:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2bf22d29dabso3535865ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 20:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781236580; x=1781841380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dm7OkWfAzOKJ7RwOi6ZOCdSsUs6x+K0PjwZRlVnoBII=;
 b=hkLVAASZ9HI+T1mf5y7OuzUGx7AwnF8rUl33de+F6kpRIFBRfAXBOGz+ywMlJuosTw
 KGNIO7KAIq4feYnztr81krGSy7/PcQXtjBJ4RBiQcUFKzqJJGOIA1F1IqsRDJBOmLAbg
 JV5RntGDLQ3tBsgqWQhaC8HxmQ3DTwDlKxAiv/guwuJtr6gPAtCK1On61LJPtqnqEIdS
 cji1eCU1l5YjlXc0MlqB5iTKgDUtcySuGdjh35LICZ47d5nLSVOyo1UEnJyWe/OhcbGx
 NJ3NnnomqbmLgfj3PBrLP9asXbcepe5VNln3yZ/B37q63gLIv/MRukV+/+SvvuJAeklF
 7vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781236580; x=1781841380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dm7OkWfAzOKJ7RwOi6ZOCdSsUs6x+K0PjwZRlVnoBII=;
 b=eWoNFYE9n+qDPw36nXoKdP7+qwZgq7AHeOSXlS+Nr/WSxjYF4nqUvIQdTT2mMndwqB
 cvggTHnaDFSkuqBAb7UvIr/1X5nLsH9JAbmCaU9tacGqFBHZZmLsORShOkcRHZLjSlet
 zGZ4gq2vfXu5OsoqYc7++xljnCf3WoCR8GgoniwEPLXcAgU0hD3N+wjl1+uzn0a0yUQW
 cs/HhZMeMKnJXmz1x3e0F9CqAzrZ6tEJDroNzv5l4xgCk0owmao2YmzrtyGER7zKj5hq
 EQjWs6u8oyaH1l+7wvN/LTysJYgii+Ej5G56UUgapjMlsSelYgLhl+Ca5P4FeLwZIv8Q
 YnUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oa3GogHj/ZWOKd1zCaM8SfOsK/2+bvDrD9fkZ4dKXDWTAs92ylokqCmttcBDsZuiF8sdG/a6Aag==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGIToPqMi85j3lBYBvXqnPPsvXkKvFM8MxLJkNcSpjmUWXCgl6
 uJXLHQ8HLjbmSYV5iW6/eTcJgo625ZyokYzUuBEKiYic5YK/RO+z2Seq
X-Gm-Gg: Acq92OFGCbPYqHV2T0IVqXrzDB053fM5eXLl9XiYeg9jKSUQO5ZKiAZETIDFyxSUtnU
 p6K/4rojb/NPjUnKcAgtj8YuzPtol7S0Th2rbC1XfQnFloEqwsCBYHPiM5CScFZvIhMtPAdO2bh
 6aIrgiUjc7NJhiaycXgsGxGhtmBYBhBdhzekBlFSzUxtE4FQ1xOX4/RlHuMqu7yBhOsrnGWo6XQ
 NQE/5aYiFUDWxZbqkg+Z+dS4u/xsH0LsqkIS9RI4Y/PVMxbPV/t2maGEV8Z8f4hGgkuAxyX3mTY
 U6FzwlpVaTrOyz5XHSiWUTpsNrr0DO28N867mkbeADVmhjGd0sjT9UZWN6XA3ipB103Cic3CQGO
 9vwrO8mlNkdTJnFg0owLI2C5BoJzM5R/yfREMQQieapjYTyS/mjeLI4QwuwVBR7jyuUjtishe31
 XiesZBbQ==
X-Received: by 2002:a17:903:3888:b0:2c2:7baf:139f with SMTP id
 d9443c01a7336-2c41255f17dmr13462935ad.30.1781236579754; 
 Thu, 11 Jun 2026 20:56:19 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42fca9f44sm4748625ad.37.2026.06.11.20.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 20:56:19 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3] drm/i915: clear CRTC color blob pointers after dropping
 refs
Date: Fri, 12 Jun 2026 11:53:10 +0800
Message-ID: <20260612035310.3013066-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jun 2026 13:05:53 +0000
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

intel_crtc_put_color_blobs() drops the CRTC color blob references, but
leaves the corresponding pointers unchanged.

This can matter in intel_crtc_prepare_cleared_state(), which frees the
old CRTC hw state before calling intel_dp_tunnel_atomic_clear_stream_bw().
The latter can fail while looking up the DP tunnel group state, for
example with -EDEADLK.

If that happens, the function returns without completing the cleared
state preparation. The failed atomic state will then be cleared by the
atomic core and intel_crtc_free_hw_state() can be called again for the
same state, dropping the same blob references again.

Clear the blob pointers after dropping the references so repeated cleanup
of the same CRTC hw state is safe.

Fixes: fb69d0076e68 ("drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state")
Suggested-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Move the blob pointer clearing to the end of
    intel_crtc_put_color_blobs(), as suggested by Imre.

v2:
  - Keep the original ordering in intel_crtc_prepare_cleared_state().
  - Clear the blob reference pointers in intel_crtc_free_hw_state(), as
    suggested by Imre.

 drivers/gpu/drm/i915/display/intel_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 71b7325917b6..a16e1cb7d41e 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -289,6 +289,12 @@ static void intel_crtc_put_color_blobs(struct intel_crtc_state *crtc_state)
 
 	drm_property_blob_put(crtc_state->pre_csc_lut);
 	drm_property_blob_put(crtc_state->post_csc_lut);
+
+	crtc_state->hw.degamma_lut = NULL;
+	crtc_state->hw.gamma_lut = NULL;
+	crtc_state->hw.ctm = NULL;
+	crtc_state->pre_csc_lut = NULL;
+	crtc_state->post_csc_lut = NULL;
 }
 
 void intel_crtc_free_hw_state(struct intel_crtc_state *crtc_state)
-- 
2.43.0

