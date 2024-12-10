Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8FAE77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1E010E3B4;
	Tue, 10 Dec 2024 15:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehqR2iq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514E10E3B4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733846186; x=1765382186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=atY7ArHbHpiWtjHrrQYkR3ljGjzogQIuoZZ/9h/VR+I=;
 b=ehqR2iq+GpoMmA2TyjPBlbD/kiXuWCCT+qmSL3ksu1JlL0KP3O2O6LmH
 o6GFYbUEfgALuTHUGI7b4z6I3FTLLafHMzXJORbOAqHQRBi9Wew3CU4wZ
 yfXdopH68UHl4+XdE72ySzV199MDXnfzN+k04vxAiKTUjyHVQ3Tsli5tf
 3gPcya08s8nTQdianzes3gHsqks30yrpWhAiKR7iWV8sdo5iPC+uTPUQJ
 OVqr78gdIPj/KBBkc4zR+xTJBYabGfQ7Mk/ZD7xXnKKQCmI3JEnsdTzl2
 q/80htXCz3D5YgUqMU1wsGlqyqc5P5/w+NkFIiuiRZA4Jy6wHBESK+QMt A==;
X-CSE-ConnectionGUID: E3wzIwI0S0CaEU2H6uLXHg==
X-CSE-MsgGUID: EpTd80aLTySFuUj2SpOCUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34117290"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34117290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:56:26 -0800
X-CSE-ConnectionGUID: INv7XmyYRj60S6mdzFUVPg==
X-CSE-MsgGUID: EMYM+gKtTbqpLaFzoC2lQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="100493136"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:56:25 -0800
Date: Tue, 10 Dec 2024 07:56:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com, 
 raag.jadav@intel.com
Subject: Re: [PATCH v2 1/2] drm/xe: introduce xe_gt_reset and xe_gt_reset_wait
Message-ID: <tqxh2dlo2mzhxujoelfr2b2chnb4lrvt3wvlq4uig2frpvn5fc@u2qn3c5jqi3q>
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
 <20241210143748.1417098-2-maciej.patelczyk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210143748.1417098-2-maciej.patelczyk@intel.com>
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

On Tue, Dec 10, 2024 at 03:37:47PM +0100, Maciej Patelczyk wrote:
>Adding synchronous version gt reset as there are few places where it
>is expected.
>Adding also a wait helper to wait until gt reset is done.

s/Adding/Add/g

>
>Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_bo.c   |  7 +++----
> drivers/gpu/drm/xe/tests/xe_mocs.c |  3 +--
> drivers/gpu/drm/xe/xe_gt.h         | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
> 4 files changed, 30 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>index c9ec7a313c6b..a1af45e06189 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -264,10 +264,9 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> 		 * however seems quite fragile not to also restart the GT. Try
> 		 * to do that here by triggering a GT reset.
> 		 */
>-		for_each_gt(__gt, xe, id) {
>-			xe_gt_reset_async(__gt);
>-			flush_work(&__gt->reset.worker);
>-		}
>+		for_each_gt(__gt, xe, id)
>+			xe_gt_reset(__gt);
>+
> 		if (err) {
> 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
> 				   ERR_PTR(err));
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
>index 6f9b7a266b41..2698e433c6fa 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -162,8 +162,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
> 		if (flags & HAS_LNCF_MOCS)
> 			read_l3cc_table(gt, &mocs.table);
>
>-		xe_gt_reset_async(gt);
>-		flush_work(&gt->reset.worker);
>+		xe_gt_reset(gt);
>
> 		kunit_info(test, "mocs_reset_test after reset\n");
> 		if (flags & HAS_GLOBAL_MOCS)
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 82b9b7f82fca..8db64e289892 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -56,6 +56,31 @@ void xe_gt_sanitize(struct xe_gt *gt);
> int xe_gt_sanitize_freq(struct xe_gt *gt);
> void xe_gt_remove(struct xe_gt *gt);
>
>+/**
>+ * xe_gt_reset_wait - wait for gt's async reset to finalize.

IMO it would read better as xe_gt_wait_for_reset(),
otherwise it's not clear from name if this function calls the reset
*and* wait or if it just waits a previously posted reset request.

>+ * @gt: GT structure
>+ * Return:
>+ * %true if xe_gt_reset_wait() waited for the work to finish execution,

%true if it waited...

>+ * %false if there was no scheduled reset or it was done.
>+ */
>+static inline bool xe_gt_reset_wait(struct xe_gt *gt)
>+{
>+	return flush_work(&gt->reset.worker);
>+}
>+
>+/**
>+ * xe_gt_reset - perform synchronous reset
>+ * @gt: GT structure
>+ * Return:
>+ * %true if waited for the reset to finish,
>+ * %false if there was no scheduled reset.
>+ */
>+static inline bool xe_gt_reset(struct xe_gt *gt)
>+{
>+	xe_gt_reset_async(gt);
>+	return xe_gt_reset_wait(gt);
>+}
>+
> /**
>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>  * first that matches the same reset domain as @class
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 3e8c351a0eab..79f61532fd00 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -135,7 +135,7 @@ static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> 	xe_gt_reset_async(gt);
> 	xe_pm_runtime_put(gt_to_xe(gt));
>
>-	flush_work(&gt->reset.worker);
>+	xe_gt_reset_wait(gt);

this can become a xe_gt_reset() since the only thing we are doing
between the calls is to release the runtime pm.... doesn't really
matter for this debugfs call.

other than the nitpicks,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
> 	return 0;
> }
>-- 
>2.43.0
>
