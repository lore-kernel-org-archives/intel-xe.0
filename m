Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E06BEDF025
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 04:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9D010E152;
	Thu, 12 Feb 2026 04:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaoJpUpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6010E152;
 Thu, 12 Feb 2026 04:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770869746; x=1802405746;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=gKJTLMRvqnDc8t15FROmBwVD4vqQr40xVf9Iv7fKNOc=;
 b=HaoJpUpFV7ZRBguDFE2RBorASbq00T3dHZ20PM/76zSLUbWJcNh6cRqY
 CnJPDfPgqFP0jN5g6UZDYYlEIqtNZo+althnTD1PX55OUdVLljhF80RYg
 64xmJh5NcsHMqhCTA7G13xIQ2GjdYv9Uy+X3Dc4R5zpluDzusCxmy9ja4
 nraW7/rBw7vsXFlk6yAikfFrLrL5ROjfn6eABGBbCQaeAfUzt3JgcT6tX
 jCIGFa0JTcwFIvzJH3kVnPNxiGTHvdmWJ8/fBeDN0/NldAltwbO50ghwk
 ugQMDMjAKUEm5SZB+Z1VwQ58xiFDnyUS6+vE9FpL20WSlbpyF5pJQ41FU g==;
X-CSE-ConnectionGUID: tZtf5PW1QqS9YxSnKy3byA==
X-CSE-MsgGUID: C2B0mOHsTuS6jaRanRR/xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75881019"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75881019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:15:45 -0800
X-CSE-ConnectionGUID: MtRDM5o+QPG0WEhJvRQ3dg==
X-CSE-MsgGUID: g7MKtThhROCZijQ9XZd0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="235437104"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 20:15:43 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 0/2] Update the PHY timeouts
Date: Thu, 12 Feb 2026 09:44:18 +0530
Message-Id: <20260212-timeout-v1-0-591fa766e8a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpTjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3ZLM3NT80hJdA7PkJCNjozRzw8Q0JaDqgqLUtMwKsEnRsbW1AHa
 hl+pZAAAA
X-Change-ID: 20260212-timeout-06cb232f71af
To: Jani Nikula <jani.nikula@linux.intel.com>, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
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

The timeouts mentioned in the spec is the recommendation from the PHY
and doesnt include the turnaround time of SoC and the OS. So ensure that
sufficient overhead is added for SoC and OS along with the PHY
recommended timeouts.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (2):
      drm/i915/display/cx0_phy_regs: Include Soc and os turnaround time
      drm/i915/display/lt_phy_regs: Add SoC/OS turnaround time

 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 4 ++--
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
change-id: 20260212-timeout-06cb232f71af

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

