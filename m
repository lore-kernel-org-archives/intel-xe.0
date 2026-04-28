Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D1FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C310E2FA;
	Tue, 28 Apr 2026 09:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bafjLhQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700A10E2FA;
 Tue, 28 Apr 2026 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777369891; x=1808905891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TOgeRtK6fTV7+o1A4i7vaFQZ+JqqAPPHyIgYqvQYJSA=;
 b=bafjLhQji9X90qUb3u+ZLlyKcIkfcUAJ4pLs0x9O2IqU65gRTfVqMbVK
 VcQXZWakN6utzhFMF7IXUYdxaTYkEQ+Hu9m+fyrG81Wtt/oeR4gZfN+0N
 m9hoYkvqIHXMOKz94REQJeizbSq7Z6WEtxgomRkSOg2CdA7RZf6+4EYxY
 dzi2QbOmnbVrtahjRTzYMAbSRTNmVp5WFvjzX6F8AxQ6WFZsubrsoB1WJ
 nLVY0W4BiRxp1OOEdQNCpKZaie4G+oCwVzwMl+v6AGeIRYAWYwbyQxjHL
 sYmYVvQHbfRvhMEsEfaN1XwV3jlLUOIc3gDshEzfR5duAdvIeNSzDzST6 Q==;
X-CSE-ConnectionGUID: qBKYQVN1RqGwog7KKwmDWg==
X-CSE-MsgGUID: NQnwvWYjTA++s4lX4lFawQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78385107"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78385107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:30 -0700
X-CSE-ConnectionGUID: 8WAD70qtRGOn8tVVWJeHhQ==
X-CSE-MsgGUID: V8qhusHcS7yndzFY/7vMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238891824"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:28 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v5 0/8] drm/i915: move more display dependencies from i915
Date: Tue, 28 Apr 2026 12:48:18 +0300
Message-ID: <20260428095104.818360-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series continues my work of refactoring the clock gating
initialization, so that i915 doesn't do display-specific stuff.

With this, all register dependencies should be gone.

Change in v5:
	* Add SKL_DE_COMPRESSED_HASH_MODE workaround for CFL/CML (Jani).

Please review.

Cheers,
Luca.


Luca Coelho (8):
  drm/i915: move SKL clock gating init to display
  drm/i915: move KBL clock gating init to display
  drm/i915/display: move CFL clock gating init to display
  drm/i915/display: move BXT clock gating init to display
  drm/i915/display: move GLK clock gating init to display
  drm/i915/display: move HSW and BDW clock gating init to display
  drm/i915/display: move pre-HSW clock gating init to display
  drm/i915: remove HAS_PCH_NOP() dependency from clock gating

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../i915/display/intel_display_clock_gating.c | 270 ++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h |  27 ++
 .../gpu/drm/i915/display/intel_display_regs.h |  31 ++
 drivers/gpu/drm/i915/i915_reg.h               |  31 --
 drivers/gpu/drm/i915/intel_clock_gating.c     | 226 ++-------------
 6 files changed, 346 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.h

-- 
2.53.0

