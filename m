Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C698AC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 14:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625B10E1EF;
	Mon, 23 Jun 2025 14:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jafiTrD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891510E1EF
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750689851; x=1782225851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ufAv3+MWfy8d6hdKab765EtBEJRHd5CLSEqcz2miGhA=;
 b=jafiTrD+evb7lfOS+jDbFRZBdQo1MNMQRAQK3owkZ6ZbCe6lwa4d8NLm
 +MiJx3VAZ53hoOJTsrzB9XJ1356DelePxWFg7J56fopaiFYx+DmV/lJnb
 uAuzbyRILaKLaEJLmf8Yzr8d6sUMQrsbiTnT3lLaTjpKxTXuauWl+i3AP
 qZZFlSyGVDrvKH2SQLi08r/QsPFXkHC7Jj8ybjd1bSoc+C9loxtbP7w3X
 3bTg2ILRHsy8TWq2MsrYYd+PTYPEj5FMP26bZIXav/bTOd7O6spG3fKIv
 c+I7PIu70j4BqkYAxi+CzJtb1k/TYpa3W9LrjyuC39gc3h9FKl6HeIO3N g==;
X-CSE-ConnectionGUID: enLYg4tUSHCf66JYg3o/fg==
X-CSE-MsgGUID: v1IJ1VyDQBGHvLilAQsBDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52837055"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52837055"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:11 -0700
X-CSE-ConnectionGUID: Ewu6Yde3Tz6ZLYvUxTeDmQ==
X-CSE-MsgGUID: IvotjY/VQpS56voWT20iIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182661932"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 0/4] Implement clear VRAM on free 
Date: Mon, 23 Jun 2025 07:45:44 -0700
Message-Id: <20250623144548.2388268-1-matthew.brost@intel.com>
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

Matt

Matthew Brost (4):
  drm/xe: Only use delayed worker to destroy userptr VMAs
  drm/xe: Drop BO argument from xe_migrate_clear
  drm/xe: Add xe_bo_tt_has_data helper
  drm/xe: Implement clear VRAM on free

 drivers/gpu/drm/xe/xe_bo.c           | 75 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_migrate.c      | 50 +++++++++++------
 drivers/gpu/drm/xe/xe_migrate.h      |  9 +++-
 drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  6 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 +++
 drivers/gpu/drm/xe/xe_vm.c           | 80 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_vm_types.h     | 13 +++--
 9 files changed, 198 insertions(+), 69 deletions(-)

-- 
2.34.1

