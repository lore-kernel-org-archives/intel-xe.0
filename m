Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98099D116F6
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7B710E046;
	Mon,  1 Dec 2025 16:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XAQW2x2n";
	dkim-atps=neutral
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D9610E046
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:10:21 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b98983bae80so4127470a12.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764605421; x=1765210221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6yqxq/Eo7orQOpG1SgVb5eJDDwz7vM469bb8qAnY+v4=;
 b=XAQW2x2nG1NVAS4o4txa4Y67cWwcoSe8wljENsIhEzYGwpKHciR34TK1iZ6RJdJJMD
 66SFEtSy8S5wG/L9fj84YQXgl3dFXea6j0pdINFTjwUscCzi0qAuKTlFGrJ5iaxwONLd
 LRNBJ9mZat3SuHJ1AlmNFmBTZb/0GHTrBwQOIALpu1iY2dHKOzObCfOpRnUA2UoqiLod
 YuNPe3xHZe4lnE2/X/1FDMqXaVMLuJz3DXnbikUWidQKA/SCq/wXPXs5UkQTh0YJNGWv
 7Pq8zZmphWDDAfKhDEVHce7zajjZzH7k4CmEvZGwOZGiZLTUbq+9IJa0Sh+QI0tFAY0d
 fkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764605421; x=1765210221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yqxq/Eo7orQOpG1SgVb5eJDDwz7vM469bb8qAnY+v4=;
 b=OxiiEPQpB5qVAujweSUXdHSAndEWWMfi0wMU84WaFy3NLtowFmUZrRegod1ELUwhS3
 FApmnseKlR1Kt3k60MFwlEE7O2v1q3E8RCCnae4gktYVeGIb1TbFqNGmnVBU9ufgzB5C
 lthcNi4yhdeZPLpmLlYGHW/Gq92Q79k2IY2LG2ecGcwkHcWka4vypfRD9UAeUV/PMao+
 k1my3OTZPONLoLK2EgKri/8ikiJuKikfFOTqn71R4GoFd6Iuz04OfgwaLlxmFJzyXRr0
 KQHar8oUmN1BLLA60PXUp75NRbcBtp6uK97ROTXz/UPQywoedxRMGmgAx0t333DbYpdi
 xA+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTUOMcGX41QgHW5hd/FQNieY88EEk0PREB9PNeDJLOwiyGa4SlmK9revDIrQbSsofZ6rIgG+6j3Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0rNkbxS9N6oUm3w8aiVDPf2z1YUjZdyk+UZcfNQmBCbOR8zyU
 ZJ26FymTuGTI6qf3nrA/qCWFASdM2QuSjFMPobc60C2CbRWDC+PLqJYz
X-Gm-Gg: ASbGnctvY83DB4EkVQoMJ6IcBB+q1ywSsl69W8yOOIz/XTfri7hS4YpdhGSIFSX35Nf
 P8Gz7XUTDKdX4nzVu/RIrB/HFq4fB0Ivd9PkA7eUeWD5RYvZwpjAbZ78tWXBzAOnLbwJwfyrfwS
 n+wibUxRCQ5kq+BwqgE+GlAoEOXLdQr/MDsfvhruLl6rJWBcfZJ5B0vfi7bcrJRqGHOTPmLKq4h
 laxQ1Ygmo0C1m0snzusM/pWyn+usS8k8mHtW4iTJUuMszVALvVNgZoNnAFy5R3unIGDEmnwLmj+
 cQk/0ixKpKZFQBR7TZRHFxcju07htQpCaMjlwNjwUwHcLZcbAocq/yltzTfjCy2tMraPuXDQ1jt
 vy13ipflv4rLo1dmtrv8RdSNcmtjugiC1wc9mR5v0ILhDn6iKx/yxiqQ7hHUspA4PoNxGkfQkvM
 FdkAjCULw9orwTyxx1PJjz/LzfNOcbU3Iuw/OQJ8l/AyMlt0Q=
X-Google-Smtp-Source: AGHT+IHiAsZMd5C1TWdr/v+o/uYLI+VAwXp0XH7jbB/AVAxfXEV6/QUegClWw8Cs1JfG5BWE9uPN6A==
X-Received: by 2002:a05:7300:f590:b0:2a7:769:ca49 with SMTP id
 5a478bee46e88-2a719537307mr20119037eec.8.1764605420848; 
 Mon, 01 Dec 2025 08:10:20 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a96560986csm69026567eec.2.2025.12.01.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 08:10:20 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/2] switch to use kernel standard fault injection in i915
Date: Mon,  1 Dec 2025 18:10:11 +0200
Message-ID: <20251201161013.735943-1-juhapekka.heikkila@gmail.com>
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

Test-with: 20251118143301.510707-1-juhapekka.heikkila@gmail.com

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

