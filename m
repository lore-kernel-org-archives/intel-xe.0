Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6741CD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269DC10E097;
	Mon,  1 Dec 2025 13:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1AB0LB0";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E1A10E097
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 13:06:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-298145fe27eso66639235ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 05:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764594369; x=1765199169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bL9TJHO12DwBaROAsnsHF4RaQCqCy2sz/2ZymZK86YE=;
 b=j1AB0LB0pvJHljlVOc/oayJl4yovddy8BfWU8CxeyKu1xEnK1ksuoH4YSoH8sIamp3
 1DdsXGyylHfQ4cUAEwvjPyNxFfm9aHbzDP7PRriEKm8QVRZo/7+uZqK9EGwBNAZi2o+e
 IRHiVe7t4Sn8l14mGA7BscNALGAFcwWvzxjPRL8M2OsRyGAWa3AQvCd/ef9wW68hB1u3
 vfumjPKhgWA8Au+76/Gs0748isWnEs9wdvC2XWEuBuav0UpoPBS+l6S2h8k3A5DnCZet
 VS5LeK1PmSRCHSe6Dw27FYsVHYpP3gjuZqO+30gAsmZ1YUnsVid5qAR2V9lA7HuUkq5p
 01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764594369; x=1765199169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bL9TJHO12DwBaROAsnsHF4RaQCqCy2sz/2ZymZK86YE=;
 b=YelAvzNGuiHPymYPHk3wFBu/y2eTQrU/Jync3Mv7TkFcbanlnYXZoHPyCnFcKh03VL
 epRcf+qAmxQhgmKVRPOp1T65iryWaOCODzRFZY2HETDlpvWo/wBkmQnYH5WuOCpSFSSM
 pRcPBPP2PAAaTT4DDIgfGKbjwO08HtThAHI+iXLavEX2CR94bpvZPkCv+wLS3NGWk6jG
 82qSG8GYGIaHbTSDWFAbLC9yBQ9fYieKvUefCfhaREoByEyxhNdwVDR+UKHJv13zpx2e
 UMcQX0Y/fCTQv2LAMnPv0QSVuA2syH99kR7OF2i10crUv1tyHKyNant7/a/cqDEr6yrP
 nwtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1QHzi2bJOB1t8/5L+L3UJjkfiqvl+sm3/qYvLuqYaCDcTrme/Ztjr4N5R2wG52nfTszvXC0hjog==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0nWi5rqzdqbGh/4DoEmOIVp0guNabqlBv2VTz6AizeLXpzop+
 tmmhW4qOZ7dbJnVfizWl0qGi82uizKUuWBLi2SruXOsDisWCaCowqvQ4b4ZXDfjH
X-Gm-Gg: ASbGncvKd/zFrPDsX3Nudqj3Nip5/UndKfExNDLqeQwrYjkuzru74T+V/chkHz+TSHv
 sJt5/+/MXAZQCmp4lNV7GlZxeHsidTSSlgo5kt4D/3ymDeWgCW7eSPUgFwbfDmGHnU95Vg94iOZ
 xyKisWXF+Nhah0Z8eykuhxcGmmM+o8z1Wbz3YNeKvaFvckPiEAnhHtw4NBcv+hrSF2zUTYX2Q5J
 K2mNV9g95OMkScj72heXMAhhW6QkEodqn3TYFdi/waitcXtawwFOE5qvXljjpXpNnfSWSP5bNCz
 TtZ2gnq01WqgW6X+0Upmo0+QRTrk2YUSQQmk4d49VZEb4JkkEYtzyEnhOZUn8HLHLUoN88s24Zk
 cbUKQomQLwG76u3EUm16Uzs4xVaxgflGbJtK9kziAjfZI16PZSUgaXu+SesMHs/Fz29jDsw64G3
 WUGcpNL2HzaFfE/23YmFzQipw4rzcUUB5XHN/b2CCmSGg/loYjAGI+M5sVmg==
X-Google-Smtp-Source: AGHT+IHxRYtdyZDcWfbmdxwzxr+ViF9Xn/q6Kgw0v0OynWsvCkqFj0NBR0zTmMMmoIEM8qTjdv5lBQ==
X-Received: by 2002:a05:7300:2323:b0:2a9:573a:4a74 with SMTP id
 5a478bee46e88-2a9573a5065mr13205471eec.9.1764594368766; 
 Mon, 01 Dec 2025 05:06:08 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a9655ceb04sm43002802eec.1.2025.12.01.05.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 05:06:08 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/2] switch to use kernel standard fault injection in i915
Date: Mon,  1 Dec 2025 15:05:57 +0200
Message-ID: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
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

Here taken out calls to i915_inject_probe_failure and changed to use
ALLOW_ERROR_INJECTION for the same functions.

Below functions are dropped from testing since I couldn't hit those
at module bind time, testing these would just fail the tests.
To include these in test would need to find way to cause resetting in i915
which would trigger these:

intel_gvt_init
intel_wopcm_init
intel_uc_fw_upload
intel_gt_init with expected -EIO (-EINVAL is tested)
lrc_init_wa_ctx
intel_huc_auth
guc_check_version_range
intel_uc_fw_fetch
uc_fw_xfer
__intel_uc_reset_hw
guc_enable_communication
uc_init_wopcm
..and all stages of __force_fw_fetch_failures


Also here added intel_gvt_driver_remove to error recovery path.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  drm/i915: switch to use kernel standard error injection
  drm/i915: Add intel_gvt_driver_remove() onto error cleanup path

 .../gpu/drm/i915/display/intel_connector.c    | 14 +----
 .../drm/i915/display/intel_display_driver.c   |  5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  9 +--
 drivers/gpu/drm/i915/gt/intel_gt_print.h      |  5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 --
 drivers/gpu/drm/i915/gt/intel_wopcm.c         |  3 -
 drivers/gpu/drm/i915/gt/intel_wopcm.h         |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  8 +--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 --
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 17 +-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 60 +------------------
 drivers/gpu/drm/i915/i915_driver.c            | 13 ++--
 drivers/gpu/drm/i915/i915_params.c            |  5 --
 drivers/gpu/drm/i915/i915_params.h            |  1 -
 drivers/gpu/drm/i915/i915_pci.c               |  6 +-
 drivers/gpu/drm/i915/i915_utils.c             | 30 +---------
 drivers/gpu/drm/i915/i915_utils.h             | 22 +------
 drivers/gpu/drm/i915/intel_gvt.c              |  3 -
 drivers/gpu/drm/i915/intel_uncore.c           |  4 +-
 20 files changed, 19 insertions(+), 199 deletions(-)

-- 
2.43.0

