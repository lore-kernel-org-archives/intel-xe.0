Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519F9C7EE33
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 15:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48F10E3CF;
	Mon, 23 Jun 2025 15:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wuek0Q10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5E10E1F3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750691876; x=1782227876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZtiC73+Sy0zkDr3HHN5VBXL1F2jwdLHN2pYywfsFZo=;
 b=Wuek0Q10gGIybwkEebb80iWtbYkrNzv4iqUq0uV/FqBVJvzqVMvB1GSc
 zyaXyQexKXCgtFH/x9TjoXNj86eTERiqbDpFNcoFbLVQ+yQm3pIZGJa4D
 52Toq271SwYcxDE+jTZ6SjHpXNyErMLCEin9gYT3++bZvRxnZNEkB5JFy
 MTKCkkxNAbcGy0v5NzyRLeJBs0RYBs3bXxihMqKUuw5iq35b3jaR9wSnH
 OvpWC9H0x0DNtYH5Mgrrf/8dqCYRvNerhdECBu8XMekUpnhrZK6h1Q2O6
 Fvi6flawiI95xnV0yCzpHroMbitEoq2j+TG+0IWNBM+77KG7JRMU3Rdtb A==;
X-CSE-ConnectionGUID: v0rER4s3TWeG/YSdilUM0w==
X-CSE-MsgGUID: LWKtIZW2QTmkLUZz85Iupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70329567"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70329567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:17:52 -0700
X-CSE-ConnectionGUID: zKsv1MAdRKKdgpsl/cgAQQ==
X-CSE-MsgGUID: p/Js4527SomE0LJMBOwLfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182669668"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:17:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v3 0/4] Implement clear VRAM on free 
Date: Mon, 23 Jun 2025 08:19:25 -0700
Message-Id: <20250623151929.2422584-1-matthew.brost@intel.com>
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

Do not use a delayed worker to destroy BO VMAs. Drop the BO argument
from xe_migrate_clear, as this function can be called with a BO that has
a zero reference count. Finally, implement VRAM clearing on free.

Avoiding a delayed worker for BO VMA destruction ensures timely
finalization of the BO during unbind, which should improve the
performance of clear-on-free. This change is therefore included in this
series.

v3:
 - Fix kunit

Matt

Matthew Brost (4):
  drm/xe: Only use delayed worker to destroy userptr VMAs
  drm/xe: Drop BO argument from xe_migrate_clear
  drm/xe: Add xe_bo_tt_has_data helper
  drm/xe: Implement clear VRAM on free

 drivers/gpu/drm/xe/tests/xe_migrate.c | 22 +++++---
 drivers/gpu/drm/xe/xe_bo.c            | 75 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h            |  2 +
 drivers/gpu/drm/xe/xe_migrate.c       | 50 +++++++++++------
 drivers/gpu/drm/xe/xe_migrate.h       |  9 ++-
 drivers/gpu/drm/xe/xe_res_cursor.h    | 26 +++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h  |  6 ++
 drivers/gpu/drm/xe/xe_vm.c            | 80 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h      | 13 ++---
 10 files changed, 213 insertions(+), 76 deletions(-)

-- 
2.34.1

