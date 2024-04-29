Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E505BC19F53
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC3910F3FF;
	Mon, 29 Apr 2024 16:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+6r5fC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598610F3BF
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714409203; x=1745945203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g/vYR+DlJASoCirNxJpElTbcMrJ5xXnCxFwoNSqJQQE=;
 b=K+6r5fC8uJAwf7SNmfSioqFFIp1ZpEmM36g7zGWkOmd+Ma06ymEMFQmO
 Ta5U1mmkY1qQTb2W7c0kEopHJH796BXmXnrCHWF0B9vAGJSzS+c9TjOx4
 I2rwTS0sWbYoPCxJ7OBJbgm11p7xLbbgSWol0Ei+9VJsdaTyz2D9nABhU
 YH+XTva5oHHnu8Lh5qeFYlTKhHyfsgo3x9mqzSbSwYt0HR3C5qTmh4BE/
 uKhyk2TEG2ndSPGhxBgpZaqNrB+njFA5FQaP6TRKsl4R7bhw4oDkaG83L
 VIYxwuaWreuffLxZe10WB4Ru2nO8H9SuFvE56LWEwP6YZbXl1PNspRh4I g==;
X-CSE-ConnectionGUID: AVNOZ0EqStKKgWp74hFfCA==
X-CSE-MsgGUID: ztp1lIo5SUCx8a5y2zU4EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21486073"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="21486073"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:46:42 -0700
X-CSE-ConnectionGUID: CWneRb2PQk61KBhydMiFNA==
X-CSE-MsgGUID: 7yCuM3I0QrGirZ1n2PKTvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="63647299"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 09:46:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/5] Convert multiple bind ops to 1 job 
Date: Mon, 29 Apr 2024 09:47:08 -0700
Message-Id: <20240429164713.2249950-1-matthew.brost@intel.com>
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

Matt

[1] https://patchwork.freedesktop.org/series/125608/

Matthew Brost (5):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling

 drivers/gpu/drm/xe/xe_bo_types.h |    2 +
 drivers/gpu/drm/xe/xe_migrate.c  |  307 ++++----
 drivers/gpu/drm/xe/xe_migrate.h  |   34 +-
 drivers/gpu/drm/xe/xe_pt.c       | 1251 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pt.h       |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h |   48 ++
 drivers/gpu/drm/xe/xe_trace.h    |   10 +-
 drivers/gpu/drm/xe/xe_vm.c       |  623 +++++----------
 drivers/gpu/drm/xe/xe_vm.h       |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h |   39 +-
 10 files changed, 1274 insertions(+), 1056 deletions(-)

-- 
2.34.1

