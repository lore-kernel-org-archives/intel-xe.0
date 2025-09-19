Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2370CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 09:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32A810E975;
	Fri, 19 Sep 2025 09:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+GLXnaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C82C10E232;
 Fri, 19 Sep 2025 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758275516; x=1789811516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nMzcnXNqVt2Hai49DqJpaTcrpMoWrokvYfbxEWFq+rY=;
 b=h+GLXnaYZQ2/Nm0lQZiGDUzcFmBjETHhWtEESWD9A7oUFO4vXL5wuOIP
 R4E6ExK5mN+ZHIxPTDBubaOC2APTpkt0y3u3xciCnIbxL4srDLNXh+5nC
 pWf66Es4KGBrGyDi0Mx/+Afm5M2uGR3lg/gE89211vfWakkWdmF51I/xF
 pNN2yObIzkBYKIOScdnZwlO8xYlReFROYLUQS6NzlsZYr7xIWGDt82XFt
 GQ432MCOe0IHfnqBJUPPZ6xZQ1rop3SwcskQbByj2wwpwe+s8V25Mf48s
 7e4QyZQ4dRHsc7YIfKv+nBVbb3MJH5xAKxUmTyaekRln78izVdvLW4C9T g==;
X-CSE-ConnectionGUID: tO8i72RcTWSjHiRbyj2Zhw==
X-CSE-MsgGUID: 9sX0w7OoT9iZVk+l6jIZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60316145"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60316145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:51:56 -0700
X-CSE-ConnectionGUID: m3lb2AllSli2YEs52DY6Vg==
X-CSE-MsgGUID: kBufa5NRRLGI6pVwTxMKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="206554223"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:51:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 0/6] drm/i915/irq: display irq refactoring
Date: Fri, 19 Sep 2025 12:51:43 +0300
Message-ID: <cover.1758275448.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Not all of this is exactly pretty, but it's a bit hard for platforms
where display and other irqs are conflated in the same registers.

Jani Nikula (6):
  drm/i915/irq: drop intel_psr_regs.h include
  drm/i915/irq: initialize gen2_imr_mask in terms of enable_mask
  drm/i915/irq: abstract i9xx_display_irq_enable_mask()
  drm/i915/irq: move check for HAS_HOTPLUG() inside i9xx_hpd_irq_ack()
  drm/i915/irq: change ILK irq handling order
  drm/i915/irq: split ILK display irq handling

 .../gpu/drm/i915/display/intel_display_irq.c  | 64 ++++++++++++++-
 .../gpu/drm/i915/display/intel_display_irq.h  |  5 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  3 +
 drivers/gpu/drm/i915/i915_irq.c               | 78 ++++---------------
 4 files changed, 84 insertions(+), 66 deletions(-)

-- 
2.47.3

