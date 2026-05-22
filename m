Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C097CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5AD10F73E;
	Fri, 22 May 2026 12:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkztB/1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730E10F73E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453464; x=1810989464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G+fuxB37A69DNnUOOlJtZuwBIbAD1S8WIkwb2An6FwI=;
 b=AkztB/1J6abqOtL7rYbcR1SNwPpfkcWIwMRsjaIsqmq7HVgjweorVLuy
 JttAVS596p/5PogY/NEEIfdj/THwGZYhSQLIVzYjpENlJR7gN6Kyis7hi
 L4/z7DWZ7+cl+/g116jEFoGPE8cRrrhFd1cRxZ4o8c4tyXh572S5PdjR1
 AXtYpbFznoMNTv2hAD87Uds1O9lPHNjgRrz4HvoYtc0UyIn/FyRyNRzqs
 C4OfpyKftBUiQh5vGAgc0D430Ip+UxxHxDbiTDRCVjUtOdwqHKyFPv8pD
 0VUGIXqXKhrO3kwAhBHADVLwFY7bi9n+p9I3gKX+6Acv2ydQ+nRM4OeFE g==;
X-CSE-ConnectionGUID: wa+2ci30S52bOjgMDLpugA==
X-CSE-MsgGUID: Uq5sD+ktSWmUcWt1jlj27A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264593"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:44 -0700
X-CSE-ConnectionGUID: KzmERZkHSx+Gwt9eZ+cRgQ==
X-CSE-MsgGUID: kyGxVji+SP2Ehewg9Smu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302173"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 09/10] drm/xe/hw_engine: document top-down paging
 requirement
Date: Fri, 22 May 2026 13:37:30 +0100
Message-ID: <20260522123720.39656-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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

We were doing this anyway, but going forward for paging engines,
agreement is to always reserve BCS instances in top down fashion. This
hopefully future proofs things for VFs, where in some low-level places
it might only have the physical BCS instance from hw pov. If we stick to
a consistent mapping scheme, it should make it possible to determine if
this a special paging engine, or not.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c279a7dc62e2..5583fd98b08d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -665,7 +665,6 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -690,6 +689,16 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 	xe_gt_assert(gt, !(num_copy_engines || num_paging_engines) ||
 		     (num_paging_engines < num_copy_engines));
 
+	/*
+	 * On PF, we just reserve the highest BCS instance for USM.
+	 *
+	 * Note: This is now a requirement going forward. The PF must ALWAYS
+	 * reserve BCS instances in top down order, that way the VF has a chance
+	 * of discovering the physical BCS instance mappings for paging engines,
+	 * in conjunction with vf_num_paging_engines. In some places we might
+	 * only have the physical instance, and from hw pov there is no such
+	 * thing as a paging engine.
+	 */
 	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
 
 	/* FIXME: Doing a simple logical mapping that works for most hardware */
-- 
2.54.0

