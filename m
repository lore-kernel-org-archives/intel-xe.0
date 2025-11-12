Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F5CCCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 12:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CBB10E6FA;
	Wed, 12 Nov 2025 12:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMn9wzhS";
	dkim-atps=neutral
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C810E6FF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 12:05:53 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-78af3fe5b17so607346b3a.2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762949153; x=1763553953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hAV17ofA9MonBCDA8VqIe2NviuUZk8J7FIjpATUadWc=;
 b=PMn9wzhS6PXhcwlNPzdZ1c9AisClyetTCkAdVG9bQToca+Q+uye68begR0LmUNI6lm
 nwbl8UieC7fAN60Ge4ZRy0op7XsJxubyzl0G/5tOb9tN9PMcUhnjYqwPmJxN7ItW5mP0
 XclDLwepAVQRADBUfOZw+Wiu+q1hYvwk2uYAT++kjfJnSLgk6CwYPdtKomoTR5biShED
 Jdq6j+wLrU3SZZgHoPSE2wCZvTeKXqChBTKZqRirMTLXMYA8uy8dfvt28/UdCpdtQ8Tj
 /YVkgdE41SrkkGkxJUuXCsr+Wj6ik32rh55kr6FXJc51N6QqlB4XQv0BvNal9tJFqWUX
 HVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762949153; x=1763553953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAV17ofA9MonBCDA8VqIe2NviuUZk8J7FIjpATUadWc=;
 b=uxJGM8ogSVWpGY9yMQLl6w8/5AJSq85MaJr1l0Iu/a8wFx8tXCF/QeVDWngXU5AJrg
 XDuuPj/Z4yDTgGb1BYLjJgzlZiG6qCpseciqCxpkjvbRHmiV1nJztW4NS9eyBgcY32dL
 n9qXS+x9eDWmRs3cDwD0jtyHRlkzX1x+Nkp9UVGp9dzxzPjbtrBn6MxCi74pwMQjN3u5
 QmFrtl+rm+1ON4FVphATsQpDbNFIs0CfBPQb22ctNRz7MjX/nOl4657oMiUSuCdI/o7v
 7BpFMnKvwMPIK2Qg6M1WMjKM4Bdf0xVTx0PzgH7cZDeLRcrnbawICBTT5HtxPPb08I/s
 PPIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv0/0lKiAcPzdIkoSEk+iKxK5P1IFoRJWTmrpx7TAYAlKF1sEjpFvY6IgAdNTAsNi5CSrmdkG+Pw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytogsKq7vJgg5bwZtZS7sqddidWlese1XoPTvzTBfCFq6LPNl8
 hKtKpaieZqfls6RXrzdyyU8LgsB/fGdRU/UmEOcI2qme6rDSGYXllvPzQWOFkVY9
X-Gm-Gg: ASbGncu2SWQw2lBMlyTQO7aEsnyU/2IQ180vWkMJsoGfkuy4aSaMzjMmbufrFzKCTaY
 ZIuXq1MSH8WFHibdApRUWbC4jQ/VpVkAgI8yQIOWb8U63oApLeSL7KILwWVNW9WvP4wWci0GcUA
 AMjGABKleNyLhANfly129/d3mW3iRhupXBx8QTcDVhNlfa5g/jIbFOgtlimuT4NfJQayWTDUtwC
 9uXwwFnCZYWB/js+kjhZ8sYzqzmyrFNCzcJjoDeMIa+XJSvRQ0UfQLgL9QtGvPCgqPlec2CPMF0
 MeptJEgRH9NiBubFdfgSEKVoqYVFqrsvJaKS6f7fmlvfosghSHnl5JgKs+J4GnPLUdXnRPRDO+W
 2MF+w1XHzxLYR07ow0/p3srgmnb1negM/mIcuBjDAj813gOppkfY1lc4F9Mj3kYQsSI6p1XvrBm
 SHR5qKurbhTByS+iI=
X-Google-Smtp-Source: AGHT+IGyUDWogT/E0GqaLkZpiyyl5RSOXgSaiVqqbXvdG1UvILXDxE1n6Qq34Gt5+UxLXI2MzZhr0w==
X-Received: by 2002:a05:6a20:3d1a:b0:2f5:ba02:a2a2 with SMTP id
 adf61e73a8af0-3590b02abacmr3663208637.36.1762949152676; 
 Wed, 12 Nov 2025 04:05:52 -0800 (PST)
Received: from localhost ([192.55.55.42]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0ccb5c674sm18196352b3a.59.2025.11.12.04.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 04:05:52 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/1] Switch to use kernel standard fault injection in i915
Date: Wed, 12 Nov 2025 14:05:29 +0200
Message-ID: <20251112120530.448802-1-juhapekka.heikkila@gmail.com>
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

Test-with: 20251111194936.444955-1-juhapekka.heikkila@gmail.com

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

