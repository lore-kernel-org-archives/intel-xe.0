Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3260BE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457910E24F;
	Mon,  9 Oct 2023 09:49:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A23B10E24F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696844965; x=1728380965;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=i/l97CkTpUImYunaQUrD72GrOJBdbV/W/riJbe6e5T8=;
 b=iHOZ1TLtnEGYVjJWknsZ/EXAlzNuixB5HWjjrb7k2lIwuuLPFG1GIxGJ
 d/FzRA3kaBjVsFJeZ5CJuQ7esJnBJ+8BXxMUhOc4d60xyuSNqN/QUuWKa
 UBBEO6PCA2M8vt+fbO8MzmdbdQJuYovQnyPiV5l1iUN1fmO85pw0oahVc
 4YrscX+PXuFShmXPl1rmFc+QUsN0ZBseapZMfOH/FukASNFD4ED10TuTB
 5cu6eSPw/GXmn/xRc+byowY/IGYF+g4o7OszHjIlR39YAvnsULqLvUM6r
 5dC2QVKCXZHO2ky1Q3Sb6I6PqqDUy9SbW+QVnoOTbJPPNb7QJNfjypPKh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="415097193"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415097193"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084274981"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084274981"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:49:16 -0700
Message-ID: <a136ed15-ade1-a2ef-9e48-4ab5faa96bdc@linux.intel.com>
Date: Mon, 9 Oct 2023 15:22:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error
 handling for PVC.
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


On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
> Report the SOC fatal hardware error and update the counters which will
> increment incase of error.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
>  drivers/gpu/drm/xe/xe_hw_error.c             | 170 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
>  3 files changed, 254 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> index fa16eaf9436b..04701c62f0d9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -20,4 +20,32 @@
>  #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
>  								(base) + _GSC_HEC_CORR_ERR_STATUS, \
>  								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
> +#define SOC_PVC_BASE	               0x00282000
> +#define SOC_PVC_SLAVE_BASE             0x00283000

why do we need to prepend the register defines with 0s ?.

