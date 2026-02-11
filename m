Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C70FEB5965
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 05:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33D10E009;
	Wed, 11 Feb 2026 05:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kv0zVI9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96810E009
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 05:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770786166; x=1802322166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hYZ8tvH35Q/IO7H6Y3Se0zsKaLReMWLP+EtbtbiSlSQ=;
 b=kv0zVI9HM9qUpGdh8Zk6N/EQDgrM+ocSbgB3ZpUCqacwJYCGSaJh7Xtz
 IcH/NrUjVZVwhuCir6nIbBV1pOMKulxv/1UiUYuE31bDvQIffu9YRcWOp
 e4i4pcGMTl6rpWVPFxE1S9toFdy0hiiDngPt722leD5ExovNeBFkn68wW
 7qm7+3pR8N8MrQwO1LZ7DmBB1tPwLBqc4tjPdvrRBzjmDRiMHta5/9Dux
 Fb2mFepWsbWXbevRfP2YG5Dg42j4pPBOlto92/rPB82BYVnJUdnVud1Gx
 3pKaAiex4R/LlJpmuszNm9sowaZTe+hD+LVdxjnM2STD00kUG3i/Y9+bm A==;
X-CSE-ConnectionGUID: XtJ8/N8tS+um536APjzr+Q==
X-CSE-MsgGUID: YzWgswMLRi6Uz2WXgOWteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72113157"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72113157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:02:45 -0800
X-CSE-ConnectionGUID: zgTbKXCSRvSJgAQ8ddQraA==
X-CSE-MsgGUID: nGY818CNRrSJne27BaJL9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216302493"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:02:44 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 0/5] Add memory page offlining support
Date: Wed, 11 Feb 2026 10:31:33 +0530
Message-ID: <20260211050132.1332599-7-tejas.upadhyay@intel.com>
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
1. Link and track ttm BO's with physical addresses
2. Handle the generated physical address error by reserving addresses 4K page
3. Adds supporting debugfs to inject manual physcal address error
4. Add buddy block allocation dump for debuggin buddy related issues
5. Sysfs entry to provide statistics of bad gpu vram pages for user info

Opens:
1. mm->avail under drm_buddy throwing WARN_ON(mm->avail != mm->size) with no leaks 
in memory, mutliple bind/ubind works fine. Debug in progress.
2. dump_allocated_blocks() and xe_ttm_vram_addr_to_tbo() API will move under drm_buddy, 
right now just to showcase concept its part of xe code

Tejas Upadhyay (5):
  drm/xe: Implement VRAM object tracking ability using physical address
  drm/xe: Handle physical memory address error
  [DO_NOT_REVIEW]drm/xe/cri: Add debugfs to inject faulty vram address
  drm/xe: Add routine to dump allocated VRAM blocks
  [DO NOT REVIEW]drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/drm/xe/xe_debugfs.c            |  49 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c         |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 366 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  23 ++
 6 files changed, 446 insertions(+), 1 deletion(-)

-- 
2.52.0

