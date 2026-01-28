Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1772D25B4E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 12:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975EE10E125;
	Wed, 28 Jan 2026 12:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At3dCMaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3150E10E125
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769604145; x=1801140145;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=TCkCR6CMzah7og+OIuj7A3fhvqQK0va0N6QTGtS5OTA=;
 b=At3dCMaDM7p9XIAV18/HiuyVfsmxD2piKYZx1UnC65XwFqqGhf1dQnO+
 1v2FFUBuH6xyQt+XUYXrqID92qIwimNrHVO4vHAbsgJczF3SyM60cBSDL
 UruM0AavmPHWKmn3WyiT/qr58Y4qXBPbAGrBHNUnRLDGAX226u73Z13i1
 LT+FKdVe1HBn2gcqpQ7NGbUtcUxoHZJp8FuHS0Uh9jdOzsRUotT1sKqbd
 94F9jhylGO7Rvq1glMGE2HJ1lSlZmmJbx2opwV35AKXAG5bwm6KSTbrlH
 qKJytoRlqlT9Q//7B9m+F0O9I+0ZrM/ikDj34lwVG1O4hFNpshk97NImo w==;
X-CSE-ConnectionGUID: 2zXpC3UEQ1+aE76WmbG5Fg==
X-CSE-MsgGUID: gBS+CYuqStGlaaCfF3aK5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81446767"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81446767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:42:25 -0800
X-CSE-ConnectionGUID: giDsuR+vTo+3XVKo0WwXjQ==
X-CSE-MsgGUID: +t9nQ5ZFTPuRipiuorzxZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212743248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.14])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:42:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:42:17 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
In-Reply-To: <20260127182418.640701-9-michael.j.ruhl@intel.com>
Message-ID: <3f8ecbc2-e5bd-37d7-faf9-f5e090845243@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-9-michael.j.ruhl@intel.com>
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

> Crashlog needs to be collected at all times.  The current pm
> check assumes telemetry only.
> 
> Update read path to enable device for crashlog instances.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4ebb4dbe1c9b..44607f1eaa88 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	if (!xe->soc_remapper.set_telem_region)
>  		return -ENODEV;
>  
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	/* make sure that we are not at an inappropriate power level */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);

While this is xe code so I don't know much about it, it feels odd to me to 
just add a get without put or explanation in the changelog why this change 
doesn't result in imbalance.

-- 
 i.


> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;
> +	}
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
>  	xe->soc_remapper.set_telem_region(xe, mem_region);
> 
