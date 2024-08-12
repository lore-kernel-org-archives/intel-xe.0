Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D6C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 20:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CDC10E2A6;
	Mon, 12 Aug 2024 20:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUFo8Mmj";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7707210E2A6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 20:12:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fc611a0f8cso33877905ad.2
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493548; x=1724098348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ee47sTb0j/o926oMtGBDdiCIUWXbl5mO3gcVsdFlDRc=;
 b=HUFo8Mmj12myDOJY8/B5VEGnGbjvd0rpy0SVvSJkFNuGaK9zGO4IOVEVBmw5uFnBgw
 rooPvfEtN9+a1cTu2I4AVRAP3+T1VAZIr9FeXaKhjVOAdjGRSeGv8AGn2MN0aCcKy/h/
 okSb8kb2taBGSAriN9KET8vC256TaCqPS/G+JaZilyOXh1h2xGdaxU0Ga3K794Rrh6hY
 +O9A4v1K7V1vDnLfShb3LExdgec+Rpx3KGk04boKsNvNf7Kx2t+54Sw7S9hqGCXY2yim
 Sr1GYpMv0rOEgB8jxQrwZvWr/jjRWaLIwN8r5aheKbP2PFj8B+m62K6OOBpBJpdIwlRX
 Epqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493548; x=1724098348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ee47sTb0j/o926oMtGBDdiCIUWXbl5mO3gcVsdFlDRc=;
 b=CSa7SMa4tOnR9efUiBuVwgrrkm1mUuhdpN861DSiiqpP89pnHOtx+a1R+GvC4Bja4q
 ZEEcVsyHTJTCkoUyVcDutT4BEol+doUWGKjIxwHTlBZV2eapuDQ2kOhzDAOoXpEIkP8I
 qvvJg1SMC8YJPKNoyJPb5dXPO3szIPlcW4kffLAGUhrbFh/X/E4Zb3oo3l1E8cfBrc0G
 GdIBxAAts+6KLlNmew4nr+EVT87EYLEzCKUvnuvyhEpYMGBkLyDluSy+E4KQTbXCrQqT
 2D9iVsyCaL6cEQy/jaOr9Jp62P/vz0LpP5ry5+mLzsOovfDtg1Vsv5iAoBRWUOxMCuFy
 Ia+A==
X-Gm-Message-State: AOJu0Yw8Kq8oxUFT6Zdx3SdX9Z9vO0VR6TFUlLEwH8JiKb5Ruh5xXL4u
 raK7Cr6XTyAXH0ED2dZi+mN+FVuHPXuEFH1owLIkcMdVEpEppdYlFqKPVjeI1rO9iZ7p
X-Google-Smtp-Source: AGHT+IEOILbBaGgBbK9R1AYMQDAgUG8ggiKb4P8y8nCEmJrQH/3tEUFYJwSeoWze/Xi5SqwwKCwy2A==
X-Received: by 2002:a17:902:eb8d:b0:1fb:3474:9527 with SMTP id
 d9443c01a7336-201ca13f98amr18737985ad.25.1723493547632; 
 Mon, 12 Aug 2024 13:12:27 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1a9368sm744655ad.131.2024.08.12.13.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:12:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chery Nanley G <nanley.g.chery@intel.com>,
 Graunke Kenneth W <kenneth.w.graunke@intel.com>,
 Souza Jose <jose.souza@intel.com>, Zhang Jianxun <jianxun.zhang@intel.com>,
 Syrjala Ville <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kempczynski Zbigniew <zbigniew.kempczynski@intel.com>,
 Bai Guangyao <guangyao.bai@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/3] Introducing Xe2 ccs modifiers for integrated and discrete
 graphics
Date: Mon, 12 Aug 2024 23:14:34 +0300
Message-ID: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

These patches modify how Intel Xe driver handle compressed Tile4 framebuffers
on display with Xe2 hardware. Specifically, here is added support for
I915_FORMAT_MOD_4_TILED_XE2_CCS as a valid tiling mode for new framebuffers. 

This change remove unconditional decompression of Tile4 type framebuffers
on Xe2 display, as handling compressed versus not compressed framebuffers
have different requirement on discrete graphics than on integrated.

/Juha-Pekka

Test-with: 20240812201124.2013652-1-juhapekka.heikkila@gmail.com

Juha-Pekka Heikkila (3):
  drm/i915/display: Don't enable decompression on Xe2 with Tile4
  drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
  drm/i915/display: allow creation of Xe2 ccs framebuffers

 drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 10 ++++----
 include/uapi/drm/drm_fourcc.h                 | 25 +++++++++++++++++++
 4 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.45.2

