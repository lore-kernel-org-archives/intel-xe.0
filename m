Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B71FED2F0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD7110EA1E;
	Thu, 12 Mar 2026 08:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvXwC/4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5580010EA19;
 Thu, 12 Mar 2026 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304644; x=1804840644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aANDWQmwnMhF5ZcIabfbkwtGF2l65vv7/Vo8WVDBec0=;
 b=HvXwC/4KesKvhQS2XGZ9IFCWV8SxPRD3I3heNV3KVgu18kT0lo+YQNKc
 8Gkc3Rw8bVW9Tu1oVXF74HZjND0fborNA5j6V6hpregWpZEjINhGJBaOw
 5QHVORiKkvsWWpxFTrBulMsCCwEWI9vjeDKmUax9jf6PKtlWLqkckx1RR
 GnbcRPGc/G1tjgHxO0EzBNdnRPH801/UclK0W7AoGwhaFUoxDyhnlNTTC
 8R6LQwicLLtkx9IZr+DWvPa8bN/5vA9iW2u1AI0H0ol5+N1BsHwgvZ72I
 2WtxG6KKOcMA24Ahclu0JO5PfoRyHAhjkydi8fnEukch05CcIeh/KMv0d w==;
X-CSE-ConnectionGUID: J44TWn5kSZyhUl0pEkCxVA==
X-CSE-MsgGUID: KYO2KZ3yRLKI1npG1WVlgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74280158"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74280158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:23 -0700
X-CSE-ConnectionGUID: vq4rQYfmRzey6/eCqRyJeg==
X-CSE-MsgGUID: hXwmh1BiS1usaWrEmN4prA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.245.57])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:21 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/2] PSR parameters handling fixes
Date: Thu, 12 Mar 2026 10:37:08 +0200
Message-ID: <20260312083710.1593781-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

This patch set contains fixes for PSR parameter handling:

1. Ensure using up-to-date ALPM parameters when e.g. refresh rate is changing
2. Do not compute anything directly into intel_dp:intel_psr

Jouni Högander (2):
  drm/i915/psr: Disable PSR on update_m_n and update_lrr
  drm/i915/psr: Compute psr_entry_setup_frames into intel_crtc_state

 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

