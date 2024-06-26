Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885CAC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC2310E1CC;
	Wed, 26 Jun 2024 21:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPXLIj7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E234210E268
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436510; x=1750972510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NDZCkjdZBO6P14868SzdmHUZsTZ7GXZVKCERl/iC3Lk=;
 b=fPXLIj7grtweHugD6r+996oGZoya4bypv6AHniUSUPhFuqp/Ly6nQSl5
 RtpXt9cgCCzrkogXbQt6pY8YqeDlT9Q7a4Sc6y7nU4nvsnK5uYh78SJXo
 ngp+1AF0FTu261vgPu4x+pkp0CQySEzZ86lY6WRTz8C6QEDnaVjJd+DhG
 f9ey9Hi6xTm5/3SYd2G0la1M3w47AuQm4YR3v4mFrSE9qVa6hflGT84aF
 5TWbTaideapSOeRCBQA+8nK/rOBKl9cpQQhEnMy//9heGtOE5Eclio+57
 Ei+hb3fL068w4nWRXBJvahK7K9bYY/u3lFHFuB/SSYH5A0IYCCgp9faN2 w==;
X-CSE-ConnectionGUID: 7vtPQ2R8SmCHYi1KInHt1Q==
X-CSE-MsgGUID: z1OZJOLcSCSN6Wz2UNTBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16278561"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16278561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:09 -0700
X-CSE-ConnectionGUID: rzF1AaWISLW4Z4mc2X2wvw==
X-CSE-MsgGUID: zgaotwueSMCkN1cLnYYNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="49056198"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 0/7] Convert multiple bind ops to 1 job
Date: Wed, 26 Jun 2024 14:15:39 -0700
Message-Id: <20240626211546.4099339-1-matthew.brost@intel.com>
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

Continuation of merging parts of [1]. Patch #2 in this series is quite
large but unsure how to split the patch without breaking functionality.

Tested with [2].

v2:
 - Rebase
 - Add error injection patch
 - Fix dma-fence reservation for binds
v3:
 - Rebase
 - Error injection patch omitted in this rev
v4:
 - Rebase
 - Fix tlb invalidation (Paulo)
 - Add missing last fence dep / test to inspection (Inspection)
 - Add error injection patch back in 
v5:
 - Address Matthew Auld's feedback
v6:
 - Fix CI failure (Matthew Auld, CI)
 - Fix checkpatch issues
 - Return -ENOBUFS in Xe layer rather than DRM SA layer to avoid warns (Matthew Auld)

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (7):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Add xe_exec_queue_last_fence_test_dep
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling
  drm/xe: Add VM bind IOCTL error injection

 drivers/gpu/drm/xe/xe_bo_types.h     |    2 +
 drivers/gpu/drm/xe/xe_device_types.h |   12 +
 drivers/gpu/drm/xe/xe_exec_queue.c   |   23 +
 drivers/gpu/drm/xe/xe_exec_queue.h   |    2 +
 drivers/gpu/drm/xe/xe_migrate.c      |  312 +++----
 drivers/gpu/drm/xe/xe_migrate.h      |   34 +-
 drivers/gpu/drm/xe/xe_pt.c           | 1279 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h           |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h     |   48 +
 drivers/gpu/drm/xe/xe_sa.c           |    7 +
 drivers/gpu/drm/xe/xe_trace_bo.h     |   10 +-
 drivers/gpu/drm/xe/xe_vm.c           |  647 +++++--------
 drivers/gpu/drm/xe/xe_vm.h           |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   55 +-
 14 files changed, 1384 insertions(+), 1063 deletions(-)

-- 
2.34.1

