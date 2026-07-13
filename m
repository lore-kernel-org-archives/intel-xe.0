Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED33C44506
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 07:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9A910E591;
	Mon, 13 Jul 2026 07:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVQSG8co";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B047E10E591
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783928896; x=1815464896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sDHCWNsA38LeEXHForDWTFR3pIs7SWijh5wOMJytQiQ=;
 b=FVQSG8coiG3qfiqyPBVsFiX12Km9ist7B37+BtMWbl1TrtPp8H5Pq3fJ
 4ngB6m7Hw1BtaFGay0Vi8UkG702iSUeHTsCcwILV6v5oDEU/1IKOv/62c
 HmgoWTClMld4f5LVEkogw+smC8J/R7nYCG+A789/p2GQ+S3KwS9oaLAoa
 CJ/B9EUAqEyZrQe2b7Sf7GYQw13n+IXLRQsUCNjDTrfZtqWdMcb0AUMUL
 gN67oSASlBBc9V7+i+72XH/Azf1SoFsR2jtZxJhKWQcNNZEZ8asPIo/re
 tbvIk0LGhaY1dq1KHLdq8NH8jU7mH/Ynuy3UUNxWRycfWkAuDi+UTRYeP w==;
X-CSE-ConnectionGUID: 1A7HkKQwSHaU98nDafTGjw==
X-CSE-MsgGUID: QzonkHu3TESM/7hhvcVRyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84548851"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84548851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:16 -0700
X-CSE-ConnectionGUID: wh9ZgIJtSTarivbEIn8idA==
X-CSE-MsgGUID: qYMSpfE4RnCJXcL8WdXfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278737260"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 0/4] Add uncorrectable error handling for core-compute
 errors
Date: Mon, 13 Jul 2026 13:17:56 +0530
Message-ID: <20260713074755.1278607-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This series adds support for handling uncorrectable core-compute errors
and is a split from [1] for CI

Uncorrectable core-compute errors are classified into Global and Local
errors.

Global error is an error that affects the entire device requiring
a reset to recover. When an AER is reported and error_detected is
invoked, request SBR (Secondary Bus Reset) from PCI core.

Local core-compute error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected engine without distrupting the rest of the device.

Error recovery for local core-compute errors is merged. [2]

[1] https://lore.kernel.org/intel-xe/20260608084700.640376-17-riana.tauro@intel.com/
[2] https://patch.msgid.link/20260706234353.3874355-1-zhanjun.dong@intel.com

Rev9: split patches for CI

Riana Tauro (4):
  drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
  drm/xe/xe_ras: Add support for uncorrectable core-compute errors
  drm/xe/xe_ras: Query errors from system controller on probe
  drm/xe/xe_pci_error: Process errors in mmio_enabled

 drivers/gpu/drm/xe/xe_pci_error.c             |  21 ++-
 drivers/gpu/drm/xe/xe_ras.c                   | 123 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  56 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c         |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   |   3 -
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   5 +
 7 files changed, 205 insertions(+), 7 deletions(-)

-- 
2.47.1

