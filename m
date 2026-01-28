Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA15ED25B48
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 11:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF43110E00D;
	Wed, 28 Jan 2026 11:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0ngy5L1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177210E00D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769601129; x=1801137129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GUHdur7wuFUG4imk4Hr1b6NiRimAkqTJSnVDKSQLzo=;
 b=S0ngy5L1POLDPEKRrPdNOl4RreGHi/zkQFdXvUyG/3yHEsviWsajVNN6
 QW3jMPnqs9TmoThsLoQgMEgiqpJ/ASDHjY3I0aKDpOmeUWF+t4VDZqWpk
 Zs99ASWPHW/Z3cNGDdv2CfLi7uTx+n5UV8SSerJAWI+aap19JAOcgWc/m
 oIgvLVsxwwywVDg6abitL+ueKO/rBrUQqIm0SUJP3kWxe0rD25mBMllGA
 9xu0LocfsLqN5Mb9WFVer0UO5Gzm12VgpqAldjYaYUTSozpAFnK8vIR1q
 +DsUsfX/Vk2jHCvFlSjWPseqXzy2UlPFuUM4lDB3S+VJmEou6tidA2Sf/ A==;
X-CSE-ConnectionGUID: MQX4LAKXSL2Qmx0VSZezBA==
X-CSE-MsgGUID: GIpfMw1rSP66PzLz76643g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70527315"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70527315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:52:09 -0800
X-CSE-ConnectionGUID: 5P4J7bBATQa+gl63dlbvVw==
X-CSE-MsgGUID: YdGHbHPnS6GCFskMjIOJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208042059"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:52:04 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 0/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Wed, 28 Jan 2026 17:21:35 +0530
Message-ID: <20260128115134.657091-4-sk.anirban@intel.com>
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

Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

v2: Modify error message (Badal)
    Rename reg bit name (Daniele)
    Update WA skip condition (Daniele)
    Update SRAM handling logic (Daniele)
v3: Reorder WA call (Badal)
    Wait for GuC ready status (Daniele)

Sk Anirban (2):
  drm/xe/rtp: Extend support for max rules/actions per entry
  drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h           |  4 +--
 drivers/gpu/drm/xe/xe_rtp_helpers.h   |  3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
 5 files changed, 59 insertions(+), 2 deletions(-)

-- 
2.43.0

