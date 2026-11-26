Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VlJG0Qeh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DAE112275;
	Thu, 26 Nov 2026 10:46:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B910E1F9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795689965; x=1827225965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=609xwgSnQOnP1dUz0D+93JB+WTaw35jYnUFx1775W+A=;
 b=VlJG0QehGTjcoI5GkpOkjlWKBWUCN0dxLRzPOjSiEjljc2uGI5M1wZNn
 3VEhbjSHhpQTxpXHTIo5qlDNumEx7NovIhETYvwIEsmZTxXIi3NSeBv47
 NeQ7qEh/LB73c0j2V3Rcr+S6w13dpDcm9rCWB0u7ky+aBk2szqUKSOHOn
 nCYCJP5d22lnv/fcZRN6laVmz9089Od8XU3MNMgIIoHpHe7415Ly4R1Vi
 oPQ29ZeRXTt5MBKub5XgiXylOU1PXj/JVI3ONDug1m9ernBLnRFsK3LGe
 ryFaOkUDDpYW8aHg1PLN/CJXWFzpUh+B9f7Vxra//D+fxIIaw9l0qzFkm A==;
X-CSE-ConnectionGUID: SPv/oP1ISGyZPmCElyXmUg==
X-CSE-MsgGUID: tE0RDYaYSbOgkiCXorziqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4605040"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4605040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:05 -0800
X-CSE-ConnectionGUID: rGkkFOVkRNCbx66SHnrDJg==
X-CSE-MsgGUID: HzfwWVOoRwaYnRlt/1KcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12744884"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:03 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 arvind.yadav@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 0/3] drm/xe/vram: decay-based reinstatement of
 soft-offlined VRAM pages
Date: Thu, 26 Nov 2026 16:15:53 +0530
Message-ID: <20261126104552.3890797-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

The existing bad-page flow soft-offlines a VRAM page on the first HW
report and promotes it to a permanent (hard) retirement on the second
report at the same address. Once soft-offlined, a page stays reserved
forever, which over-punishes a single transient DBE caused by a
one-off environmental disturbance -- the page remains unusable until
the next reboot/probe even if it never faults again.

This series adds a per-VRAM-manager decay timer so a SOFT-offlined
page is automatically reinstated after a configurable window (default
24h) of no further reports at that address, configurable via configfs
(bad_page_decay_secs, 0 disables). HARD-offlined pages -- i.e. pages
that have faulted a second time, or that are reloaded from firmware's
non-volatile permanent list at probe -- are never eligible for decay
and remain permanently retired, as before.

Patch 1 introduces the core feature. Patches 2 and 3 are fixes for two
issues found during internal review before this series was ever
posted:

  - Patch 2 : Pages reloaded from firmware's permanent
    list at boot were being created as SOFT instead of HARD, making
    already-confirmed-bad memory silently eligible for reinstatement
    once the decay window elapsed.

  - Patch 3 : The decay GC worker rescheduled itself
    unconditionally, so once started it never went idle even after
    every tracked page had decayed away or been promoted to HARD.

IGT coverage:
https://patchwork.freedesktop.org/patch/765064/

Tejas Upadhyay (3):
  drm/xe/vram: add decay-based reinstatement of soft-offlined VRAM pages
  drm/xe/vram: don't let firmware-confirmed permanent bad pages decay
    back in
  drm/xe/vram: stop decay worker from rescheduling itself forever

 drivers/gpu/drm/xe/xe_configfs.c           |  55 +++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c            |   2 +-
 drivers/gpu/drm/xe/xe_ras.c                |   7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 101 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  16 ++++
 7 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.52.0

