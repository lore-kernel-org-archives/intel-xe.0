Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0DDE87836
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FBA10E681;
	Tue,  3 Feb 2026 14:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdJiwLCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EED10E681;
 Tue,  3 Feb 2026 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770127998; x=1801663998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+YV6LIUee58HtjBLaWVlo/8hUkKV+JfcZuDArPrhbTU=;
 b=PdJiwLCtQmTsPCsOabVC5/4ek+ee4Vc3PB4zxh9CGKJYuHKSudp5xa9u
 5AM8mbS3wpbHiLYyfkIWBbT8P7tMw6pDLlaLpDZPy6FH8xP8QxQMbasa+
 mMSx2CFuJgT5AQskFRmZMwFUkOk6AAXF1BwCdz2AdJtVGrLKt7FPfmf3+
 prDcw+4VmlxpnUDY+PeQPFtdt40vpQ4izcootIQoeyif9ZRnCwcoNbl5A
 OGvwvLdC9CG4jdWgHSheafVcdw/47iRNBqNgcUp1/h0p3a5xJRiYroGee
 YSnaa+y6Al7IS8ZqGk6T454SRY7DVV6ulXkX0ZQI2q9klNcmBOs/af+T5 g==;
X-CSE-ConnectionGUID: 8lMPKLx8RFm6TaJhd9GtXA==
X-CSE-MsgGUID: W9arD6OjSFKrNCPV5AF5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156433"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:16 -0800
X-CSE-ConnectionGUID: aL8rBZ/fTFKZXg0mHge4gQ==
X-CSE-MsgGUID: ui81IkFxQ0CkKXVHy7hSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956286"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:14 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 00/10] CMTG enablement
Date: Tue,  3 Feb 2026 19:13:57 +0530
Message-Id: <20260203134407.2823406-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Common mode timing generator (CMTG) support is added LNL onwards.
Enable CMTG which will be needed by other fearure like dynamic dc
state enablement later.

Testing ongoing, currently counters are incrementing as expected.

Animesh Manna (8):
  drm/i915/cmtg: enable cmtg LNL onwards
  drm/i915/cmtg: cmtg set clock select
  drm/i915/cmtg: set timings for cmtg
  drm/i915/cmtg: program vrr registers of cmtg
  drm/i915/cmtg: program set context latency of cmtg
  drm/i915/cmtg: set transcoder mn for cmtg
  drm/i915/cmtg: program sync to port for cmtg
  drm/i915/cmtg: enable cmtg ctl

Dibin Moolakadan Subrahmanian (2):
  drm/i915/cmtg: enable cmtg in secondary mode
  drm/i915/cmtg: disable CMTG on transcoder disable

 drivers/gpu/drm/i915/display/intel_cmtg.c     | 140 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |   4 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  22 +++
 drivers/gpu/drm/i915/display/intel_crt.c      |   1 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  52 ++++---
 .../drm/i915/display/intel_display_types.h    |   7 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   4 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |   4 +
 10 files changed, 225 insertions(+), 23 deletions(-)

-- 
2.29.0

