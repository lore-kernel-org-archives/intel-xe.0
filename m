Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE73DC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8810E20E;
	Fri, 25 Jul 2025 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngl2uKA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44F10E20E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458033; x=1784994033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OUL6zxRUJEaVa5utGwjpYSTXV3U0oq5zrHEgRPIi4KI=;
 b=ngl2uKA9SiDcNuV2ZCkn7CHP/keCpoHk6ou4Rht8v6RTDxyPuzH+S3Gt
 r1C3nByjf2FRmiW6o6h682axpFritT/QCFTa6p9a2vgSZMZGYpnlc5Iti
 3bWdTrXjT2EUfMmWKv8hucqpKeYgU+0RSG0zFWjEM25A4VcCKv3v+BTyn
 EJtFve1l1Vz/8jm4EufKe33eX129p463OQ/lBtzTpP1Cu6NwDtBsuvZQe
 fzmxCBERmjOtqZTURqvugjcgg8+LBxJlGPVNrcB+HiTK9Sc0HE2MaLcVZ
 5Z//Z8deDdDJbOUm9izNzsW/t6A9n7ucKms7QjdsrdZudmPpy2eiUOp2p Q==;
X-CSE-ConnectionGUID: o/kwCE5gQkOy8qDAnY5wjQ==
X-CSE-MsgGUID: qmUpBVv4TJmJwouXaR6DpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879411"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:33 -0700
X-CSE-ConnectionGUID: fkIKwrKCR5uQ8XYN40MAew==
X-CSE-MsgGUID: kbftmCrESf+J9YFmB/ZdlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503658"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:32 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 0/6] Prepare GPU SVM for migration of THP
Date: Fri, 25 Jul 2025 17:39:24 +0200
Message-ID: <20250725154011.2807655-1-francois.dugast@intel.com>
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

v2: Rebase, address feedback provided by Matthew Brost

Francois Dugast (6):
  drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
  drm/pagemap: Use struct drm_pagemap_addr in mapping and copy functions
  drm/pagemap: DMA map folios when possible
  drm/pagemap: Allocate folios when possible
  drm/xe/migrate: Populate struct drm_pagemap_addr array
  drm/xe/svm: Migrate folios when possible

 drivers/gpu/drm/drm_gpusvm.c       |   4 +-
 drivers/gpu/drm/drm_pagemap.c      | 120 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_bo.c         |   2 +
 drivers/gpu/drm/xe/xe_migrate.c    |  86 ++++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.h    |   5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h |  10 +--
 drivers/gpu/drm/xe/xe_svm.c        |  46 ++++++-----
 drivers/gpu/drm/xe/xe_svm.h        |   4 +-
 include/drm/drm_gpusvm.h           |   4 +-
 include/drm/drm_pagemap.h          |  50 ++++++------
 10 files changed, 206 insertions(+), 125 deletions(-)

-- 
2.43.0

