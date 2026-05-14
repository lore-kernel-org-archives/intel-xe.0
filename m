Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C16CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 05:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C53A10E369;
	Thu, 14 May 2026 05:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTEMfjCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971B410E138;
 Thu, 14 May 2026 05:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778738335; x=1810274335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7I6T0HIIYSy6kzvSENfJbEfuQfQT4318S1ePO1DVDbo=;
 b=dTEMfjCjv/nAyKaC+E2ZKB7kwG97ZBBcF0lvSUdos4RJf0eSfJvlmyU1
 o1VrC+lR/X5aoVrWBy1JMaQX7/D94LBiAIUeOJ73Jx+o5kRSG3evxnxTQ
 BXtgDlHb4NIjyVkhA8WurWJQ17cHxjqULzMGnS7DRHIza52fIjh5np5+b
 Zl6HG+u5Pq17vHeN8+CgZ7PnOd0yFpodIPcKhRlqqSmLqJUMJBKDdiT6h
 vgsNUxoGw1EBniAuZYVel67yJB3/n3OWrNwweryoSP7cOHflrJLRvWaIz
 LuIDr4rN/1ar9k7TZDiyUoS6zO3xEw0Hg0b+mTl8W5Kf9n791gO3nme2V Q==;
X-CSE-ConnectionGUID: MKVTGSAnSvC6z0t4sQz1+A==
X-CSE-MsgGUID: 0yLlknW1S1C9bN7z0XC0nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67203215"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="67203215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:58:54 -0700
X-CSE-ConnectionGUID: RFsjeCBCTP+dUItm07UvXQ==
X-CSE-MsgGUID: 38xbwQmnRvWct1rEwJu+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237434211"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 13 May 2026 22:58:52 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in
 full-AUX VESA path
Date: Thu, 14 May 2026 11:28:46 +0530
Message-Id: <20260514055848.871938-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

In full-AUX VESA mode (aux_enable && aux_set) the driver never touches the
native PCH PWM. If BIOS left the PWM CTL register enabled, the PCH PWM keeps
the system alive during s2idle and blocks S0ix. This series sanitizes that
stale BIOS state on first enable so S0ix is no longer blocked, while keeping
runtime behaviour otherwise unchanged.
Patch 1 is a minor debug-message rename cleanup.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/i915/backlight: Rename debug message in the setup() callback
  drm/i915/backlight: Sanitize BIOS-enabled PCH PWM in full-AUX VESA
    path

 .../gpu/drm/i915/display/intel_backlight.c    | 14 ++++----
 .../drm/i915/display/intel_dp_aux_backlight.c | 32 +++++++++++++------
 2 files changed, 30 insertions(+), 16 deletions(-)

-- 
2.34.1

