Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB6CCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 12:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621CA10F35B;
	Mon,  8 Jun 2026 12:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBL7UHvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB910F358;
 Mon,  8 Jun 2026 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780923268; x=1812459268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Me0ohWrWn3CTiN/3QpM22fHUezTkivbSmrzYmClpf8=;
 b=UBL7UHvX5Y9u6MGM8cAARDv68MKmFFLXJFBIzs7rXqeHt2HyUs9nOd6Y
 ODX6YIG6J3jGwQzmlone7xqJImBBL6ZvSLaffV1geY5oylvo3MEaA4prk
 EiLZLHvSPYRnxUHIuZGMiASn34QBnlrf93IER+7R55tRwl7gZWPcxBQh6
 hy4Lz7FB/xs3V30vL+KyR4tOtyWINugIX8q3o0E8w3E8+pOYRj3Kov6hA
 G8yZ31gzzUIICHuQxNSO+EqBfy8KwRV5F54SPQ29WNoTsXz+CfcMfCWkX
 CfNwnlwAyspwBzILFbWclSguKC8TgmPysZzlJjeQo4j/8og/cPG1w9JSw A==;
X-CSE-ConnectionGUID: N3teSNf7RNq6Au2DNIvR6g==
X-CSE-MsgGUID: q+gex+8cTxC/Vu35Pm2Yhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81401583"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81401583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:54:28 -0700
X-CSE-ConnectionGUID: +rVb9wCCQb+U1ZCv6c/7IQ==
X-CSE-MsgGUID: M295jJijQpmNUkJ8TBlw8w==
X-ExtLoop1: 1
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2026 05:54:26 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/2] Fix pipe fifo underruns during cdclk/DDB transitions
Date: Mon,  8 Jun 2026 18:20:07 +0530
Message-Id: <20260608125009.979672-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

	This series fixes two distinct classes of pipe FIFO underruns
observed during modesets and back-to-back atomic commits.

1. Patch 1 avoids cdclk VCO-change glitches in bxt_modeset_calc_cdclk()
by preferring a same-VCO table entry (pure squash, no DBUF ratio
change) over an intermediate that drops below min_cdclk or flips the
DBUF ratio mid-commit.

2. Patch 2 closes a brief DDB-overlap window when back-to-back commits
reshuffle per-plane PLANE_BUF_CFG sub-ranges without changing the per-pipe
DBUF allocation, MBUS join or slice mask. Shrinking ranges are pre-
programmed and a vblank is awaited so hw retires the old (larger) ranges
before grown/new planes occupy the freed space.

Nemesa Garg (2):
  drm/i915/cdclk: Avoid VCO-change glitches
  drm/i915/wm: wait a vblank before shrinking plane DDB

 drivers/gpu/drm/i915/display/intel_cdclk.c   | 47 +++++++++++++++++++
 drivers/gpu/drm/i915/display/skl_watermark.c | 49 ++++++++++++++++++++
 2 files changed, 96 insertions(+)

-- 
2.25.1

