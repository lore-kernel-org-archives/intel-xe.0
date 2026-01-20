Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A09CCF2DD
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 15:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053810E122;
	Tue, 20 Jan 2026 15:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn24uLuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEFE10E0AD;
 Tue, 20 Jan 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768923947; x=1800459947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=coaVUw5a2J36+nJkGkKo6+WKeYVRAlZmUu3UHoPw2VM=;
 b=fn24uLuoHB2O+dRnOC0a28OwF3JOWA1gu3Q5JOPlMli2t14m5VD8J3UF
 k88+5rS4PFCPmR3YzZlAwH3nXHGPLMzZ40PZxPzPy4sXCXFeQV0J0YDw+
 gikynJN0KzG+nI61eK7XCgGU6qa1Yunlm30FB+LW8UcNZMiaiB3ihuQX4
 L4gjL+VTGks2znPk5Gk0MaqaX2mYFn6TFaSQO2MT4VnCROTOrQEivWTVs
 NldzbZjTbkkBiQ43KljZ9Kl9hQfq1BRAuBnKhVp1GxkT+N9sWc+OSzhbW
 aiIElp4lXDjIt5eHBcfDOndjTWRC3SJ10qqMbNeobrVCHWPE7PGQ98L0g g==;
X-CSE-ConnectionGUID: CWrRpDhTSIKXbsojuKid8A==
X-CSE-MsgGUID: OgNxcuwyQwufzaKrJ4WLtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70040626"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70040626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:45:46 -0800
X-CSE-ConnectionGUID: 9BLQI0fKSGmyUtd1w55MRQ==
X-CSE-MsgGUID: 86xuowU4SEGBSdRcx2Iy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="211004140"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:45:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/2] drm/{i915,
 xe}/dsb: move DSB buffer calls to parent interface
Date: Tue, 20 Jan 2026 17:45:39 +0200
Message-ID: <cover.1768923917.git.jani.nikula@intel.com>
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


Jani Nikula (2):
  drm/i915/dsb: move i915 specific DSB buffer implementation to i915
  drm/{i915,xe}/dsb: move DSB buffer to parent interface

 drivers/gpu/drm/i915/Makefile                 |  2 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      | 92 ++++++++++++++-----
 .../gpu/drm/i915/display/intel_dsb_buffer.h   | 22 -----
 drivers/gpu/drm/i915/i915_driver.c            |  2 +
 .../intel_dsb_buffer.c => i915_dsb_buffer.c}  | 28 ++++--
 drivers/gpu/drm/i915/i915_dsb_buffer.h        |  9 ++
 drivers/gpu/drm/xe/display/xe_display.c       |  2 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    | 28 ++++--
 drivers/gpu/drm/xe/display/xe_dsb_buffer.h    |  9 ++
 include/drm/intel/display_parent_interface.h  | 14 +++
 10 files changed, 147 insertions(+), 61 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 rename drivers/gpu/drm/i915/{display/intel_dsb_buffer.c => i915_dsb_buffer.c} (63%)
 create mode 100644 drivers/gpu/drm/i915/i915_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.h

-- 
2.47.3

