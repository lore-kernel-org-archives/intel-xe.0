Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D6C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 17:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4D310E656;
	Fri,  5 May 2023 17:00:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935BF10E645
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 17:00:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D443B63F2C;
 Fri,  5 May 2023 17:00:15 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 36E68C433EF;
 Fri,  5 May 2023 17:00:13 +0000 (UTC)
Date: Fri, 5 May 2023 13:00:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFU2G7Bc5XhWfZ4F@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429062332.354139-7-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe: Rename reg field to addr
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 11:23:31PM -0700, Lucas De Marchi wrote:
> Rename the address field to "addr" rather than "reg" so it's easier to
> understand what it is.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

ops, another one impacted by the rebase... sorry


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h  |  6 +++---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c     |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c            |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c        |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  8 ++++----
>  drivers/gpu/drm/xe/xe_irq.c            |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c           |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.h           | 26 +++++++++++++-------------
>  drivers/gpu/drm/xe/xe_mocs.c           |  6 +++---
>  drivers/gpu/drm/xe/xe_pci.c            |  2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c         |  6 +++---
>  drivers/gpu/drm/xe/xe_ring_ops.c       |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.c            |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c          |  4 ++--
>  16 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index da781bc7bdc7..4554362ff4d9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -18,8 +18,8 @@
>  struct xe_reg {
>  	union {
>  		struct {
> -			/** @reg: address */
> -			u32 reg:22;
> +			/** @addr: address */
> +			u32 addr:22;
>  			/**
>  			 * @masked: register is "masked", with upper 16bits used
>  			 * to identify the bits that are updated on the lower
> @@ -71,7 +71,7 @@ struct xe_reg_mcr {
>   * object of the right type. However when initializing static const storage,
>   * where a compound statement is not allowed, this can be used instead.
>   */
> -#define XE_REG_INITIALIZER(r_, ...)    { .reg = r_, __VA_ARGS__ }
> +#define XE_REG_INITIALIZER(r_, ...)    { .addr = r_, __VA_ARGS__ }
>  
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index ad2fe8a39a78..4b2aac5ccf28 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -244,7 +244,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
>  
>  	xa_for_each(&reg_sr->xa, idx, sre) {
> -		if (idx == param->expected_reg.reg)
> +		if (idx == param->expected_reg.addr)
>  			sr_entry = sre;
>  
>  		count++;
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 363b81c3d746..f0f0592fc598 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -129,7 +129,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>  		for_each_if((domain__ = ((fw__)->domains + \
>  					 (ffs(tmp__) - 1))) && \
> -					 domain__->reg_ctl.reg)
> +					 domain__->reg_ctl.addr)
>  
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 2461e51c0abf..6a9be9d031d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -398,7 +398,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  	 */
>  	drm_WARN(&gt_to_xe(gt)->drm, true,
>  		 "Did not find MCR register %#x in any MCR steering table\n",
> -		 reg.reg);
> +		 reg.addr);
>  	*group = 0;
>  	*instance = 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 12b636910460..af7b09086358 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -721,7 +721,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		response_buf[0] = header;
>  
>  		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
> -			reply_reg.reg += i * sizeof(u32);
> +			reply_reg.addr += i * sizeof(u32);
>  			response_buf[i] = xe_mmio_read32(gt, reply_reg);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 683f2df09c49..6d550d746909 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -426,7 +426,7 @@ static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>  				      unsigned int n_entry)
>  {
>  	struct guc_mmio_reg entry = {
> -		.offset = reg.reg,
> +		.offset = reg.addr,
>  		.flags = reg.masked ? GUC_REGSET_MASKED : 0,
>  	};
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d1b7ac35c4a0..e62662bc3a86 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -235,20 +235,20 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  				   u32 val)
>  {
> -	XE_BUG_ON(reg.reg & hwe->mmio_base);
> +	XE_BUG_ON(reg.addr & hwe->mmio_base);
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
> -	reg.reg += hwe->mmio_base;
> +	reg.addr += hwe->mmio_base;
>  
>  	xe_mmio_write32(hwe->gt, reg, val);
>  }
>  
>  static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  {
> -	XE_BUG_ON(reg.reg & hwe->mmio_base);
> +	XE_BUG_ON(reg.addr & hwe->mmio_base);
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
> -	reg.reg += hwe->mmio_base;
> +	reg.addr += hwe->mmio_base;
>  
>  	return xe_mmio_read32(hwe->gt, reg);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7aa245792927..5bf359c81cc5 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -36,7 +36,7 @@ static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>  
>  	drm_WARN(&gt_to_xe(gt)->drm, 1,
>  		 "Interrupt register 0x%x is not zero: 0x%08x\n",
> -		 reg.reg, val);
> +		 reg.addr, val);
>  	xe_mmio_write32(gt, reg, 0xffffffff);
>  	xe_mmio_read32(gt, reg);
>  	xe_mmio_write32(gt, reg, 0xffffffff);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0e91004fa06d..c7fbb1cc1f64 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -421,7 +421,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  		unsigned int i;
>  
>  		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
> -			if (mmio_read_whitelist[i].reg == args->addr) {
> +			if (mmio_read_whitelist[i].addr == args->addr) {
>  				allowed = true;
>  				break;
>  			}
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 0f792a196545..3b722ff0428e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,18 +21,18 @@ int xe_mmio_init(struct xe_device *xe);
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   struct xe_reg reg, u32 val)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	writel(val, gt->mmio.regs + reg.reg);
> +	writel(val, gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	return readl(gt->mmio.regs + reg.reg);
> +	return readl(gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> @@ -50,18 +50,18 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>  static inline void xe_mmio_write64(struct xe_gt *gt,
>  				   struct xe_reg reg, u64 val)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	writeq(val, gt->mmio.regs + reg.reg);
> +	writeq(val, gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	return readq(gt->mmio.regs + reg.reg);
> +	return readq(gt->mmio.regs + reg.addr);
>  }
>  
>  static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> @@ -119,7 +119,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  static inline bool xe_mmio_in_range(const struct xe_mmio_range *range,
>  				    struct xe_reg reg)
>  {
> -	return range && reg.reg >= range->start && reg.reg <= range->end;
> +	return range && reg.addr >= range->start && reg.addr <= range->end;
>  }
>  
>  int xe_mmio_probe_vram(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 7ad43e53f826..3ab58b267bda 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -478,7 +478,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
>  	     i++) {
>  		struct xe_reg reg = XE_REG(addr + i * 4);
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.reg, mocs);
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
>  		xe_mmio_write32(gt, reg, mocs);
>  	}
>  }
> @@ -513,7 +513,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).reg,
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
>  			 l3cc);
>  		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
>  	}
> @@ -533,7 +533,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	gt->mocs.wb_index = table.wb_index;
>  
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).reg);
> +		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8687e51cb0a4..6e55809cfb3d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -393,7 +393,7 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  
>  static u32 peek_gmdid(struct xe_device *xe, struct xe_reg gmdid_reg)
>  {
> -	u32 gmdid_offset = gmdid_reg.reg;
> +	u32 gmdid_offset = gmdid_reg.addr;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>  	u32 ver;
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 51a40a9e532d..0312823101ad 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -93,7 +93,7 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e)
>  {
> -	unsigned long idx = e->reg.reg;
> +	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
>  	int ret;
>  
> @@ -174,7 +174,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	 */
>  	val |= entry->set_bits;
>  
> -	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.reg, val);
> +	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
>  
>  	if (entry->reg.mcr)
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
> @@ -239,7 +239,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  
>  	/* And clear the rest just in case of garbage */
>  	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
> -		u32 addr = RING_NOPID(mmio_base).reg;
> +		u32 addr = RING_NOPID(mmio_base).addr;
>  
>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index efc59eb4a491..7d90ffa16078 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -48,7 +48,7 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
>  			      u32 *dw, int i)
>  {
>  	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> -	dw[i++] = reg.reg + gt->mmio.adj_offset;
> +	dw[i++] = reg.addr + gt->mmio.adj_offset;
>  	dw[i++] = AUX_INV;
>  	dw[i++] = MI_NOOP;
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index f2a0e8eb4936..0c6a23e14a71 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -101,7 +101,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  		.read_mask = action->read_mask,
>  	};
>  
> -	sr_entry.reg.reg += mmio_base;
> +	sr_entry.reg.addr += mmio_base;
>  	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 11eea970c207..35fde8965bca 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -170,10 +170,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  err_out:
>  	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> -		   DMA_GUC_WOPCM_OFFSET.reg,
> +		   DMA_GUC_WOPCM_OFFSET.addr,
>  		   xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET));
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> -		   GUC_WOPCM_SIZE.reg,
> +		   GUC_WOPCM_SIZE.addr,
>  		   xe_mmio_read32(gt, GUC_WOPCM_SIZE));
>  
>  	return err;
> -- 
> 2.40.1
> 
