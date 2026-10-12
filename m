Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7640CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC910E666;
	Mon, 12 Oct 2026 19:10:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F0210E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791832248; x=1823368248;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FMuLNwlfgQp/dGF7clcuCeRt4uqUU7AOgNClysFkALA=;
 b=Nhy8oOtv43qjfydAme/0HKW/Apsyf2AwOjEm2zCTiAT/htY7JLejyjC6
 vfGMmDq+jV7vvCnZtVaF3OCfYuXPYoF42zjFirZhZWuTtY27+dwuXm+Hw
 vwc5jZEZib7FqJL0dAbaBDIut55GLhlNvZfYrgbr1Nw1wy0dCSBHOsvUM
 +ZgOnJxcrjlDJMDuL5PmnwRBHZ+5mKvtyhSezkoJwLstJbbYRqcmfCqhz
 f78fB6+2pQtB2iPP7MR3SXRRbmykkBL+eTf4vFQ0gSPcYkniRDw4ITXBQ
 IteHgFvP2hPYz3wgF9x2bUB+OSbbASMAkLK2i/TBjFWXBGVGkIgRBlVuU A==;
X-CSE-ConnectionGUID: /9eI/L9hS2WFtxBbCWDUhw==
X-CSE-MsgGUID: NOxHl+VyRyanFdkHFH22bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="445431"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="445431"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
X-CSE-ConnectionGUID: 2EIfMyGRQeeS6MRWMODD4w==
X-CSE-MsgGUID: EbWDOUBoTsShWy4HCKH3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2747984"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe: skip eviction of a BO with no resource
Date: Mon, 12 Oct 2026 12:10:40 -0700
Message-ID: <20261012191041.1492725-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
References: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
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

xe_evict_flags() switches on tbo->resource->mem_type to choose an
eviction placement. An xe BO can reach eviction with no ttm.resource,
e.g. an imported dma-buf BO whose resource was freed during teardown
while its attachment is still live: the exporter then invalidates it via
xe_dma_buf_move_notify() -> xe_bo_evict(), and the switch dereferences a
NULL resource and faults.

A BO with no resource has nothing placed or mapped, so there is nothing
to evict. Return an empty placement (num_placement = 0), mirroring the
handling already used for non-xe scatter-gather BOs just above;
ttm_bo_validate() then takes the pipeline-gutting path and returns 0.

Without the fix the xe_dma_buf@xe_test_dmabuf_move_notify_no_resource
dynamic live selftest will fail with below stack.

BUG: kernel NULL pointer dereference, address: 0000000000000010
RIP: 0010:xe_evict_flags+0xf4/0x140 [xe]
Call Trace:
 <TASK>
 xe_bo_evict+0x40/0xa0 [xe]
 ? ttm_bo_pipeline_gutting+0x71/0x180 [ttm]
 xe_test_dmabuf_move_notify_no_resource+0x182/0x440 [xe]
 xe_dma_buf_kunit+0x387/0x580 [xe]

v2: Add Fixes tag and failure info in commit text (Matt Brost)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cc78283b702c..12e523c61c1f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -340,6 +340,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	/* No resource: nothing is placed/mapped, so there is nothing to evict. */
+	if (!tbo->resource) {
+		placement->num_placement = 0;
+		return;
+	}
+
 	bo = ttm_to_xe_bo(tbo);
 	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
 		*placement = sys_placement;
-- 
2.43.0

