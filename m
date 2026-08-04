Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F0C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84F210E94F;
	Tue,  4 Aug 2026 09:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aa6YWRP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3310E65A;
 Tue,  4 Aug 2026 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785835785; x=1817371785;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=3GlscK3lNx02BFsP++ibM8j6ZFvRGqpKlr5CF1uQT0w=;
 b=Aa6YWRP+5wCqyye1WNL1foVDMj+AA/5HxtQ3ft+9tcCf1dUgQ/K6Vja6
 u9keornY1BHXVwOEvovajDiHtkC6jHTjGSBE2o7xC5OBt9AQER9t679RS
 lYxH9em2syorMLnPlu8OQG/s0Nl3a0DkKMEuMi8TzqA/yfiueZh2TE7fb
 p/EF2oOiG6tdz5GMqj69GkFSfTVFVZ8zMHy9/Z3egGul8XEv4cMmFZYhv
 dvDTuhUeIKCL7HE9xpYcBLJE1SoujV4joYFahYtu09oqsFREp2tx3Et3M
 v6rTrkam+GfjoN9hQuBjXmpwCi33VFukVZqiGZSQpCly/q5eVVo3S2pck A==;
X-CSE-ConnectionGUID: 0BdnBZD9SPuVx9bA5gOO/Q==
X-CSE-MsgGUID: oLu77guURTatlIuTbS2NOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97034039"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97034039"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:29:44 -0700
X-CSE-ConnectionGUID: 0zzZfYfgQUiuutbyCUUNIQ==
X-CSE-MsgGUID: q+7kfPdfTquUcTxBrpVEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="259669116"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 02:29:42 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 0/2] cdclk mismatch with sw/hw
Date: Tue, 04 Aug 2026 14:58:29 +0530
Message-Id: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2wcWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eSU5JxsXctU87S0ZHPDNAujRCWg2oKi1LTMCrA50bG1tQBBedh
 xVwAAAA==
X-Change-ID: 20260804-cdclk-9e7ffc71f82a
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Polo-Fran=C3=A7ois_Poli?= <polo.code.dev@gmail.com>
X-Mailer: b4 0.15-dev
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

With 4k eDP panel and an external DP, cdclk sw/hw state mismatch
warnings are observed along with cdclk mismatch on DC6 exit is also
observed and eventually FIFO underrun.

On boot, skl_cdclk_init_hw()->skl_sanitize_cdclk() decides to use the
pre-OS cdclk leading to programming a very low cdclk that doesnt satisfy
the pipes requirement. This leads to FIFO underrun.
Also this programmed and the sw calculated cdclk mismatches and on every
dc state exit warnings are thrown.

In this series the cdclk is programmed to max instead of 0, and then the
first modeset will bring it back to the required/calculated.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (2):
      drm/i915/display: Seed skl_cdclk_init_hw() with SKU-max, not zero
      drm/i915/display: Reconcile cdclk SW state with HW on DC-off exit

 drivers/gpu/drm/i915/display/intel_cdclk.c         | 65 +++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |  2 +
 .../drm/i915/display/intel_display_power_well.c    |  1 +
 3 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 0377b35cbeef071dfeed06ccadc0d7607eccaa64
change-id: 20260804-cdclk-9e7ffc71f82a

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

