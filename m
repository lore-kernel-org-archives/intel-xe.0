Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF9E77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F218910E229;
	Tue, 10 Dec 2024 15:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKJLJvzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0010E229
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733843888; x=1765379888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jMULmwdJs0CGsprtKU4u2waCc5tkA4caiBt8dUfhkkQ=;
 b=cKJLJvzsEh7Al4O1CETRVyjkKKWDv6Su5Pdow5zLSivqcKegX9gyyhz+
 t4HVcPzockgCpVDcqc8ed7qyjfQ3i/tGTRweU4zW57EonA3zF9zjTBbtG
 82BaqJjW6XDWC7nug44uMPE/7rfXZz6vM+SAu/BgggvVhiSjq13Le0s1W
 NY1cbYBaSxMknExWYERQ+I92WpfBTFHHbdQD+9P5s31rbL8Lw+6CZH3HH
 w2k/XMcV9QveLEPkLH/Pvg4ORZvqbD5BY1EKkzy8qWtEg6UQsJ+3HZSwZ
 o3BOhFxMEgNEOS5C/4YGMTsjAMhLi5+PAZi6mLA/QVj8N2cK+CB86ZUAx A==;
X-CSE-ConnectionGUID: 14GCMsIHQpOE/3GUmZh7aw==
X-CSE-MsgGUID: PjHi8z4PTZWIczYmS+AO5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="21776330"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="21776330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:18:07 -0800
X-CSE-ConnectionGUID: I9Gm/gjyQw+hUdPIgJ1IGg==
X-CSE-MsgGUID: JyxhHxNqT9SrmtY2RJVLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95502738"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:18:06 -0800
Date: Tue, 10 Dec 2024 07:18:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 08/11] drm/xe: Simplify GuC early initialisation
Message-ID: <bxb5rfufwiejghuzxyndqnsfnlqr5gzfezihholtbub5vmcd6x@n5fyypgta4yo>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-9-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-9-dev@lankhorst.se>
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

+Michal

