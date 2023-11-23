Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9FC5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 16:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712E10E16B;
	Thu, 23 Nov 2023 16:01:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937A10E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700755313; x=1732291313;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jv4IaO6635KCQ7YVvoWcYFZZ4jP7vZsjwiUtAIKAibY=;
 b=JWo/8TTEalmejqCzywr2nr05corq/NsTm2jy2arOgGakDn7yVE4zG2go
 eO7UsF5cNeyB2eWbB5vEF0r9aZlg4WzOgCCcyVbXAUt02pyGWlj683Whc
 pf8lvt7P8kr9f2/rENTiXZ3qysb/BXzghwd8ELciXUC+clTZmXLQBJi+8
 bPvgM/0VZgcGow/pIF2dN1LBeHgQyw2ppDGQkhlJB6bzjQDO2c+Jenrsd
 6TEJq8G/3m83gSIvWDu/hCwYw9RtKBtJYfcP9/BWELuKV8SGi1eXL3oGg
 hqYrcnRsSaoWDfcw4XX6Scuno1yoXHaVqR9BTM2PUpDuHVSRWX+isqycJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392063483"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="392063483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 08:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="743633397"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="743633397"
Received: from mocoilea-mobl1.ger.corp.intel.com (HELO [10.252.24.207])
 ([10.252.24.207])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 08:01:52 -0800
Message-ID: <0bd314de-b326-4684-97a7-ba8482de033f@intel.com>
Date: Thu, 23 Nov 2023 16:01:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
 <20231123153158.12779-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231123153158.12779-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe/vm: Fix ASID XA usage
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

On 23/11/2023 15:31, Thomas Hellström wrote:
> xa_alloc_cyclic() returns 1 on successful allocation, if wrapping occurs,
> but the code incorrectly treats that as an error. Fix that.
> Also, xa_alloc_cyclic() requires xa_init_flags(..., XA_FLAGS_ALLOC), so
> fix that, and assuming we don't want a zero ASID, instead of using
> XA_FLAGS_ALLOC1, adjust the xa limits at alloc_cyclic time.
> 
> v2:
> - On CONFIG_DRM_XE_DEBUG, Initialize the cyclic ASID allocation in such a
>    way that the next allocated ASID will be the maximum one, and the one
>    following will cause an ASID wrap, (all to have CI test high ASIDs
>    and ASID wraps).
> 
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 15 ++++++++++++++-
>   drivers/gpu/drm/xe/xe_vm.c     |  5 +++--
>   2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8be765adf702..9e5260422f6d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -230,7 +230,20 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	init_waitqueue_head(&xe->ufence_wq);
>   
>   	drmm_mutex_init(&xe->drm, &xe->usm.lock);
> -	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
> +	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		/* Trigger a large asid and an early asid wrap. */
> +		u32 asid;
> +
> +		BUILD_BUG_ON(XE_MAX_ASID < 2);
> +		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, NULL,
> +				      XA_LIMIT(XE_MAX_ASID - 2, XE_MAX_ASID - 1),
> +				      &xe->usm.next_asid, GFP_KERNEL);
> +		drm_WARN_ON(&xe->drm, err < 0);

err != 0 ? I assume wrap here would be a bug?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

And r-b remains for the rest of the series.

> +		if (err >= 0)
> +			xa_erase(&xe->usm.asid_to_vm, asid);
> +	}
>   
>   	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
>   	INIT_LIST_HEAD(&xe->persistent_engines.list);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b39c6f43f01f..85b9d6f864ec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1994,13 +1994,14 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (xe->info.has_asid) {
>   		mutex_lock(&xe->usm.lock);
>   		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> -				      XA_LIMIT(0, XE_MAX_ASID - 1),
> +				      XA_LIMIT(1, XE_MAX_ASID - 1),
>   				      &xe->usm.next_asid, GFP_KERNEL);
>   		mutex_unlock(&xe->usm.lock);
> -		if (err) {
> +		if (err < 0) {
>   			xe_vm_close_and_put(vm);
>   			return err;
>   		}
> +		err = 0;
>   		vm->usm.asid = asid;
>   	}
>   
