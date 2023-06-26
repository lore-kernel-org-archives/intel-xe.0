Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE354EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 14:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDED10E1A2;
	Mon, 26 Jun 2023 14:55:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA94310E1A2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687791334; x=1719327334;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bm0AMJNDXMBv2MuJZIMCkhT+4hiVLOsKSWCj7YkG6sQ=;
 b=OWZIZPbRK05Sy8nH9p6/j8TXg1AQbbslXY4JfN3rB6Rab0sh5VtCflQo
 qYoI3cEUZcBzZb9YJfAynXxgX1LeiwavqUUxmWrlxUeCorccl7w5iOuQi
 1AmI7VGe8c5ONHWo0vcCd2qdrvu27yX+xq2pwg06/6jcy3mx7cB80xBD/
 u5iwin7pGoCE6Gh7hDbUqwQTmGsDsKSCg2jYH0y+yu7vlzrUObS7g4OQt
 48M5GYLEA9EnSvwCl08c2ACV4BNoo+7jq/oLWWoN0pUugMh2cnpeocvZ9
 e2O68T2rWAAmAiRp8R8Pc7IflIIuZBSTf/lSPFp1ar6AN+hgih2YqSMyT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341626033"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="341626033"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 07:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="745813879"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="745813879"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.105])
 ([10.249.254.105])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 07:55:31 -0700
Message-ID: <06d040ea-c25b-9fdc-aa22-6e0f543a734f@linux.intel.com>
Date: Mon, 26 Jun 2023 16:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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

Hi, Zbigniew,

On 6/26/23 16:42, Zbigniew Kempczyński wrote:
> Driver may alter bo size requested by the user. Return real object
> size to make userspace aware how to arrange vm bindings.

I think for Xe VM_BIND, the space needed for a bo with given size must be

ALIGN_TO(bo->size, xe_get_default_alignment())

(xe_get_default_alignment() being an igt xe lib function).

Even the padded bo->size returned with this patch is lower than the 
value above. If you use that value, will the value assigned below still 
be needed.

/Thomas

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 71a14e1f25be..55dbb374a787 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1744,6 +1744,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		return err;
>   
>   	args->handle = handle;
> +	args->size = bo->size;
>   
>   	return 0;
>   }
