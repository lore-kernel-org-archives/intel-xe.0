Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A7BC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202AD10EBFB;
	Tue, 30 Jun 2026 11:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naDf4NU7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDBC10EBFB
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820726; x=1814356726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9I6zRg66FaiA0IRZsDZ7q0aZIZf2LP2HtEJo0TxXc8g=;
 b=naDf4NU7zf/tBzeshHBjjSjc8BRLSOIuEhgYZ3gKldonI4hhcb8LKcqe
 EelsmhjELBlJfZLsZQ9aARrI+X9irc1UtvNcPVl5k9Jt10lENemXA0n9+
 i5oWoGRcj0q/xqzPzA2ZbbU//vsP+PiLmya9kXJugNnd6fKsF2rVM3myB
 egOO1u6v/8MVf+HetIkrt1TW2sajYDSLwNG/YHthTaQvvg51X33MOca9+
 ieEM59Pdu7HJOnCEdxYbErL9PgJ5n67sbqBdumC3l3jn4yZ7hqyOnpmtP
 F5ZZmC2p/g5GNNASd3dFtp72hLBi7FLJn1r8yud0vI2/E8GUIyeCTiV33 g==;
X-CSE-ConnectionGUID: 39s6ofmNS5SLsswxKSRAkg==
X-CSE-MsgGUID: ntpq6rJtQkawBdLXxzJQpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323569"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:58:45 -0700
X-CSE-ConnectionGUID: Co8iBoEHRSuwFnFcZ1jpEw==
X-CSE-MsgGUID: qpojKSWOQMSIzBSaYb198Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839640"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:58:41 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 0/5] drm/xe: Structured RAS error logging infrastructure
Date: Tue, 30 Jun 2026 17:25:04 +0530
Message-ID: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

Today XE logs GPU errors with ad-hoc drm_err()/drm_warn() calls that
have no standard format, making it hard to identify what failed, where
on the GPU it happened, and how to correlate events.

This series adds a lightweight structured logging layer:

- Introduces xe_sig_ids.h (Signature IDs that name each error
  class) and xe_ras_log.c (__xe_ras_log()), which emits every error in
  a fixed format:

    [xe-err] SIG_ID=<id> Severity=<sev> Location=<loc> Errno=<n>
    Message="<msg>"

- Converts the first call site: the open-coded drm_err() in
  xe_device_declare_wedged() is replaced with xe_ras_log_wedged(),
  routing wedge events through the new common path.

v2:
- Rebase.

v3:
- Add HW SIG IDS details. (Riana)
- Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
- Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
- Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
- Make macro function properly.
- Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
- Add sig id documents. (Riana)
- Change macro function same prefix as the file.
- Handle __xe_ras_log() function with variable format.
- Update message in xe_ras_log_wedged().

v4:
- Change commit message.
- Update the document. (Riana)
- Move documents to xe_sig_ids.h
- Update Hardware error.
- Remove example in Hardware error SIG_ID.
- Make Fabric errors.
- Add kernel doc for SIG_IDS. (Michal Wajdeczko)
- Provide severity details
- Handle CONFIG_UEFI_CPER properly.
- Add CPER_SEV_RECOVERABLE in __xe_ras_log().
- Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
- Update commit message.
- Remove document. (Riana)
- Replace XE_RAS_WEDGED to xe_ras_log_wedged. (Dnyaneshwar)

Dnyaneshwar Bhadane (1):
  drm/xe: Replace critical drm_err log with xe_ras_log_probe

Mallesh Koujalagi (4):
  drm/xe: Add SIG_IDs for RAS error logging
  drm/xe: Add RAS logging helpers
  drm/xe: use xe_ras_log_wedged macro in xe_device_declare_wedged
  drm/xe: Use RAS logging to report survivability mode

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_sig_ids.rst        |   8 ++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_device.c             |  23 ++--
 drivers/gpu/drm/xe/xe_hwmon.c              |   4 +-
 drivers/gpu/drm/xe/xe_irq.c                |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c               |   5 +-
 drivers/gpu/drm/xe/xe_pat.c                |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                |  14 ++-
 drivers/gpu/drm/xe/xe_pcode.c              |   5 +-
 drivers/gpu/drm/xe/xe_ras_log.c            |  65 +++++++++++
 drivers/gpu/drm/xe/xe_ras_log.h            |  62 +++++++++++
 drivers/gpu/drm/xe/xe_sig_ids.h            | 124 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c |  11 +-
 drivers/gpu/drm/xe/xe_vram.c               |   5 +-
 15 files changed, 307 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sig_ids.rst
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

-- 
2.34.1

