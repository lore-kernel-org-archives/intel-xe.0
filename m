Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFEEC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 12:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB610E021;
	Tue,  9 May 2023 12:21:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB74410E021
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683634874; x=1715170874;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+EVUdWvAsZQrAIaJj3awy/D6U9zeOkR5FQkZT0uhwMQ=;
 b=en02M4Eun1qBwmSX8Xl2WHzKhPjI4HoMQ5P0XEaWaPuZRlaqLKLK3GO2
 y7s2Mr0ctPXcToR2TBilW+jaGOI3eKjwh3af7+8lrro3TQ4Nrpr7rDLIw
 DMlTiFpKzdAl+BTQBbsu2VLQeHSIVzgRdTY9Ca1qJPUNLos4cgBmfgea5
 n8rH6JaOER9wZiX9tSu2u4b5RQeva510lh6wnEHQanT8J+IpiBYORbX8b
 wL12gMFy1Ekme53wgnwOZtZ5ve5fYbJV8coJPzxJ7DVBIzYabuXqW/onu
 bWcFxK38sTnbmBw1N9cEXXfgVnh1MfpPeelRJDeOZDNiLcSF1tzuDM4rp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349944235"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="349944235"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698878293"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="698878293"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:21:12 -0700
Message-ID: <6ced9963-33a7-cb7a-d415-4c5efaca18f1@linux.intel.com>
Date: Tue, 9 May 2023 14:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-7-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 06/31] drm/xe: Ensure LR engines are not
 persistent
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


On 5/2/23 02:17, Matthew Brost wrote:
> With our ref counting scheme LR engines only close properly if not
> persistent, ensure that LR engines are non-persistent.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

With Rodrigos "Long-Running" comment addressed,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_engine.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index d1e84d7adbd4..91600b1e8249 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>   			return -ENOENT;
>   
>   		e = xe_engine_create(xe, vm, logical_mask,
> -				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
> +				     args->width, hwe,
> +				     xe_vm_no_dma_fences(vm) ? 0 :
> +				     ENGINE_FLAG_PERSISTENT);
>   		xe_vm_put(vm);
>   		if (IS_ERR(e))
>   			return PTR_ERR(e);
