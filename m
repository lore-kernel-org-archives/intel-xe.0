Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D2D25B48
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 12:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EA910E6C3;
	Wed, 28 Jan 2026 12:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6JUMwgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4512F10E6C3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769604385; x=1801140385;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6CPKl2PvI60opOwMyW7igGwa0tk/bmTYWDlH99u8B7Q=;
 b=G6JUMwgni7jbcoiVIDMnBKBacVdeTj1HtdP45em7QSfbVbm6dJAsWUeY
 bnGzPOtLHjkkHlWQcvkSJzXt2re75mSXT3h12zGGpFSD48ebvGCbeZrdb
 FuFhPAKWaUrBIIlLn1yK9fpPM9Cu/bmetFOjRcxIrCC7hH/eSUCc0bUHF
 LT9lbQhMFrnw3nj1y2HJCBIU8nt+pN7VBr8XJTeZ/oUVlY//lvjpFyhDf
 H/6U1QLZMw/22VQlm5nlwQ2Ee3mSeiFhG8h9zKJ6lmjA6C8UuAaWxWhrt
 OyXYAbXM8QUi13YQvSwFfiqrU/B9+vpk5V/ngC9EgslnS+tcZpwT7sUXv A==;
X-CSE-ConnectionGUID: b8W/JohORuiwT8GubjGk7g==
X-CSE-MsgGUID: VXTOCu2VR9SeS7tdmBlfiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81537708"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81537708"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:46:25 -0800
X-CSE-ConnectionGUID: 2tbQYFFDTzqbr0ChkLTeFQ==
X-CSE-MsgGUID: uuPjY4FbTruDqfviNzCPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245865398"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:46:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:46:17 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 5/5] drm/xe/vsec: Crescent Island PMT callbacks
In-Reply-To: <20260127182418.640701-12-michael.j.ruhl@intel.com>
Message-ID: <4d9d416c-5aa3-1d65-f2bb-4159efd343c4@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-12-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> CRI PMT support requires callbacks to access the discovery status
> and control areas.  Access is a common MMIO area that requires an
> index to be set before access is allowed.
> 
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 84 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4bddc22d86c7..c5b0c16f23be 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -300,17 +300,89 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	return count;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @pdev: the pcie device that register the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + *

An extra empty line.

-- 
 i.

> + */
> +static int xe_pmt_read_reg(struct pci_dev *pdev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_write_reg(struct pci_dev *pdev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static struct pmt_callbacks xe_cri_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
>  };
>  
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -338,8 +410,14 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		break;
>  	}
> 

