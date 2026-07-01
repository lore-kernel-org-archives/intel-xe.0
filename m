Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E86EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 07:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E9A10E31E;
	Wed,  1 Jul 2026 07:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJLG2Wng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273AE10E31E;
 Wed,  1 Jul 2026 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782892668; x=1814428668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fuEz4iKrGv3vbpxOgk18pgxTCIzbRA6QY9EpWelDJ7k=;
 b=NJLG2WngVpwcCI65PcjghMp9V/SkI9mSGanSgflX3mdmsArU9o6ljBS2
 zj/AWBXLfVLfV4hA32Yw6MO+MulC9MRowSPXmSMgSin0p/MT7nCsu9Xjd
 RjT+fpBFU9fGeC3Bt6CodApoAh8oMDgs5JuzD9+tnK83VYO/09nfdRppv
 WHyaG7M5df9QcaocVuptDqXDwvO8aDNg0rGpmLdewOVx8nmGfsHEYThha
 alBj3P7nGBPw0l2lEt5zbmJ780s1sW4d/5iHMOEPMOqCoO2ofAMoYZphM
 CnWn/DgP6MvcEebSBDfP0OMqF2i0t1kvnr8nuM4rpYfT4WoImfLvZjqG4 g==;
X-CSE-ConnectionGUID: 00nkJ2dSRamn8nSmafb/xw==
X-CSE-MsgGUID: psAPCEfnR6G32Q+FJ3L3mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83816624"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83816624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 00:57:47 -0700
X-CSE-ConnectionGUID: hmbB5lwoTu6nLiiwk6MrWw==
X-CSE-MsgGUID: avLTYeBXRcC/Z4PAiNWVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="282565666"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 00:57:45 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Fix LT PHY related SSC writes
Date: Wed,  1 Jul 2026 13:27:35 +0530
Message-Id: <20260701075737.1285909-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Xe3P onwards we only write on SSC Enable PLLA on PORT
CLOCK CTL. Fix this register write. Along with that add
ssc_enabled readout.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/i915/ltphy: Readout ssc_enabled for LT PHY
  drm/i915/ltphy: Fix SSC Enablement bit in PORT_CLOCK_CTL

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.34.1

