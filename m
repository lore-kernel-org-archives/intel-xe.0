Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C6C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 18:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A7510E8C7;
	Thu, 25 Jul 2024 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kibImwa8";
	dkim-atps=neutral
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491410E8C9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 18:32:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2cb566d528aso128318a91.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721932346; x=1722537146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8HyenliVWG9yCyXmZFimiOTAAusF5iv9oOlLbOD7bP8=;
 b=kibImwa8+foOwgL8w4K+mpC02UOpFBW+anYm8ooMDLZKY0kukhg+s5n5BpYDKyj0Ql
 MqiPNvDgBLNJEmVbDws6bafzNhSrr38a2ytaSjVOBKz/5mhWftmhuHC1M8CaHXLSdKM1
 xd8rZNUtuA22ZeDg0OLvHxnLRv9i3Y0z0ONkLKdq86cKv+jvZwM7P02CFTKulgE6oPh4
 VUOkhgDyNI5b92UCwv0NvlpHtbdBHzXjAALYsST2InHsa7qF1J7dvGt74vYy+Zh6Zy6L
 uJbqOGCyXNeC2THRMNMqTwT2o7hs3SU9VuAo0xbiWm63tOEFqV1AGgrJ0TeJ/9T9e/Bt
 CRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721932346; x=1722537146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HyenliVWG9yCyXmZFimiOTAAusF5iv9oOlLbOD7bP8=;
 b=gSD5kZ42Jlg3YfImjg31LYHTpq2j8vTnTDcdRgCpQf3DMvEzrWR8KjJnl19OYQMe0r
 H7KRACPdxvozEwLQxXgtaOiuI9QpTlI9TudZMkaI9X7sSNyNEdS5OBlghp6d68YMzgcL
 EGCjZxhnouEC2ST8jSp7O2BwPCtYjERglzpkeX0aHX/gBGH330wzXGNhLQb+D3em3J+K
 t/19JyIUWMxkaqkL7l2bccCElH2Nt5S68Tqm+XANiKq8MssXVdnITisRaiVPcER29CSa
 tGXl9E2XAw787WMJejOBv8IEPkx95Sak0cvAPLh5deiqmzqdwXBIDUv3ZsIUO8YRUSwo
 sesA==
X-Gm-Message-State: AOJu0YyNGjqgOWpITbCklsX4mP8gAppsy7CUgeq5UFomIi3KwOZ6x6+8
 nmtfmPcJoXQ5rFrBp1z1yGn/nX1CxjxQ+4niWx3d6nmCLcWRGM1jg1ttKCldfHI=
X-Google-Smtp-Source: AGHT+IFGePb1fPvmN8t8Fo6RAdctncnpLBA6kNUCpR9aFs/EojfGasdakroAbzArHZuERvQ4UFweqQ==
X-Received: by 2002:a17:90b:314d:b0:2ca:5a46:cbc8 with SMTP id
 98e67ed59e1d1-2cf2eb8440bmr3004816a91.26.1721932346160; 
 Thu, 25 Jul 2024 11:32:26 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55b35sm1886692a91.9.2024.07.25.11.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:32:25 -0700 (PDT)
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
Subject: [PATCH 0/2] Introducing I915_FORMAT_MOD_4_TILED_XE2_CCS Modifier for
 Xe2
Date: Thu, 25 Jul 2024 21:35:52 +0300
Message-ID: <20240725183600.3458050-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
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

Test-with: 20240725181622.3457403-1-juhapekka.heikkila@gmail.com

Juha-Pekka Heikkila (2):
  drm/fourcc: define Intel Xe2 related tile4 ccs modifier
  drm/i915/display: allow creation of case
    I915_FORMAT_MOD_4_TILED_XE2_CCS type framebuffer

 drivers/gpu/drm/i915/display/intel_display.c       |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  9 +++++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  8 +++-----
 include/uapi/drm/drm_fourcc.h                      | 12 ++++++++++++
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.43.2

