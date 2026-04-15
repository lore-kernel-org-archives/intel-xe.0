Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20BCFA0C2C
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 05:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B77E10E0DA;
	Wed, 15 Apr 2026 05:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/Ihi+OP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370210E05A;
 Wed, 15 Apr 2026 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776231624; x=1807767624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+2W6lPWhHIYu48Bo+L4CqsG6/1wXuPKqFNaXw3LviqM=;
 b=k/Ihi+OP4/kDbtNXs188hpVnZJxR8bhzHs0fl5p38x++HYJWmQMyafIv
 ioPRNKLUMVSbWI4wnVZHpqZCIrCBB11qYzWZoZO3OR/h5roiqobFOo+bZ
 vbn/jJz64VPr3g55FsIYPOb+y/bSP0/nBvby16wN26F70lNmtMLZYC1da
 HluHBbL21JXClSsHD5/cVN7yk3DWhxIS0UCYh6jdhCDw3gn3S4OSacpZD
 2OQH7VtBCSGdcl5lVrbX0PeTJYBLdDbSoR78QcjzJmZw27/7OastqF19R
 n/SwdlA4vSQE9HEiX+5ZOHrQmk+CcGqdX0Cd/ETc5I5czr9gHEdOq5aq1 Q==;
X-CSE-ConnectionGUID: 75xJf8sOTp+NccGOxTaABg==
X-CSE-MsgGUID: /1WX3rYlQ4WuHdbf0FUeLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102657057"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102657057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:40:24 -0700
X-CSE-ConnectionGUID: AgFH5CGTRIWBpj6cnAFzYA==
X-CSE-MsgGUID: zIE4Lw7JT/+BbFiMP7qRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227129766"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:40:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/4] PSR2 SDP on Prior Scanline workarounds
Date: Wed, 15 Apr 2026 08:39:56 +0300
Message-ID: <20260415054000.400070-1-jouni.hogander@intel.com>
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

This patch set implements two workarounds:

1. There are problem in PSR2 SDP on Prior Scanline implementation in
   several panels due to eDP1.4b spec ambiguity. Two tackle this there is
   Intel specific DPCD register for panel to indicate implementation
   compatibility with Intel source implementation. eDP1.5 doesn't have
   this problem.

2. In NVL there is an HW optimization done. When there is an SU triggered in
   Capture state, Link will be kept ON post Capture CRC SDP. Before valid SU
   pixels Intel source will transmit dummy pixels. Some TCONS are improperly
   considering these dummy pixels as a valid pixel data. Prior NVL link was
   was turned of even if there was SU triggered in Capture state and no dummy
   pixels were transmitted. These dummy pixels are problem only if SDP on
   prior scanline is used and Early Transport is not in use. The workaround is
   to start SU area always at scanline 0.

Jouni Högander (4):
  drm/i915/psr: Add defininitions for INTEL_WA_REGISTER_CAPS DPCD
    register
  drm/i915/psr: Read Intel DPCD workaround register
  drm/i915/psr: Apply Intel DPCD workaround when SDP on prior line used
  drm/i915/psr: Apply SDP on prior scanline workaround for NVL

 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dpcd.h     | 15 ++++++
 drivers/gpu/drm/i915/display/intel_psr.c      | 49 +++++++++++++++++--
 3 files changed, 60 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpcd.h

-- 
2.43.0

