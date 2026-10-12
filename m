Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74230CA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 21:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466C10F385;
	Mon, 12 Oct 2026 21:50:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907A10F2E5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791841830; x=1823377830;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=37EKjDzVXjqGy2iqiepmyBvh42nkKxiyQ+QCBGuWiJE=;
 b=BmOrleMfcErjnLWfS7sDWwjqoB+g/e9rp51Gcq1p95/rpY57g1COd907
 sZTNT7iHMGrnDU5ir72ilP43Z12FINiIoE3vqlQ8QG700DQ2bTWH4mibZ
 NNbHVRkRnod5szRfd04wrphYGsqduq5R/gWX0L24ziAVru0njIbzJlPEZ
 viFBAJhF8FxkCa10uGfCb66Hg6Zu+zj4kyl2Yir5zuLq1YNHMwfowjMT5
 YgNrrREt53xBtC+ieWalPBr9KcnIH4kART/snHXSC02Dt5GmeSs+d/HqI
 DS+XYqhQ0m1W4UWzf2bqtCp7/nwyYF5ao6ykxFcVfazr+QxBDBoEfjJle Q==;
X-CSE-ConnectionGUID: pj8g5Z0oQMal2Nl31R5EIQ==
X-CSE-MsgGUID: +NFRN/RDT9uEi2X8zSuDjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="436018"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="436018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 14:50:24 -0700
X-CSE-ConnectionGUID: it9qt2PwQ/6ssi2VPoNVyg==
X-CSE-MsgGUID: FzttFLHdRx6w42N7NbZvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="899028"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 14:50:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/xe: skip eviction of a BO with no resource
Date: Mon, 12 Oct 2026 14:50:14 -0700
Message-ID: <20261012215014.1495677-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012215014.1495677-4-niranjana.vishwanathapura@intel.com>
References: <20261012215014.1495677-4-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
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

