Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226AAC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D802D10E2E2;
	Thu, 17 Jul 2025 13:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHIVZ3AN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCFC10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759606; x=1784295606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6y4Z8TIxfjZwGRf4A8QgEvz7RX4FC7EJuWZ4sa32CUs=;
 b=kHIVZ3ANXAfs1rf5twgQmONDQCsT8imhhYkWCbw1ZpVA433tC3zbVCzT
 fuxB+4wWadOtCtFX6R+x1fr9wITN7nHACWYvfJNoD8soCuN+0Ew6UMzG9
 2HTjx61kt7hwL5fXCPrYtLM3Wq2ULWxnia+cZby4TCqaYzjoCCXV66Dr2
 nSK4UOpiwsiQMieIne1f+bzYFjxBZY7leTnAEMGsv1LKdFToNw0R+Z46P
 hW+DehOaacq915uFDPp+NxjRDqauNgsnMqsFyemUjxJFi9NWRrnck9Q9E
 c7T0ax4hZZEJNQkr54J4ZSNUrE60mWiScQjl61I4B4vpcOzJfoGYKHbmv g==;
X-CSE-ConnectionGUID: I0MnZ2nwTQyr7kT/8NIjZQ==
X-CSE-MsgGUID: g7YdI/ISRKu/pM8wMfLUbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251720"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:05 -0700
X-CSE-ConnectionGUID: 6n4X/2QXQ2SaF4gvUKNetg==
X-CSE-MsgGUID: IikJhYwQSQKLPrxlvYhWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328385"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:04 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 0/5] Prepare GPU SVM for migration of THP
Date: Thu, 17 Jul 2025 15:38:22 +0200
Message-ID: <20250717133928.526111-1-francois.dugast@intel.com>
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

This series adds support to handle folios in GPU SVM in preparation of
THP migration of zone device pages. Major performance improvements are
expected due to skipping multiple loops that call APIs for DMA mapping,
page allocation, copy, etc. If 2MB folios are used instead of 4KB pages
some operations might be reduced by a factor of 512.

However, this cannot be exercised yet as the folio order will remain 0
until the migration code is available. This is being developed in a
separate series [1]. Once merged, a few more changes will be required
in GPU SVM to make use of it.

[1] https://lore.kernel.org/linux-mm/20250703233511.2028395-1-balbirs@nvidia.com

Francois Dugast (5):
  drm/pagemap: Use struct drm_pagemap_device_addr in mapping and copy
    functions
  drm/xe/svm: Use struct drm_pagemap_device_addr
  drm/pagemap: DMA map folios when possible
  drm/xe/migrate: Use order to calculate migration length
  drm/pagemap: Allocate folios when possible

 drivers/gpu/drm/drm_pagemap.c   | 115 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_migrate.c |  69 +++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.h |   5 +-
 drivers/gpu/drm/xe/xe_svm.c     |  37 +++++-----
 include/drm/drm_pagemap.h       |   8 +--
 5 files changed, 140 insertions(+), 94 deletions(-)

-- 
2.43.0

