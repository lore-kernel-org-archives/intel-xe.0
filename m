Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC7C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 00:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F70710E753;
	Thu, 11 Jul 2024 00:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqEZXayn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1332F10E0C9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 00:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720659459; x=1752195459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbRwXDTpowOp526BGcBGYM0n5s/oBfPRskFoSwouC9k=;
 b=CqEZXaynCGLlfIbpmurU8dCTdXFbIQa76AH3y2jSBNm8NWotC5vniqHm
 bYbbMuJyPNbhCLGrE1u6PorajMd+czG23OftexVcioqa+/cL5AIqwG1T0
 DHs0J+Ta7err22/3pUzyZk42CO5Ewlbylne266Y/LmeVY5StRQMNKJNrQ
 2VBfH6JV1D7zaZZ5MjscnW+eikQhx2NQbjBf2Uh0aAW5fpcwAg6e/8xOG
 ZDgtOGSMVjoVOsAzZ70pn5Na+k0B9xzQD4uTb8/3nOd26gGBZaipYRW2w
 ri28JKOA6utb6y+cSnAkKVfTR0Ls6UBpcUE87hqFJcM55Dm72GHojSE2D w==;
X-CSE-ConnectionGUID: 4cR7A+8iSjaowOrOeCiJpA==
X-CSE-MsgGUID: fFtCefDBTTe/NIktBuiGzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17720384"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17720384"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:57:39 -0700
X-CSE-ConnectionGUID: budUzSnZTwWFoz71OuSXtg==
X-CSE-MsgGUID: vaxpTKKCT4y1uFZw2yPyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48475730"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:57:38 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 06:07:22 -0700
Message-ID: <cover.1720515376.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Message-ID: <20240711130722.CIZDrZ8q4hfNohZn7jVcz12990BUdYMV8W7WmjnuG5s@z>

According to the SAS for BMG compression, we need to decompress during eviction,
and not recompress on restore. Due to this, we need to introduce encoding pat_index
in case of vram too. This patch explores the solution of setting up an additional
identity map for the vram, this time at the end of previous mapping offset and
with compressed pat_index. 
We then select the appropriate mapping during eviction/restore/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 449 insertions(+), 18 deletions(-)

-- 
2.34.1

