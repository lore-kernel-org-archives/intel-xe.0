Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECC2106703C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 15:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA410EA42;
	Thu, 12 Mar 2026 15:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnMXsPlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F810E355;
 Thu, 12 Mar 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328663; x=1804864663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6POo/X0poV0uB8C7WHmbaQRrwR/6U8gkBRMbGSxsF4k=;
 b=MnMXsPlthfKgxb8EG0YBfDIdiFY9L9TpAeC5KKdcflVF8Loh1BaXGnpj
 YaP5GDufIN5rmWSq3JqpYpUvizugGr1/RKAoFVoVmQ60oOpgQbBLEBSbh
 tGaLEfNWu37EQnilKNOh9TbffBqhsui7GAMgSNvFbTFOO7VlVgXcipwJG
 9pqKdXMa8JaigsHE1fSh2kexrfmeicBPiN3C1inRJI4fi0qet7/Q0VAOj
 sw/y6oivfvBsXBtmY/OOzH709oj1f6Jh+btPgKaYZ7pk8KrhNAhv1cMfL
 wdMAuxdqn+6m4BobSnx2Qy01Od6LTe4HeXBhqco3WVs7/bPyxA60w4GFv g==;
X-CSE-ConnectionGUID: nx+3vLQoRdiFnFBYkV5GJQ==
X-CSE-MsgGUID: NOl43JO+SEynqQAMGekgdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74316976"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74316976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:17:42 -0700
X-CSE-ConnectionGUID: rTvKg9ZyQja91UW4J4cD+Q==
X-CSE-MsgGUID: n0MRYrVYTZKRWz0t+wEKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225830955"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:17:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/4] Enable THP support in drm_pagemap
Date: Thu, 12 Mar 2026 16:16:25 +0100
Message-ID: <20260312151726.1779566-1-francois.dugast@intel.com>
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

Use Balbir Singh's series for device-private THP support [1] and previous
preparation work in drm_pagemap [2] to add 2MB/THP support in xe. This leads
to significant performance improvements when using SVM with 2MB pages.

[1] https://lore.kernel.org/linux-mm/20251001065707.920170-1-balbirs@nvidia.com/
[2] https://patchwork.freedesktop.org/series/151754/

v2:
- rebase on top of multi-device SVM
- add drm_pagemap_cpages() with temporary patch
- address other feedback from Matt Brost on v1

v3:
The major change is to remove the dependency to the mm/huge_memory
helper migrate_device_split_page() that was called explicitely when
a 2M buddy allocation backed by a large folio would be later reused
for a smaller allocation (4K or 64K). Instead, the first 3 patches
provided by Matthew Brost ensure large folios are split at the time
of freeing.

v4:
- add order argument to folio_free callback
- send complete series to linux-mm and MM folks as requested (Zi Yan
  and Andrew Morton) and cover letter to anyone receiving at least
  one of the patches (Liam R. Howlett)

v5:
- update zone_device_page_init() in patch #1 to reinitialize large
  zone device private folios

v6:
- fix drm_pagemap change in patch #1 to allow applying to 6.19 and
  add some comments

v7:
- now that patch #1 is merged, rebase and resend for CI

v8:
- rebase on 7.0.0-rc3

Francois Dugast (3):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (1):
  drm/pagemap: Correct cpages calculation for migrate_vma_setup

 drivers/gpu/drm/drm_gpusvm.c  |   7 +-
 drivers/gpu/drm/drm_pagemap.c | 157 +++++++++++++++++++++++++++-------
 include/drm/drm_pagemap.h     |  14 +++
 3 files changed, 147 insertions(+), 31 deletions(-)

-- 
2.43.0

