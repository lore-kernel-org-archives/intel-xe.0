Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B5BCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A55410E49D;
	Tue, 26 May 2026 12:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT6UyiY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F68C10E49D;
 Tue, 26 May 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779800165; x=1811336165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o/qMlvGGPeyCyyH39L3XonE7unE7hENoW+DvqoEOAvk=;
 b=cT6UyiY3S3/EUFepl2KY96yKwfxQ2zNFJLVmE7YTneEZJqRuIC0Mnc9l
 c4Xc2ZKPSSVPiTce2WyI6r/OzaPIFHSExv0Ya9+ldtiQPdkZb0sb5OtQ5
 VDo+SIR+Gwcal+z2bmFdfPlgH3Zqw0YybVKly5ldUVWfFrSybYNXVI24y
 Q2mLn1fllGuP0MlNAqR8az5+EcnajlDG7cvcruMT9nO6Zw77pOp0LL7xu
 FKNgKHMxA1vA4aqHiNQKhsmHSnMmL6PnEM5qf+nZXBDsxaNcqDf5TiSrD
 yg/xH/yfMe4Y3TvcJ2fCfS+GE2bzfzI3hGqg9HHxfBDlzGRtnvwlS38nd w==;
X-CSE-ConnectionGUID: yHIFHAm2Q26g2VSozMf8WQ==
X-CSE-MsgGUID: BBI1grA6QmutSE98sZeR1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84465956"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84465956"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:56:04 -0700
X-CSE-ConnectionGUID: GPrXYlCkSP+ErGXhuB+lMw==
X-CSE-MsgGUID: lxk46J6zSs+51x4NUObJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238897496"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:56:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	imre.deak@intel.com
Subject: [PATCH 0/3] drm/i915/power: renames, cleanups
Date: Tue, 26 May 2026 15:55:56 +0300
Message-ID: <cover.1779800132.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Jani Nikula (3):
  drm/i915/power: make intel_power_domains_{suspend,resume}() static
  drm/i915/power: rename intel_power_domains_*() to
    intel_display_power_*()
  drm/i915/power: drop resume parameter from
    intel_display_power_init_hw()

 .../drm/i915/display/intel_display_driver.c   |  8 +-
 .../drm/i915/display/intel_display_power.c    | 84 ++++++++++---------
 .../drm/i915/display/intel_display_power.h    | 16 ++--
 .../drm/i915/display/intel_modeset_setup.c    |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            | 14 ++--
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/xe/display/xe_display.c       | 20 ++---
 7 files changed, 74 insertions(+), 72 deletions(-)

-- 
2.47.3

