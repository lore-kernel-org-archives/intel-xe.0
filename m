Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDD7C48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A13B10E008;
	Mon, 19 Feb 2024 21:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giVmHhmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAE310E008
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377337; x=1739913337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u41E6tZkly4bkyO8fukii9WaJAyaBKFtAy45JDVDNSk=;
 b=giVmHhmtk9IXkmXVZMxJb9qqRVuvNvlqf8L3ZlreaI+zT+Y80GXJhjLQ
 eGhqhYddD1cI67WH4XAIfeLL+f0w9iPiQjCEjQJivYjEwSEKntdNA4d0z
 lPiBgjLB4je14IjgkTitnvNI8x3gnyb+62ax+Xh/LFJul8LLsdVUfWAGj
 Uvl1nfepgBVRtRRFg7psa9WlhBjxpNM8GjqnxaLhGRmYknF2Qd70hQEBO
 MWsbKZnr8BA1L0BiVEsLaJf2GpFrGm35/8rumEAEhuXKJwef7AfZlsmyp
 0vZxIK1Z1v/1oJo6TjGnAdpF7IbvbtRv+6AUmGGeSZZsxZw/MQl2SvPih w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2610038"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2610038"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9218670"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:15:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/3] Skip remap fixes
Date: Mon, 19 Feb 2024 13:16:13 -0800
Message-Id: <20240219211616.3633630-1-matthew.brost@intel.com>
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

A few fixes related to skipping remaps.

Will put together an IGT showing failures too.

Matthew Brost (3):
  drm/xe: Fix xe_vma_set_pte_size
  drm/xe: Add XE_VMA_PTE_64K VMA flag
  drm/xe: Return 2MB page size for compact 64k PTEs

 drivers/gpu/drm/xe/xe_pt.c       |  6 ++++--
 drivers/gpu/drm/xe/xe_vm.c       | 12 +++++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.34.1

