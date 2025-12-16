Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD0D5C0CD
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 08:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910310E743;
	Tue, 16 Dec 2025 08:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uf4taUh+";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CB410E743
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 08:08:26 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0a95200e8so22535925ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765872506; x=1766477306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UcGwnkJI+x9Zj9EkUAHg+6nFkUOQodVP98UqzkIBE1k=;
 b=Uf4taUh+JgjH7VM+fEqtzPMQRTeHo6Uota1+gF/05t8niq9jqweMsWuwvXVIHuNJi/
 kScSjJYdjV3O8hSy0X0XzwLhlYpxA8jFe1p3LwzZnrtNphkoW//veK0K2b3/SLCzuc7X
 jhoG2HFDcMLRU+G1Gm7gkSK2UBnZitNxcfZ1g50Jy6Eda9VrR078j+a5+myzXUuG9cfE
 0xFWwKJaakSgRlQUOU3FQia39+HkszakkkSLbbU9ygiOnqIwrCamnp33L5wJ3TFEmftq
 meFzw34ATW17QjZ2hBDbRKZA51GwQpuaYsb3iVuXJN0oPk5e0NQ8PySB88OnsXkgGuSP
 wefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765872506; x=1766477306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcGwnkJI+x9Zj9EkUAHg+6nFkUOQodVP98UqzkIBE1k=;
 b=TRXUZeYslv5VV5Tzk4FF8aiJ3n0/H4oMSUdWlWhY98jexMEncfWz+iSdSRdPqlx/LO
 Ra+8PT0byYH9U/hZ9OfR+p91NBWuTcrxHlC8ahAH4s/aP2XByonK70DmVr7+0qVqyauU
 2pTtITFlQH3ilakZlG32/83uER0mRVMVLGlOjHdLhnRFZE2in2SxnQBjFQ5KYubuL04S
 fllHEq4ULxv2/puvcu4ZXJ2a7jnnUYx1fI8sMbbFS4C4Zq7nBpZ1ictfYJA//97Thrxo
 RkzA5RUY55KFMXnHDqnMABycEwPthyiD150e+xI3O1eBBOyQ4ENqHOJPzdraqJuS0TYB
 g00A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+F4I+2rGRG19r/Vnb52mH69wog5B7493BuZ1olvxKjCO8+PGaZdjVWqwZ2RZ7/cHwlF1tSpZ1Bg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvh+83mw6+ULgyoIzI/sjwK/IvcVGUugemWGRx29lEfeidiwHj
 fHdSI5Q/aEoQuqWAr55GHKd/O1emjQqoW39iOAi23y6YVcIwtX2FlU5zZO+Asm4UPOE=
X-Gm-Gg: AY/fxX66zrXxfZ6Whlkzv0HP4LfgxlWQmCFRXt3VY9IPXtEYf/L5QzmmDlpDA2H4Gk9
 6qYpP3ubpg+FBTQE2F8cOTPhsV+7Aabh+g7wfH91O5kYC07XjTQD9cfP9341FL2cH190ZcBrAym
 0+W6QWqLtQJr9dNqoK1qI06sfINlBvBaipoF2HJFJmlNbXBGILZKyQHjq9IVRqwu78q2wtiJtkA
 +mm+c8Gu96k88EHgkRI8omrdA7hHjtchIEF4L35i5f3JQFch3pdakqYFx18rvKaVNxyoGDbVXdE
 xqiQLOf7iAFvfDqmK7y19pmvP88/A+oA8h+ErybewGyV1yC8dWDj88kAfcbn0pThvPKjgrjtULI
 gs/aLSsFQKtstFrI2mswjbWBP67IJN449Zfqq8p39OxkVh9CoV9y8vX+AmX4kFGMbj4yuAmY5YG
 swTSALgmb6WkH6krvZKROt4jRMZ5qDiuo6+7MMg1UfsgxmyzJc3avKG4pTE/SP
X-Google-Smtp-Source: AGHT+IHjLPpjkhRHBhcs8Nph29+B00E9r7Df3sKFF9Qg/AnA3mcDOGgHpW+Yt2CFP6iFnQPe45cuVg==
X-Received: by 2002:a17:903:f90:b0:295:b46f:a6c2 with SMTP id
 d9443c01a7336-29f23c7ba77mr137880075ad.37.1765872506098; 
 Tue, 16 Dec 2025 00:08:26 -0800 (PST)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9b36af7sm157481845ad.18.2025.12.16.00.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 00:08:25 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/2] switch to use kernel standard fault injection in i915
Date: Tue, 16 Dec 2025 10:07:52 +0200
Message-ID: <20251216080754.221974-1-juhapekka.heikkila@gmail.com>
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

Test-with: 20251215134510.183735-1-juhapekka.heikkila@gmail.com

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
 19 files changed, 18 insertions(+), 199 deletions(-)

-- 
2.43.0

