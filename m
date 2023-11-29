Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 23:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4010E0F9;
	Wed, 29 Nov 2023 23:28:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9FD10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701300514; x=1732836514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vvAE0kCgS6r3pAuwNBX+7di48tBeSO6OG3qgy892gNw=;
 b=kzFgF38r1NQWVIk/8s79seoCoP7HX1/L3V/J2gv713ZxsoysZVl6+Euj
 JEBE4cstPEXqrDLjoOblU3Wf6pBt3eAxPLCwiHi282JVilZecYT9Q0nUc
 Z1Mm2R6hGlEFY3K78jGiiRMF39Nx0oJuBAv4bU4eIgMFW8V2wVNMBBl+B
 H65sZxE59MiZJz2PW5Z/h5/NRfXm8FSWrA3WkhCeOXredoTz5LbYYe5eY
 vgepXlAwMtxfkgW1XoWgCSOyW/Oo/rEslf6TOk6UcSLN9tWnzNX5rEaDH
 9AxgaP0CF0mDZXu+WHzSzP1L3irHDEaOO0h9DyvNfDLE13PZUeGTaz5E8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14797372"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14797372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798088834"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798088834"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 15:28:02 -0800
Message-Id: <20231129232807.1499826-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] drm/xe: Add WA kunit support to MTL/LNL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Previously we didn't have support to test the WA tables for MTL and LNL
since they use GMD_ID to connect the graphics and media descriptions.
Add some infrastructure to add that support by stubbing peek_gmdid().
Now the test provides its own version of that function, which allows the
versions and steppings to come from the test table.

First patch is a the series from Michał Winiarski
(https://patchwork.freedesktop.org/series/127083/) squashed into a
single patch as I expect that to land first.

Lucas De Marchi (4):
  drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
  drm/xe/kunit: Move fake pci data to test-priv
  drm/xe/kunit: Add stub to read_gmdid
  drm/xe/kunit: Test WAs for MTL and LNL

Michał Winiarski (1):
  20231129214509.1174116-1-michal.winiarski@intel.com

 drivers/gpu/drm/xe/tests/xe_pci.c             |  38 +++--
 drivers/gpu/drm/xe/tests/xe_pci_test.h        |  23 ++--
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   4 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c         |  32 ++++-
 drivers/gpu/drm/xe/xe_device.c                |  72 ++++++++--
 drivers/gpu/drm/xe/xe_device.h                |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  20 ++-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   2 -
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                   |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |  58 ++------
 drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
 drivers/gpu/drm/xe/xe_pci.c                   | 130 +++++++++++-------
 drivers/gpu/drm/xe/xe_step.h                  |   2 +
 drivers/gpu/drm/xe/xe_tile.c                  |  36 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +-
 17 files changed, 283 insertions(+), 152 deletions(-)

-- 
2.40.1

