Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B8C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0C110E653;
	Wed, 22 Nov 2023 14:39:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7D410E653
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663940; x=1732199940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ict8J6J4pAQs6hPE7TMceK6mnHwzXLcee5ShMJtDT8c=;
 b=a1TmTdILEOiZxs8aH6b7hPimcReF4rEJ1mlUH7WLjmBORcgpE/pSWh8q
 WOyRBoyzBalDyagB1ps8xuxtbliFWj4VEfBR0FrCpi8iusN0PQpHtOKqD
 p5SwsDJ6Er+x8DqHrH+pgDbPBpioW5XWaiuOh3m8xpN7fQyREFaJMgmAI
 3BVGeIjopP6QFQkh+dHWNE92J6RfljK8LPmLN/oQ5JCpthSjKtd8561NJ
 dV+tg4NW9yf/QQsZn8sy9UTNQvQnwEA47RUkhOEW5nFoW5nHiUy+341in
 2SyVsCvhrF7kEgw7htroDxSPXmpFcl77gUZMjRUPYgdtFWj8/rq0R7opn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985057"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985057"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430294"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430294"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:40 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:19 +0000
Message-Id: <20231122143833.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/14] uAPI Alignment - Cleanup and future
 proof
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The series "uAPI Alignment - take 2 v3" [1] has grown too much which makes
it difficult to review and to digest by UMDs. This new series is a third
break down, which cleans up the uAPI and prepares for future needs.

v2: Fix according to feedback from v1, rebase on drm-xe-next, add new fixes

[1] https://patchwork.freedesktop.org/series/126203/

Francois Dugast (3):
  drm/xe/uapi: Align on a common way to return arrays (memory regions)
  drm/xe/uapi: Align on a common way to return arrays (gt)
  drm/xe/uapi: Align on a common way to return arrays (engines)

José Roberto de Souza (1):
  drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Mauro Carvalho Chehab (1):
  drm/xe/uapi: Reject bo creation of unaligned size

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (8):
  drm/xe/uapi: Separate bo_create placement from flags
  drm/xe/uapi: Split xe_sync types from flags
  drm/xe/uapi: Kill tile_mask
  drm/xe/uapi: Crystal Reference Clock updates
  drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL
  drm/xe/uapi: Add Tile ID information to the GT info query
  drm/xe/uapi: Fix various struct padding for 64b alignment
  drm/xe/uapi: Move xe_exec after xe_exec_queue

 drivers/gpu/drm/xe/tests/xe_dma_buf.c   |   8 +-
 drivers/gpu/drm/xe/xe_bo.c              |  39 +++--
 drivers/gpu/drm/xe/xe_gt_clock.c        |   4 +-
 drivers/gpu/drm/xe/xe_gt_types.h        |   4 +-
 drivers/gpu/drm/xe/xe_query.c           |  78 +++++----
 drivers/gpu/drm/xe/xe_sync.c            |  23 +--
 drivers/gpu/drm/xe/xe_sync_types.h      |   1 +
 drivers/gpu/drm/xe/xe_vm.c              |  49 ++----
 drivers/gpu/drm/xe/xe_vm_types.h        |   2 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  56 +-----
 include/uapi/drm/xe_drm.h               | 219 +++++++++++++-----------
 11 files changed, 224 insertions(+), 259 deletions(-)

-- 
2.34.1

