Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F3AC52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 09:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8CF10E192;
	Wed, 14 Aug 2024 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ia4g0p/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EFF10E192
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629243; x=1755165243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xGNu2cPi6ztccON/evkYzvSSoSmdfNSf4J58PLvWQa8=;
 b=Ia4g0p/fH+8/CJvsje9f4saUmmCJJGP4ACIsrYxDHOKEF0Oh1WQLu1Kf
 ufjZnP7QBydXnqliZ4iv3LfcOrq5sTniW7zQLpaxMVgSItjIWuUBvCpSG
 pyuLEIM27f59aSxNDMhjZ5Vb334QsuVJ/IDB8r1EHI3/mmWxN/nov3D4i
 eZRvHYuYHJbF++Kv9Sp1zv6IQfovt86xkIDvJOKJMPltlYIAHDdYoA5H9
 URBh5yH2m/TJ5neYGb5cPBYWH4x5PcPveOMz9mk+GmBl2NjPJF52JDaIf
 RmrqKzyylyOiCNX5Uqk2agTGbbDvF3bq1CFHpYmizakCfFt9DYp81FOKA Q==;
X-CSE-ConnectionGUID: k0uf1MhbRo+PDuPABj2S5w==
X-CSE-MsgGUID: m2BbczTfSmaZJuFx53Nfrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32510050"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="32510050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:54:03 -0700
X-CSE-ConnectionGUID: adTLYk7sSYK2W5Ds+WOBUQ==
X-CSE-MsgGUID: nqxarfbpTyqWDI2r0U5nnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63624169"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 02:54:01 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 0/3] Shuffle enable_host_l2_vram order and use MCR reg
Date: Wed, 14 Aug 2024 15:26:11 +0530
Message-Id: <20240814095614.909774-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series introduces,
1. Move enable_host_l2_vram after mcr_init
2. Use MCR regsiter as mcr reg and write to all slices and 
   respective fixes tag to change

V2:
  - Reword commit message
  - Handle STATELESS_COMPRESSION_CTRL as its recently added and
    missed to be defined as mcr reg

Note: Tesetd on BMG with more than 100+ loadunload module with HDMI
connected and did not see any error.

Tejas Upadhyay (3):
  drm/xe: Move enable host l2 VRAM post MCR init
  drm/xe: Write all slices if its mcr register
  drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr register

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++--
 drivers/gpu/drm/xe/xe_gt.c           | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

