Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D0C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D9010E3F3;
	Mon, 13 May 2024 07:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdXYkhzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F42610E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715584476; x=1747120476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7Q0BltrU9foFvIPGnM9AYEO/UzEx+UtfjF6+V+HgWnQ=;
 b=BdXYkhztnaGOBo3H/M3W4nWegidwioWfF3DWlLXcRhOgyYrJdocLOCIn
 azvD4OQn9QVRCksn3cHBdZNt291SxDt4QVnoSA7FRtSpE8PLdegot4oT0
 CfLU1abpx2693urHefFzEjmdUc3bA7/iV65mQLcPhw8ipJm3vfEbWEwsU
 QR7yYOry6Jitgn+39fcs1fcqDYjxKZRT9kLaMlilnW2PzRQfJudJgW+q8
 OANw9JSKi8gpNRdmd6PlEzi8lMyqjnZqSX6jtWwUl5rzM8FDIAHQyoyeH
 gRQY/fRv7n1Gx7IJl1BFEKK/PDavCijCiK4s5mTRzLKNadJJ+sXVqD3us A==;
X-CSE-ConnectionGUID: bUS0T9LbTjKpfsm7YTsnbw==
X-CSE-MsgGUID: z11hMe2SQq60qRfI1qPazA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="29017904"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="29017904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:14:36 -0700
X-CSE-ConnectionGUID: csoVWXyLRUqANQdOKxWqeQ==
X-CSE-MsgGUID: LdauMfYiQaK+NHLqikqLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34940175"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:14:35 -0700
Message-ID: <c7cfa699-81ec-4994-b641-987667e22796@intel.com>
Date: Mon, 13 May 2024 09:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] drm/xe/pci: remove broken driver_release
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-25-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-25-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> This is quite broken since we are nuking the pdev link to the private
> driver struct, but note here that driver_release is called when the
> drm_device is released (poor mans drmm), which can be long after the
> device has been removed. So here what we are actually doing is nuking
> the pdev link for what is potentially bound to a different drm_device.
> If that happens before our pci remove callback is triggered (for the new
> drm_device) we silently exit and skip some important cleanup steps,
> resulting in hilarity.
> 
> There should be no reason to implement driver_release, when we already
> have nicer stuff like drmm, so just remove completely. The actual pdev
> link is already nuked when removing the device.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_device.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f89c781986a5..d6f9880a15fd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -188,13 +188,6 @@ static const struct file_operations xe_driver_fops = {
>   #endif
>   };
>   
> -static void xe_driver_release(struct drm_device *dev)
> -{
> -	struct xe_device *xe = to_xe_device(dev);
> -
> -	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
> -}
> -
>   static struct drm_driver driver = {
>   	/* Don't use MTRRs here; the Xserver or userspace app should
>   	 * deal with them for Intel hardware.
> @@ -213,8 +206,6 @@ static struct drm_driver driver = {
>   #ifdef CONFIG_PROC_FS
>   	.show_fdinfo = xe_drm_client_fdinfo,
>   #endif
> -	.release = &xe_driver_release,
> -
>   	.ioctls = xe_ioctls,
>   	.num_ioctls = ARRAY_SIZE(xe_ioctls),
>   	.fops = &xe_driver_fops,

