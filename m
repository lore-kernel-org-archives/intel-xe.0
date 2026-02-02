Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F189E7DEFB
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1BB10E501;
	Mon,  2 Feb 2026 16:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqYh18kH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4E110E4FD;
 Mon,  2 Feb 2026 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770048094; x=1801584094;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ecu0NDyGhnZcJjiNKDPm8HvNlyBDHj4hIJRX6KhBAU=;
 b=gqYh18kHqD5OQ+69PkeMQjDR6jJK8t/S2vEiYmyDCBVjuXTAJCKjUmGr
 02TkHd3vjXjdwb0xoHCIdX/NGqnMTOqx2kA2uxlauy7p0ta6TXPqWnLmY
 kNOuKhV68+4GB/h3Q2pOA18Ie3qpOjqc5mXiFoI/yBqNucuxCcDSQfyIx
 Utj24VPnr5ByBJNSKMChsIRDAZAY+xEZk7yKl6LD3/g46NAEdi0K4v58H
 88ToPrVEXSakXqUqtUu1m1rZGpCfgYMg2VZ0PYa1dEcKlNLyogK2CMsq+
 YI175iFifN/vYO7KVxnNhJga41SeKCnw7WJASrofvb3FcG0rjw1mQM8/r g==;
X-CSE-ConnectionGUID: y+APbXeDSgO1fdRigGnuiQ==
X-CSE-MsgGUID: /J4f0vCrTm21nfUgXg4EhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81944009"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="81944009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:01:34 -0800
X-CSE-ConnectionGUID: 4b65Zh0bRhahknUpABGImQ==
X-CSE-MsgGUID: bfrUNL82QQ2sDIK6DF5Q/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="240230919"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.182])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:01:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/4] Enable THP support in drm_pagemap
Date: Mon,  2 Feb 2026 17:00:51 +0100
Message-ID: <20260202160118.1983946-1-francois.dugast@intel.com>
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

Francois Dugast (3):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (1):
  drm/pagemap: Correct cpages calculation for migrate_vma_setup

 drivers/gpu/drm/drm_gpusvm.c  |   7 +-
 drivers/gpu/drm/drm_pagemap.c | 158 +++++++++++++++++++++++++++-------
 include/drm/drm_pagemap.h     |  14 +++
 3 files changed, 148 insertions(+), 31 deletions(-)

-- 
2.43.0

