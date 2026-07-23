Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF39CC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55E210F1FC;
	Thu, 23 Jul 2026 20:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQD0zucX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CED010F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839090; x=1816375090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sBJEeSThZO3/zDqs8+5LomiDzZ28GvpbPNltCewUNY4=;
 b=MQD0zucX2HRD+VRMcMk8r638n8MR2wudNLMh5YjvNoCtfUHD6Tf9I0Gz
 9MKULWJFse2lQBForvAr+6/nb73+TNz5VYPLe41ljShEhK6svXTeTAarL
 Qn3HlW9rXL+xWl9pCsgSvHTEQlPWvk/7yH7eKvE0NtZB0n/HqG7qM91OS
 l772Q5ojw+iSqZp1IzubX2Amyt/+SWHcmeFLyw3tu8RkDmoVJpW+3lyqj
 3gIoN9ZITGvDNhczo1/k0xFrqmErmf53xru05BQXNGhuKQihoKw1gvmrm
 nM/A2lRujRgDoHyo93PFz98eywwy6S+t2KKqX9pLnBBK23+6aXKe40lL8 Q==;
X-CSE-ConnectionGUID: i+JwApcgQRuIIdW42YtYWw==
X-CSE-MsgGUID: /wZ83jdoSiGzneSU6wk7Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484278"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:10 -0700
X-CSE-ConnectionGUID: UhqUYNLRSqKleuB8IjnNtg==
X-CSE-MsgGUID: cc/PRGTgTNWIt31l6hwgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578570"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 00/19] drm/xe: Add structured SIGID error logging
 infrastructure
Date: Thu, 23 Jul 2026 22:37:33 +0200
Message-ID: <20260723203754.3782-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
strings that have no stable shape. That is readable for a human, but it
gives fleet tooling nothing durable to match on: the wording changes
between releases, lines can be rate-limited or dropped under an error
storm, and there is no consistent way to ask "which recognised fault
just happened?".

Introduce a signature identifier (SIGID): a small, stable integer that
names one recognised Xe fault situation and serves as the primary handle
for triage. A SIGID maps, through published end-user documentation, to a
description and a recommended action; the driver only has to emit the
right SIGID next to the usual human-readable text.

Design decisions:

 - Software-emitted signatures only. This header enumerates just the
   situations the driver detects and reports itself. Signatures that
   originate in firmware or hardware are identified by those layers (via
   their own records/counters) and are logged as received -- minting a
   driver-side id for them would duplicate an id the reporting layer
   already owns.

 - Flat catalogue, chosen per report site. Each site emits the single
   most specific situation for that site, so a multi-layer failure
   produces a chain of reports rather than one ambiguous classification
   (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
   matches no defined situation keeps using ordinary xe_err() /
   xe_gt_err() rather than forcing a wrong id.

 - Stable numbering. A single flat list numbered sequentially from 1, in
   introduction order. Values are only ever appended, never renumbered
   or reused.

 - First-order action. Each SIGID carries a coarse, in-tree resolution
   bucket (COLLECT / RETRY / UPDATE / RECOVER) so it is actionable
   without an external reference, and so every new id must declare what
   to do about it.

 - Severity is decoupled from the SIGID and chosen at the call site via
   xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
   be reported at different severities depending on the instance.

 - dmesg stays close to a normal xe error line by reusing xe_err() /
   xe_gt_err() (and their Tile/GT decoration); the only stable,
   machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
   the durable machine record is the CPER carrying the same SIGID (a
   planned follow-up, left as a TODO).

Wire up a representative site for each software signature so the set is
exercised rather than merely declared:

 - PROBE: xe workqueue allocation failure during early init
 - WEDGED: xe_device_declare_wedged() (drop redundant "CRITICAL" + BDF)
 - SURVIVABILITY: entering boot survivability mode
 - RUNTIME_FW: GuC mmio request failure
 - DEVICE_FW: PCODE mailbox failure
 - GT_TDR: GT reset failure (which then chains into a WEDGED report)
 - MEM_FAULT: page-fault queue overflow
 - IO_BUS: PCI re-enable failure after a bus reset

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

Mallesh Koujalagi (1):
  drm/xe/log: Add structured SIGID error logging infrastructure

Michal Wajdeczko (18):
  drm/xe: Introduce xe_any helpers
  drm/xe/log: Add simple helpers for xe_log_emit
  drm/xe/log: Allow to emit SIGID dmesg/cper separately
  drm/xe/log: Add Tile/GT decorations for dmesg message
  drm/xe/log: Introduce structured log components
  drm/xe/log: Add component based SIGID log helper
  drm/xe/log: Add errno-only SIGID log helpers
  drm/xe/log: Add hardware error signatures
  drm/xe/log: Extend components list with hardware items
  drm/xe/tests: Add Kunit tests for xe_log
  drm/xe: Report 'probe blocked' error using SIGID
  drm/xe: Report 'device wedged' errors using SIGID
  drm/xe: Report 'Survivability Mode' errors using SIGID
  drm/xe/guc: Report 'GuC mmio' errors using SIGID
  drm/xe/pcode: Report 'Mailbox failed' error using SIGID
  drm/xe/gt: Report 'reset failed' errors using SIGID
  drm/xe/gt: Report 'pagefault' errors using SIGID
  drm/xe/pci: Report 'cannot re-enable' error using SIGID

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_sigid.rst          |  14 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h        | 192 ++++++++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h      | 196 ++++++++++++
 drivers/gpu/drm/xe/tests/xe_log_kunit.c    | 331 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h                | 107 +++++++
 drivers/gpu/drm/xe/xe_device.c             |  16 +-
 drivers/gpu/drm/xe/xe_gt.c                 |   7 +-
 drivers/gpu/drm/xe/xe_guc.c                |  18 +-
 drivers/gpu/drm/xe/xe_log.c                | 221 ++++++++++++++
 drivers/gpu/drm/xe/xe_log.h                | 175 +++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c          |  10 +-
 drivers/gpu/drm/xe/xe_pci.c                |   5 +-
 drivers/gpu/drm/xe/xe_pci_error.c          |   7 +-
 drivers/gpu/drm/xe/xe_pcode.c              |   5 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  23 +-
 17 files changed, 1290 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

-- 
2.47.1

