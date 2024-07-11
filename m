Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81807C3DA42
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 00:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423610E88F;
	Thu, 11 Jul 2024 00:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/517PI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A7410E741
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720657995; x=1752193995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbRwXDTpowOp526BGcBGYM0n5s/oBfPRskFoSwouC9k=;
 b=T/517PI4bjmV9HxncN/QhIcyLcMwews1l7jyob+UIjH1kaBuS6r2Xjzn
 9ieJFVP9yUdaUoEGtZoY74Vcui6m0TUmqs5l32ZpJTA2fQC3OfuSGuc+H
 iYrIRk1sJ0XxDOiWZY3YnBWU4QiUdboSHw+n0gXZ6dFDGhTpVg4dtNT2A
 spNO5vZ8nc1H3Gjkk+2tSvx1jEgDgN6RXJZgSm2Hb5P2f0iOoFcfi1Ab/
 uhhjyHOnnt1la0yHfYhpSdzIiTd6bZhdO0DyZUYvqY/7L5uwKK06zu7Pp
 Up5EmA04Fm1OZz2saDJdO1uQK/I0019621UsIF7c1vSL8FHTaKHMH/EEF w==;
X-CSE-ConnectionGUID: jPPmSQCPSFWDxwktwbB8wg==
X-CSE-MsgGUID: Ocw8jaiLRDmE537EWWI2UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17884750"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17884750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:33:15 -0700
X-CSE-ConnectionGUID: z5leENfMSKyI+oecY8VQkA==
X-CSE-MsgGUID: AvbgEGa9S9O6vfuUnmIhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="71603844"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:33:14 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 05:42:58 -0700
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
Message-ID: <20240711124258.hgzuqdXPkWMuZ9bpI8iJfJKHbO4Um6lY5Ee-eV2VYNQ@z>

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

