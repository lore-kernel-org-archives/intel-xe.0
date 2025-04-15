Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99641C369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 18:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4497210E367;
	Tue, 15 Apr 2025 18:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlutH7K5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4221010E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 18:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744742280; x=1776278280;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gdqFc04AI+O0zQFhf96ofGK7k2/X7LbYh1mxmCY/9AY=;
 b=IlutH7K5tb3Mq2qKicA4qcxdQ5n4cY0/lJ89f/ZfbTdj2qSenz+wrMo+
 4H2cyf93p0OKKHR46ko5EHuE7gzqPN2g4xbq0dFU76lF3QUgO1J5rCTMD
 3wOrOMriGkMEsbwXXLvr3QzkBMo96S6tNqZgrFFYo5P8bsErwIQbyPpj+
 JGx64hP7nZ5bez7UxnZvRV/z29IVoWyykelFAYIPKg3xapj8jCCjiaCpV
 PGVIB/7ESIt50HTG3OyEvakVytrcvZ1wXbIjfeJtCQR+MhMCFYtMTGIjG
 pXCgIUwJzXRB6f/nZwcRTkTugjq7lC2zlDuSuhaSGwnO8jzedPBfYw65/ g==;
X-CSE-ConnectionGUID: xVtTV2naRCiPkmomlbpZzw==
X-CSE-MsgGUID: pJ5/vpjtSYiEhk3Ehmz5ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71662258"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="71662258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 11:38:00 -0700
X-CSE-ConnectionGUID: wtVkXdFIRIeV4XAuLdKbbQ==
X-CSE-MsgGUID: aBjcFnS2Szy9f9DFQaJMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161234046"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 11:37:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/4] Large devcoredump file support
Date: Tue, 15 Apr 2025 11:39:12 -0700
Message-Id: <20250415183916.332202-1-matthew.brost@intel.com>
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
v4:
 - s/drm_printer_is_full/drm_coredump_printer_is_full (Jani)
v5:
 - Bail in drm_coredump_printer_is_full if not coredump printer (Michal)

Matthew Brost (4):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/print: Add drm_coredump_printer_is_full
  drm/xe: Abort printing coredump in VM printer output if full

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c           | 218 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   3 +
 include/drm/drm_print.h                   |  20 ++
 8 files changed, 291 insertions(+), 32 deletions(-)

-- 
2.34.1

