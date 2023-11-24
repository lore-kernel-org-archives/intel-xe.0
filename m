Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B7EC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 11:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A9F10E1BC;
	Fri, 24 Nov 2023 11:13:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7A10E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700824381; x=1732360381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N92e3OFrnUuyxrMjyeOWFI3WnukDH/4y/CndrdXjQUo=;
 b=D2xcwG0+wLKQ3ETUrZYSuntnqgVE3CQQ3Epl+V8Il7EOOCof33I1tNCT
 uz+bEAH2vOwo/ipdAK2CZjI5bzxzXwRRMM+9Pots1kILk4LsWyOAq7uQA
 MqXADNU3JkSZkEdiSHFTui2v7+U3H8aTml649Y3rfQR9wH+Nagp11K5yF
 2pjb0sAlXaP8Ucz3qz/1ZmqTJifbBUvE9h0esOgl59HR5vVV2R0gwOyw6
 FbV2tOdKQKlTdc9cX3lr2URdns+s9lpoA/z/pebRHzU1MPKOUkVh5lLbG
 OXtf/2mmgDpBX0JcGW8FJx067p9e7FfLMdZVTjXmya9BbvOIsDMhyRsp3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377439815"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="377439815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="15602973"
Received: from ochura-mobl1.ccr.corp.intel.com (HELO [10.252.24.199])
 ([10.252.24.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:11:52 -0800
Message-ID: <ce4d3a2b-d261-4924-a1fc-e4a2735d12d0@intel.com>
Date: Fri, 24 Nov 2023 11:11:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
 <20231124091111.77269-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231124091111.77269-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 4/4] drm/xe/vm: Fix ASID XA usage
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

On 24/11/2023 09:11, Thomas Hellström wrote:
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
> v3:
> - Stricter return value checking from xa_alloc_cyclic() (Matthew Auld)

A missing git add? :)

> 
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Ohad Sharabi <osharabi@habana.ai> #v1
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
