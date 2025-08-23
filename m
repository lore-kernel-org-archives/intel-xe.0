Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A080CA0EFA
	for <intel-xe@archiver.kernel.org>; Sat, 23 Aug 2025 12:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0B210E0CB;
	Sat, 23 Aug 2025 12:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="TZpicumQ";
	dkim-atps=neutral
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Sat, 23 Aug 2025 12:26:21 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC9D10E0CB
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 12:26:21 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 70B6C3F7CE
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1755951427;
 bh=tHRlOV1gcalzCWbpUniF1ug9QqZWPgVHTvYS8H+hUMA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=TZpicumQwx9P//l5pS7RKN21LIiNy8BQKnnuI0ltCmfbNzNAnDULaxK81NYYFzRI+
 ph8OrWZXkA2nxRnSarj59BPiZfSeQLwvZp6yqiqkGMCueTLLwjtWof5dz7n7+h4+sv
 wYMFdG6lkrGl80VpvtVUqR0+MFEnYkC2+XHQCKVuMEQqslBSno8nzejczher4P4B4A
 luCDtLMxXrQtdwjgYHdf94JgUg1isPRP3oirXGfk7ni8CsKI5SidgTf2dQmtIGYG1r
 6/xhhDWoLr3xyV2dhJ0ZO+MwfQRbhNjQfcgVZ0aF+GrN7u5YM2xDPPy6JaAphQVq5H
 LIbAVN/GwMjRA==
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bccebaso85825921cf.2
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 05:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755951426; x=1756556226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHRlOV1gcalzCWbpUniF1ug9QqZWPgVHTvYS8H+hUMA=;
 b=Vt569Fkwaxyt0rne3Zff6Xeu5QDIkMVw1/ywFPwxrLCaz9cndyNPJsE1un6zfdqQyv
 NVU8JOLaTG0n2DA1tz5W6QUJFqFTo0FmX1++f4aI5Kg1y9JcC+82E2i3b90hQsX1Yf42
 J+KoTeKX9LE+EsdpcRc4joD8NUOu8yhr1QX9BqiRgWEyYbrUzHX4VlzkAxUL2s6GMYCl
 Zlt8MAaxEvh9vFQOd3xasQ7ahV+hTzJrHDQD8zb8iFJST0fA50PKTffFBrFx31fG2B+e
 3swIOfS6DFiyy1ev80pcu1xTqH2v/juMe867l14SJdEXUW31QC0FvLh0Y+Ai0SwZkobl
 1WKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAgG9AqJR5kEKeUwPCjJmBuXYEddd/T/TzPdnCfCPcgUW9yLK5H0SBmzOU3L9Wj0+0kvuhGMwrJQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjuRNWrkWsEFFzFzM06T8OOxtNWcUs9uZ4fiHPq1FrxLSH1n4Y
 eq8O4/ApoMW79VYWOp/KR2OBfnt4713hULyx2A5ql4bnxk/nfaSl8eRBbG2+JZQPGGIU956PwIx
 Hw/RRceWzePwHcvor2D30VYl+muymvTEjx3p3WeQyKgs37PdUjSdg8izPj9+obd5+xMw3D/MtvR
 c7fi9Wj1SW
X-Gm-Gg: ASbGncshPbBqyIXiRHYMqCIDPKeUwAFrEGvjPWoR9xRSEqgL+j8gS1SwBilg3cIK1ek
 dW/2UqOx5v8zTFLPPOEm6rqoyonQfORGoeGof6BrOxI+RRTCRSR412H+FT60418vuCNhuw6suQN
 z3duIx3/4/cAD7tpZSy9NyEo5naA7UWIlrkrhNRWBMX1aicJZc+axayK0DfoNBpWWr7wiaoxE76
 WlergngZCxEsGPCVjtQ2ivmAxwIeO7T/xfLb2SOn2HpLzCkwPAYUO15m4c+EofhCn7P3EyfDllL
 rOJ63p7LB9rWsta1Uchy8MgjHr4LiKEGCVQoJ5UnocnPnZa0Y9qha9rh
X-Received: by 2002:a05:622a:a:b0:4b2:8ac4:ef5d with SMTP id
 d75a77b69052e-4b2aab546bamr68378081cf.84.1755951426366; 
 Sat, 23 Aug 2025 05:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnIKajDSfV7NO4Hfrf80vUm5NXdkjXXgtLCjExMGkFAp2FhrBW40tEeu25Y2rj3Y+K0BtRNA==
X-Received: by 2002:a05:622a:a:b0:4b2:8ac4:ef5d with SMTP id
 d75a77b69052e-4b2aab546bamr68377701cf.84.1755951426018; 
 Sat, 23 Aug 2025 05:17:06 -0700 (PDT)
Received: from localhost.localdomain ([162.213.32.233])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8c618ddsm15429971cf.10.2025.08.23.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 05:17:05 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, suraj.kandpal@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/backlight: Honor VESA eDP backlight luminance
 control capability
Date: Sat, 23 Aug 2025 20:16:47 +0800
Message-ID: <20250823121647.275834-1-aaron.ma@canonical.com>
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

The VESA AUX backlight failed to be enabled becaused luminance_set is
false always.
Fix it by using luminance support control capabitliy.

Fixes: e13af5166a359 ("drm/i915/backlight: Use drm helper to initialize edp backlight")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 41228478b21c7..0a3a3f6a5f9d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -546,7 +546,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 				     luminance_range->max_luminance,
 				     panel->vbt.backlight.pwm_freq_hz,
 				     intel_dp->edp_dpcd, &current_level, &current_mode,
-				     false);
+				     panel->backlight.edp.vesa.luminance_control_support);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0

