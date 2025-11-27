Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC86D11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 11:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E4A10E673;
	Thu, 27 Nov 2025 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEOOjuaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524EE10E5BF;
 Thu, 27 Nov 2025 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764244487; x=1795780487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=34MpZIBJDkyfi29WtvcEloofE4SUVT4IyGdEbcXfQp0=;
 b=LEOOjuaYG8rML5MA0eZ6NVR7iMHu9pTYtcRzGc+8k+L5vrSY2Iq/cT5M
 YrY9m6ESnelGugb/idUvmS2OlUDyAgc2eqlX1bzfjcDt0gKpzZWuTq7Hl
 kXpzxF7E7C1Hy+FpjvB+qwAJqqiGTCLYvlIqWR/qSrdxX23FZLm8u1K4y
 aBwNK59SPgsDESJWd4z2w2niXJX5c8TmRO8Z96RwUsx+soVy5HGUfwT4d
 lcAF+jq9jdVDipXDBgpllr8giq4IQFn0ngMUurv8Xrocydgj5cpwhC9Bm
 4VkCDm6WedNhZ1ipyXs3/s7UsaOSheahATns4GSSc8PDAdn1CqGbTj+Fc g==;
X-CSE-ConnectionGUID: EAcpyxciThCw/dxpn59OLA==
X-CSE-MsgGUID: Aj6Et8aiQa+oizdfYZGunw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83682745"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83682745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:54:46 -0800
X-CSE-ConnectionGUID: hetChEImRo65blvbHh3etg==
X-CSE-MsgGUID: aCPAmInyST6eQB2QrlMOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="224167812"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.244])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:54:44 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, matthew.d.roper@intel.com,
 gustavo.sousa@intel.com, ville.syrjala@intel.com, jani.nikula@intel.com
Subject: [PATCH v4 0/3] drm/i915/display: Enable system cache support for FBC
Date: Thu, 27 Nov 2025 13:53:46 +0200
Message-ID: <20251127115349.249120-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Use system cacheability configuration register to assign a reserved
area in system cache for FBC

v4: included the sys cache workaroung patch + review commets changes

Vinod Govindapillai (3):
  drm/i915/display: Use a sub-struct for fbc operations in intel_display
  drm/i915/xe3p_lpd: Enable display use of system cache for FBC
  drm/i915/fbc: Apply Wa_14025769978

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  2 +-
 .../gpu/drm/i915/display/intel_display_core.h | 11 ++-
 .../drm/i915/display/intel_display_device.h   |  1 +
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 +
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 98 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fbc_regs.h | 10 ++
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 8 files changed, 121 insertions(+), 6 deletions(-)

-- 
2.43.0

