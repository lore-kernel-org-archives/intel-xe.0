Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB1CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F9210E629;
	Tue, 26 May 2026 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=poorly.run header.i=@poorly.run header.b="drl1dbHg";
	dkim-atps=neutral
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882EC10E135
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 13:57:32 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7c58e6eb3edso88786207b3.2
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1779717451; x=1780322251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R2Pnx/Mi+Y/3KV/4Sc1GEttUJtfyf8f5vLDsmZdB3eA=;
 b=drl1dbHgFn46jD9/1E+ftFwo8fyEynU0mzF7rrsOJG1h+Djaa6JbjM/0SZA7UKgPY+
 NTP4j9vJukZhEAOb3N0Gwf2AXoIZvsjx1EYXFe1PfN5T71l3Dd2VwSYWehPWVEcAck91
 kmxGWZvOVMf0nt+5vo2UFGKOJuGr3uP5CIG7PaSbpy8HMU7dTK2a/ozJ9KObsaZL+uE/
 ssFFqp4gMhzStA13VF4M4lSVQr6mbknzlOJRiu31kE5AqlTvTH5Q8xhkKoYli8Qfv7vQ
 oU/INzDTwA6xF+EeNktGhPrRBvdsytBWoBAzlnxFbTGPAkHpc8p0j2bd8fjTpncTxIDu
 24VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779717451; x=1780322251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2Pnx/Mi+Y/3KV/4Sc1GEttUJtfyf8f5vLDsmZdB3eA=;
 b=ltAmrOEnNHu9r3hAYK7tlWoEiUEz0f58/H6wB4lHG6Ah1nXjsTlu67MEkLfmF5zE3g
 SZJwvR6dhAAWn0w7Re3mYk4MB4t5Wk37ksPUFRe6BCveOfIQpGKc+S23Q2ZZilp6R16e
 y7u9ZOJVvlc6bWWa7IxywamUCrkChsPE/ozcyw6knP2Q5/I2k/KYGrnsmjmV59vbXup+
 U+WANL18WasUPo3vEgmJHi8zF2ftj3CdLHUAWMWSDmQxq9Dik/bOiWR37OojsbmA876O
 NqKT/9eSn1a6n5H210RvhTWSIxqg2QZtUb0a3RZUkk7ZJ5qPpdIFUzty8fBybkzQVNiz
 64Dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZP4H7MCEjHIoaj1XW80AvooCGorxOBOb7b6QUJJewxYnPET2bGNc87bMpjgf48Yk/GWsu0E0ZDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZmbfZYKA1EGEK9mIc3xx3eNdQp3HJGRuWlwlkp/59o7L4aSJb
 I4nA7A/83E65pyr8w7mzEe+48o7/tUDi4W02VJCrCFLd5prOE52Vml/0to8GR7XtmlU=
X-Gm-Gg: Acq92OFnhF9F2xabViQMLI55cPEQYja15ciuhOCvxelaIEZg/FJ0KCuVT02garSrcrb
 pV+FlClEqD5HD3L/hl+SmlWGLKu0dI7erFff5EWjzU79UN9h6KJwxrvBAHhBUXcvcKBJBa23+Hn
 qohTeKmETjGqQ+orWBCwJjrM6huU6Nu8LtBF49+gGC/rkWWAUH3+6QOQJqTACOJAPTaI7MPb0Dn
 rJ5gqsKP2AhHUUr4WNQnqfP40mxkSviQlsWBHLYdZSBzB8KMvNGdGTGYNIINAg8D980ufkXCsRh
 hhSR3rqnZBveTtRMMFDPdF7C6oqC2qdZkU28qYnyQ08VdFGtOmzJMlo29YLjg6TK3ypwNhC93+V
 g7E454Ki0nxzmQesOU7HlaclzVdZmfgLD4AuokwTr8ehMSuJlqVqP8kp1ARbE204IIeqy1/oH8s
 g56aGBYRblgAI1lKvO/Kvc/IDs/L5Uz5bsCPpYjfctoAmWs1yjvVhr0Cg=
X-Received: by 2002:a05:690c:338e:b0:7c9:30f5:2054 with SMTP id
 00721157ae682-7d33a95ca47mr156744337b3.40.1779717451418; 
 Mon, 25 May 2026 06:57:31 -0700 (PDT)
Received: from localhost (191.99.245.35.bc.googleusercontent.com.
 [35.245.99.191]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7d389d176a9sm46721407b3.16.2026.05.25.06.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:57:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Cc: Sean Paul <seanpaul@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2.1 1/2] drm/i915/color: Fix step discontinuity in Post-CSC
 Gamma LUT
Date: Mon, 25 May 2026 09:56:04 -0400
Message-ID: <20260525135730.1122696-1-sean@poorly.run>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 May 2026 13:01:58 +0000
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

From: Sean Paul <seanpaul@google.com>

Fix a step discontinuity in the Post-CSC Gamma LUT when SDR dimming
is active by clamping Segment 2 to the last user-provided LUT entry
value instead of hardcoding it to 1.0 (1 << 24).

Link: https://lore.kernel.org/intel-gfx/20260521180143.2143262-1-sean@poorly.run/ #v1
Signed-off-by: Sean Paul <seanpaul@google.com>

Changes in v2:
- Split out into separate patches for pre/post csc fixes
- Dropped loop bounds fix in favor of [1]

[1]- https://lore.kernel.org/r/20260519075245.383864-1-pranay.samala@intel.com
---

Changes in v2.1:
- Rebased on Pranay's patch and sending without in-reply-to

 drivers/gpu/drm/i915/display/intel_color.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 7ef870cd9a16..7185f3628dcf 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4038,11 +4038,11 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 						   lut_val);
 			}
 
-			/* Segment 2 */
+			/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
+						   lut_val);
 			} while (i++ < 34);
 		} else {
 			/*TODO: Add for segment 0 */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

