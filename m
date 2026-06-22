Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB2CCDB476
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFAD10E4CE;
	Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVPqh/6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824D10E285
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111578; x=1813647578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kBVy9QqtvCncXJrIb2EdhlbghHFFviZuU2ezx7fo2fY=;
 b=XVPqh/6SukUZiUUf7mfaWXSp+8nrv3hjvg+eYXRdLRWz+KC2xmJ0kdoi
 4mHe3ujQzSmR30HhoCyM01bPFV+l2BhkL2Gf3U2TZVFdaMl0GcYPctjh7
 yZVuysKgYgANqcS9VQMIRkN5BrjylMudDG1No+I2ZSDKzwPSee4lE3Cy+
 PTjlKrvnfiYemdqx1EqDlC6mL27KNNUdl1MWQNZnkmo7EWReNr4oZ7iXT
 +GAGQGyvH1hSJeAFGgYt8Cm0tc8cQVCKQtjbXEHvX6SlyZQo1FTwt/BU0
 FgHzZdNvIgUJ+I4S2F/Q2rDmlC3ejt4L1zUKAKkobebVOs3Ie9pmVKPQ3 g==;
X-CSE-ConnectionGUID: piib0GzORBeJnUjpcXGr7Q==
X-CSE-MsgGUID: ZB3QTSpaQj2YXxhvLJLphA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928697"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:35 -0700
X-CSE-ConnectionGUID: l4kv6rHrRPGfjWfPakAuRA==
X-CSE-MsgGUID: bnSlvdEjQYKd42g10VsaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068080"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:32 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/9] drm/xe: add page size allocation mode control and coverage
Date: Mon, 22 Jun 2026 12:30:22 +0530
Message-ID: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

This series adds support for controlling the page size allocation mode
through xe debugfs and extends the corresponding test coverage.

The intent is to make allocation behavior easier to validate under
different page size configurations and to simplify debugging of
page-size-specific allocation paths. The test updates complement this by
verifying that the expected allocation behavior is observed for the
selected mode.

As per the suggestion, sending it to upsteream.

Nareshkumar Gollakoti (9):
  drm/xe: add page size allocation control state to xe_device
  drm/xe: add helper for multi page-size support
  drm/xe/debugfs: add page size allocation mode knob
  drm/xe: add 1G BO page-size alignment flag
  drm/xe: apply debug page-size policy to user BO creation
  drm/xe/vm: apply debug page-size policy to VMA map flags
  drm/xe/vm: validate large-page user BO bind alignment
  drm/xe/pt: limit page-table walk depth for large-page mappings
  drm/xe/tests: add live KUnit coverage for BO page-size allocation modes

 drivers/gpu/drm/xe/tests/xe_bo.c            | 223 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |  60 +++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  52 +++++
 drivers/gpu/drm/xe/xe_device.h              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |  20 ++
 drivers/gpu/drm/xe/xe_pt.c                  |   5 +
 drivers/gpu/drm/xe/xe_vm.c                  |  43 +++-
 9 files changed, 407 insertions(+), 4 deletions(-)

-- 
2.43.0

