Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26DBFEFB4F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6389310EB70;
	Fri, 27 Feb 2026 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ze4MkyWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19ED10EB65
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199922; x=1803735922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d7tPocR7rBLu2HymRaDBm+9KcBspltaTjZdVGurQLYA=;
 b=Ze4MkyWdo2Q6KKGVbOfK2Uo5vleUPPanddHAToItT/iSoo+JWD1lixL/
 EKs+Xm7yXf5P+iVgRArNK5A0vKggscfyOpmP2W4oXbjLteMhNaYGAQ1yf
 yFnSJsueEkyro/gEo1uE3lV9kkQtPFGi9xJmqKJO883AFwHVa6ONLpyCg
 fpR6G+oGgZocTYr1+9CTYxn2SM355j1pqYcTx0MOnmjMTG9oN7lML70Bf
 vMygJKPRQYOuBJN7V0adDYqaMeMB9QfGO1ol/ldfgo/OTHGWloiS8UndT
 bn3qO2aBOqBXz8ujBS0bv8QAylARAPR2QlbwsQNKTruuhdGl3ChjBuza1 A==;
X-CSE-ConnectionGUID: uFAq3MqsS/6jXh4XAeEUyg==
X-CSE-MsgGUID: BwB2Bn/2QUa0R0W3BmRqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633178"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633178"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:22 -0800
X-CSE-ConnectionGUID: O3BjByxSRXKGh/97udrkKg==
X-CSE-MsgGUID: I5ligDUtRC2L3sh68/6pow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021706"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:21 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 0/7] Add memory page offlining support
Date: Fri, 27 Feb 2026 19:14:37 +0530
Message-ID: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

This functionality represents a significant step in making
the xe driver gracefully handle hardware memory degradation.
By integrating with the DRM Buddy allocator, the driver
can permanently "carve out" faulty memory so it isn't reused
by subsequent allocations.

This series adds memory page offlining support with following:
1. drm/xe/svm: Use xe_vram_addr_to_region, avoid block->private usage
2. Link and track ttm BO's with physical addresses
3. Handle the generated physical address error by reserving addresses 4K page
4. Adds supporting debugfs to inject manual physcal address error
5. Add buddy block allocation dump for debuggin buddy related issues
6. Sysfs entry to provide statistics of bad gpu vram pages for user info
7. Add configfs for vram bad page reservation policy


Opens:
1. in case of faulty address in critical bo, wedge or go for reset via system controller, in
discussion

V4: API reworks, add configfs for policy reservation and apply config everywhere
V3: use res_to_mem_region to avoid use of block->private (MattA)
V2:
- some fixes and clean up on errors
- Added xe_vram_addr_to_region helper to avoid other use of block->private (MattB)


Tejas Upadhyay (7):
  drm/xe/svm: Use res_to_mem_region
  drm/xe: Implement VRAM object tracking ability using physical address
  drm/xe: Handle physical memory address error
  [DO_NOT_REVIEW]]drm/xe/cri: Add debugfs to inject faulty vram address
  drm/buddy: Add routine to dump allocated buddy blocks
  drm/xe/cri: Add sysfs interface for bad gpu vram pages
  drm/xe/configfs: Add vram bad page reservation policy

 drivers/gpu/drm/drm_buddy.c                |  43 +++
 drivers/gpu/drm/xe/xe_bo.c                 |  18 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   1 +
 drivers/gpu/drm/xe/xe_configfs.c           |  64 +++-
 drivers/gpu/drm/xe/xe_configfs.h           |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  49 +++
 drivers/gpu/drm/xe/xe_device.c             |  41 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
 drivers/gpu/drm/xe/xe_svm.c                |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 363 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  25 ++
 12 files changed, 611 insertions(+), 15 deletions(-)

-- 
2.52.0

