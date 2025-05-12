Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2AFC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 10:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C9A10E091;
	Mon, 12 May 2025 10:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBbh1eIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25AF10E091;
 Mon, 12 May 2025 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747046041; x=1778582041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4lfX/Lb1Y/eDJ4/nmEgaW0kCqDQ+TIcmVAla7/7IoEw=;
 b=aBbh1eIm1mHxmoUyYJktmzv/o6S83Pp8Tid4Tv3s6W9oTaXIB6anB1DB
 04IOySrUPEk8dMk86H747Mafgzw2WXsnjcMK/ovzx5ZTQR7793aV3fpl9
 f75y1w/3JHWr8kvzd4CBEbU1qLjz/gpZ2kFjqIPrNZMHesiLGUA6/CTXQ
 wovCDzYSb2d/YswLgCplBvFrO5kkHwSQIaUMbQobaG39uK0U8myYrE4Fc
 v1lWI9LZjqLkQNszzSton6v6pTl49+w25016QW/WE4K60KpMyeug81TRu
 PurewDej6IMsZcvZwTs768itEp6ZjiFBMhGY0FEEYBogkMhIrRJWJYs+g g==;
X-CSE-ConnectionGUID: XUPSqLSGSrWCUbB+mHKl+A==
X-CSE-MsgGUID: E29UhCn1S9qTPX1uXtYvzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59467352"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59467352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:34:01 -0700
X-CSE-ConnectionGUID: EWtWm2eBTFCmuiM3oQzg+Q==
X-CSE-MsgGUID: Kll9sGPiTC6hJbE0BQzKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142439946"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.195])
 by orviesa005.jf.intel.com with SMTP; 12 May 2025 03:33:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 May 2025 13:33:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915/dmc: PIPEDMC stuff
Date: Mon, 12 May 2025 13:33:51 +0300
Message-ID: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Hook up PIPEDMC interrupts and refactor some of the event handler
stuff as preparation for flip queue stuff.

Ville Syrjälä (7):
  drm/i915: Drop PIPEDMC faults from the fault mask on LNL+
  drm/i915: Hook up PIPEDMC interrupts
  drm/i915/dmc: Define all DMC event IDs
  drm/i915/dmc: Extract dmc_evt_ctl_disable()
  drm/o915/dmc: Relocate is_dmc_evt_{ctl,htp}_reg()
  drm/i915/dmc: Extract is_event_handler()
  drm/i915/dmc: Introduce dmc_configure_event()

 .../drm/i915/display/intel_display_device.h   |   1 +
 .../gpu/drm/i915/display/intel_display_irq.c  |  17 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      | 156 ++++++---
 drivers/gpu/drm/i915/display/intel_dmc.h      |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 297 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h               |   6 +-
 6 files changed, 424 insertions(+), 55 deletions(-)

-- 
2.49.0