On Tue, Dec 10, 2024 at 09:31:08AM +0100, Maarten Lankhorst wrote:
>Add a 2-stage GuC init. An early one for everything that is needed
>for VF, and a full one that loads GuC and is allowed to do allocations.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/tests/xe_guc_relay_test.c |  2 +-
> drivers/gpu/drm/xe/xe_device.c               | 16 ------
> drivers/gpu/drm/xe/xe_gt.c                   |  9 +++-
> drivers/gpu/drm/xe/xe_guc.c                  | 51 ++++++++++++--------
> drivers/gpu/drm/xe/xe_guc.h                  |  1 +
> drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++++++----
> drivers/gpu/drm/xe/xe_guc_ct.h               |  1 +
> drivers/gpu/drm/xe/xe_guc_relay.c            |  6 +--
> drivers/gpu/drm/xe/xe_guc_relay.h            |  2 +-
> drivers/gpu/drm/xe/xe_huc.h                  |  1 +
> drivers/gpu/drm/xe/xe_uc.c                   | 21 ++++++++
> drivers/gpu/drm/xe/xe_uc.h                   |  1 +
> 12 files changed, 88 insertions(+), 51 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>index 13701451b9235..b951d55ef1b32 100644
>--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>@@ -42,7 +42,7 @@ static int relay_test_init(struct kunit *test)
> 	kunit_activate_static_stub(test, relay_get_totalvfs,
> 				   replacement_relay_get_totalvfs);
>
>-	KUNIT_ASSERT_EQ(test, xe_guc_relay_init(relay), 0);
>+	KUNIT_ASSERT_EQ(test, xe_guc_relay_init_noalloc(relay), 0);
> 	KUNIT_EXPECT_TRUE(test, relay_is_ready(relay));
> 	relay->last_rid = TEST_RID - 1;
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 4c46809472ae4..09d5ca1c6004e 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -652,25 +652,9 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_gt_init_early(gt);
> 		if (err)
> 			return err;
>-
>-		/*
>-		 * Only after this point can GT-specific MMIO operations
>-		 * (including things like communication with the GuC)
>-		 * be performed.
>-		 */
>-		xe_gt_mmio_init(gt);
> 	}
>
> 	for_each_tile(tile, xe, id) {
>-		if (IS_SRIOV_VF(xe)) {
>-			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>-			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
>-			if (err)
>-				return err;
>-			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
>-			if (err)
>-				return err;
>-		}
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index d6744be01a687..dc6901255dc91 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -387,7 +387,14 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> 	spin_lock_init(&gt->global_invl_lock);
>
>-	return 0;
>+	/*
>+	 * Only after this point can GT-specific MMIO operations
>+	 * (including things like communication with the GuC)
>+	 * be performed.
>+	 */
>+	xe_gt_mmio_init(gt);
>+
>+	return xe_uc_init_noalloc(&gt->uc);
> }
>
> static void dump_pat_on_error(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 7a25c1da6c6c3..0f2cc4113500d 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -596,21 +596,11 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> 	return 0;
> }
>
>-static int vf_guc_init(struct xe_guc *guc)
>+static int vf_guc_init_noalloc(struct xe_guc *guc)
> {
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int err;
>
>-	xe_guc_comm_init_early(guc);
>-
>-	err = xe_guc_ct_init(&guc->ct);
>-	if (err)
>-		return err;
>-
>-	err = xe_guc_relay_init(&guc->relay);
>-	if (err)
>-		return err;
>-
> 	err = xe_gt_sriov_vf_bootstrap(gt);
> 	if (err)
> 		return err;
>@@ -622,6 +612,35 @@ static int vf_guc_init(struct xe_guc *guc)
> 	return 0;
> }
>
>+int xe_guc_init_noalloc(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	int ret;
>+
>+	xe_guc_comm_init_early(guc);
>+
>+	ret = xe_guc_ct_init_noalloc(&guc->ct);
>+	if (ret)
>+		goto out;
>+
>+	ret = xe_guc_relay_init_noalloc(&guc->relay);
>+	if (ret)
>+		goto out;
>+
>+	if (IS_SRIOV_VF(xe)) {
>+		ret = vf_guc_init_noalloc(guc);
>+		if (ret)
>+			goto out;
>+	}
>+
>+	return 0;
>+
>+out:
>+	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_guc_init(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
>@@ -631,13 +650,13 @@ int xe_guc_init(struct xe_guc *guc)
> 	guc->fw.type = XE_UC_FW_TYPE_GUC;
> 	ret = xe_uc_fw_init(&guc->fw);
> 	if (ret)
>-		goto out;
>+		return ret;
>
> 	if (!xe_uc_fw_is_enabled(&guc->fw))
> 		return 0;
>
> 	if (IS_SRIOV_VF(xe)) {
>-		ret = vf_guc_init(guc);
>+		ret = xe_guc_ct_init(&guc->ct);
> 		if (ret)
> 			goto out;
> 		return 0;
>@@ -659,10 +678,6 @@ int xe_guc_init(struct xe_guc *guc)
> 	if (ret)
> 		goto out;
>
>-	ret = xe_guc_relay_init(&guc->relay);
>-	if (ret)
>-		goto out;
>-
> 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>@@ -671,8 +686,6 @@ int xe_guc_init(struct xe_guc *guc)
>
> 	guc_init_params(guc);
>
>-	xe_guc_comm_init_early(guc);
>-
> 	return 0;
>
> out:
>diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>index 58338be445585..965bf72912009 100644
>--- a/drivers/gpu/drm/xe/xe_guc.h
>+++ b/drivers/gpu/drm/xe/xe_guc.h
>@@ -26,6 +26,7 @@
> struct drm_printer;
>
> void xe_guc_comm_init_early(struct xe_guc *guc);
>+int xe_guc_init_noalloc(struct xe_guc *guc);
> int xe_guc_init(struct xe_guc *guc);
> int xe_guc_init_post_hwconfig(struct xe_guc *guc);
> int xe_guc_post_load_init(struct xe_guc *guc);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 7d33f3a11e618..e8860d0dc368f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -204,12 +204,10 @@ static void primelockdep(struct xe_guc_ct *ct)
> 	fs_reclaim_release(GFP_KERNEL);
> }
>
>-int xe_guc_ct_init(struct xe_guc_ct *ct)
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> {
> 	struct xe_device *xe = ct_to_xe(ct);
> 	struct xe_gt *gt = ct_to_gt(ct);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct xe_bo *bo;
> 	int err;
>
> 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>@@ -235,6 +233,23 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>
> 	primelockdep(ct);
>
>+	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>+	if (err)
>+		return err;
>+
>+	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>+	ct->state = XE_GUC_CT_STATE_DISABLED;
>+	return 0;
>+}
>+ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>+
>+int xe_guc_ct_init(struct xe_guc_ct *ct)
>+{
>+	struct xe_device *xe = ct_to_xe(ct);
>+	struct xe_gt *gt = ct_to_gt(ct);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo;
>+
> 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> 					  XE_BO_FLAG_SYSTEM |
> 					  XE_BO_FLAG_GGTT |
>@@ -243,13 +258,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 		return PTR_ERR(bo);
>
> 	ct->bo = bo;
>-
>-	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>-	if (err)
>-		return err;
>-
>-	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>-	ct->state = XE_GUC_CT_STATE_DISABLED;
> 	return 0;
> }
> ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>index 82c4ae458dda3..9f28fc135890d 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>@@ -11,6 +11,7 @@
> struct drm_printer;
> struct xe_device;
>
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> int xe_guc_ct_init(struct xe_guc_ct *ct);
> int xe_guc_ct_enable(struct xe_guc_ct *ct);
> void xe_guc_ct_disable(struct xe_guc_ct *ct);
>diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
>index 8f62de026724c..b778d0e0253de 100644
>--- a/drivers/gpu/drm/xe/xe_guc_relay.c
>+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
>@@ -322,7 +322,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
> }
>
> /**
>- * xe_guc_relay_init - Initialize a &xe_guc_relay
>+ * xe_guc_relay_init_noalloc - Initialize a &xe_guc_relay
>  * @relay: the &xe_guc_relay to initialize
>  *
>  * Initialize remaining members of &xe_guc_relay that may depend
>@@ -330,7 +330,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>  *
>  * Return: 0 on success or a negative error code on failure.
>  */
>-int xe_guc_relay_init(struct xe_guc_relay *relay)
>+int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay)
> {
> 	const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
> 	struct xe_device *xe = relay_to_xe(relay);
>@@ -356,7 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>
> 	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
> }
>-ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
>+ALLOW_ERROR_INJECTION(xe_guc_relay_init_noalloc, ERRNO); /* See xe_pci_probe() */
>
> static u32 to_relay_error(int err)
> {
>diff --git a/drivers/gpu/drm/xe/xe_guc_relay.h b/drivers/gpu/drm/xe/xe_guc_relay.h
>index 385429aa188ab..e0afff4542cfc 100644
>--- a/drivers/gpu/drm/xe/xe_guc_relay.h
>+++ b/drivers/gpu/drm/xe/xe_guc_relay.h
>@@ -11,7 +11,7 @@
>
> struct xe_guc_relay;
>
>-int xe_guc_relay_init(struct xe_guc_relay *relay);
>+int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay);
>
> int xe_guc_relay_send_to_pf(struct xe_guc_relay *relay,
> 			    const u32 *msg, u32 len, u32 *buf, u32 buf_size);
>diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
>index fa1c45e704432..bc6f93028c2b6 100644
>--- a/drivers/gpu/drm/xe/xe_huc.h
>+++ b/drivers/gpu/drm/xe/xe_huc.h
>@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
> 	XE_HUC_AUTH_TYPES_COUNT
> };
>
>+int xe_huc_init_noalloc(struct xe_huc *huc);

