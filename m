Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF35EC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A9B10E2AE;
	Wed, 29 May 2024 18:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwi+TFus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256310E2AE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717007479; x=1748543479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8fsr5sIcIneKRnuDqVtYxRzQtKPwgtsCgVfHLogPqo=;
 b=nwi+TFusxbkelP/243DkQ6hv5Ucv2Kvf0ybyBQ/XVw4cBpOvQpHGvadf
 Bbzu+Cq53uP82nYkhwrAv9GRcvfjSQ/9HuwZCFf7hCQPwi77nDQqUB1I1
 92926Svfc/DTd77ONrme8h9dPk8NCjCeCy5t/2xZ7DOwVy4y1Na5jpiJR
 QQtSuxV1QTQXB7Zh8wqBnts9QYfX3BE5/ofqyMTWzyOEFKBYdk47bfhUo
 C35J5FrQeXiG8nTXgltZUCoYzq1JcDgU5K88meGcq41tkXMZh4ieJgwTD
 MZrZG/SYeDqQPYzrflZf0AeWmOvpApvVAuAiG9d9zvQGxj613kmGtj9N1 g==;
X-CSE-ConnectionGUID: sGgPZYEWQYawByVYT4aK6Q==
X-CSE-MsgGUID: OJjBmlS3SiqPRsGJpj9VBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13280734"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13280734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:19 -0700
X-CSE-ConnectionGUID: yKIZjAI8RWWMRE1FvDnkpA==
X-CSE-MsgGUID: zn0W/Op3RJ64UR1B+FPHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40388032"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/5] Convert multiple bind ops to 1 job
Date: Wed, 29 May 2024 11:31:43 -0700
Message-Id: <20240529183148.1713695-1-matthew.brost@intel.com>
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

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (5):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling

 drivers/gpu/drm/xe/xe_bo_types.h |    2 +
 drivers/gpu/drm/xe/xe_migrate.c  |  305 ++++---
 drivers/gpu/drm/xe/xe_migrate.h  |   34 +-
 drivers/gpu/drm/xe/xe_pt.c       | 1276 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pt.h       |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h |   48 ++
 drivers/gpu/drm/xe/xe_trace.h    |   10 +-
 drivers/gpu/drm/xe/xe_vm.c       |  623 +++++----------
 drivers/gpu/drm/xe/xe_vm.h       |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h |   41 +-
 10 files changed, 1298 insertions(+), 1057 deletions(-)

-- 
2.34.1

