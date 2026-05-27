Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C69CD5BC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45CD10E796;
	Wed, 27 May 2026 11:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgGLpRph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5C410E780
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779880440; x=1811416440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSebk0/svn9/82Kp+1Ff0gT/kw3w+eQn27uqANWUluo=;
 b=jgGLpRph3m86qBkxQRuYaVpa0kAoYkAJoqbyWzPZDJbPbHj9nsyJ+NnB
 pVzXI/J2Q/48AwVR326evoFjOyKrIjn7O1aW2DeXSfLerxfkHwnlFDIYa
 7+7iQY/Kb8fxszjb8wNDMM+PFe7fCiKtyHudR4y6dHKk0+V1X+kaeq6RO
 oAMUrrKAwb4+C+m3PvZCOpuJRHut/I3uthllGurQXFRgVbrcasI+U6AWG
 nwEmuYOGAosl+ryiIwbR5S/8rYFf+7V7p10xhsSl3CYpDGAZiBKe6xgEc
 1NwhrWl4s2Cg4TioEBtYku9n41VR55q1ZlkMAhAK0DQ0ZbtcGlGzx1h0K Q==;
X-CSE-ConnectionGUID: Rgqo6bW7RBatQ8gBS61//Q==
X-CSE-MsgGUID: atESy45rTySVWVF7ism9Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80612997"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80612997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:14:00 -0700
X-CSE-ConnectionGUID: RuhvPBdWRsm7B1VR3kgZ0g==
X-CSE-MsgGUID: qEV/ul1TShCOumLbbkfEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242371124"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:14:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 09/10] drm/xe/hw_engine: document top-down paging
 requirement
Date: Wed, 27 May 2026 12:13:45 +0100
Message-ID: <20260527111335.140000-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527111335.140000-12-matthew.auld@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
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
index 9cdd3e64235c..538cb86f02b5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -665,7 +665,6 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 		if (hwe->class == XE_ENGINE_CLASS_COPY)
 			num_copy_engines++;
 
-	/* We just reserve the highest BCS instance for USM */
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
@@ -690,6 +689,18 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 	if (XE_WARN_ON(num_paging_engines > num_copy_engines))
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

