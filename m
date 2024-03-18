Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5111C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62810F0EC;
	Mon, 18 Mar 2024 21:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="oQGubViv";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4744A10EA3D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:12:21 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1710796335; bh=SBKRBfsVX+uk8vlY4dVVKmBg0cGFhNuMLBfzYHWNeaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oQGubVivu0Iwb2UfMGBp4alUELas6+YIV1/DPAmNsptEnOFfDamxq+71dA3tJMghS
 m58uFxNJtn3wOxMNmpHohpQ+/dcGZLHZyVjmbUlwUfGO/RitSGOx/TyosS8aVOOwPf
 OldGRmasS1TPjnTRRnrFsyoz0dJA6AzmEi8vhpFxbo+BbViczhKKzbyUac50QYs9Lh
 +OoLxEbv2WH9/IrIDVl+kXEH/fgooXkTezMfF0gU6CKpUFvG1oXjpE1oXd+9ZGzzN7
 jnpTajgDin+KbU+8LLYdaiVyh71hcgYzKNhQTe8GyuAyP9IW37aCXCssu/nypiyJ8H
 YiNn9tsGwvzfg==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 42ILCAUM470987; Mon, 18 Mar 2024 23:12:10 +0200
Date: Mon, 18 Mar 2024 23:12:10 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <knthwwkn3a4oucvvprgg56lks5a2zgb3n5wegiisdkmlyp6jdr@yq5j5zggqbgr>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-6-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315140108.217862-6-rodrigo.vivi@intel.com>
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

On 15.03.2024 10:01, Rodrigo Vivi wrote:
>So, the busted mode can be selected at runtime with the device
>granularity, rather then a module policy.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c | 12 +++++++++
> drivers/gpu/drm/xe/xe_guc_ads.c | 46 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_ads.h |  1 +
> 3 files changed, 59 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 175ba306c3eb..0cd20862d32e 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -12,6 +12,7 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_gt_debugfs.h"
>+#include "xe_guc_ads.h"
> #include "xe_pm.h"
> #include "xe_step.h"
>
>@@ -124,8 +125,10 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> 			       size_t size, loff_t *pos)
> {
> 	struct xe_device *xe = file_inode(f)->i_private;
>+	struct xe_gt *gt;
> 	u32 busted_mode;
> 	ssize_t ret;
>+	u8 id;
>
> 	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
> 	if (ret)
>@@ -136,6 +139,15 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
>
> 	mutex_lock(&xe->busted.lock);
> 	xe->busted.mode = busted_mode;
>+	if (busted_mode == 2) {
>+		for_each_gt(gt, xe, id) {
>+			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
>+			if (ret) {
>+				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the busted_mode=2\n");
>+				break;
>+			}
>+		}
>+	}
> 	mutex_unlock(&xe->busted.lock);
>
> 	return size;
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 43f0a88bbe8a..5dccdbe595bf 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -7,6 +7,7 @@
>
> #include <drm/drm_managed.h>
>
>+#include "abi/guc_actions_abi.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
>@@ -14,6 +15,7 @@
> #include "xe_gt.h"
> #include "xe_gt_ccs_mode.h"
> #include "xe_guc.h"
>+#include "xe_guc_ct.h"
> #include "xe_hw_engine.h"
> #include "xe_lrc.h"
> #include "xe_map.h"
>@@ -679,3 +681,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> {
> 	guc_populate_golden_lrc(ads);
> }
>+
>+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
>+{
>+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
>+	u32 action[] = {
>+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
>+		policy_offset
>+	};
>+
>+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>+}
>+
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
>+{
>+	struct xe_device *xe = ads_to_xe(ads);
>+	struct xe_gt *gt = ads_to_gt(ads);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct guc_policies *policies;
>+	struct xe_bo *bo;
>+	int ret = 0;
>+
>+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>+	if (!policies)
>+		return -ENOMEM;
>+
>+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>+	policies->is_valid = 1;
>+	if (xe->busted.mode == 2)
>+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+
>+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
>+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>+					    XE_BO_CREATE_GGTT_BIT);

Hi,
This commit title is identical to the previous commit in this patchset. I think better
to change it to avoid confusion.
Also, the 'bo' created here is only released upon device release right? It can be releasejhlhhhhajhhhaas
immediately.

Thank,
Dafna

>+	if (IS_ERR(bo)) {
>+		ret = PTR_ERR(bo);
>+		goto out;
>+	}
>+
>+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
>+out:
>+	kfree(policies);
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>index 138ef6267671..7c45c40fab34 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
> void xe_guc_ads_populate(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
> void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
>
> #endif
>-- 
>2.44.0
>
