Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94968C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 11:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D710F630;
	Mon,  5 Feb 2024 11:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCvI1b/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD0610F2FB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707131158; x=1738667158;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2UHvo0Blld305Nvmc7TTiap10ZXGRKsD0o2OKYrKn4I=;
 b=mCvI1b/2Byi9OXsq5sN7FsPdp55lNttNUG5ABR+qjHikZ8n3dW/o8Bla
 zmFflSPFMJqBljdFybu4V3mcfXthfTPM4qBPc4C1KNLVw25GEMBx0OZFl
 aeWeGZZ7HDMCMyaI1zPTRVSh3OzQxMwa53z0r22OzTXxUAbQsdEJWYQzv
 ck5KhZAxW0cbibUys4uVDOLaRlwV3HIe1VbNP/ZegWFnIusIZr7dcx7Pl
 0Q9wLDWQ230rvFxVZGafH90sv65lsZtvV7OrRncRolZ27Q2e1+XykuxIp
 U0nipA1cG7LLH2xXKCtBiCCYLdbU08E4341AXcCu206wla4bO8YQFNvpB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="414258"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="414258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5308936"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 03:05:56 -0800
Message-ID: <df663ea7-5d81-4e6c-8ce3-9cd53fe72ea3@intel.com>
Date: Mon, 5 Feb 2024 11:05:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/34] drm/xe: Ensure device is awake before removing it
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-13-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> If device is suspended, the module unload might face challenges.
> So, let's ensure that the very first thing of the "unprobe" (remove)
> is to wake the device.

Core kernel already ensures device is called with pm_runtime_get_sync() 
before calling probe/remove. Do we still need this?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index df6b3b31f419..0f296df729c4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -686,8 +686,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	if (!xe) /* driver load aborted, nothing to cleanup */
>   		return;
>   
> -	xe_device_remove(xe);
>   	xe_pm_runtime_fini(xe);
> +	xe_device_remove(xe);
>   	pci_set_drvdata(pdev, NULL);
>   }
>   
