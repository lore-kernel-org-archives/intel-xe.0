Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F3CC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9B10E49F;
	Tue,  9 Jan 2024 17:28:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129DB10E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704821292; x=1736357292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f6AAH1OuS4ZoQZ8WJ2ostWSo2DA+UZvtTi+LnEOF6lk=;
 b=W42N5lfE6bNoEtBn5DI0L5icNiv0+yLPSDTrm/9me/BFjyZTSi8v5Cp/
 gqZeNReMhYWoD0viI8QYftJAtVstO0QzHLYCKljQIshm/BCr1o9Ykql1+
 +33JX9RBgHhaIXtAOQBwQ8xh4aCK7QQSa547GgxUB9nallqtO/JWnaer+
 8Hu3kdoTQiT3c5PKapDh+313/83Ql6WXoywh1NO/z1R8CPJZb956d81sl
 lCfdgLLb1GEZ2NXgL7iwNKg/kX9MPBNGQfRo77p+X4t6T2+Kn4pOvxyMw
 +RkbXWKpaMwPOddZk8yBjpyX5RdqqH/CpSEad2ar0IVyyaFW3vOS/3kXB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5624825"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5624825"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="16355299"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 0/4] Page fault logic clean ups
Date: Tue,  9 Jan 2024 09:28:34 -0800
Message-Id: <20240109172838.1376015-1-matthew.brost@intel.com>
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

Add build bug on and fix head / tail convetion for page fault and
access counter queues. No functional changes.

Matthew Brost (4):
  drm/xe: Add build on bug to assert page fault queue works
  drm/xe: Invert page fault queue head / tail
  drm/xe: Add build on bug to assert access counter queue works
  drm/xe: Invert access counter queue head / tail

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 38 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_types.h     | 25 +++++++++---------
 2 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.34.1

