Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189FAC7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 16:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08E310E189;
	Wed, 26 Apr 2023 16:16:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6910E189
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682525789; x=1714061789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u73aPv3VTmOwQ7SMOzhTM7LnEXTIlKb50XFufGx8QIY=;
 b=IFNjBEJ5MeL3tVAEyM420g4Z8fC78/EGY3LIrg2Ar9jnF2g7XyAMehi5
 ftxIAOFR4z6ZbRfURCoBjTfKQFN8QyaF8LH5ykbFWIgMOvCgdEYrhYnDF
 BKQCYiqpIbYxJAcd9agZYPvGiz09wRNoxHjy99GZ15Y4kIaWVElvud5KV
 LWU6xC7BcHGnKYuBF6HIrIdWRotucD6wnOTX5rWcfRjpiXxCtEab6GlhA
 Wj7ZrKoSk0Uy7lmTxRoZrwM+CiYmQifW1qT/4LkKW3PmKkyLY4ANkelHe
 DfiGd0LOiaz4kK4ixeEQ8NedVk4WtBW0CnjPbX4E2dJBQOGziuGvEYUly w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345913728"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="345913728"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763381134"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="763381134"
Received: from spmccann-mobl.ger.corp.intel.com (HELO [10.252.16.175])
 ([10.252.16.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:14:23 -0700
Message-ID: <7a5d4461-98bf-11df-2ee2-73a17893b0a8@intel.com>
Date: Wed, 26 Apr 2023 17:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230426131234.482201-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230426131234.482201-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] Revert "drm/xe: Enable d3cold support
 for dgfx"
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

On 26/04/2023 14:12, Rodrigo Vivi wrote:
> This reverts commit 7c1c3d3898c60f3e96f40737f0d8ddd4b8934aaf.
> 
> Unfortunately we are not ready for this step yet.
> 
> We need to rethink our strategy on D3cold:
> 
> 1. rewrite the VRAM save / restore to avoid buffer object locks
> 2. block D3cold if we have a big amount of device memory in use in order
>     to reduce the latency.
> 3. at resume, detect if we really lost power and avoid memory restoration
>     if we were only up to d3cold
> 
> Reference: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

fwiw for the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 14be0259a222..9324aed8a821 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -762,8 +762,13 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
> -	if (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
> -		xe->d3cold_allowed = true;
> +	/*
> +	 * FIXME: d3cold should be allowed (true) if
> +	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
> +	 * however the change to the buddy allocator broke the
> +	 * xe_bo_restore_kernel when the pci device is disabled
> +	 */
> +	 xe->d3cold_allowed = false;
>   
>   	return 0;
>   }
