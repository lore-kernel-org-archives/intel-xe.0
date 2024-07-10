Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059FAC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3B410E63A;
	Tue,  9 Jul 2024 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXnExHR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B510E63A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720554247; x=1752090247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbRwXDTpowOp526BGcBGYM0n5s/oBfPRskFoSwouC9k=;
 b=EXnExHR1EercNVwzXulPrp7MtPFC7rR/5F5dHKfpy4J90b0SUr8dMr6R
 xRDb4hExUL04r52FKe+xrWXFM05ZIObCECf/KHEhcMGI8kgtXQ6QfW5YA
 RVgzfJFOBPza+JqMPu+gl5WFKCZRrS7a1arMGN5bSAIoOTj1W188mIOhU
 Biq3tjzdSBTP5a8dpuLG9sH5sIWGyxXOFuec+7+TuwCPE/NP2Tmg1l0oE
 Ds51L5ioo3sGuD5q+VBoxlVB4SkKEcC4RtXN5X1RfAr1HLW6GN2vOGsbB
 8UGMQT+sgqJRa9ZhfUdzGwDcjYey2Roy2XUO8PzsbRnGtWNZ0RCKcrkJY g==;
X-CSE-ConnectionGUID: 20PRimZsTHqmDRXBCMhUSw==
X-CSE-MsgGUID: 7TxvOq71T9W3VH7tqLNhPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17469518"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17469518"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:44:06 -0700
X-CSE-ConnectionGUID: rDbsGxoKSCiAWFZEqrz1rw==
X-CSE-MsgGUID: 5foD7NMCTFqv/aYFX36OUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52562212"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:44:06 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, lucas.demarchi@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Wed, 10 Jul 2024 00:53:44 -0700
Message-Id: <cover.1720515376.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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

According to the SAS for BMG compression, we need to decompress during eviction,
and not recompress on restore. Due to this, we need to introduce encoding pat_index
in case of vram too. This patch explores the solution of setting up an additional
identity map for the vram, this time at the end of previous mapping offset and
with compressed pat_index. 
We then select the appropriate mapping during eviction/restore/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 449 insertions(+), 18 deletions(-)

-- 
2.34.1

