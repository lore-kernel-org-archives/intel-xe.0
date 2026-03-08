Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7811BF5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A61C10E120;
	Sun,  8 Mar 2026 13:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by0fop25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE810E041;
 Sun,  8 Mar 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772976303; x=1804512303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sSd20dBKrCtftN/WiE5WjQxeKU+fpgU0M4RSRFoKsww=;
 b=by0fop25de6GXGY4KYCYgcuWli8Us5JGkmFEeWCe22XHdsmjyTNg+22g
 aY+uLBHNjpLT2GuV7871Kr/ZQ91YVmJGzVut0gn3G7rrtglK9bKb9rtPV
 35hOd83xKtScxGKGfCRg61iMeQm3QpHDrv35pkqIH5z4ty8Chl8ifKNaH
 4uiKT2cJ8S9Jy13o9hIOdwlm7VfRlKY9+vA9rJnKWyd6fMZDkfMPHGiGb
 AmDocenzh6oaF4WpisXUuMxQJpjLu1LNnacTRCCoK1Oat1lhr2vaxlXCf
 9D2MjeADkavqnn0hDG3gSOijp0N+/ePlExzezTvYBBHkXO+e7fxbpn3bA A==;
X-CSE-ConnectionGUID: sCRz9XQvTE6nVEXplIbiBQ==
X-CSE-MsgGUID: D+dNaFHXSMCHBDgkSW01LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77871393"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77871393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:25:03 -0700
X-CSE-ConnectionGUID: AETMFiaGTqWSMU+gZXdfRw==
X-CSE-MsgGUID: dLDPygN4RbOSsJD2/9lkiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="217598072"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 06:25:01 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC v1 00/11] support for vswing/preemphasis override
Date: Sun,  8 Mar 2026 14:24:35 +0100
Message-ID: <20260308132446.3320848-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This patch series aims to get initial feedback & CI coverage on adding
support for Vswing / Preemphasis Override from VBT. Currently patchset
covers all platforms from MTL onward. There is an additional patch
covering platforms from ADL-P, but since it is still work-in-progress,
it hasn't been included for now.

BR,
Michał

Michał Grzelak (11):
  drm/i915/bios: search for Block 57 by default
  drm/i915/bios: cache V/P Override block
  drm/i915/bios: remove V/P Override warning
  drm/i915/bios: print V/P Override port info
  drm/i915/buf_trans: add intel_dp_above_hbr1() helper
  drm/i915/buf_trans: add intel_edp_above_hbr2() helper
  drm/i915/lt: align xe3plpd with V/P Override layout
  drm/i915/buf_trans: switch from u8 to u32
  drm/i915/xe3p: add V/P Override support for xe3p
  drm/i915/dg2: warn on V/P Override request on dg2
  drm/i915/mtl: add V/P Override support for mtl+

 drivers/gpu/drm/i915/display/intel_bios.c     |  33 +-
 drivers/gpu/drm/i915/display/intel_bios.h     |   1 +
 .../drm/i915/display/intel_ddi_buf_trans.c    | 323 ++++++++++++++----
 .../drm/i915/display/intel_ddi_buf_trans.h    |  16 +-
 .../gpu/drm/i915/display/intel_display_core.h |   2 +
 5 files changed, 300 insertions(+), 75 deletions(-)

-- 
2.45.2

