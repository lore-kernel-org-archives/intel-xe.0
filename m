Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C7606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bB9QQbcS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8557B10E0BD;
	Fri,  6 Nov 2026 18:59:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E40B10E0BD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793991551; x=1825527551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVXdqP1dupb+u7XMIiV7Gqljvm7DMFcn/e4C1jNQYrk=;
 b=bB9QQbcSXHTxn6JwxXGMyip6UMDYwogIr/t84vo/yMGlZBHtCAwR2g+e
 WF7NtwfKvLEb6EsNYjBsqRUvGx3jJ61FfoCwfu24zffubvmKVqZTcCQ3L
 QWl8gzFaWJfxL8t13FZLnx/8s8QnBOUUb0PrPeQ6+wAyvvMNUem/vgdXx
 7lx/Gf/eA9guaAcxyezg2Rt42c6qFcyj30+HxBHNBIQx+plYc3UeAkRZa
 OEGlZ2bxwJ4NqwDeEgLC9anF+g7VzTUujxt+QFfBVlrJhbgh9JqL6sTW/
 blTtlmiD9oS9BXhOYpAaDyxS5bdRqFUQbMMzNHaUjCw1yvMoaWHdQA3dT Q==;
X-CSE-ConnectionGUID: yvjLDvzRQBy6JYN+Abobyw==
X-CSE-MsgGUID: EwTk1XOXT0CTT559bQbGvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2839854"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2839854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:10 -0800
X-CSE-ConnectionGUID: mZxle9fWQjeWyHNXnu6u0w==
X-CSE-MsgGUID: EK6wXiMmTQqhLFdBdToq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7679084"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:06 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v6 0/2] Extend CPER records with RAS info queue data
Date: Sat,  7 Nov 2026 00:29:04 +0530
Message-ID: <20261106185903.3570234-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series continues the RAS info queue support from
https://patchwork.freedesktop.org/series/169692/#rev5

Badal Nilawar (2):
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 287 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper_types.h            |  59 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 140 +++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 117 ++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 6 files changed, 591 insertions(+), 18 deletions(-)

-- 
2.56.0

