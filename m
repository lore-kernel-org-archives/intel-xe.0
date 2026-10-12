Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0739CA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6253610E662;
	Mon, 12 Oct 2026 19:11:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ADF10E662
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791832253; x=1823368253;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+iWaDcSHtE8lVgxPBdrZpBMTjg5Ti4uDk6r9nI768Q=;
 b=njRONpku5hFCj19mrELCATs8vhaRbLW2eSG/h2C0ES1hmPoXc7caLci1
 Z/2FxVqDfqXEYog3iZWCXtqU8tRIo0SNOwkHsjAx9RIH1+2s09iD2XTnQ
 n1pB3rJis48C/085wQg7Mf+feTzCFGjMds/8Xo/q40/CKAuxPjDIiw2U3
 9A9kYFzSbvEuDxttFeyePIEvR802DQm6DEHRnw3R6Tvyp6IzFbMLZvRrg
 xp3AQeCYsOPxuTvtubNhhYRXmefU/bdYHukNEmcfDarXaRr0eXiovODjq
 vKY+lmBNdZO0zha0+ywRh1YYWgzTYNqx3XfJ/fK+91huzLLG+x7w6e917 Q==;
X-CSE-ConnectionGUID: BoXt1dMeT2ivwOzID8EBJw==
X-CSE-MsgGUID: JdUSRTXSTl6GVyQbZ+HD6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="445430"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="445430"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
X-CSE-ConnectionGUID: r4WnppQxRGyYcoR67zvLIA==
X-CSE-MsgGUID: X66mimBCRGW+U7xN1OEm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2747983"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/xe: don't dereference a NULL resource in
 xe_evict_flags()
Date: Mon, 12 Oct 2026 12:10:39 -0700
Message-ID: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_evict_flags() picks an eviction placement by switching on
tbo->resource->mem_type, but an xe BO can reach eviction with no
ttm.resource -- e.g. an imported dma-buf BO whose resource was freed
during teardown while its attachment is still live. The exporter's
invalidate then drives xe_dma_buf_move_notify() -> xe_bo_evict() ->
xe_evict_flags() into dereferencing the NULL resource. Hit by the UAL
export-reject-imported-bo IGT.

Patch 1 returns an empty placement (num_placement = 0) for a NULL
resource -- nothing is placed, so there is nothing to evict -- matching
the existing non-xe scatter-gather handling.

Patch 2 adds a KUnit regression (xe_dma_buf) that guts an imported BO
and drives the real move_notify path; reverting patch 1 makes it OOPS.

v2: Update patch 1 commit text

Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: skip eviction of a BO with no resource
  drm/xe/tests: add regression for eviction of a BO with no resource

 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 89 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c            |  6 ++
 2 files changed, 95 insertions(+)

-- 
2.43.0

