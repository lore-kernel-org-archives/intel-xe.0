Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8936CC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B9910F0F8;
	Wed, 12 Aug 2026 19:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBwWs4VA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3138810E42E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562103; x=1818098103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FtXTTpg+6rOb6LwIINi/CgK3uIeEvm8exYrSGCZaz44=;
 b=ZBwWs4VA4BeqKT9bSMelq6T7cKhAMqMNAPiGjznvc8wo4ON/XM824eK/
 7f/8c5AjfgQiYUdmf3h2tyHb4B7NGZyaQ0lY+LdNKmnDFXI8aThfAnbW3
 LcO6pmaVjMDofEDefswnDshayliy/ccZ5jLjHeN4WVXuZPFD9ib3n6cf3
 nzoGEMuUsvVmkE61BI3Unfh5jDRnE7KHkuJvV7QUsPc2mmeu90xmPdsb7
 lvCvfXvo9/9Et+dkeFcNySnUkO/ZbfxQXqmZQGc3ctnGkxXUHxUYQKdDK
 W6LNw7reMoMC2K25dUfs1ow+i/24k8UDvbtOuTTvys4sL13KEdBnbG3Wk w==;
X-CSE-ConnectionGUID: xjxQqm7xRo+jwCXnnzedeg==
X-CSE-MsgGUID: FltXGle7RcaEUM3OBpqUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987489"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:02 -0700
X-CSE-ConnectionGUID: XDZBG+44RlK3gxsfx5XHmA==
X-CSE-MsgGUID: Xjf0yf8iSaKAs1lKT0ldzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891736"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:00 -0700
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
Subject: [PATCH v4 00/32] drm/xe: Add structured SIGID error logging
 infrastructure
Date: Wed, 12 Aug 2026 21:14:16 +0200
Message-ID: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

 - Severity is decoupled from the SIGID and chosen at the call site via
   xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
   be reported at different severities depending on the instance.

 - dmesg stays close to a normal xe error line by reusing xe_err() /
   xe_gt_err() (and their Tile/GT decoration); the only stable,
   machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
   the durable machine record is the CPER carrying the same SIGID (a
   planned follow-up, left as a TODO).

Wire up a representative site for each software signature so the set is
exercised rather than merely declared.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

v1: https://patchwork.freedesktop.org/series/171022/#rev1
v2: https://patchwork.freedesktop.org/series/171022/#rev2
    component/location dmesg decorations moved away from macros
    HW component identifiers related to RAS/FW enum values
    CORRECTED severity rendered as an error
    more support for const pointers
    log 'probe blocked' as INFO
    fix kunit device setup
    more tests
v3: https://patchwork.freedesktop.org/series/171022/#rev3
    fix typos, args list and to_dev() corner case (Sashiko)
    use assoc macros in xe_any (Jani)
    add xe_any kunit test suite (Michal)
    add more xe_log test cases (Michal)
v4: more patches with SIGID usage (Michal)
    support for printk index (Jani)
    more macros and other fixes (Mallesh)
    no recovery buckets (all)

Mallesh Koujalagi (1):
  drm/xe/log: Add structured SIGID error logging infrastructure

Michal Wajdeczko (31):
  drm/xe: Introduce xe_any helpers
  drm/xe/log: Introduce structured component/location identifiers
  drm/xe/log: Add component/location decorations to dmesg
  drm/xe/log: Add SIGID log helpers for severity
  drm/xe/log: Add SIGID log helpers for location
  drm/xe/log: Add SIGID log helpers for location & severity
  drm/xe/log: Add SIGID log helpers for components
  drm/xe/log: Add SIGID log helpers for component & severity
  drm/xe/log: Add SIGID log helpers for errno-only
  drm/xe/log: Index all SIGID printk messages
  drm/xe/log: Add hardware error signatures
  drm/xe/log: Extend components list with hardware items
  drm/xe/ras: Check RAS and LOG component definitions
  drm/xe/kunit: Setup driver data in the test device
  drm/xe/tests: Add Kunit tests for xe_log
  drm/xe/tests: Add kunit tests for xe_any
  drm/xe: Report 'probe blocked' error using SIGID
  drm/xe: Report all probe errors using SIGID
  drm/xe/survivability: Report 'boot status' using SIGID
  drm/xe/survivability: Report 'sysfs failure' error using SIGID
  drm/xe/survivability: Report 'Boot Mode enabled' status using SIGID
  drm/xe/survivability: Report 'Runtime Mode enabled' status using SIGID
  drm/xe: Report 'device wedged' errors using SIGID
  drm/xe/pcode: Report 'Mailbox failed' error using SIGID
  drm/xe/pcode: Report 'timeout, retrying' error using SIGID
  drm/xe/pcode: Report 'initialization timedout' error using SIGID
  drm/xe/guc: Report 'GuC mmio' errors using SIGID
  drm/xe/gt: Report 'reset failed' errors using SIGID
  drm/xe/gt: Report 'Fault response' pagefault error using SIGID
  drm/xe/gt: Report 'Queue full' pagefault error using SIGID
  drm/xe/pci: Report 'cannot re-enable' error using SIGID

 Documentation/gpu/xe/index.rst              |   1 +
 Documentation/gpu/xe/xe_sigid.rst           |  14 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h         | 199 +++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h       | 172 +++++++
 drivers/gpu/drm/xe/tests/Makefile           |   1 +
 drivers/gpu/drm/xe/tests/xe_any_kunit.c     | 213 ++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   4 +
 drivers/gpu/drm/xe/tests/xe_log_kunit.c     | 543 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h                 | 137 +++++
 drivers/gpu/drm/xe/xe_device.c              |  16 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   7 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  18 +-
 drivers/gpu/drm/xe/xe_log.c                 | 235 +++++++++
 drivers/gpu/drm/xe/xe_log.h                 | 178 +++++++
 drivers/gpu/drm/xe/xe_pagefault.c           |   8 +-
 drivers/gpu/drm/xe/xe_pci.c                 |  32 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |   7 +-
 drivers/gpu/drm/xe/xe_pcode.c               |  14 +-
 drivers/gpu/drm/xe/xe_ras.c                 |  11 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  84 +--
 21 files changed, 1821 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_any_kunit.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

-- 
2.47.1

