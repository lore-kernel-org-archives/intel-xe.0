Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA41E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DD610EF68;
	Thu,  5 Dec 2024 18:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wu/SXj2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9D10EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733422983; x=1764958983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6LP0TuCb4cr9q6L3f41WeAoUoVhd6HYuf4082OUJSXs=;
 b=Wu/SXj2AcpYo+xN8eqzThXkWsiH2pmTSs3ai+uVPbYau/AdHtDSCR01w
 4U47C2Lg4ZBYkgavem9SurtHbkoNXPz/dkHwfOLi5jMY0SgZNNgfGorEe
 BT5FLpeGG0ITIFz5h3Rq777bC389+Ig/UVHNfcTYD8HWg+V6MSxO6yXLc
 NbplF9+X6LsD+O4SWRvC+7ScCdvGLoC2LLUXlSxKSgjLlKbeqbOG59E7f
 8l4lp4ciya7LjAcnU+nii/sp2R31A5yRTU9JK38jCQssmX0ws43L0NWxT
 FvJw4Kns/jMbrGM2kFJcmseNL7U/mW/B/1olkmXiAkT4vYKnrzEZcgE6V w==;
X-CSE-ConnectionGUID: tbfRqqSOT+amZoztVtTMKg==
X-CSE-MsgGUID: ZqeuLLvkRKSLmeG4mTNMgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33083522"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33083522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
X-CSE-ConnectionGUID: 43Kr+BaMTPGqUlh7mkWNuw==
X-CSE-MsgGUID: K+Fr8tLCQMesiy7gMymp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94375111"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] reg_sr/whitelist fixes and refactors
Date: Thu,  5 Dec 2024 10:22:35 -0800
Message-ID: <20241205182240.3463027-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

First patch is an important fix that we could eventually trip on (and it
did in this series because it increases the amount of save-restore
registers).

Second is more to maintain it consistent than anything else: if we don't
trust the HW defaults, what difference it makes if the engine has 1 or 0
whitelisted registers? The rest should be written to anyway. However,
I'm not happy with not trusting the HW default there: bspec says these
registers are power context saved/restored. So maybe we should add a
test to verify that's true and stop doing that? Or at least provide some
evidence this is needed because of a workaround or the like.

The other patches are what I was really intending to do in this series:
make the whitelist stop interacting with the HW. It instead collects the
registers and add them to the hwe's reg_sr. With that the mmio write
covers the hw interaction and there's no special code in xe_guc_ads.c to
communicate to GuC that these registers should survive an engine reset.

Lucas De Marchi (5):
  drm/xe/reg_sr: Remove register pool
  drm/xe/reg_sr: Write all whitelist slots
  drm/xe: Add xe_gt_dbg_printer
  drmxe/reg_sr: Convert whitelist to gt logging
  drm/xe: Apply whitelist to engine save-restore

 drivers/gpu/drm/xe/xe_gt.c            |  4 +-
 drivers/gpu/drm/xe/xe_gt_printk.h     | 22 +++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ---
 drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
 drivers/gpu/drm/xe/xe_reg_sr.c        | 84 ++-------------------------
 drivers/gpu/drm/xe/xe_reg_sr_types.h  |  6 --
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 59 +++++++++++++++++++
 7 files changed, 88 insertions(+), 95 deletions(-)

-- 
2.47.0

