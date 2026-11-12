Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED7606A327
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jRwa5Wd+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC710E403;
	Thu, 12 Nov 2026 12:43:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F85F10E403
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794487428; x=1826023428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ac7bFX+N3nA6dbSSCpg5Fl3FFGvr6gQenYAoEuoJ5qI=;
 b=jRwa5Wd+p9hmKGcuGVkqgsax74xUnKda+1zf5xPOHeOiJPlmuvoHvZXT
 AZDhMmkKpD5H9I2u9Hel9dTwRcvMLwpFQL+6Fc57NzZzif3gpA0ddXxe8
 3gqHsql0tlJEtyrWrh7gWkBKKjRq720/KRhn9rbvlt5IfaiZdjQHluK+W
 evm3FdBN1GMYgtFPdz/e9l6amKd887u3Qp1NYdCfSJ1NldPoJIF/Mn1wH
 qvDQFHpi3Hcixu7nkP4n6OXitOllq+O2B24gJ4CEamZsOvmbuEMfEka9H
 H+/WGSZQwrQcdStaTSvxTONQ6656pj1k5dFsidSYTvJbOqeHo3TLK6Igb w==;
X-CSE-ConnectionGUID: qwxcdRu9R0K8mvZfMEBKpA==
X-CSE-MsgGUID: GjfBSAd0TCyL0pYU05pAFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3181262"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3181262"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:43:47 -0800
X-CSE-ConnectionGUID: KE1EPFuSRIukSZxYDrsuwg==
X-CSE-MsgGUID: 2rNKJpvvQlOlDxdIDEZHZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8577389"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:43:46 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 0/3] drm/xe/vram: decay-based reinstatement of
 soft-offlined VRAM pages
Date: Thu, 12 Nov 2026 18:13:30 +0530
Message-ID: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
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

 drivers/gpu/drm/xe/xe_configfs.c           | 55 +++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  2 +-
 drivers/gpu/drm/xe/xe_ras.c                |  7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 82 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 16 +++++
 7 files changed, 157 insertions(+), 8 deletions(-)

-- 
2.52.0

