Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE3E63F25
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 05:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19810E123;
	Mon, 16 Feb 2026 05:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dN1Kj6gD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BAA10E123;
 Mon, 16 Feb 2026 05:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771218058; x=1802754058;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=jygPIa5pY9SpdOMeCeUgRxD6/6YoS3J38Ba41G0GJQQ=;
 b=dN1Kj6gDCX8NTTdalLFsHuJrwCuD11FCfVKzK8Mh2ZGtywq5YEqEWyyq
 FM8k1AnMcseU48a+6p61TbYVeQ8Qp+Lym3GnYNAghwLNFSOqkhyxIp8MM
 qfWzu1V1vOFXiL/1fLusij8cMqM3rWVu36n8oLG+1VyE7O70dpyfME5El
 5AyWKhg1JIw5J6JEaaXo0sbSF7yDRPRe/JD98+F4bCfd4mDGG7fpay70e
 XsxBEl2OTZfAtb9Am8DKMBBEKqqsWV712KbhAuiyxrZdvmz/LDIC4EyJ/
 xwIV6i0IHInDVhxowWRgrWv2YwGQB//J0XRuODYAsanPRkJxLsBFA/tRU Q==;
X-CSE-ConnectionGUID: 5zMIwTk7SRqPtO/SBd8dVA==
X-CSE-MsgGUID: vX+kFz6dQIGE5iZ5N7icZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94929083"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="94929083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 21:00:58 -0800
X-CSE-ConnectionGUID: SqHk+E6vQoeHwt8NGyvvgA==
X-CSE-MsgGUID: vtxVVuofREmIY0+5UYqclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="212818493"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 21:00:55 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 0/2] Update the PHY timeouts
Date: Mon, 16 Feb 2026 10:29:38 +0530
Message-Id: <20260216-timeout-v3-0-055522c22560@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADukkmkC/3WMwQ7CIBAFf6XhLAa2llZP/ofxQOliN7HFABJNw
 79LezIxHuflzSwsoCcM7FQtzGOiQG4uUO8qZkY935DTUJiBACVAAo80oXtGLpTpoQbbSm1ZeT8
 8Wnptpcu18EghOv/ewkmu628jSS54c5RWt0php+WZ5oj3vXETWxsJ/nhQvPbQG6OHRshu+PZyz
 h9+QTaS1gAAAA==
X-Change-ID: 20260212-timeout-06cb232f71af
To: Jani Nikula <jani.nikula@linux.intel.com>, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>, Cole Leavitt <cole@unwrap.rs>
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
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20260212-timeout-v2-0-74bccad5018d@intel.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260212-timeout-v1-0-591fa766e8a1@intel.com

---
Arun R Murthy (2):
      drm/i915/cx0_phy_regs: Include SoC and OS turnaround time
      drm/i915/lt_phy_regs: Add SoC/OS turnaround time

 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 4 ++--
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
change-id: 20260212-timeout-06cb232f71af

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

