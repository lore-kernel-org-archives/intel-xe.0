Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B7DCAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 18:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5310EA65;
	Fri, 19 Sep 2025 18:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFQCigIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FC910E252;
 Fri, 19 Sep 2025 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758305323; x=1789841323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5n9Hkxn0ykBN/ZaGeLBBww3ghE3/t2cV4g2hFZXhPEU=;
 b=kFQCigIcwP4QpASwFmoZUF55Hf4wGsoTOOLu8TAfIf4+sRuGztS0c0AA
 slbhU0mmAd/YO0uIzjnGlTPu7EBvZ5tinsfs5IvebOArJ254zE3uudIUH
 cTKjJI582952qyEyfWyTvvS9A/yUyXszTaN9JGX+UQmQ795Qm3Vj22dPw
 z8QD/hzcUDrRvbzAOGn0lMx2loplzWCSpbQlECRxKRNb/VaAvT7AdIT+I
 A2O9WJvQJPSjJrUDdI1SUgNPNpYPUExQkPc6jtEheXTqRxvKHldtyWgnb
 MtqCfsAc1MRArDH1nJIOAlZTwQ7eegRrve6RfVazNnb0QrxD2/DrlgDrP A==;
X-CSE-ConnectionGUID: lVEfDPlSQBqDBMAVMnoQFA==
X-CSE-MsgGUID: hcesZGJrRRW6NUDT30U75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64458710"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64458710"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 11:08:42 -0700
X-CSE-ConnectionGUID: EkKsB8yHR4emJmxbJhXGcA==
X-CSE-MsgGUID: SBC6g0J3RPWkhpcf/fHXCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="181019094"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 11:08:42 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Fix skl+ watermark linetime stuff
Date: Fri, 19 Sep 2025 21:08:35 +0300
Message-ID: <20250919180838.10498-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix the linetime calculation in the skl+ watermark code. The current
code is wrong for plane downscalign use cases.

Ville Syrjälä (3):
  drm/i915: Use the the correct pixel rate to compute wm line time
  drm/i915: Deobfuscate wm linetime calculation
  drm/i915: s/intel_get_linetime_us()/skl_wm_linetime_us()/

 drivers/gpu/drm/i915/display/skl_watermark.c | 25 ++++----------------
 1 file changed, 5 insertions(+), 20 deletions(-)

-- 
2.49.1

