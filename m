Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE08E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 21:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E17F10E582;
	Mon,  9 Dec 2024 21:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCjtSARl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9649C10E582
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733781210; x=1765317210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o0+b3y/cj8ERdnbIAARbgGNaNr5cEQsIAakljw1UUYk=;
 b=kCjtSARlqPd31dERTmWJ/jHOA66g177/bDmaCMALrnSu9HTo1ROFkWuQ
 3ryimEF7c7jYIIcz2WyNVSF3ezIWx9KvLo54f4OEB1yODJak/TlzqhCJ+
 qMMtp+b2jdQO+yQVlgHrFWploTGgRdeLzKTDCijsGi0X9dLWg4IzMzzQ7
 5KMwUqjrdWgnwy9QyyLTEiT2o/ZV4s39Go3hF/eYk20c6E1dmcHzNgvA1
 Qc7WhLoChKiYgY2kyNJnsmN0ShsrCy6F0rRgub/EAUZyw4hIrLjf2VI/4
 675IRdGA1bkHXGDdXCgbaIonlt2N884kw+z/70a30JQkzYcdAOBHNa8IB Q==;
X-CSE-ConnectionGUID: tIvsBPNWTHq6mo2mM5n42A==
X-CSE-MsgGUID: Mq8bv3dTQECat3bDzSNE6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33439211"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33439211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 13:53:30 -0800
X-CSE-ConnectionGUID: fAvahZwMQ7m6Ij378QDOCw==
X-CSE-MsgGUID: GvdN6kTSTDuTQ0APjkuF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="118443338"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.77])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 13:53:29 -0800
Date: Mon, 9 Dec 2024 13:53:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com
Subject: Re: [PATCH 5/5] drm/xe: Apply whitelist to engine save-restore
Message-ID: <zofkiibtetsflh7x3pxcdaqrfmghrquv64s2hducuxk7sfnpg5@e2s3uydb3tbx>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-6-lucas.demarchi@intel.com>
 <6d2c1813-d602-4509-9e7c-3de3f6f2d085@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6d2c1813-d602-4509-9e7c-3de3f6f2d085@intel.com>
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

On Thu, Dec 05, 2024 at 03:14:05PM -0800, John Harrison wrote:
>On 12/5/2024 10:22, Lucas De Marchi wrote:
>>Instead of handling the whitelist directly in the GuC ADS
>>initialization, make it follow the same logic as other engine registers
>>that are save-restored. Main benefit is that then the SW tracking then
>>shows it in debugfs and there's no risk of an engine workaround to write
>>to the same nopriv register that is being passed directly to GuC.
>>
>>This means that xe_reg_whitelist_process_engine() then only process the
>>RTP, converting it to sr entries and then add those entries to the
>What is 'RTP'? Isn't that just a generic term for any table of 

not any table, the table defined with the specific fields defined by xe_rtp.h
as documented in xe_rtp.c:

/**                                                                            
  * DOC: Register Table Processing                                              
  *                                                                             
  * Internal infrastructure to define how registers should be updated based on  
  * rules and actions. This can be used to define tables with multiple entries  
  * (one per register) that will be walked over at some point in time to apply  
  * the values to the registers that have matching rules.                       
  */

>registers? Also what is the 'sr' in xe_reg_sr? Is it meant to be 
>save/restore or something else entirely?

yes, save/restore


>It would be really useful to have some top level documentation 
>somewhere that says how the w/a, whitelist, etc. register lists are 
>handled - how they are constructed, how they are applied (in both the 
>KMD and the GuC), etc.


I can try to add later if noone beats me to it.

