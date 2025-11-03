Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B16CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1AE10E493;
	Mon,  3 Nov 2025 17:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJnd4S0C";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46BA10E491
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:52:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2956d816c10so21419065ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Nov 2025 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762192339; x=1762797139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5HpvJX47hFrWiRSANC4NR6oeqqm/jPnmMoPcCTF0knQ=;
 b=lJnd4S0CrfoBMmPrlYOB4NAM4Cm8Yzw1mvMF467S3MHnJyqZsk9PdEwlTuK9UNxeet
 YjY6OXFqo2E8ZWhHsXhPcR4hKFdY8Ih/gJNqF5A8iS//FdPKc6q2bjArSuYh9FR5EkuB
 SOkBcOLmxMvaznjTNTMKaogQ+6FfNoq+X34MfG4b10IIlMFyJshDKS2Hc1Z/H5ePmJRR
 GdmI6xsNJ03r53b7ouzGUIt7X346jm4cjzjWff2pxbZM+/V6NSCjtdqM50blR7257nmt
 UdDwQK047A+WaL6xNPDfVgsJXvkAUdZjSddiYKHEaT/7V6YnZDrmk57uOc9gfCHejAud
 EylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762192339; x=1762797139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HpvJX47hFrWiRSANC4NR6oeqqm/jPnmMoPcCTF0knQ=;
 b=KQcFJ5oNz95c1VM2rEhk8mber761xMyGB/LLws9U4rcknAi/XEBnfJNQsr2LNIawIt
 8Viwjrfldqxm2vAdo+VZx1tbe0vlBacmFnkpkZNz1zkbo3NiHr7/VUCRI37XisFIQo99
 AALjZtxcHgxKTCd8fYaO6drbGjR4pXThqXtbu6eTWcYJE7/vjIZk6Vcy3EoOD0wcEuzj
 5o1h7ERs4pCV+tRqYwokP3tzyV1IsBB6fo8ebRa8ISiiPYomSgRG9jAUW8BYOIJR47wL
 kVNYCil51CN/uAWpKkERCU0UJA/HbwzgMfHoMRhRgfuEqIDkKfyKkKRkp/igMPERthbh
 v1bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgEgd9cHHZ/Px884EhVgtpfb1JAr8fy1N+FoprjrUO/Lxy6i6t1TZFTL/+KQnTqXQT8S5Fpcs7Tw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpmB6s2f0ECJyocOWfk7HxwjzRfAEApu7Oau143M8lqdjjZUhw
 R9J/wd36hvfCtb55fs51Q0TbWVVjbr+4tttoYyy30Y/UD5LiN7KnTJxD
X-Gm-Gg: ASbGncud2iuWLEQJuo2HfAjyxSVXeDVo47GAlA/dgop4ZhYqZQtKQ+KQJYK/QpLdnTJ
 L/Z+IGCi8AdilTVz38io7SQ3aMnDfJ/aACfIJGgLaAgBzqIToS4n0GG2wtnibjbCQCa4ZBpKG01
 qKVWHY3nt8Sle/1npIgxnnsJAWWQmnT76/9CQcar9LN1QMMkw3Iw0QwmWwPuxGaEyjMRNCfSgOx
 pcH4vkHyVR5nbdbuRdApK/xxGxopSpRjRaHvk6KV0oRVUGJNBS/mPSkYP8cs6F5IBXlI6OQ0oKC
 ng+r1RKAjkR3fpVBEUbouXFzrFL/kBE6TfaJmkQ1GZ0OGryrWfkFTmy6alNZV0O8z/wT1u+VwB1
 kaec6k7Qv4sN3I0RGjYim2bGW2Kv+TFhyKR7/YllfOej2N2BFtYY4IcPMEba+rM9SoYWwbvxCm8
 ZcwQHeetw3e20HWRr6hw==
X-Google-Smtp-Source: AGHT+IFX4wELdr0pTLsp1G4cdjl2Vvw/HxeL67SZyg8W5Lk460ekfQ7V1jGDUPAPmqyXLtIqRNjrDQ==
X-Received: by 2002:a17:902:db09:b0:295:8c51:6505 with SMTP id
 d9443c01a7336-2958c516a0emr73799835ad.33.1762192339169; 
 Mon, 03 Nov 2025 09:52:19 -0800 (PST)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29557bd3679sm94013385ad.87.2025.11.03.09.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:52:18 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/1] Switch to use kernel standard fault injection in i915
Date: Mon,  3 Nov 2025 19:51:33 +0200
Message-ID: <20251103175134.343703-1-juhapekka.heikkila@gmail.com>
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

/Juha-Pekka

Test-with: 20251031181216.172174-1-juhapekka.heikkila@gmail.com

Juha-Pekka Heikkila (1):
  drm/i915: switch to use kernel standard error injection

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
 drivers/gpu/drm/i915/i915_driver.c            | 12 +---
 drivers/gpu/drm/i915/i915_params.c            |  5 --
 drivers/gpu/drm/i915/i915_params.h            |  1 -
 drivers/gpu/drm/i915/i915_pci.c               |  6 +-
 drivers/gpu/drm/i915/i915_utils.c             | 30 +---------
 drivers/gpu/drm/i915/i915_utils.h             | 22 +------
 drivers/gpu/drm/i915/intel_gvt.c              |  3 -
 drivers/gpu/drm/i915/intel_uncore.c           |  4 +-
 20 files changed, 18 insertions(+), 199 deletions(-)

-- 
2.43.0

