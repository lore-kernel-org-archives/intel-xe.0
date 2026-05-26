Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D5CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435BC10E6A7;
	Tue, 26 May 2026 14:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuhaEKfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608D610E6A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805165; x=1811341165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alqsCEcZcVCKqyMaUOYcPyKufV+eHZGP9JQa6i6EQgY=;
 b=HuhaEKfXi8fybVEUX2u+5M4aXXTImamqGYxyBLqZMjNFgH7flL6q+qwd
 4o+JChjcGo7Zj3TWUK2udv9QQk0xi36i/KXO7SbBrTl4vftYGmVKZ+7ik
 G4agFTGXFHZwmTyv5Dr92xbImhPAMXlfvwmLAVMx4oxdhM+44HFVyMIvT
 RTGPI+P4hpKWPFsDBPuxt1FzaWA5k4vFUGLb76hGnZV3Yu78O9kGSxGqO
 sN5FEQNnQF+oe6W+Njy3pamGic0AsQKLeZqy6WMDPA5Q1pUmkA6czRcFg
 c2xLQMT1+Ngu/SQZRsDc01n6jNuHh1OP0exr7xNyD0otRqptSK2Gl6W6y w==;
X-CSE-ConnectionGUID: 690AzhwjSbqOgFEn+wXV0w==
X-CSE-MsgGUID: DCuGjr+aSEabUWd2CIukBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505754"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:25 -0700
X-CSE-ConnectionGUID: euA8jIeqTFSBrnctSbJoKA==
X-CSE-MsgGUID: Y4bveYjAQ2agPD1xMpfKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015769"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 09/10] drm/xe/hw_engine: document top-down paging
 requirement
Date: Tue, 26 May 2026 15:19:11 +0100
Message-ID: <20260526141901.62207-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 62b966bde34f..1a254e70927f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -665,7 +665,6 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -691,6 +690,16 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		       num_paging_engines > num_copy_engines))
 		return -EINVAL;
 
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

