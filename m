Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E814CA9EBE
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 05:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350910E485;
	Sat, 10 Oct 2026 05:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjFVmbyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2255010E485
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 05:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791610851; x=1823146851;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NEYwO72/FKINJilpMfHOzAdaKr/sklhmObstIDhs+lg=;
 b=IjFVmbyNkWBtt+HjMPUVTY3/7jKpqqq9vf1TZb5T/Td+b77HMMSFGtuf
 zJm1cQb4OAYGXN8JUpjEy1icD9RHrWEQ4uGQcdoq2m16so5UK+Bcbe40B
 uZhT9klCGSqhotJivNXlzHhsQ4mZm5UYP0Bg+toRvTCbn1+aP/MCnwsUC
 yA3zTozQgIogY+ilRpBVCTaxLVOuZ/738CHNjkpuDb/DEgh9at/YGTk9+
 ROKDYmKz8p6K1LY2c7n8XuMEnQQnnQulLAB9tdgm6kzK8A898bZJwZzka
 kZwkkAVlaQ+8EIgYgDF8gNxDnVXH/D1+S15D53p8zZeAR6LmDg9AJqyjP w==;
X-CSE-ConnectionGUID: 4dl92ccgRj+uBb0FWS8oFg==
X-CSE-MsgGUID: lHzcUBSKTNSJ8pWlnvBNgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="412370"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="412370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 22:40:51 -0700
X-CSE-ConnectionGUID: XFUOOa8BQ2aMGB6N+xZHlw==
X-CSE-MsgGUID: 0ds1wvuySRWEHJlMPWTclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="794256"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 22:40:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
Date: Fri,  9 Oct 2026 22:40:32 -0700
Message-ID: <20261010054041.1327217-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
References: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
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

