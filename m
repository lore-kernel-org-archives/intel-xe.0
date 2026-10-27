Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C2606A323
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaT+erjc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1B610F79E;
	Tue, 27 Oct 2026 18:36:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE73F10F798
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793126204; x=1824662204;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=coUA17bYw1cCmDRgXuDDFL6U1ebZSQrYurjkgXJY2+Q=;
 b=WaT+erjcJq4bEgWJHrM8IIv6pqs94q08v+MMfjKFuHsnp+aZ2K18nECK
 XvotKOJDYOOLIhhfsTsgDBEXVYaxUT8w76GkG+qeuWvjYbBvo65cz9T2Z
 TjzE3vQrhHzWQ7F4/v6jgvQxxR0WrKmYnsmsm49eleXMXkeibSX3EtIW7
 tueEwwdgRjX615rwXFDLBYJnygCFDAy0KjTnL0ZxzBHfNVP1Po9CMA+5U
 V0a2edW61dXoLn6gCPyNNmU3u9UyFdHLJERz52U9O0gxtSpAixZ1LMTtI
 dDMIdwh1Ie7AZsfXk4reKY4TWSMkCPjD8AYW2qHaoIfTv1uccW/vQvesT g==;
X-CSE-ConnectionGUID: +kvDnJ20RLCQi44ifSp2Cw==
X-CSE-MsgGUID: bEsqk3aDRA2r9S8/bWaqsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1725992"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1725992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
X-CSE-ConnectionGUID: eC6m7Xl7S+yX8cxXMoq8Wg==
X-CSE-MsgGUID: s7L7kEVFT8+IQVt7zpioHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579010"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/5] Add a minimum age gate to the shrinker + LRU fixes
Date: Tue, 27 Oct 2026 11:36:33 -0700
Message-Id: <20261027183638.1031299-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix misuse of the TTM LRU in Xe + add a minimum age gate to the shrinker
which is hidden behind a Kconfig for shrinker tuning.

Matt  

Matthew Brost (5):
  drm/xe: Bump the LRU of every BO an exec touches
  drm/xe: Bump the LRU on a successful page fault
  drm/xe: Leave the VM bulk move on BO release, not on GEM close
  drm/ttm: Allow skipping to the next priority in the bo LRU cursor
  drm/xe: Add a minimum age gate to the shrinker

 drivers/gpu/drm/ttm/ttm_bo_util.c    |   3 +
 drivers/gpu/drm/ttm/ttm_resource.c   |  35 +++++-
 drivers/gpu/drm/xe/Kconfig.profile   |  15 +++
 drivers/gpu/drm/xe/xe_bo.c           | 106 ++++++++++++++---
 drivers/gpu/drm/xe/xe_bo.h           |   5 +
 drivers/gpu/drm/xe/xe_bo_types.h     |   8 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c |  35 ++++++
 drivers/gpu/drm/xe/xe_pagefault.c    |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 164 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_shrinker.h     |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |  19 +++-
 drivers/gpu/drm/xe/xe_vm_types.h     |   8 ++
 include/drm/ttm/ttm_bo.h             |  19 ++++
 include/drm/ttm/ttm_resource.h       |   2 +
 14 files changed, 390 insertions(+), 34 deletions(-)

-- 
2.34.1

