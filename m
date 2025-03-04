Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15071C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 10:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CCE10E30A;
	Tue,  4 Mar 2025 10:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqquvom9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F09310E30A;
 Tue,  4 Mar 2025 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084060; x=1772620060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHUiu93cYotGPYiJLy93L4hr97MrLkY/wRYK5SsIE1I=;
 b=aqquvom9SpEtwAW++JGP/CFe4GtMGTp/cu3PAKQntVe/2F5b42FJZAhH
 Iiful4EbnpwkXcvw4o1hE9uI+kXHcMvqMJEVaEfOBDfF7kzo8OvhgoiVq
 b/iI4+x69evrY4ff4qSz86E5BwshQvLN1kSJfdhg2pTS+A3F8wlYRGjer
 PiwvvyEj1pAGze12AauZ/xpBPMmRAH5H9TxsUZM7Ya04pVZ1wOlof0vFH
 84IkD6AO+IZqtGS5aJFwwE/+b5dWXSoQZGpWRjfvA9OzfQF0cTfcORHB0
 BR3NJ9qHJaGxFW5y2XLDxMyroeA1UU2yJpHADRlEQ/T43KXADSuYzaqn4 Q==;
X-CSE-ConnectionGUID: NC2AJ8DHSkWHI6JIRPwJEw==
X-CSE-MsgGUID: oDovkdyOTae9/ZH/gSRHCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52632769"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="52632769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:27:40 -0800
X-CSE-ConnectionGUID: PgWjj1tlSqWj/NVmPuuRVA==
X-CSE-MsgGUID: 0iSXGz67RNuWMgi8o0wwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118321665"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:27:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/5] drm/i915/display: convert intel_display.[ch] to struct
 intel_display
Date: Tue,  4 Mar 2025 12:27:29 +0200
Message-Id: <cover.1741084010.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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


Jani Nikula (5):
  drm/i915/display: convert various port/phy helpers to struct
    intel_display
  drm/i915/display: convert some intel_display.[ch] functions to struct
    intel_display
  drm/i915/display: convert intel_has_pending_fb_unpin() to struct
    intel_display
  drm/i915/display: remove dupe intel_update_watermarks() declaration
  drm/i915/display: convert intel_display.c to struct intel_display

 drivers/gpu/drm/i915/display/intel_bios.c     |    5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |    9 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 1045 ++++++++---------
 drivers/gpu/drm/i915/display/intel_display.h  |   24 +-
 .../drm/i915/display/intel_display_driver.c   |   10 +-
 .../i915/display/intel_display_power_well.c   |    9 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |    3 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h    |    6 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |    3 +-
 drivers/gpu/drm/i915/i915_reg.h               |    4 +-
 10 files changed, 550 insertions(+), 568 deletions(-)

-- 
2.39.5

