Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D945DC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 04:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A089A10E8C8;
	Thu,  6 Mar 2025 04:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIFDRmb4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ECE10E8C8
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 04:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741235895; x=1772771895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uuca2mhEpCsfs6mouHAw5Jil0EN1l064IpGnTi1z4KY=;
 b=WIFDRmb4+xbDiJcb4gApJ3Cabl2ywr8ZpBkYG86xceQhERcQ9nmNiBV9
 Y5tFMGVXWZk448n4ajdaDJ86Vh2XiXE2/ncxS61K89+uP58jADJ4WT4MV
 4PSv8+Ii9M+3o4hl6dDTBRIMMxBrtC5bG/ZlLFRPqomyBtqm/HRgGZ9C8
 p28Lz9rlPRyxSN4bFsNE+gX+MlUoI1HIo4J9uL4DUMqYWyGwMuuR5dGJP
 xBhq5P2bBijOWA1CbNYuoAHikrbey/QLaIzWm/OCCyPJSp58+TUgcQYb7
 6+dvxwBjfkQVAyvGZFaY05SAYm3Ioaem4XHG8XUKTA+Om+XypG+f6O5j6 Q==;
X-CSE-ConnectionGUID: 35t/C1zRREOZLjOVnIPZCw==
X-CSE-MsgGUID: 83uyVGgbSNC3tdJ/Vak02Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42144621"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42144621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 20:38:12 -0800
X-CSE-ConnectionGUID: WBarcOvxQiGM0hxciceFUA==
X-CSE-MsgGUID: Nv4JK/F7QoSpUP1ILXQNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="123915742"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.254.240])
 ([10.247.254.240])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 20:38:10 -0800
Message-ID: <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
Date: Thu, 6 Mar 2025 10:08:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
To: Raag Jadav <raag.jadav@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com
Cc: intel-xe@lists.freedesktop.org
References: <20250304061727.452100-1-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250304061727.452100-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 04-03-2025 11:47, Raag Jadav wrote:
Hi Raag,

> Since we're expecting many platform specific mailbox commands that
> might not be widely supported, stop logging them as errors. With this
> we can avoid unnecessary platform checks and use the return value of
> mailbox without enraging CI.
are you saying there are cases where we send a command that is not supported
on a particular platform?

Thanks,
Aravind.


>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 9333ce776a6e..280f69119ff1 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  
>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>  	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
>  			err_decode[err].str ?: "Unknown");
>  		return err_decode[err].errno ?: -EPROTO;
>  	}
