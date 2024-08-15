Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A64C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 23:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388E10E559;
	Thu, 15 Aug 2024 23:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k684+7PJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693E910E558
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723763159; x=1755299159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/e9wa6ZxwaEurqTjpz3rsvzS8M2Yme1iozFs+89ch4k=;
 b=k684+7PJ66H8eOh3TnWxnr8i7lHpBiEL3FyUk4pv+Z84rSJWFqthsjsR
 j/+BdmP+blL722r95fzC+VUwjJ+LaLNiLur2MUPxdWjKCMvDG2G16Zn0S
 GjAI07P4SMtEZjocu5WXRXZ/PcQ+bS/bQghQScYxhB91/g3SEhcKt7A6T
 hzrEH3NZBR9mIDJ1BX+YwiOyAhixqT/CN0y6ohvVKPhy0sYM7sxJhF43N
 o6i1431Mt1xqGjXuHUdUprzNCn66Bj6cKSRAAs4iHB+uStLQxlKcMy7Mc
 WfDszBTa2F4SzsCgyOWRmHT9rXCOl1PR1rL/vvwZPBWmshJB19L946b/t Q==;
X-CSE-ConnectionGUID: XiGBCC+ZSoeh8WieiVni3A==
X-CSE-MsgGUID: 1UHF21XsSjmwX/+Ikxlh4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21687156"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21687156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:58 -0700
X-CSE-ConnectionGUID: cgVhoDYgQYeWHNF3ixGcPw==
X-CSE-MsgGUID: jDVejgREQhS6wefp0M58RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="63686118"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 16:05:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 2/3] drm/xe/uc: Use devm to register cleanup that includes
 exec_queues
Date: Thu, 15 Aug 2024 16:05:40 -0700
Message-ID: <20240815230541.3828206-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240815230541.3828206-1-lucas.demarchi@intel.com>
References: <20240815230541.3828206-1-lucas.demarchi@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Exec_queue cleanup requires HW access, so we need to use devm instead of
drmm for it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8a9b3c50a588e..8a137cb833186 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -437,7 +437,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	return ret;
 }
 
-static void free_resources(struct drm_device *drm, void *arg)
+static void free_resources(void *arg)
 {
 	struct xe_gsc *gsc = arg;
 
@@ -495,7 +495,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	gsc->q = q;
 	gsc->wq = wq;
 
-	err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
+	err = devm_add_action_or_reset(xe->drm.dev, free_resources, gsc);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da63be550d4d9..be5b9d8cfa5fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -284,7 +284,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	free_submit_wq(guc);
 }
 
-static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
+static void guc_submit_wedged_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_exec_queue *q;
@@ -877,7 +877,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 
 	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
-	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
+	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
 		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
-- 
2.43.0

