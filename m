Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C1ACF34D3
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 15:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B525710E03E;
	Wed, 19 Nov 2025 15:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J459P6Ld";
	dkim-atps=neutral
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E7F10E03E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 15:33:48 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-bc0e6d91222so5108697a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 07:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763566427; x=1764171227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JFDb6c2JZWuaLGSfnoCesjNWdQPTSohr+0a0IhhrJq8=;
 b=J459P6LdfN0HkzeRyekqixK7qz1UaZeZ1m0U/HKloLcwWI8lFekXN4GDL3dzgoRzcD
 lmEYxrCRjZS3S6Bs6ZvUyNncsprt0AZ0SoaSDqs5xB8zHhXfMTs/EfkMdqt99TV06zDc
 q/AVz10vq0YcB/7ruj3M/Bxpq1tMEu2j7Na90l6R0y6HBz0fOO4kXc+/3k3GNQmj1Fa8
 yKimIAnQ4FyWXZi8rRXaMwqobf8sLe2eXSd4tTkrBZr/TS1I08AVVd69A5e0da/0iOZN
 KtCnN9Kjn79AQZn4fp++09Z8VDgLm6O8dwHAhdObPeo5+Eq1tGOK1lTvzdIKupS7lrAV
 rZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763566427; x=1764171227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFDb6c2JZWuaLGSfnoCesjNWdQPTSohr+0a0IhhrJq8=;
 b=GHuBbw4UiS0vDo4iZbrXBWwVof8Gd2GFanbhptQuEHRYNTXnQCAvMQdKkbZghdu09T
 Pm0QljRhnQGqjTpETiGr9+Eer1Aml2Mvd3r0d0deE61VaekcImUDV/Jmx6r2c60LNtif
 bqCE8p/1jZl+/noJZG3/BacrmCwV8005aDRbNWFbTRbkBF4rieBdLmbREd5hFVcO6ZJ/
 zIDaGgh6WWo1J3ziMFj02V7jro7+CqvLcFvUFjPIXr22ePi2i5LCqayGGd1xOXNIfHO+
 c8aETQofVKT41v8idfh9bHcFM5PhAkcGYNAF2DaOx6VXeXREvmuSNBies6Wkg0tyEHOl
 QRqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD00oeT0eeJrNMQ/HfANK5OoiYB/i9LL/h0xJay+8sV+GhdCp/PUw62026HX7Z/nQAURRVnnNytg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqmQgIdU3uzUtel+/b36aV1XPx1d9E3vOQXMBqG+41VNH5yc4X
 hJWFXW3Vj1/IqZi+wxPr+wIufQO/w9Hgidt2HDxXDHJTRQbLYgZCoNew
X-Gm-Gg: ASbGncsljtDy5MUNFWKV9dLBMW1t8R/thAVREAFByvyc9QUEsQ6LtQEbf/Ie2whL+NN
 mfIRRUlXvZLXESWUasby3+qjFtXtlkzyeAbb61B+AmHNVazkCj3zrRMEqQqhDYtxGGVgY/Z86tL
 bEDry0hd2RZYfrzRyyYV5LCak+k+chKPfUsL/OrI+H+vACIP9eSjYpaHvxn0lpOgvA8kfYrXqPT
 72k4LA3+on5xWiAFTCen2BFFZtua2ZpAgeh0m7mS0mkTBXIx5t0/HEq1BoAsJJgkfwVbQKMWNVO
 3mL1gKuNFnd8GxfNcdfi9Wwhsn8faq/WjDcq1uKQhmgOG0CKrfm/KeiPlrCKMGnaZx9zprT/laL
 vaCCli+q5wMB4l+E9ibOxAgpcaLRQcUxJEtjlrwqng7Q71qNLknpoxKV4kzIuf4NGxGjdbTwfcC
 IdOoJd/Vp0ba3Jm2KZ5950buxG8g==
X-Google-Smtp-Source: AGHT+IEMeIRzWxM8Mo3lgGEFyym9360jwoy6nbYqawzqz2rn3upWxUWgozDHjujTiGf/J8XssbjvVQ==
X-Received: by 2002:a05:7022:1707:b0:11b:7970:ea3f with SMTP id
 a92af1059eb24-11b7970ec72mr4159915c88.25.1763566427263; 
 Wed, 19 Nov 2025 07:33:47 -0800 (PST)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a6d2570e69sm14147182eec.2.2025.11.19.07.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 07:33:46 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/1] Switch to use kernel standard fault injection in i915
Date: Wed, 19 Nov 2025 17:32:56 +0200
Message-ID: <20251119153257.570726-1-juhapekka.heikkila@gmail.com>
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

This is resend of the last version just to get igt changes tested.

/Juha-Pekka

Test-with: 20251118143301.510707-1-juhapekka.heikkila@gmail.com


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

