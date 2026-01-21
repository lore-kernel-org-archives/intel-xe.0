Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F902C44526
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9B710E77F;
	Wed, 21 Jan 2026 13:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBD3LKuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874C10E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769000577; x=1800536577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06HnCxUF8RH/TuxV13Wuyjw9IUeyczz66ygRpiulYHU=;
 b=VBD3LKuPH81eZyrDVm+1bm3U5Qxax6fk/+r6wNsQLheTCHhTXdudSbkl
 7yPmlUxtD+ot/EW4po7pN+j84sgqSCwtxPzyCXJPsGs5fRqSkiRxyzk+E
 53bucue/4IBziF+4u5z40z5dfLPDrZ/nVeqe7Py6ov3gNnDVVOuTyQPvy
 is4tIZ4tJTfG97zok97kRTqKppTHGp4HhP6fR3hYGjDWSihx0oKCWqxjo
 JfJs0usm7rShu24RXWtTKn9r/PScnBOWYcdXi0FsDw0KqOr1e1PzxJJEt
 mzwqNt02iWIFDvdF4R5x0jvcxXNekBEwYg8wyF9+TFFQZtMnLmyHutyFG Q==;
X-CSE-ConnectionGUID: ONa7bhkeQZCvKK9xQyascA==
X-CSE-MsgGUID: xUB2ZsBsREqhw5jgj50UYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80944494"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="80944494"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:02:56 -0800
X-CSE-ConnectionGUID: FR01gN1ETx6CctIuUQyAPA==
X-CSE-MsgGUID: yK/R4wqkSRKeSwj3gquUog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211452180"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 05:02:53 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: iommu@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>,
 Calvin Owens <calvin@wbinvd.org>, David Woodhouse <dwmw2@infradead.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Samiullah Khawaja <skhawaja@google.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tina Zhang <tina.zhang@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: Xe performance regression with recent IOMMU changes
Date: Wed, 21 Jan 2026 14:02:16 +0100
Message-ID: <20260121130233.257428-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

I am reporting a slowdown in Xe caused by a couple of IOMMU changes. It
can be observed during DMA mappings/unmappings required to issue copies
between system memory and the device, when handling GPU faults. Not sure
how other use cases or vendors are affected but below is the impact on
execution times for BMG:

Before changes:
  4KB
    drm_pagemap_migrate_map_pages: 0.4 us
    drm_pagemap_migrate_unmap_pages: 0.4 us
  64KB
    drm_pagemap_migrate_map_pages: 2.5 us
    drm_pagemap_migrate_unmap_pages: 3.5 us
  2MB
    drm_pagemap_migrate_map_pages: 88 us
    drm_pagemap_migrate_unmap_pages: 108 us

After changes:
  4KB
    drm_pagemap_migrate_map_pages: 0.7 us
    drm_pagemap_migrate_unmap_pages: 0.7 us
  64KB
    drm_pagemap_migrate_map_pages: 3.5 us
    drm_pagemap_migrate_unmap_pages: 10.5 us
  2MB
    drm_pagemap_migrate_map_pages: 102 us
    drm_pagemap_migrate_unmap_pages: 330 us

Bisecting points to these commits:
  d373449d8e97 iommu/vt-d: Use the generic iommu page table
  d856f9d27885 iommupt/vtd: Allow VT-d to have a larger table top than the vasz requires

Simply reverting them brings back performance.

Any idea about why and how to fix it?

Thanks,
Francois

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joerg Roedel <joerg.roedel@amd.com>
Cc: Calvin Owens <calvin@wbinvd.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Samiullah Khawaja <skhawaja@google.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>

-- 
2.43.0