^ there is no such function defined

> int xe_huc_init(struct xe_huc *huc);
> int xe_huc_init_post_hwconfig(struct xe_huc *huc);
> int xe_huc_upload(struct xe_huc *huc);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2e..45d0c2f26754c 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -32,6 +32,27 @@ uc_to_xe(struct xe_uc *uc)
> }
>
> /* Should be called once at driver load only */
>+int xe_uc_init_noalloc(struct xe_uc *uc)
>+{
>+	int ret;
>+
>+	/*
>+	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
>+	 * to correctly move our tracking of the FW state to "disabled".

why do we huc/gsc care about the guc submission being off? It seems we
can part ways with this comment at all.

>+	 */
>+	ret = xe_guc_init_noalloc(&uc->guc);
>+	if (ret)
>+		goto err;
>+
>+	/* HuC and GSC have no early dependencies and can be completely initialised during full xe_uc_init(). */

per this comment it seems there's no plan for a xe_huc_init_noalloc(),
so that declaration can be removed.

Lucas De Marchi

>+
>+	return 0;
>+
>+err:
>+	xe_gt_err(uc_to_gt(uc), "Failed to early initialize uC (%pe)\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_uc_init(struct xe_uc *uc)
> {
> 	int ret;
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index 506517c113339..650e95585b4ba 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -8,6 +8,7 @@
>
> struct xe_uc;
>
>+int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_hwconfig(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>-- 
>2.45.2
>
