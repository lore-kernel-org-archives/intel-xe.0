Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17805D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 18:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90B810E0C4;
	Fri, 15 Nov 2024 18:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9rMnpNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB1E10E17B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731697026; x=1763233026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+T3LHzgTU6L2DHkyEZohcZ+ObYZKgtVPR3wa6EpfDck=;
 b=b9rMnpNozJTv7Svfkz5NIfj+qgv8+Db16luPPICP/umhWJjQWIqLKYpp
 frzQBSFOBGmDRhpN0Wzi1m7Gfr1J5P5jkLMMJ+Tvp4AAcuC7JQTI0ZPUZ
 /ABxp2ddGlnwADdkE6v+044hgGUYCOriWL+NebLXcNNbpAHUz4J+KfO6M
 B+vF2aAU5x+FOcByStecZuH2t0Q8tH9N43ylX27O2KWKoZoLLaerdMUq6
 RK6K7bOLP/gwu5ncryOB5mBo6JjpnzBVB0lBSBBinJHzd+O87Kk7vkmfP
 6D/lJKE1+YB/D32I8AnkvVHqUFk3h/XG4/TRLWIVGRrR0AhwKkC9OUo/H g==;
X-CSE-ConnectionGUID: eayJXMbzS6euWX8wy0sOsw==
X-CSE-MsgGUID: x8KD4/0mSfqhQzPe3XJ2SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="43110512"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="43110512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:57:06 -0800
X-CSE-ConnectionGUID: obUV/Fj5ROS9vOK79KBqLQ==
X-CSE-MsgGUID: ndPHvsLjR/uoYTDHL4gGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119479193"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.108])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:57:06 -0800
Date: Fri, 15 Nov 2024 12:56:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "brian.welty@intel.com" <brian.welty@intel.com>, 
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, 
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Message-ID: <f34ezr2xwkzxhd6h6vcetpertkg46jnffmjmbbnx2xtht2nefx@ysn2rc5grkdf>
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
 <la7edkqhnhjs2vuy7eihivskiqwbqtm3tpnu4alyreqgi5lwn4@chzwysy5jiri>
 <CH0PR11MB5444A7503D73D9D2B4C287C6E5242@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444A7503D73D9D2B4C287C6E5242@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Fri, Nov 15, 2024 at 11:28:25AM -0600, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Thursday, November 14, 2024 4:31 PM
>To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; brian.welty@intel.com; Roper, Matthew D <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>
>Subject: Re: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
>>
>> On Fri, Nov 01, 2024 at 10:23:50PM +0000, Jonathan Cavitt wrote:
>> >When performing a guc_mmio_regset_write, we add all the registers in the
>> >reg_sr list to the save/restore list, but do not do the same for the
>> >nonpriv registers.  Add them in.
>> >
>> >v2:
>> >- Add all NONPRIV registers to avoid undefined behavior (Harrison)
>> >- s/whitelist/nonpriv
>> >
>> >Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> >CC: Lucas de Marchi <lucas.demarchi@intel.com>
>> >CC: Matt Roper <matthew.d.roper@intel.com>
>> >CC: John Harrison <john.c.harrison@intel.com>
>> >CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
>> > 1 file changed, 7 insertions(+)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> >index 943146e5b460..b0afb89d9d90 100644
>> >--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> >+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> >@@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>> > 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>> > 			count++;
>> >
>> >+	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
>> >+
>> > 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>> >
>> > 	if (XE_WA(gt, 1607983814))
>> >@@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>> > 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>> > 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>> >
>> >+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>> >+		guc_mmio_regset_write_one(ads, regset_map,
>> >+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>> >+					  count++);
>>
>> I guess this fixes the issue. I'm still wondering why we are changing it
>> in the ads though.
>>
>> Ideally we'd do:
>>
>> a) switch the order in hw_engine_init() so it does:
>>
>> 	xe_reg_sr_apply_whitelist(hwe);
>> 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>>
>> b) change xe_reg_sr_apply_whitelist() so instead of writting the
>>     mmio slots by itself, it writes them to hwe->reg_sr
>>
>>
>> I **think** it would also work and stop handling the nonpriv slots as
>> snow flakes. They would also show up in debugfs/.../register-save-restore
>> file.
>>
>> Can you give it a try?  If it doesn't work, feel free to
>> add my
>>
>> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> and we can try to polish it later.
>
>Thank you for the conditional RB.  Here's what I attempted WRT this request:
>
>"""
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index c4b0dc3be39c..095df24c61b8 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -573,8 +573,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>        xe_gt_assert(gt, id < ARRAY_SIZE(engine_infos) && engine_infos[id].name);
>        xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>
>-       xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>        xe_reg_sr_apply_whitelist(hwe);
>+       xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>
>        hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>                                                 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index e1a0e27cda14..809a72767bde 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -234,6 +236,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>
>        p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
>        xa_for_each(&sr->xa, reg, entry) {
>+               struct xe_reg_sr_entry sr_entry = {
>+                       .reg = RING_FORCE_TO_NONPRIV(mmio_base, slot),
>+                       .clr_bits = entry->clr_bits,
>+                       .set_bits = reg | entry->set_bits,
>+                       .read_mask = entry->read_mask,
>+               };
>+
>                if (slot == RING_MAX_NONPRIV_SLOTS) {
>                        xe_gt_err(gt,
>                                  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>@@ -242,16 +251,19 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>                }
>
>                xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>-               xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
>-                               reg | entry->set_bits);
>+               xe_reg_sr_add(sr, &sr_entry, gt);
>                slot++;
>        }
>
>        /* And clear the rest just in case of garbage */
>        for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
>-               u32 addr = RING_NOPID(mmio_base).addr;
>-
>-               xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>+               struct xe_reg_sr_entry sr_entry = {
>+                       .reg = RING_FORCE_TO_NONPRIV(mmio_base, slot),
>+                       .clr_bits = 0,
>+                       .set_bits = RING_NOPID(mmio_base).addr,
>+                       .read_mask = 0,
>+               };
>+               xe_reg_sr_add(sr, &sr_entry, gt);

you need to add it to the hwe->reg_sr, not to the whitelist. There are
more things to be simplified as this doesn't touch the hw anymore (no
need for forcewake), it's probably in the wrong place now as it's not
really related to the reg_sr. Let's land the other previous patch and
maybe cleanup it later.


Lucas De Marchi

>        }
>
>        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>"""
>This didn't seem to have the intended effect, and xe_oa@mmio-triggered-reports test still failed
>after an engine reset.  Also, we seemed to be running up against the "if (xa_empty(&sr->xa))" case
>in xe_reg_sr_apply_whitelist, though I can't tell if that's normally what happens, or if it's a result
>of the hw_engine_init reordering.
>-Jonathan Cavitt
>
>>
>> thanks
>> Lucas De Marchi
>>
>> >+
>> > 	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>> > 		if (e->skip)
>> > 			continue;
>> >--
>> >2.43.0
>> >
>>
