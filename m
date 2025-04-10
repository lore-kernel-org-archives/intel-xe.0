Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E475C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 04:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D928A10E0DD;
	Thu, 10 Apr 2025 04:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ6wmB6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A3410E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 04:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744257907; x=1775793907;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h2ccD/cLYGa0SvYBHv5iq3Bq17qINVy7XPLtx2m561k=;
 b=AQ6wmB6rjr81qWpwkmFGuDJKh1MYLcKhelk+dis0m5gpWm45OTo4lh4H
 jX6rtLPrrWWaMj5vpjFou2etKbud9LQscCTbrIhbWElLq3oQhHimh/1oE
 tYD7BsX8G6f7Ibq5zJUgYbmoUaQDsj0dy5A4qyLkI1k7U1gu7eJ7nknqy
 P3+ZyEphJLmfMJs3rfSz73JjVAM7wjRE9QG4OOZd5ZfdexiB7SuTuofAE
 yEvgDH+6FmfvpINiMSLOa1Qj8RoMcSnG6kgI8WxhxkGMJy0YwOQ5a9fjn
 TzUqhkQehMsWzLI/34b/tSBL+yTr4pj8e2BYUQAVu97Fny+57cv1rF2C2 w==;
X-CSE-ConnectionGUID: wUfAkqX/RwyYZZF4TPEhAA==
X-CSE-MsgGUID: h/DX98zOSqueE11Taaf3aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44999849"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44999849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
X-CSE-ConnectionGUID: +tF9M2XMTdywZOw/FVoNTA==
X-CSE-MsgGUID: n4OFwGnYT1yTR0SUCaLLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133642759"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/4] Large devcoredump file support
Date: Wed,  9 Apr 2025 21:06:18 -0700
Message-Id: <20250410040622.238389-1-matthew.brost@intel.com>
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

Devcoredump were truncated at 2G, remove this restriction. While here,
add support for GPU copies of BOs to increase devcoredump speed.

v2:
 - Fix build error
 - Abort printing once printer if full
v3:
 - Actually fix build error
 - Address a few nits from Jonathan

Matthew Brost (4):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/print: Add drm_printer_is_full
  drm/xe: Abort printing coredump in VM printer output if full

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c           | 218 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   3 +
 include/drm/drm_print.h                   |  17 ++
 8 files changed, 288 insertions(+), 32 deletions(-)

-- 
2.34.1

