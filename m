Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C05DC88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E9A10E599;
	Fri, 11 Sep 2026 21:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="V1BedFKT";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB6110F65D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48436216a98so664872f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139108; x=1789743908; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mniijplyGZlkQZmDrYFnOPglJBLK+WFjfb4odBVk/dg=;
 b=V1BedFKT64n6GOpbO/JpGOpzLgyIijYwldqwvPoOebpj6iIeiFMgQQ/U/dhWcl3PeJ
 Mt96cfykNoiyTN6eqLf1dAr7fJqLXmzsX6JEPKKce73UlOgNI1EcCjOqxpIU7iH7B4Rz
 kagFOG6TzpuxjevUu9p74CFT4ymZUJQegGnsJsbvyE0xh0MpNALTokXy9ibvUrf5UYTV
 rh/h/d24nzVLYixZFnUZrMktrTsJGxOftpGS6hjMT7hY5EuzuxxszJ9TtffgaA1dT8m5
 8d7hw3aa28DFL3oquB9jBfcjbzFbSo+6an32Muzjg/6/Iw0BTT3tIPth2WPV0cGjJczq
 eYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139108; x=1789743908;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mniijplyGZlkQZmDrYFnOPglJBLK+WFjfb4odBVk/dg=;
 b=GKqujTwRt6mYrraE2XuwLKmGzNRUSB9YILClSW7OQZbvFn/I1I5izbX0p2Z6X6y8tC
 J8rIpScHRjBJpKTijHSxzBmBBUW4sDeiPUUsgkZXDDrgCaMqT+VcPiGw3pdMuZrpmoRF
 +5X5TJgZZW1V43+bmZZMhh3arftDiUp+Dlvtsm52hpNisdzN/XvewoWFu3dUmWYcMKtk
 nEOV9irUSseVTtFJxSeJIv64n0/KBTqMhciZ52pWdTrPljsC9e4G2jd2ffbjvM7i8YxN
 tSHOgW2fObkSJ3lf5lIfL/2HPL3+Nmlmys8ww29hwe/7YtYok+xiC4uybEFIq5lIn5uX
 IgmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxB93n1udD7yMtdW3UUOWMb9h2DhpjOm2fShJCTQT5bqB6owXqctYtOpLPThLwAVcLv2W1EH2Qsww==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kojrOpvC3vEZZalOib9bQtbI9zMnYhWpqmyq8bPSc6sj0J3SyP
 1b8dLmDqw1RUDkALYbE2MhctP2/xnsOam85EChsHXRidRQtgEN6CW5fY9f9KvxbD480=
X-Gm-Gg: AYBFou2TTXpLMl61dFVAMPdG/wr01xaRC6hWbn7od6UmSJ1Oof6YP/PkGifz7DQzPSe
 J5PNeyandXW8sn6sV2YstpBcuJlf8G355ka36g/FWeSW3wWpZczroWpsZshElXfYL+F781W1q67
 h/c2hCuRuQHQ6LJ2t6RJS9eCD0U6fj9d5q47oVkB+/ss0jmR2M2MKOq0GWUJkINg1SwJYlzoUeb
 H7/cMsLWE6rDqjwg/i3cNnzvi70psz9UCnwKl3uO4YAHnz3Dm7EGImq/qv5PQzO8GXSMGql1SbB
 8C0oL2RuuZqHlFShYfRbjQON2uaEMT1tnIce5b1mMJ4LMAv29B1WSz6mSrqABZriNhj1w1NFu0Y
 NjqQun0xH9+FMWMnT9N01gxMHn4fBfyM9xqsW78D+NmuTAAtyZTCT1dPHsoWLLP6C+BEoIOTLgk
 Qe+LdNjnifydUkawS+UI2dTQmfF2N9Nm97G9AvItBQgTJctxYtMg4ivpODM3I+mvFfm2ovtrW9k
 CZmPejXJBolRSpU
X-Received: by 2002:adf:ee86:0:b0:485:8c17:975f with SMTP id
 ffacd0b85a97d-486eb2ffac7mr4035568f8f.33.1789139107698; 
 Fri, 11 Sep 2026 08:05:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:07 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Remove the error-injection.h include from linux/module.h
Date: Fri, 11 Sep 2026 17:04:00 +0200
Message-ID: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260816-module-include-error_injection-4f80e37a8ea6
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Sep 2026 21:45:10 +0000
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

linux/module.h appears in roughly 15k #include directives across the
kernel. This makes it a "hot" header, so it should avoid pulling in
unnecessary definitions.

The header currently includes linux/error-injection.h to obtain the
definition of `struct error_injection_entry`. However, this is unnecessary
because the type is only referenced in the file as a pointer, for which an
incomplete type is sufficient.

Add explicit includes of linux/error-injection.h to files that use the
ALLOW_ERROR_INJECTION() macro and currently rely on it being provided
indirectly via linux/module.h. Then remove the linux/error-injection.h
include from linux/module.h.

The first five patches can go through their respective trees if preferred.
The final patch depends on the preceding cleanups.

---
Petr Pavlu (6):
      block: Include error-injection.h for ALLOW_ERROR_INJECTION()
      net: Include error-injection.h for ALLOW_ERROR_INJECTION()
      syscalls: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/i915: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/xe: Include error-injection.h for ALLOW_ERROR_INJECTION()
      module: Remove the error-injection.h include from linux/module.h

 block/blk-core.c                                    | 1 +
 drivers/gpu/drm/i915/display/intel_connector.c      | 1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c | 1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c           | 1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                  | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c               | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c            | 1 +
 drivers/gpu/drm/i915/i915_driver.c                  | 1 +
 drivers/gpu/drm/i915/i915_pci.c                     | 2 ++
 drivers/gpu/drm/i915/intel_uncore.c                 | 1 +
 drivers/gpu/drm/xe/xe_device.c                      | 2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                  | 1 +
 drivers/gpu/drm/xe/xe_ggtt.c                        | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                         | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c                     | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                      | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c                     | 2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                   | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c       | 1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c             | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c                        | 1 +
 drivers/gpu/drm/xe/xe_oa.c                          | 1 +
 drivers/gpu/drm/xe/xe_pm.c                          | 2 +-
 drivers/gpu/drm/xe/xe_pt.c                          | 2 ++
 drivers/gpu/drm/xe/xe_pxp.c                         | 2 ++
 drivers/gpu/drm/xe/xe_sriov.c                       | 2 +-
 drivers/gpu/drm/xe/xe_sync.c                        | 1 +
 drivers/gpu/drm/xe/xe_tile.c                        | 2 +-
 drivers/gpu/drm/xe/xe_tuning.c                      | 2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c                       | 2 +-
 drivers/gpu/drm/xe/xe_vm.c                          | 1 +
 drivers/gpu/drm/xe/xe_wa.c                          | 2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                       | 2 +-
 drivers/net/netdevsim/tc.c                          | 1 +
 include/linux/compat.h                              | 1 +
 include/linux/module.h                              | 1 -
 include/linux/syscalls.h                            | 1 +
 kernel/module/main.c                                | 1 +
 net/core/skb_fault_injection.c                      | 1 +
 40 files changed, 45 insertions(+), 13 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260816-module-include-error_injection-4f80e37a8ea6
