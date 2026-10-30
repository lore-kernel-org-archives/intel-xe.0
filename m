Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB096606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bSxdIKbo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C5A11276D;
	Fri, 30 Oct 2026 11:50:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D5B11276D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361002; x=1824897002;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dMORptQF0QORTdSmxjgy1LUQ5HTliQkyYmvxy4rQusE=;
 b=bSxdIKbouL/+VveTRRYx1l79Iy7R70cK0tQQAXvTBWw3q9RX0C224WQZ
 e2Yb6rD9qVDRlgI8i8zUBgqzTUDp4Qt9h7nGnjNaa6RS6T0VRidIQNmkB
 GhdeBABW26U31COs0/BKWkE1PMp3TUbxt2Dkx4ufWUJaTnM0bVqQr03Ob
 RcHpfspWJQw2aR5NV0VUDFxYdgj2HpiPFxKaeDD1EOdynr6m3gFyC9+8d
 O3BIuBCY3ga48FY3JUrA5OP1QY6vfdAO80I0/lSP8zlTyOF2WnsH7LvaD
 C26vwXlf83UBwMmmml0YwImFIHvPfvAB2ySM3+WJ5J5vvaa42kyLxZ6Md w==;
X-CSE-ConnectionGUID: ab7W5SfmRFGcAUzFz9fYBA==
X-CSE-MsgGUID: ZBtAYJw+Qheej+VRBvpK4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135382"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135382"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:02 -0700
X-CSE-ConnectionGUID: jB/3M+I6QGemTHyM7EO1gg==
X-CSE-MsgGUID: ZykkNTARTEu21c5lTHdjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441126"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] Interruptible bb wait + related bits
Date: Fri, 30 Oct 2026 11:49:50 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261028-migrate-bb-optimise-65bb54cf303e
Content-Transfer-Encoding: 8bit
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

Previous attempt:
https://patchwork.freedesktop.org/series/176670/

In this version the approach is to try to reduce overall pressure on
the bb pool. And then for the bb wait, which is now much less likely to
be hit, keeping it uinterruptible only where it makes sense, like when
caller asked for it.

---
Matthew Auld (6):
      drm/xe/migrate: allow larger chunk sizes for identity VRAM clears
      drm/xe/bb: drop per-batch prefetch padding
      drm/xe/sa: remove unused shadow BO and two-step bb helpers
      drm/xe/sa: allow callers to specify interruptible suballocator waits
      drm/xe/migrate: plumb interruptible wait flag to clear and copy
      drm/xe/migrate: avoid interruptible waits once passes are in flight

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
 14 files changed, 69 insertions(+), 243 deletions(-)
---
base-commit: 29f9258a2788a1066c0910c480e65c80887f4d20
change-id: 20261028-migrate-bb-optimise-65bb54cf303e