>
>
>>engine sr. With that all the registers should be covered by
>>xe_reg_sr_apply_mmio() to write to the HW and there's no special
>>handling in GuC ADS to also add these registers.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_gt.c            |  4 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |  7 ----
>>  drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
>>  drivers/gpu/drm/xe/xe_reg_sr.c        | 49 ----------------------
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 59 +++++++++++++++++++++++++++
>>  5 files changed, 60 insertions(+), 60 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index d6744be01a687..41ab7fbebc193 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
>>  	if (err)
>>  		return err;
>>-	for_each_hw_engine(hwe, gt, id) {
>>+	for_each_hw_engine(hwe, gt, id)
>>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>>-		xe_reg_sr_apply_whitelist(hwe);
>>-	}
>>  	/* Get CCS mode in sync between sw/hw */
>>  	xe_gt_apply_ccs_mode(gt);
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>index b0afb89d9d90c..943146e5b460d 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>@@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>>  			count++;
>>-	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
>>-
>>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>  	if (XE_WA(gt, 1607983814))
>>@@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>>  		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>>-	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>>-		guc_mmio_regset_write_one(ads, regset_map,
>>-					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>>-					  count++);
>>-
>>  	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>>  		if (e->skip)
>>  			continue;
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index c4b0dc3be39c3..b193667441488 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>  	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>>-	xe_reg_sr_apply_whitelist(hwe);
>>  	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>>  						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>>index ea958400a15a1..9475e3f749580 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>@@ -24,7 +24,6 @@
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>-#include "xe_reg_whitelist.h"
>>  #include "xe_rtp_types.h"
>>  static void reg_sr_fini(struct drm_device *drm, void *arg)
>>@@ -192,54 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>>  	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>>  }
>>-void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>-{
>>-	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>>-	struct xe_gt *gt = hwe->gt;
>>-	struct xe_reg_sr_entry *entry;
>>-	struct drm_printer p;
>>-	u32 mmio_base = hwe->mmio_base;
>>-	unsigned long reg;
>>-	unsigned int slot = 0;
>>-	unsigned int fw_ref;
>>-
>>-	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
>>-
>>-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>>-		goto err_force_wake;
>>-
>>-	p = xe_gt_dbg_printer(gt);
>>-	xa_for_each(&sr->xa, reg, entry) {
>>-		if (slot == RING_MAX_NONPRIV_SLOTS) {
>>-			xe_gt_err(gt,
>>-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>>-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>>-			break;
>>-		}
>>-
>>-		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>>-		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
>>-				reg | entry->set_bits);
>>-		slot++;
>>-	}
>>-
>>-	/* And clear the rest just in case of garbage */
>>-	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
>>-		u32 addr = RING_NOPID(mmio_base).addr;
>>-
>>-		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>>-	}
>>-
>>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>-
>>-	return;
>>-
>>-err_force_wake:
>>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>-	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>>-}
>>-
>>  /**
>>   * xe_reg_sr_dump - print all save/restore entries
>>   * @sr: Save/restore entries
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 3996934974fa0..0be105b305907 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -10,7 +10,9 @@
>>  #include "regs/xe_oa_regs.h"
>>  #include "regs/xe_regs.h"
>>  #include "xe_gt_types.h"
>>+#include "xe_gt_printk.h"
>>  #include "xe_platform_types.h"
>>+#include "xe_reg_sr.h"
>>  #include "xe_rtp.h"
>>  #include "xe_step.h"
>>@@ -89,6 +91,62 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  	{}
>>  };
>>+static int whitelist_add_to_hwe_sr(struct xe_reg_sr_entry *entry,
>>+				   unsigned int slot,
>>+				   struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
>>+		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>>+		.set_bits = entry->reg.addr | entry->set_bits,
>>+		.clr_bits = entry->set_bits,
>>+		.read_mask = entry->read_mask,
>>+	};
>>+
>>+	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>>+}
>>+
>>+static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
>>+					 struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_reg_sr_entry hwe_entry = (struct xe_reg_sr_entry) {
>>+		.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>>+		.set_bits = RING_NOPID(hwe->mmio_base).addr,
>>+		.clr_bits = ~0u,
>>+	};
>>+
>>+	return xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>>+}
>This function is effectively just this?
>
>static int whitelist_add_nopid_to_hwe_sr(unsigned int slot,
>					 struct xe_hw_engine *hwe) {
>	return whitelist_add_to_hwe_sr(RING_NOPID, slot, hwe);

one thing is the format kept by the whitelist where the key is the
register. Another thing is the register we actually write to the hw
which is specific to the whitelist stuff: n slots in which the register
address is part of the *value*.

That's why it was added the way it is, in a complete separate reg_sr
array and then converted to the right register at the time it needs to
be applied.  This patches it to be like below:

1) we still use a separate reg_sr for collecting all the registers from
the RTP.... this is basically done because the RTP infra knows how to
process the table into sr entries, but it's a bit overkill here. It may
be converted to a simpler xarray/linked-list in future.

2) loop through the whitelist entries and add the right register in the
engine sr array (same array where the tuning and WAs are saved)...
that array will later be applied via mmio and passed to GuC, which
eliminates the extra step we were doing for whitelist.


>}
>
>But there is no way to create an xe_reg_sr_entry from an XE_REG() that 
>is simpler than just doing it manually here?

see above, the entry is different. One has the reg as address, the other
has the slot as address.

>
>
>>+
>>+static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>>+	struct xe_reg_sr_entry *entry;
>>+	struct drm_printer p;
>>+	unsigned long reg;
>>+	unsigned int slot;
>>+
>>+	xe_gt_dbg(hwe->gt, "Whitelisting %s registers\n", sr->name);
>>+	p = xe_gt_dbg_printer(hwe->gt);
>>+
>>+	slot = 0;
>>+	xa_for_each(&sr->xa, reg, entry) {
>>+		if (slot == RING_MAX_NONPRIV_SLOTS) {
>>+			xe_gt_err(hwe->gt,
>>+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
>>+				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>>+			break;
>>+		}
>>+
>>+		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>>+		whitelist_add_to_hwe_sr(entry, slot, hwe);
>>+		slot++;
>>+	}
>>+
>>+	/* And clear the rest just in case of garbage */
>>+	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++)
>>+		whitelist_add_nopid_to_hwe_sr(slot, hwe);
>Note that RING_MAX_NONPRIV_SLOTS is short. There are actually 20 
>NONPRIV registers on newer platforms. It's just that regs 12 onwards 
>are somewhat scattered and not consecutive addresses with the first 
>12. We should really be splatting all of them not just the first few.

I'm actually dropping that in v2 until we need it

Lucas De Marchi
