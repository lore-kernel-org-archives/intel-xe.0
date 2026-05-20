Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBBFCD5BAA
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 17:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B6910E0C9;
	Wed, 20 May 2026 17:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFOwcwdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326A10F109
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779298212; x=1810834212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uo2ElXPTnvggJnnAP4ZjHDLlAxRBd99tMGZDwi35nNQ=;
 b=XFOwcwdQYox97OhnLClbx9wygHGJ+Xf9l1KrIRNgGv2S6pj70BWONQ8t
 Eap8eE9AfyBQcas+V57ZH7MOS5zmtrPv05E+3TGuVAkYvPx8kKCL5VFDr
 +3a5Cy+dcJNSe4AD8VONSCFjp1oO6hUSk1omMuyhz9yQQt3vdyWlBdh6L
 SD4jrP60BKnoNHvrahx0j6qebMLSH09l6Ox6uGxfysIOYR1V/Ygr9CuFL
 VTd7wsZXDZnM1EwkohdvMX1unuTJMFPA6c3fW4rQtFXRsYnR55nP+5N5w
 zzXaX930fl9dFkKd3DOw3rpvZFzPREiDTnyezObDYvWWBZXDPCxvlXgi5 w==;
X-CSE-ConnectionGUID: VKLTitcTQqym33xtVge0CQ==
X-CSE-MsgGUID: tcDBYJ6ISGaxHSiZbqfWEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105667661"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105667661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:12 -0700
X-CSE-ConnectionGUID: Om2RN++zQCKJExcQclcL+g==
X-CSE-MsgGUID: G7cfoc0nQKGE7hpowIyfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="270598167"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.159])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 09/10] drm/xe/hw_engine: document top-down paging requirement
Date: Wed, 20 May 2026 18:28:56 +0100
Message-ID: <20260520172846.291708-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520172846.291708-12-matthew.auld@intel.com>
References: <20260520172846.291708-12-matthew.auld@intel.com>
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
index d98e2cd86820..b52723dfbf79 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -665,7 +665,6 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -687,6 +686,16 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
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

