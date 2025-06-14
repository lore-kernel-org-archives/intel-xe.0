Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D794C71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A4310E5D9;
	Sat, 14 Jun 2025 01:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A216COIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA2910E9DF
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866161; x=1781402161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lWwvj5O/UfM5I9VEhDKEyskf7YfKKhoIa3RWQxG7ecA=;
 b=A216COIruYsOzNfUy0T5s7f39ZZpNIP/jOTtghLHk1RVzulCwag01D2B
 EvoeyAfcIzkY+TK1yFli0N8xTI9YO9L7KvaehwyvYODCsqyLj1vxQ87MV
 RHUCOQdj0aJR+c0QdCIq07AVn4JjdLRW3SN0Poo0RZzUDJdzFeqfYrQIZ
 C6icNHUe+g6AA3yu8l8U13UwqpSafum9WxJfrmCUMmZ54YIVcaqLBTnJW
 EOOT9DDYERV7+1Wp2EIlpHP7Xaddl/KpU/v/uaj9D6TbtROo7odRG87r4
 l5618G+TrZ6Mb+oVvKlXp09WD7FXHIEICPJVJnQftSDdxr4jxSCBj7Gnk A==;
X-CSE-ConnectionGUID: Z392OR2ESS2YknsXwt1UUg==
X-CSE-MsgGUID: gWJKZ4PKQyuF9FpivfQkcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481418"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:56:01 -0700
X-CSE-ConnectionGUID: Q+8MMdVsQKad20S+0qwHrQ==
X-CSE-MsgGUID: ZuL4dbh4T+qQ2E0JyNOG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875060"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:56:00 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/7] drm/xe/pvc: Add GuC firmware definition
Date: Fri, 13 Jun 2025 18:55:09 -0700
Message-ID: <20250614015511.691610-6-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614015511.691610-1-julia.filipchuk@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
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

Add pre-release support for PVC.

UAPI version 1.13.4.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250403185619.1555853-7-John.C.Harrison@Intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 4d3ace56f38aa..918e594c63174 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,6 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.49.0

