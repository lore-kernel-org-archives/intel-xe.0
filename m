Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F65CDE016
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E810F577;
	Fri, 26 Jun 2026 11:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR8X2HbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882BB10F572
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472545; x=1814008545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e7eoSatgapcOGAyye6se9f6Dhtq/bSbEGjIVytujwpI=;
 b=nR8X2HbGWEHmugqwwJ70KB5LNl0Jfpc83CFCok90p95HHQFDArl0YeFT
 je8i7qgw6tUZNwwSMDKZtoujVf3ZthpETBMuj75xY9je+qtL15FBKoaRy
 bQcrq3j8DRL9xV7ZHeaM3SW3rT0qzQy9ROuI9HX+DWBxsbmnfzCFVw0Lo
 UYHI31r6yJzpX0GNzHBoT1FTPawAAikLdIm8gTyxRhY61NDXHYGglqu1o
 TPLLPWL9tUNIVmzgM2Uz+1QghtyoQHL0jZr9NCgUxTtmZyJU2pNqO32MZ
 a6diVoRAZ29FPTuuRGGrTfvCk46rTHVkLRfFMqBygkgrMRVs69Of1NNYz w==;
X-CSE-ConnectionGUID: 6zadjzUDTwKckiCeMP7bzg==
X-CSE-MsgGUID: DdL+fPsjRVyVoPKdMkhkuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100695000"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100695000"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:45 -0700
X-CSE-ConnectionGUID: pHeh7Y31RUOnLyP2Td85tg==
X-CSE-MsgGUID: NJsqbSFHQiC2lGoE98ZGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214368"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 09/10] drm/xe/hw_engine: document top-down paging
 requirement
Date: Fri, 26 Jun 2026 12:15:30 +0100
Message-ID: <20260626111520.487997-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626111520.487997-12-matthew.auld@intel.com>
References: <20260626111520.487997-12-matthew.auld@intel.com>
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
index d2c6b8645a62..fc533a6257fe 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -673,7 +673,6 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -700,6 +699,18 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
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

