Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2911C282D2
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 18:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DB710E102;
	Fri, 28 Feb 2025 18:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7DHilP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBD110E0EA;
 Fri, 28 Feb 2025 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740766891; x=1772302891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dahitv31if4tKW1dsResOt3QjQAmdlm1eUUPE9x1GRg=;
 b=G7DHilP/bWSj8QqqxOwDBNVOHgNgqSakC/KJOYe1wCedY7BtSTepL2ou
 IS6E8nlmrhI1BqaaYSxpSvHplL6wT/23S7s4/tCz92KCX/TCA81BC6qgR
 Mhmrv9amSD9dsdlm4af2OlOBL0HPpBrYrxz7omhr/E0hrDt+r0rQp05Qv
 ggeRAcpq3A5HHv9ziOvUNUlIMN8cwpF+YJghbWlcvom7BP3PRxeMVJCjF
 mwOXosuDtnGXPpLpRW1GPHLAgQ9OEvEoQISxu8VBIZTkxG6Fp+njzIQ9I
 njezBP/LUyqYdZOZShhADrkQL2jXihT7rZiEn2hpD7A5WOpDxe0Oa5U4+ Q==;
X-CSE-ConnectionGUID: 83wKRSl7T4CIYFEhGlKZXA==
X-CSE-MsgGUID: L50ya4CPTv2LmdOgdNWuww==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41729569"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41729569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:29 -0800
X-CSE-ConnectionGUID: FWSP0B9KSwOg/tw6NQ2yMg==
X-CSE-MsgGUID: ySmPhLkqSherJ7plOiDQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="148214509"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:22 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Fri, 28 Feb 2025 18:21:16 +0000
Message-ID: <20250228182122.77475-1-jonathan.cavitt@intel.com>
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

Add additional information to each VM so they can report up to the last
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

Additionally, add a new ioctl - xe_vm_get_property_ioctl - that allows the
user to query these pagefaults

v2: (Matt Brost)
- Break full ban list request into a separate property.
- Reformat drm_xe_vm_get_property struct.
- Remove need for drm_xe_faults helper struct.
- Separate data pointer and scalar return value in ioctl.
- Get address type on pagefault report and save it to the pagefault.
- Correctly reject writes to read-only VMAs.
- Miscellaneous formatting fixes.

v3: (Matt Brost)
- Only allow querying of failed pagefaults

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>

Jonathan Cavitt (6):
  drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_vm: Add per VM pagefault info
  drm/xe/uapi: Define drm_xe_vm_get_property
  drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  66 +++++++-------
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  29 +++++++
 drivers/gpu/drm/xe/xe_vm.c           | 124 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  20 +++++
 include/uapi/drm/xe_drm.h            |  63 ++++++++++++++
 7 files changed, 279 insertions(+), 34 deletions(-)

-- 
2.43.0

