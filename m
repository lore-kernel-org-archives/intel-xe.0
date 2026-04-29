Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF1FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 11:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0687710E072;
	Wed, 29 Apr 2026 11:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLeeXyzg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321A310E072;
 Wed, 29 Apr 2026 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777460406; x=1808996406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GHjgXNB7eAadQqa9quL6Ysw1JKMMKM3Xzvhd7Ok720I=;
 b=aLeeXyzgsSzP70MOlaPGYpdW97MGjO0QnuKjElY8o+DwDAF3yPNbhEYx
 HUP7l3DtOPCYOk98EZoFP3TsHoUe9XR+aeD6QPq+IFM2BN/jXqj8cx3u5
 rbMrLrhLQqeCdBaPyeYf0eC8mNShXn3DlelR1GC1UVqZE4YaclDgwCNT1
 ONOt/PX/QTIXcX4KdCOlvQvNvzObIj7VANpj6ULC/2rWFowcHpWQPBHpE
 UALd+xIXqQNnMFq78Yhtq/vJ4Jhti7zUgTHPgADRdgRJMQznBq+ORUF3x
 +NYPUeo8qHqzXOLpgAFWtKCNsZ25Rzm9vU7FL3F01+qlEslGMgbp6o8Gq A==;
X-CSE-ConnectionGUID: wqfuPsRQTfyE2z0rjR/HBQ==
X-CSE-MsgGUID: TkB/TjXTTD2ChH9pf5Ey/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78280000"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78280000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:06 -0700
X-CSE-ConnectionGUID: 6UZuw0DHQySqU40bvndkjw==
X-CSE-MsgGUID: TcsAcSyqRhSQdgRoi51x9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="264614291"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 04:00:04 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH 0/2] drm/i915/psr: DC entry prevention during active vblank
Date: Wed, 29 Apr 2026 16:30:21 +0530
Message-ID: <20260429110023.611664-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

Unify PSR DC state disable for both PSR and Panel Replay, and use DMC
wakelock on display version 30+ instead of set_target_dc_state().

Dibin Moolakadan Subrahmanian (2):
  drm/i915/psr: Unify DC state handling for PSR and Panel Replay on VBI
    enable
  drm/i915/psr: Use DMC wakelock instead of DC state for VBI

 drivers/gpu/drm/i915/display/intel_psr.c | 37 +++++++++++++-----------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.43.0

