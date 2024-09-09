Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53AECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 13:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FE810E575;
	Mon,  9 Sep 2024 13:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEZfdFmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF1E10E573;
 Mon,  9 Sep 2024 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725888785; x=1757424785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fl+9BeoFUsW6x2ilLg2a3ilY800TFWhhxNdManS4q98=;
 b=mEZfdFmtCOYpx3+6421TmkNGwXviMOLU2judbZG9Pb1KtWw21fvIoB5Z
 zYzEORRjszUIcbRKKul6Zoa+1b4h/wQ9BdUw1spg/Rqrd5ie6siJGu5G8
 3/VE6RvKXGn8hNiRgRKBOdE66GYuSupFhGFusM+5bvLgHX/Udl5B6VghO
 m9OpBkeXgpKRJgLonTagcg8xA2uocW46Nm9pcZDqvGn25SJDjz+Qrx8t+
 6n+5ED1Y6QBQMO9FDIRxo3L2jmod0ikmwoqMl+awtr1VQFiJQcPQPT63w
 LRK7hm8Pt278wRH5D7x7+xsDQinHJtgLnbmEE+S1NOJa9jXBZhf9wT5yu w==;
X-CSE-ConnectionGUID: pj68cF8uTPyUPSPwrDAcXQ==
X-CSE-MsgGUID: zH+wgydiQDmBRXengthyvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24527026"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24527026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:33:05 -0700
X-CSE-ConnectionGUID: TCKiBlv6Sh2rXetbkob7EA==
X-CSE-MsgGUID: 36GeSaXwSMSM0eNZjuzzFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="89961517"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.176])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:33:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 0/4] drm/i915/display: add snapshot capture/print infra
Date: Mon,  9 Sep 2024 16:32:55 +0300
Message-Id: <cover.1725888718.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Another spin of [1].

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1725372032.git.jani.nikula@intel.com


Jani Nikula (4):
  drm/i915: dump display parameters captured in error state, not current
  drm/i915/display: add intel_display_snapshot abstraction
  drm/i915/display: move device info and params handling to snapshot
  drm/i915/display: move dmc snapshotting to new display snapshot

 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_display_params.c   |  8 ++-
 .../drm/i915/display/intel_display_params.h   |  5 +-
 .../drm/i915/display/intel_display_snapshot.c | 72 +++++++++++++++++++
 .../drm/i915/display/intel_display_snapshot.h | 16 +++++
 drivers/gpu/drm/i915/display/intel_dmc.c      | 39 +++++++---
 drivers/gpu/drm/i915/display/intel_dmc.h      |  7 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  | 16 +++--
 drivers/gpu/drm/i915/display/intel_overlay.h  | 25 ++++---
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 25 ++-----
 drivers/gpu/drm/i915/i915_gpu_error.h         | 11 +--
 12 files changed, 168 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.h

-- 
2.39.2

