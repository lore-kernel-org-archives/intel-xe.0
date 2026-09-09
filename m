Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4BC79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0F410EF75;
	Wed,  9 Sep 2026 07:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1YjMk5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B273410EF7A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788938830; x=1820474830;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YrcDtTUBWNxe7sjUrFcraP4K+3m4GqWGGicqsywyJIw=;
 b=j1YjMk5rgOuSohvZPE/q/nMRyNn70EzWg6CiIVKcZw1Xho2113oZH5X4
 BHHKcqX9yC05JUZlh/xmaIpFYgXcvFFtoelzOERJRjGmzI3OhdYo7476i
 SdYrVAdrlt9WdD4YBO2nRsuBj9HueCw5e/4tBUALZFmWFyTKshC3QGZjb
 2NKOWvcrUK8iH/ya4Av/Dpi5HwD3YzMRQt5r9rfPeVABPFiFTHRhv72de
 LV3st6SY+b+u80zFxBOu9s/dGAS7eJF+nA+F2fBkfphYmoKI6b4gzlEex
 RPUMDgd7IRoXKHRqMDZY84ImNofbDf3TbAgP5K3LDzyOSQighnI89vSoi A==;
X-CSE-ConnectionGUID: lP2P8jkrQeSHciAK0Vhmcw==
X-CSE-MsgGUID: RnmYWa4wSEWUDhiy98lyLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89192990"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89192990"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:27:09 -0700
X-CSE-ConnectionGUID: V+i4ze2fR4eJVYd89WereA==
X-CSE-MsgGUID: O5MolyMkRxOUdPyg6g9MVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296175655"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 00:27:07 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com, gustavo.sousa@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Wed,  9 Sep 2026 12:55:38 +0530
Message-ID: <20260909072540.99303-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

This series adds Wa_14025941587 (minimum IDLEDLY floor) for Xe2, Xe3 and
Xe3p and hardens the shared adjust_idledly() helper it builds on.

Patch 1 fixes three pre-existing corner cases in adjust_idledly() that
can panic or misprogram RING_IDLEDLY.
(timestamp_base == 0 divide-by-zero, IDLE_WAIT_TIME == 0 underflow, and
u32 overflow in the tick<->ns conversions).

Patch 2 applies Wa_14025941587 on top of the hardened helper.

Tangudu Tilak Tirumalesh (2):
  drm/xe: harden adjust_idledly() against divide-by-zero and overflow
  drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 65 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 57 insertions(+), 12 deletions(-)

-- 
2.46.0

