Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B67CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 05:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E06112A5C;
	Fri,  5 Jun 2026 05:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3nz9kKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2EE112A5C
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 05:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780636787; x=1812172787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XSKQWiZZsdOf1UAIXowwNL6UOhMX/fuF1m1D2qUPOTY=;
 b=Q3nz9kKWFJZVUNnfsNgmW7rKyOF5FN37eQplxtuZeHZxOuj6d3CICKsT
 1OzvLKuwiJJ5EbAK9dqlnV3oN1dZ/t3lZFc1TxDktIM1V4bR513OhaT9p
 TSuydr5MxCRVX4ttY/v1KZh1DL0975o8KA2qqcM629X8IyLc0VLY6L0Ax
 O3DxF3+XCUdFNmdULNBPg0DLg2LNvMG7HYQDM4NUnjh/ze5//6Y11Ro4z
 g+KR/mlM8F0l0vVoTEDVcmKZH6qr0mSqXao6yuRKf9I2CM+g3J0voe/Eq
 gPDr+gF4U4stCgOYgwdWwdx+K0eXUXX6Wbc3SkHwTrT/qGJmZMFdmdY0t Q==;
X-CSE-ConnectionGUID: 6+kTqCyxQWmNSX59U3Ckww==
X-CSE-MsgGUID: bROH030hR+OAQo6AxBCRZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85321551"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85321551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 22:19:47 -0700
X-CSE-ConnectionGUID: d+gv/7UUQUq9uHdwQ1XwFQ==
X-CSE-MsgGUID: yu1/NLk+TWihzZdzD4fguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240291500"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2026 22:19:46 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/query: Avoid global forcewake in cycle query path
Date: Thu,  4 Jun 2026 22:19:44 -0700
Message-ID: <20260605051944.1541085-1-x.wang@intel.com>
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

Engine cycle query is a lightweight timestamp path and should not wake
unrelated GT domains. Limit forcewake scope to what the query actually
needs.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 8c7d54498f38..dc975f595368 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -119,6 +119,7 @@ query_engine_cycles(struct xe_device *xe,
 	struct drm_xe_engine_class_instance *eci;
 	struct drm_xe_query_engine_cycles resp;
 	size_t size = sizeof(resp);
+	enum xe_force_wake_domains fw_domain;
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
@@ -154,8 +155,10 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
-		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+	fw_domain = xe_hw_engine_to_fw_domain(hwe);
+
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
 			return -EIO;
 
 		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
-- 
2.43.0

