Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF2E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 05:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D121310E5E6;
	Fri,  6 Dec 2024 05:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmP9iOXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812EA10E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733461580; x=1764997580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L9rH4SkBVERCtTFlyKtWjH/dFNUy7zIgCAWhN90Srmc=;
 b=DmP9iOXGjJPrXzcmMfFP2aAgmnGHm/wSJwKY77+ouHiCzHhUlw6YGJMB
 JL/3wca8buWUo9RMA8iXxUpZcR8VejvabjOFkZoG9RlNgOESnPxRkQM8l
 9ot0XH417Fg+/CtpDL3INgm1aGWI/7VBYZy74j5K7/Zp5PT65CBu0nbPP
 PUfHIO8+juswpmbTn85XZFKBRKS3eqiu3kwNu1L3yJe3ndSG8iNsYSDP0
 nQFY/2h40bFJxO+RIi6mISi374LsIkBywzVkeQsAo9q1UFQMyJhJxBRfH
 I4x01mzCPgUs2w2j3g5Yf36wG1rbfINyjPkxLN0pxDQJ1LSMdHoIPKb1n Q==;
X-CSE-ConnectionGUID: x2MfAikbQ4OURt7LaTaCdA==
X-CSE-MsgGUID: hIi22Z/TR4aOtgPfrErdbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33154903"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33154903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:06:20 -0800
X-CSE-ConnectionGUID: HObd+FGqTeiXwX/niW+2gQ==
X-CSE-MsgGUID: JPOBLWFBQ2mIaYCrob6A/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="98752518"
Received: from jdoman-desk1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.215])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:06:20 -0800
Date: Thu, 5 Dec 2024 23:06:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
Subject: Re: [PATCH 5/5] drm/xe: Apply whitelist to engine save-restore
Message-ID: <xppqdr3qkdaktmyzueifrz3g4lkggozgbq74hle4bbmmp7snjn@g7rd7rk6mvqv>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-6-lucas.demarchi@intel.com>
 <20241205204203.GF3224633@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241205204203.GF3224633@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Dec 05, 2024 at 12:42:03PM -0800, Matt Roper wrote:
