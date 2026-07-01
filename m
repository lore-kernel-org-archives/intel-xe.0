Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE1BC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337B010F05D;
	Wed,  1 Jul 2026 16:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2dnKatY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291810F05D
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782923590; x=1814459590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+WHeTQN7vGt9KUOtDCauFeJlop9QLEUQSgggwpFf3Jg=;
 b=W2dnKatYVzag2JU13xOSL1myV0qNSn5JMc5zkzfexK5Ts6l3k/ekN0hY
 zJ9ODyzHmAKPRe54eIUzYDWR8+tC2SeEac7HYmp00c1KP4vSQT8Kk4J17
 eXxi5UzQZUzCWDhvp2APoXVL58RztmGUp2GVVGlJ+zlRGiovqNadiYl9s
 j9Wuygt4schjNNsLtcpbEM7mLA+06JYbqSCB174F0ztyGptuzvtoPfFAn
 UovP9zwaPCjzWNsG2FvB0lxRVohQfJZoUqai6whXW2Af+hRcpW0M0zdGv
 sb2KPAfCTrmfd43hdXj7c/nsrdCyFXfOCO3uzJqRPxMuIPREJvFblko3J Q==;
X-CSE-ConnectionGUID: 3TPj1QIwRQypFzSowlS/+Q==
X-CSE-MsgGUID: 1UmBbfecQTCQIeyuU10KgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82779242"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82779242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:33:09 -0700
X-CSE-ConnectionGUID: gYElwvoHQxSx6v2PKBaApQ==
X-CSE-MsgGUID: hGTeazk1SICY5akiqjkLfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256196412"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 09:33:08 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 0/8] drm/xe: add page size allocation mode control
Date: Wed,  1 Jul 2026 22:03:40 +0530
Message-ID: <20260701163348.3432358-1-naresh.kumar.g@intel.com>
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

Some platforms support multiple page sizes for user BO allocations,
including 4K, 64K, 2M, and 1G.

For validation and debug, it is useful to control the page size
selection policy for user BOs so that specific allocation paths can be
exercised deterministically. In particular, this makes it possible to
force allocations into 2M-only, 1G-only, or mixed modes.

In mixed mode, allocations are distributed across the supported page
sizes in a round-robin manner. For example, for eight user BOs, the
selected page sizes would be:
  - BO1, BO5: 4K
  - BO2, BO6: 64K
  - BO3, BO7: 2M
  - BO4, BO8: 1G

This series adds:
 - debug control state in xe_device
 - a platform helper for multi-page-size support
 - a debugfs knob to select allocation mode
 - 1G BO alignment flag handling
 - debug policy application at user BO create time
 - propagation into VMA map flags
 - bind-time alignment validation for large-page user BOs
 - PT bind support for selecting leaf level (4K/64K, 2M, 1G paths)

The intent is to improve debugability of page-size-specific
behavior without impacting normal/default paths
when debug mode is not enabled.

Nareshkumar Gollakoti (8):
  drm/xe: add page size allocation control state to xe_device
  drm/xe: add helper for multi page-size support
  drm/xe/debugfs: add page size allocation mode knob
  drm/xe: add 1G BO page-size alignment flag
  drm/xe: apply debug page-size policy to user BO creation
  drm/xe/vm: apply debug page-size policy to VMA map flags
  drm/xe/vm: validate large-page user BO bind alignment
  drm/xe/pt: allow selecting the bind leaf PTE level

 drivers/gpu/drm/xe/xe_bo.c           | 68 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c      | 52 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 16 ++++++-
 drivers/gpu/drm/xe/xe_vm.c           | 57 ++++++++++++++++++++++-
 7 files changed, 215 insertions(+), 4 deletions(-)

-- 
2.43.0

