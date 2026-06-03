Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FFBCD6E60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6094111212D;
	Wed,  3 Jun 2026 16:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdSyOgT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B182112127
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505495; x=1812041495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5czThqk13yJULadShC6q5EEAhnIWx7oZp/gP70mMZE=;
 b=bdSyOgT3UGAfv+01g9sbtQDhMxoFQtIjHfWSlm9tiJiqaxMt/CoFtKnu
 0I3Vo7pmJV6JWZIStQrA2fA8fN0TS/lgJfkHcl9FqarzZi7g8AT4gA43d
 cZlaCYhd3LaEglx9RNk+X6NSIf8Eha3JvKsPQPQPczeCQVfK3atSCHQMO
 rFNgWug7sqTuSwHs6L6oCA+e74dafeWT/AdTmZOm7mY8UczF+PlWHuloz
 Cxjd8adkGLzCWjqtsid0Eh8rA7IEsWs5kAWvDDJndj4+kzSVV4Y02gNxw
 SKqe5TJSjVaAlN8y0bTzxq7DUnj+M9rp56a9LrpJbLFyH7NTbpeowXYXr g==;
X-CSE-ConnectionGUID: YYsRrLiERleHtLBta0f4Sg==
X-CSE-MsgGUID: 1YQ/30iuTuulNFr3X+56pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449080"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449080"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:35 -0700
X-CSE-ConnectionGUID: TToy7nc1QTWhzBpMYb2pjw==
X-CSE-MsgGUID: S27MCKMcS1C5SZ4ThdxwSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817910"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 09/10] drm/xe/hw_engine: document top-down paging
 requirement
Date: Wed,  3 Jun 2026 17:51:02 +0100
Message-ID: <20260603165052.183465-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603165052.183465-12-matthew.auld@intel.com>
References: <20260603165052.183465-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
it might only have the physical BCS instance from the hw pov. If we
stick to a consistent mapping scheme, it should make it possible to
determine if this is a special paging engine, or not.

v2 (Daniele)
  - Give a concrete example, like with page fault descriptor

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c5c6d4bca08..7fbfb7c725b1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -663,7 +663,6 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -688,6 +687,18 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 	if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
 		return -EINVAL;
 
+	/*
+	 * On PF, we just reserve the highest BCS instance for USM.
+	 *
+	 * Note: This is now a requirement going forward. The PF must ALWAYS
+	 * reserve BCS instances in top-down order, that way the VF has a chance
+	 * of discovering the physical BCS instance mappings for paging engines,
+	 * in conjunction with vf_num_paging_engines. In some places we might
+	 * only have the physical instance, and from hw pov there is no such
+	 * thing as a paging engine. For example, the page fault descriptor,
+	 * which comes directly from the hw, will use the physical engine
+	 * instance.
+	 */
 	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
 
 	/* FIXME: Doing a simple logical mapping that works for most hardware */
-- 
2.54.0