>On Thu, Dec 05, 2024 at 10:22:40AM -0800, Lucas De Marchi wrote:
>> Instead of handling the whitelist directly in the GuC ADS
>> initialization, make it follow the same logic as other engine registers
>> that are save-restored. Main benefit is that then the SW tracking then
>> shows it in debugfs and there's no risk of an engine workaround to write
>> to the same nopriv register that is being passed directly to GuC.
>>
>> This means that xe_reg_whitelist_process_engine() then only process the
>> RTP, converting it to sr entries and then add those entries to the
>> engine sr. With that all the registers should be covered by
>> xe_reg_sr_apply_mmio() to write to the HW and there's no special
>> handling in GuC ADS to also add these registers.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c            |  4 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ----
>>  drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
>>  drivers/gpu/drm/xe/xe_reg_sr.c        | 49 ----------------------
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 59 +++++++++++++++++++++++++++
>>  5 files changed, 60 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d6744be01a687..41ab7fbebc193 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
>>  	if (err)
>>  		return err;
>>
>> -	for_each_hw_engine(hwe, gt, id) {
>> +	for_each_hw_engine(hwe, gt, id)
>>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>> -		xe_reg_sr_apply_whitelist(hwe);
>> -	}
>>
>>  	/* Get CCS mode in sync between sw/hw */
>>  	xe_gt_apply_ccs_mode(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index b0afb89d9d90c..943146e5b460d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>>  			count++;
>>
>> -	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
>> -
>>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>
>>  	if (XE_WA(gt, 1607983814))
>> @@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>>  		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>>
>> -	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>> -		guc_mmio_regset_write_one(ads, regset_map,
>> -					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>> -					  count++);
>> -
>>  	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>>  		if (e->skip)
>>  			continue;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index c4b0dc3be39c3..b193667441488 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>  	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>>
>>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>> -	xe_reg_sr_apply_whitelist(hwe);
>>
>>  	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>>  						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index ea958400a15a1..9475e3f749580 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -24,7 +24,6 @@
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>> -#include "xe_reg_whitelist.h"
>>  #include "xe_rtp_types.h"
>>
>>  static void reg_sr_fini(struct drm_device *drm, void *arg)
>> @@ -192,54 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>  	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>>  }
>>
>> -void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>> -{
>> -	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>> -	struct xe_gt *gt = hwe->gt;
>> -	struct xe_reg_sr_entry *entry;
>> -	struct drm_printer p;
>> -	u32 mmio_base = hwe->mmio_base;
>> -	unsigned long reg;
>> -	unsigned int slot = 0;
>> -	unsigned int fw_ref;
>> -
>> -	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
>> -
>> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>> -		goto err_force_wake;
>> -
>> -	p = xe_gt_dbg_printer(gt);
>> -	xa_for_each(&sr->xa, reg, entry) {
>> -		if (slot == RING_MAX_NONPRIV_SLOTS) {
>> -			xe_gt_err(gt,
>> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>> -			break;
>> -		}
>> -
>> -		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
>> -				reg | entry->set_bits);
>> -		slot++;
>> -	}
>> -
>> -	/* And clear the rest just in case of garbage */
>> -	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
>> -		u32 addr = RING_NOPID(mmio_base).addr;
>> -
>> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>> -	}
>> -
>> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -
>> -	return;
>> -
>> -err_force_wake:
>> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>> -}
>> -
>>  /**
>>   * xe_reg_sr_dump - print all save/restore entries
>>   * @sr: Save/restore entries
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index 3996934974fa0..0be105b305907 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -10,7 +10,9 @@
>>  #include "regs/xe_oa_regs.h"
>>  #include "regs/xe_regs.h"
>>  #include "xe_gt_types.h"
>> +#include "xe_gt_printk.h"
>>  #include "xe_platform_types.h"
>> +#include "xe_reg_sr.h"
>>  #include "xe_rtp.h"
>>  #include "xe_step.h"
>>
>> @@ -89,6 +91,62 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  	{}
>>  };
>>
>> +static int whitelist_add_to_hwe_sr(struct xe_reg_sr_entry *entry,
>> +				   unsigned int slot,
>> +				   struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
>> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>> +		.set_bits = entry->reg.addr | entry->set_bits,
>> +		.clr_bits = entry->set_bits,
>
>Should we just set clr_bits to ~0 since this entry is an exact setting
>for the entire register and we don't want to leave any of the flags (or
>currently unused bits) at their existing value?
>
>> +		.read_mask = entry->read_mask,
>> +	};
>> +
>> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>> +}
>> +
>> +static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
>> +					 struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
>> +		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>> +		.set_bits = RING_NOPID(hwe->mmio_base).addr,
>> +		.clr_bits = ~0u,
>> +	};
>> +
>> +	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>> +}
>> +
>> +static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>> +	struct xe_reg_sr_entry *entry;
>> +	struct drm_printer p;
>> +	unsigned long reg;
>> +	unsigned int slot;
>> +
>> +	xe_gt_dbg(hwe->gt, "Whitelisting %s registers\n", sr->name);
>> +	p = xe_gt_dbg_printer(hwe->gt);
>> +
>> +	slot = 0;
>> +	xa_for_each(&sr->xa, reg, entry) {
>> +		if (slot == RING_MAX_NONPRIV_SLOTS) {
>> +			xe_gt_err(hwe->gt,
>> +				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>> +				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>> +			break;
>> +		}
>> +
>> +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>> +		whitelist_add_to_hwe_sr(entry, slot, hwe);
>> +		slot++;
>> +	}
>> +
>> +	/* And clear the rest just in case of garbage */
>
>If we still want to keep this (which I'm not sure is even really
>important), I think we should change the comment.  We're not actually

agreed... I was very confused when I read this comment too.

>"clearing" anything (these registers don't have any kind of
>ignore/disable flag so they're always active).  We should elaborate that
>we're just repeatedly adding a specific known register in all the
>remaining entries just so that we know exactly what's in them and so
>that when debugging we have a well-known value we can compare against.
>Since that NOPID register is already userspace accessible without any
>explicit whitelisting, these extra entries will wind up not having any
>functional effect.

let me go the othe direction and simply drop it instead of what patch 2
is doing.

Lucas De Marchi
