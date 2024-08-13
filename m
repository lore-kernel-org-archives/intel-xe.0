Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F34C52D7B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 14:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506C10E367;
	Tue, 13 Aug 2024 14:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7SZ1gwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686610E366
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723558268; x=1755094268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yP42tp1EKZIXmizeIVPPkqaLg7MrakOsR6KTQIj6Qzo=;
 b=P7SZ1gwTa2gINWSjo3UVCVoS8k2mS8Ls5YImAlgjGml0p52vS5xnUVPY
 jPnxiruZDY5r8v7FaWVkCrXAelhd3pQBUMq8LPIotRGehEbuIPN1ZWOy6
 ToUtV3QPEIKMhtDrzDRclARgpBo22kJpCs8um1jgKNbSkr2dEh/oBj0zj
 2ewFI404VD62QgUAtZBMJQ84eYxgb47R9xuupJz1RQwT39chQk01TorYA
 IXW2a3G01sdoTESoKytEFcxZZyaYjNYHzXKqS0ioA6mNBzjPwVWkHsatz
 Sjz/IujmkfHoRGTSoM24PHjt+5F7O7IQOY+4eMd2mJvd8Bi2OjTvxnWj1 Q==;
X-CSE-ConnectionGUID: Y5K89uaPQba9h2Gmw7Subw==
X-CSE-MsgGUID: w89XYdENRpGVw9WvH8uN6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21367538"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21367538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:11:08 -0700
X-CSE-ConnectionGUID: xLvWgcslSRSHbZUN8q8ZnA==
X-CSE-MsgGUID: CxDpHyeMR6eYZlQRBgDAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="59237391"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:11:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdsEp-0000000ErHe-1I8R; Tue, 13 Aug 2024 17:11:03 +0300
Date: Tue, 13 Aug 2024 17:11:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, hdegoede@redhat.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
Message-ID: <Zrtpd_WwougszltH@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812200422.444078-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Aug 12, 2024 at 04:04:22PM -0400, Michael J. Ruhl wrote:
> The Battlemage (BMG) discrete graphics card supports
> the Platform, Monitoring Technology (PMT) feature
> directly on the primary PCI device.
> 
> Utilize the PMT callback API to add support for the BMG
> devices.

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>

...

> +#define SOC_BASE		0x280000
> +
> +#define BMG_PMT_BASE		0xDB000
> +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)

> +#define BMG_TELEMETRY_BASE	0xE0000
> +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)

This looks like double indirection.
Wouldn't suffix _BASE_OFFSET be better for PMT and TELEMETRY cases?

...

> +#define BMG_DEVICE_ID 0xE2F8

Is this defined in any specification? I mean is the format the same as PCI device ID?

...

> +#define GFX_BAR			0

Do you need a separate definition for this?

...

> +enum record_id {
> +	PUNIT,
> +	OOBMSM_0,
> +	OOBMSM_1

Trailing comma?

> +};
> +
> +enum capability {
> +	CRASHLOG,
> +	TELEMETRY,
> +	WATCHER

Ditto?

> +};

...

> +	switch (record_id) {
> +	case PUNIT:
> +		*index = 0;
> +		if (cap_type == TELEMETRY)
> +			*offset = PUNIT_TELEMETRY_OFFSET;
> +		else
> +			*offset = PUNIT_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index = 1;
> +		if (cap_type == WATCHER)
> +			*offset = OOBMSM_0_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_1:
> +		*index = 1;
> +		if (cap_type == TELEMETRY)
> +			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> +		break;

default case?

> +	}

...

> +static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 mem_region;
> +	u32 offset;
> +	int ret;
> +
> +	ret = guid_decode(guid, &mem_region, &offset);
> +	if (ret)
> +		return ret;
> +
> +	telem_addr += offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	/* indicate that we are not at an appropriate power level */
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
> +
> +	/* set SoC re-mapper index register based on GUID memory region */
> +	xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
> +		      FIELD_PREP(SG_REMAP_BITS, mem_region));
> +
> +	memcpy_fromio(data, telem_addr, count);

> +	ret = count;
> +	xe_pm_runtime_put(xe);

Does this have a side effect on count? If yes, a comment, if no, you may return
count directly.

> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


