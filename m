Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50959CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 21:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6010F38B;
	Mon, 12 Oct 2026 21:50:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7513D10F2E5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791841824; x=1823377824;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+iWaDcSHtE8lVgxPBdrZpBMTjg5Ti4uDk6r9nI768Q=;
 b=YRVStgLInVktIZLFKXtrpJJeygW4+cGaDfBz+cohlttvOEepBIFD+MGu
 3Q38ZGC2btexRHZG2SiWrD/YJufOF8RchVzkXFYeyoc0W5r1PeAhFhAz4
 VKGCEJAgxc7KqclpnBneBsvG0i1URXSdOYw+Uo3O2CCAF15sJDY67rStw
 JsbhfrkzA5H4QV10XHi4eM+gPmhye6FFj6WCATdoy8M73Hjqr2UCO9r9E
 Y6IJ/nBMNQMOGeMtN+hULwuyOpm8yLL3qkqDfltC0XYaK+5SCAi8qxbjo
 3eO39o8i3jSujmCBy/qqeuyCXYfkZOTEIqs0f0sI0tq8I1UchDV4zvybL g==;
X-CSE-ConnectionGUID: 3FsNoESIS3S0qg+K8lA0Dw==
X-CSE-MsgGUID: yzMZ4crmTgmeoifgt7cZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="436017"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="436017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 14:50:24 -0700
X-CSE-ConnectionGUID: n2a1mt+cTeSn0jD+fqbXGA==
X-CSE-MsgGUID: MRfT78+gRJOdFcMsMXkvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="899027"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 14:50:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/xe: don't dereference a NULL resource in
 xe_evict_flags()
Date: Mon, 12 Oct 2026 14:50:13 -0700
Message-ID: <20261012215014.1495677-4-niranjana.vishwanathapura@intel.com>
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