> +
> +#define _SOC_LERRCORSTS		       0x000294
> +#define _SOC_LERRUNCSTS		       0x000280
> +#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
> +								(base) + _SOC_LERRUNCSTS : \
> +								(base) + _SOC_LERRCORSTS)
> +
> +#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
> +								(base) + _SOC_LERRUNCSTS : \
> +								(base) + _SOC_LERRCORSTS)
> +#define _SOC_GSYSEVTCTL		        0x000264
> +
> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
> +								(base) + _SOC_GSYSEVTCTL, \
> +								slave_base + _SOC_GSYSEVTCTL))
> +#define _SOC_GCOERRSTS		        0x000200
> +#define _SOC_GNFERRSTS		        0x000210
> +#define _SOC_GFAERRSTS		        0x000220
> +#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
> +								(base) + _SOC_GCOERRSTS, \
> +								(base) + _SOC_GNFERRSTS))
> +
> +#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
> +								(base) + _SOC_GCOERRSTS, \
> +								(base) + _SOC_GNFERRSTS))
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 76ae12df013c..fa05bad5e684 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
>  	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
>  };
>  
> +static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_fatal[] = {
> +	[0]         = {"MASTER LOCAL Reported",			XE_SOC_HW_ERR_MSTR_LCL_FATAL},
> +	[1]         = {"SLAVE GLOBAL Reported",			XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
I don't think we shall count the first 2 bits as they just specify which IEH reported error and not
the error itself.

May be you can introduce an enum XE_HW_ERR_UNSPEC before the max and use it to identify anything
that we do not want to count.
> +	[2]         = {"HBM SS0: Channel0",			XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
> +	[3]         = {"HBM SS0: Channel1",			XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
> +	[4]         = {"HBM SS0: Channel2",			XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
> +	[5]         = {"HBM SS0: Channel3",			XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
> +	[6]         = {"HBM SS0: Channel4",			XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
> +	[7]         = {"HBM SS0: Channel5",			XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
> +	[8]         = {"HBM SS0: Channel6",                     XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
> +	[9]         = {"HBM SS0: Channel7",                     XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
> +	[10]        = {"HBM SS1: Channel0",                     XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
> +	[11]        = {"HBM SS1: Channel1",                     XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
> +	[12]        = {"HBM SS1: Channel2",                     XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
> +	[13]        = {"HBM SS1: Channel3",                     XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
> +	[14]        = {"HBM SS1: Channel4",                     XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
> +	[15]        = {"HBM SS1: Channel5",                     XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
> +	[16]        = {"HBM SS1: Channel6",                     XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
> +	[17]        = {"HBM SS1: Channel7",                     XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
> +	[18]	    = {"PUNIT",					XE_SOC_HW_ERR_PUNIT_FATAL},
> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +};
> +
> +static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_fatal[] = {
> +	[0]         = {"SLAVE LOCAL Reported",			XE_SOC_HW_ERR_SLAVE_LCL_FATAL},

same here as above.

> +	[1]         = {"HBM SS2: Channel0",			XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
> +	[2]         = {"HBM SS2: Channel1",			XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
> +	[3]         = {"HBM SS2: Channel2",			XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
> +	[4]         = {"HBM SS2: Channel3",			XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
> +	[5]         = {"HBM SS2: Channel4",			XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
> +	[6]         = {"HBM SS2: Channel5",			XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
> +	[7]         = {"HBM SS2: Channel6",                     XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
> +	[8]         = {"HBM SS2: Channel7",                     XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
> +	[9]         = {"HBM SS3: Channel0",                     XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
> +	[10]        = {"HBM SS3: Channel1",                     XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
> +	[11]        = {"HBM SS3: Channel2",                     XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
> +	[12]        = {"HBM SS3: Channel3",                     XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
> +	[13]        = {"HBM SS3: Channel4",                     XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
> +	[14]        = {"HBM SS3: Channel5",                     XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
> +	[15]        = {"HBM SS3: Channel6",                     XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
> +	[16]        = {"HBM SS3: Channel7",                     XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
> +	[18]	    = {"ANR MDFI",				XE_SOC_HW_ERR_ANR_MDFI_FATAL},
> +	[17]        = {"Undefined",                             XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +};
> +
> +static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[] = {
> +	[0]         = {"Local IEH Internal: Malformed PCIe AER",     XE_SOC_HW_ERR_PCIE_AER_FATAL},
> +	[1]         = {"Local IEH Internal: Malformed PCIe ERR",     XE_SOC_HW_ERR_PCIE_ERR_FATAL},
> +	[2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",   XE_SOC_HW_ERR_UR_COND_FATAL},
> +	[3]         = {"Local IEH Internal: FROM SERR SOURCES",      XE_SOC_HW_ERR_SERR_SRCS_FATAL},
> +	[4 ... 31]  = {"Undefined",				     XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +};
> +
> +static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
> +	[0 ... 3]   = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +	[4]         = {"Base Die MDFI T2T",			XE_SOC_HW_ERR_MDFI_T2T_FATAL},
> +	[5]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +	[6]         = {"Base Die MDFI T2C",			XE_SOC_HW_ERR_MDFI_T2C_FATAL},
> +	[7]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +	[8]         = {"Invalid CSC PSF Command Parity",	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
> +	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
> +	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
> +	[11]        = {"Invalid PCIe PSF Command Parity",	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
> +	[12]        = {"PCIe PSF Unexpected Completion",	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
> +	[13]        = {"PCIe PSF Unsupported Request",		XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
> +	[14 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
> +};
> +
>  static void xe_assign_hw_err_regs(struct xe_device *xe)
>  {
>  	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> @@ -451,6 +520,104 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
>  }
>  
> +static void
> +xe_soc_log_err_update_cntr(struct xe_tile *tile,
> +			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
> +{
> +	const char *errmsg;
> +	u32 indx;
> +
> +	errmsg = reg_info[errbit].errmsg;
> +	indx = reg_info[errbit].cntr_indx;
> +
> +	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +			    "Tile%d %s SOC FATAL error, bit[%d] is set\n",
> +			    tile->id, errmsg, errbit);
> +	tile->errors.count[indx]++;
> +}
> +
> +static void
> +xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
> +	u32 errbit, base, slave_base;
> +	int i;
> +	struct xe_gt *gt = tile->primary_gt;
> +
> +	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
> +
> +	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err != HARDWARE_ERROR_FATAL)
> +		return;
> +
> +	base = SOC_PVC_BASE;
> +	slave_base = SOC_PVC_SLAVE_BASE;
> +
> +	/*
> +	 * Mask error type in GSYSEVTCTL so that no new errors of the type
> +	 * will be reported. Read the master global IEH error register if
> +	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
> +	 * global error register is set then process the corresponding
> +	 * Local error registers
> +	 */
> +	for (i = 0; i < PVC_NUM_IEH; i++)

PVC_NUM_IEH is defined as 1 so this will not process IEH1,
check below.
> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
> +
> +	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
> +	drm_info(&tile_to_xe(tile)->drm, HW_ERR
> +		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
> +		 tile->id, mst_glb_errstat);
> +
> +	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
> +		slv_glb_errstat = xe_mmio_read32(gt,
> +						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
> +		 drm_info(&tile_to_xe(tile)->drm, HW_ERR
> +			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
> +			  tile->id, slv_glb_errstat);
> +
> +		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
> +			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
> +										      hw_err));
> +			 drm_info(&tile_to_xe(tile)->drm, HW_ERR
> +				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
> +				  tile->id, lcl_errstat);
> +
> +			for_each_set_bit(errbit, &lcl_errstat, 32)
> +				xe_soc_log_err_update_cntr(tile, errbit,
> +							   soc_slave_lcl_err_reg_fatal);
> +
> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +					lcl_errstat);
> +		}
> +
> +		for_each_set_bit(errbit, &slv_glb_errstat, 32)
> +			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
> +
> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +				slv_glb_errstat);
> +	}
> +
> +	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
> +		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
> +		drm_info(&tile_to_xe(tile)->drm, HW_ERR "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
> +			 lcl_errstat);
> +
> +		for_each_set_bit(errbit, &lcl_errstat, 32)
> +			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
> +
> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
> +	}
> +
> +	for_each_set_bit(errbit, &mst_glb_errstat, 32)
> +		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
> +
> +	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
> +			mst_glb_errstat);
> +
> +	for (i = 0; i < PVC_NUM_IEH; i++)

same here

> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +				(HARDWARE_ERROR_MAX << 1) + 1);
> +}
> +
>  static void
>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
> @@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>  
>  		if (errbit == 8)
>  			xe_gsc_hw_error_handler(tile, hw_err);
> +
> +		if (errbit == 16)

Please define the bits along with respective register and use here.
> +			xe_soc_hw_error_handler(tile, hw_err);
>  	}
>  
>  	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index ee7705b3343b..05838e082abd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
>  	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
>  	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
>  	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
> +	XE_SOC_HW_ERR_MSTR_LCL_FATAL,
> +	XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
> +	XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
> +	XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
> +	XE_SOC_HW_ERR_PUNIT_FATAL,
> +	XE_SOC_HW_ERR_UNKNOWN_FATAL,
> +	XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
> +	XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
> +	XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
> +	XE_SOC_HW_ERR_ANR_MDFI_FATAL,
> +	XE_SOC_HW_ERR_PCIE_AER_FATAL,
> +	XE_SOC_HW_ERR_PCIE_ERR_FATAL,
> +	XE_SOC_HW_ERR_UR_COND_FATAL,
> +	XE_SOC_HW_ERR_SERR_SRCS_FATAL,
> +	XE_SOC_HW_ERR_MDFI_T2T_FATAL,
> +	XE_SOC_HW_ERR_MDFI_T2C_FATAL,
> +	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
> +	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
> +	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
> +	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
> +	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
> +	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
we have convention in naming, it shall be source_typeoferror_errorname
this we shall follow everywhere even when we expose these counter to userspace.

eg: XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD


>  	XE_TILE_HW_ERROR_MAX,
>  };
>  
> @@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
>  	XE_GT_HW_ERROR_MAX,
>  };
>  
> -#define ERR_STAT_GT_COR_VCTR_LEN (4)
> -#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
> +#define ERR_STAT_GT_COR_VCTR_LEN	(4)
> +#define ERR_STAT_GT_FATAL_VCTR_LEN	(8)
> +#define PVC_NUM_IEH			(1)

ideally this shall be defined with 2, as we have 2 IEHs

you can define something like:

enum xe_soc_num_ieh {
    XE_SOC_MASTER_IEH = 0,
    XE_SOC_SLAVE_IEH,
    XE_SOC_NUM_IEH
}
> +#define SOC_SLAVE_IEH                   (1)
> +#define SOC_IEH0_LOCAL_ERR_STATUS       (0)
> +#define SOC_IEH1_LOCAL_ERR_STATUS       (0)
there ERR_STATUS be better defined with registers as
>  
>  struct err_msg_cntr_pair {
>  	const char *errmsg;
Thanks,
Aravind.
