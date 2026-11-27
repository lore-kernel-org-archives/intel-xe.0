Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C01A606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyUKYl80
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6510E598;
	Fri, 27 Nov 2026 12:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DA010E598
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781693; x=1827317693;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=QftqLCYMy+ZMJKGcwKGEz2RBR6ZNpL93w5sHpcaR0Wo=;
 b=SyUKYl80ZZfrujEnlWl6lgpLpsOwaAdr0nQSr/ckH90NnMkgnW4sEtCW
 40n03uZoIWnKM0OdyTtFlOWTjS5L8rzsdMeQdd7+7YuqiLwMKaCp3StIg
 xEmLzdqPyeXBDYts7i8RSDZoinqvdfNuOWWuMDUYxf3/4Iua+J0bGdHNl
 i4DZ/mrDzYPZyCWC94ooPZDI6xLN8Gx4sp5PSfTY0J2t1Vj9XszEz+YjZ
 oZ4WtwVW0wIGGymS4OQ2hAP1EPChWkAQ/08H1N1MDrT5rjIrOkolOwjhP
 P34f5dnSXUJX+TOQULodUG6Fz369qCKuw5rMf/ouubThY+VzvsGiZZ651 Q==;
X-CSE-ConnectionGUID: VEnmGZJdSHO+v9IQIaKweg==
X-CSE-MsgGUID: GoCLTwgwRheOpyK9gMz4eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4599396"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4599396"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:52 -0800
X-CSE-ConnectionGUID: GF8fqlBLQKGI5qeqlDiOYw==
X-CSE-MsgGUID: 0ww2Rp8USw25TOVM+OIrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14404679"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/6] Interruptible bb wait + related bits
Date: Fri, 27 Nov 2026 12:14:10 +0000
Message-Id: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywqDMBBFf0Vm3Sl5qGhX/Y/iwsRRBxojSZAW8
 d+bSpddngP33B0iBaYIt2KHQBtH9ksGdSnAzv0yEfKQGZRQtRSqQcdT6BOhMejXxI4jYV0ZU5V
 21EIT5OUaaOTXWX10mWeOyYf3ebLJr/31tPjb2yQKNM0gZF22dqT2zkui59V6B91xHB8L/9fIt
 gAAAA==
X-Change-ID: 20261028-migrate-bb-optimise-65bb54cf303e
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Original motivation comes from user issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644

Original attempt:
https://patchwork.freedesktop.org/series/176670/

In this version the approach is to try to reduce overall pressure on the
bb pool.

The first three patches fix suballocator waits so callers can control
whether bb waits are interruptible, keeping waits uninterruptible where
required by the caller or once multi-pass migration work is already in
flight.

Remaining patches reduce overall pressure on the bb pool and make
hitting the wait less likely in the first place. Also, there is a small
optimisation for big VRAM clears via indentity map, in addition to
cleaning up unused suballocator helpers.

---
Changes in v2:
- Add some missing Fixes: tags (Thomas).
- Move the stable fixes to the start of the series.
- Fix display fbdev takeover build by passing intr=false to
  xe_migrate_copy().
- Link to v1: https://lore.kernel.org/r/20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com

---
Matthew Auld (6):
      drm/xe/sa: allow callers to specify interruptible suballocator waits
      drm/xe/migrate: plumb interruptible wait flag to clear and copy
      drm/xe/migrate: avoid interruptible waits once passes are in flight
      drm/xe/migrate: optimise chunk sizes for identity VRAM clears
      drm/xe/bb: drop per-batch prefetch padding
      drm/xe/sa: remove unused shadow BO and two-step bb helpers

 drivers/gpu/drm/xe/display/xe_display_bo.c |   3 +-
 drivers/gpu/drm/xe/tests/xe_bo.c           |   2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c      |  12 ++--
 drivers/gpu/drm/xe/xe_bb.c                 |  90 ++----------------------
 drivers/gpu/drm/xe/xe_bb.h                 |  12 ++--
 drivers/gpu/drm/xe/xe_bo.c                 |   9 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   3 +-
 drivers/gpu/drm/xe/xe_guc_buf.c            |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c            |  25 +++++--
 drivers/gpu/drm/xe/xe_migrate.h            |   6 +-
 drivers/gpu/drm/xe/xe_page_reclaim.c       |   2 +-
 drivers/gpu/drm/xe/xe_sa.c                 | 109 ++---------------------------
 drivers/gpu/drm/xe/xe_sa.h                 |  31 +++-----
 drivers/gpu/drm/xe/xe_sa_types.h           |   3 -
 drivers/gpu/drm/xe/xe_vram.c               |   2 +-
 15 files changed, 71 insertions(+), 244 deletions(-)
---
base-commit: 2167aae7e27a3c224f220ce01eea87498ff3724d
change-id: 20261028-migrate-bb-optimise-65bb54cf303e

