Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F0FC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 17:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A0710E04F;
	Mon,  7 Sep 2026 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHAD1+w0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3C10E2BB;
 Mon,  7 Sep 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788801542; x=1820337542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kAhK1azvJNLIJsnViwPP6o2QI1WMwXDIlLgSTGyz7As=;
 b=HHAD1+w0UEqLMDhzd3mL/XD/pZfTW4IpUA4KsZuBuogwj81OgLGe6tvq
 Uya9l2QlLlg0+qxnIHr2ifzg7I9JoRubCxKFGAlFkytw1HzJa8A1NNKGJ
 oM+YnaGHSIyIZ+64KjB4FspUeCtQnnOwmQ7rCYNpERdpWFpSE7zQFpvLj
 1pi1671wefnMnVBcv3mwZezFkFSPAfSTThEWEGPyJ1Xw7s7/B9qJqN4GM
 bZ4S1UTFgjE2+8NNZpC5tTuLm5YIFxuJaxm/vloQhjvJqd9or2Zy7upvp
 At6n5Z48ZMgkzNOWkXMf74oG8cjLvYNaajp5dXcrraFKNxOh4IkYSrhzJ A==;
X-CSE-ConnectionGUID: tEXy2RuzTT2ROF+EseYLdA==
X-CSE-MsgGUID: 6X4X2g6iTOiUJZaBElIX/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111980758"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111980758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:19:01 -0700
X-CSE-ConnectionGUID: jbIYProqSSao0/8VXqoTGA==
X-CSE-MsgGUID: a5mphUTQTB66R1mwvQM/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269449163"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:19:01 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v4 0/2] Add validation for DMC firmware header parsing
Date: Mon,  7 Sep 2026 22:48:57 +0530
Message-ID: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
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

The DMC firmware parser does not validate the firmware load address
stored in version 3 headers before it is used by dmc_load_program().

The firmware size conversion from dwords to bytes can overflow while
calculating the payload size.

Fix both by validating the firmware load address against the expected
range and using check_mul_overflow() for the firmware size conversion.

v2:
Added Fixes tag in commit messages for both patches.
v3:
Address Sashiko's parser-hardening review comments in patch 2
v4:
Publish mmio_count, start_mmioaddr and dmc_fw_size only after the
payload allocation succeeds, so a failed allocation cannot leave
stale state for a later dmc_load_mmio() call (Sashiko)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Add sanity check for DMC load address
  drm/i915/dmc: Harden DMC firmware payload parsing

 drivers/gpu/drm/i915/display/intel_dmc.c      | 99 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.43.0

