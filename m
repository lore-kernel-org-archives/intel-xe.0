Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C40C369D1
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E25410E24A;
	Wed, 23 Apr 2025 17:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp9ofVer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5D10E21B
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745428572; x=1776964572;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6vA7Lo/ScmOV0WLyFbWWbEfTORRAjq4fNv16WKnkryM=;
 b=gp9ofVerj+LYVYGv3gOZyFV9PRg8/g9tHcKXAH9Dvjx/CvUAL2M1OOng
 qi62hpYtsDDehntL0mvtVOjvU3Sda3NJtKLXFgMbIEjFU1Byz+lZEXZYk
 QPDPFDZTFdFVOAhHJemG2Y/KqKMUCq2yl2dp5+SixsfwMghbkd5/ifMtU
 ANU4s3EIX83/jzPBXCebhyylsuAzE+Z3ZSEOoYEBG9HAZcOmT62NvUodL
 dww5f4Od+3K1sEh93/EyCriGq/RaJY8L70ByUkz/TbyV/fW1TIQhhSUpQ
 QWHrMdy/yYA8Z5X1w6tFGLrH8H2XXF5mDXctpdH9IMONvK89t9+Imh1Xv Q==;
X-CSE-ConnectionGUID: gR+UcfcFT6CsyK1nR5IycQ==
X-CSE-MsgGUID: LGFj3wAdRD2oVukycg/wMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57228671"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57228671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:11 -0700
X-CSE-ConnectionGUID: 4e8YQCanSQuAJiN6crz4AA==
X-CSE-MsgGUID: QZC7jawHSBWpr7NB9iJoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137459375"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/4] Large devcoredump file support
Date: Wed, 23 Apr 2025 10:17:21 -0700
Message-Id: <20250423171725.597955-1-matthew.brost@intel.com>
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
v6:
 - Drop GFP_ATOMIC in hwconfig (John H)

Matthew Brost (4):
  drm/xe: Add devcoredump chunking
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/print: Add drm_coredump_printer_is_full
  drm/xe: Abort printing coredump in VM printer output if full

 drivers/gpu/drm/xe/xe_bo.c                |  15 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |  59 ++++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_migrate.c           | 218 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h           |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   3 +
 include/drm/drm_print.h                   |  20 ++
 7 files changed, 290 insertions(+), 31 deletions(-)

-- 
2.34.1

