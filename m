Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CAD597AF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2BA10E670;
	Tue, 12 Nov 2024 22:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXoA4mX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DA710E670
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448857; x=1762984857;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/znJFvZanMN/ezfZLGiEAb7/ju05AIK7jPpF2aB7SE=;
 b=dXoA4mX119mvrsEBYmq6v5SGrB1qvM1G65ZJVi4cyOuBcXalZFinA0yl
 MIBzV6xsa+GRAIczuqRvjVsGreFu2GNRQ4h3+dlhV/EsJYw9DX5w3Ogus
 tEGmAwcdIbWJf7fBrHJ+IZl2QMB2SeG9cYrs8fF4Iu+zLRZK/KCNsqC1v
 fnBaThglfhz8IEulZJOAi0QbwDTpSFbwuWRf880WJbsv+2xqyvfStlXFj
 DBqFSTBcCXshBxA5WIvuALc+I6/tFMRJVdYsYF5Bv8eNcWn63ETTPD0xa
 Ue3pc6En5ATI0iDnPQkgYxlVEPmchFdL84c61YtD5bkZ+hObUFYxt6YqW g==;
X-CSE-ConnectionGUID: c7zDMK+gQdmHZfsJrOkYGA==
X-CSE-MsgGUID: jVCNTgesTeuJsy2yUQjRxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403992"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:56 -0800
X-CSE-ConnectionGUID: vsm7h7M2QHKaA/NYLvvy0g==
X-CSE-MsgGUID: wwYLyFB6QkmNjmZPrNkurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605695"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/7] Devcoredump Improvements
Date: Tue, 12 Nov 2024 14:01:20 -0800
Message-Id: <20241112220127.1369527-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Mainly enabling devcoredump for LR queues. Missing is engine capture
from Zhanjun worked on to find one manually or from the GuC. Can be done
in a follow up.

v3:
 - Send correct code

Matt

Matthew Brost (7):
  drm/xe: Add xe_ring_lrc_is_idle() helper
  drm/xe: Add ring address to LRC snapshot
  drm/xe: Add ring start to LRC snapshot
  drm/xe: Improve schedule disable response failure
  drm/xe: Add exec queue param to devcoredump
  drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
  drm/xe: Wire devcoredump to LR TDR

 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h       |  6 +++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 --
 drivers/gpu/drm/xe/xe_guc_capture.c       | 29 ++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_capture.h       |  6 ++---
 drivers/gpu/drm/xe/xe_guc_submit.c        | 19 ++++++++++-----
 drivers/gpu/drm/xe/xe_hw_engine.c         |  8 +++----
 drivers/gpu/drm/xe/xe_hw_engine.h         |  4 ++--
 drivers/gpu/drm/xe/xe_lrc.c               | 26 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h               |  4 ++++
 10 files changed, 76 insertions(+), 44 deletions(-)

-- 
2.34.1

