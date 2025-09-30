Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958E6CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253510E0F1;
	Tue, 30 Sep 2025 23:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0G5l2Ld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C310E0F1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759274527; x=1790810527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rMquVmDUf9jC688n0a6QUpZt9k7ZfxosXOh0pAH04Jk=;
 b=i0G5l2LdeQC9iww9uW8tpIwvhJAjrAumWZdy9U4ufKp/Gkiy5EIsOr7J
 If6RDDlTMTBl7Kk8HrTKU15mfalt2fKlS4OaxM9lD9BoNWjtS9IiHUygs
 GbXuBFSZbzxMYvGkbwGWc/3BiscZ/QQpKw3ydyfxtBYpACP8pGGL5qPHY
 95CumUWzfJJn5WCbgVJ26aCcJj0T8vLm5BsNtCwwQTO+xZ18BnzhClA1B
 CFgaDAoiKJ4NdBZ78HFPFsVr7I7kqzu8X5ncHzZ6pvTXfKj7Hf/D0CNhC
 tVqJoI82bP8SNXEsGrUPDK3nCTn0RrH22fynAsE9rdVi5miABEdfUy9oR w==;
X-CSE-ConnectionGUID: CaRghu/ES6iTZ8PtA5xNtQ==
X-CSE-MsgGUID: tJb4tX3URseddfPdr/6tlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72645761"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72645761"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:22:07 -0700
X-CSE-ConnectionGUID: y97qLvczRkSKWm2pfA7ztw==
X-CSE-MsgGUID: PYutVB9yQUyd6ZBmVuWwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178682009"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:22:06 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: TileAddrRange registers are being deprecated.
Date: Tue, 30 Sep 2025 16:26:44 -0700
Message-ID: <20250930232645.600251-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Quoting BSpec: 59353, "The TILEx_ADDR_RANGE registers no longer have any
impact on HW behavior. They now function only as scratch registers for
communication between SoC FW and the GPU driver, and will eventually be
replaced by equivalent registers within SoC MMIO space. At that point,
these registers can be deprecated from XeTLB.".
While the transition is ongoing, the SGAddrRangeforTile continues to be
valid and works on all platforms supported by xe, reading that instead
to avoid potential breakage.

Fei Yang (1):
  drm/xe: TileAddrRange registers are being deprecated.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ++-
 drivers/gpu/drm/xe/xe_vram.c         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.43.0

