Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD7C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCED210E524;
	Mon, 10 Feb 2025 13:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4R4cAmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFC010E524
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739193132; x=1770729132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yl0lXi8aGtav9JlNdkOAL8kzbmRu5/agQnlOKMb+yiE=;
 b=F4R4cAmJIM2CprTZzGHl4NYd2UVVK8N4Okbdc9I1Jc9jXn1dcQ0JaPFc
 v1F4+WljIi54YCn2gdIDOmp0PpIuu2aJe9hhxbxbBFjeOa3jWpSwnmXCK
 fOQOYBXAb+IYni9oFpfo0Y4bPFreRu3tlC9by3m73tULP2gjuqanYwNR6
 zvPYmy8P9Vk8sb9VwV1Fx/tbIfznAztR+TRF2w2e4eZTQ4+dPMk4IeYMc
 FYldIyfblGeSrCXVas18bjTxXatPywDaBlP7vqt15/SMzT2jIhQPrbVaW
 Kpq8uoBhSGjUmpfOQNEk3vs1t8HQS/sgx3aHYlqPiyVHUlc2NapgPMBrn A==;
X-CSE-ConnectionGUID: q7YB1Y4LShyEZ4eZEfX3kA==
X-CSE-MsgGUID: YfaLbRVdTVWWIVAamUvIpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43532733"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="43532733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:12:12 -0800
X-CSE-ConnectionGUID: JTsw/jP/SiWUM2UWcUku4g==
X-CSE-MsgGUID: BDmRmowJQ6CJYp7+N4DDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143083334"
Received: from akanter-mobl1.ger.corp.intel.com (HELO [10.245.177.152])
 ([10.245.177.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:12:10 -0800
Message-ID: <a2a8a8a2-66c7-4a73-94c4-a9b11e83b404@linux.intel.com>
Date: Mon, 10 Feb 2025 14:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/client: bo->client does not need bos_lock
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
References: <20250205051042.1991192-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20250205051042.1991192-1-tejas.upadhyay@intel.com>
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

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

RB-ed and merged to drm-xe-next.


Thanks

On 2/5/2025 6:10 AM, Tejas Upadhyay wrote:
> bos_lock is to protect list of bos used by client, it is
> not required to protect bo->client so bring it outside of
> bos_lock.
>
> Fixes: b27970f3e11c ("drm/xe: Add tracking support for bos per client")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 63f30b6df70b..2d4874d2b922 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -135,8 +135,8 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
>  	XE_WARN_ON(bo->client);
>  	XE_WARN_ON(!list_empty(&bo->client_link));
>  
> -	spin_lock(&client->bos_lock);
>  	bo->client = xe_drm_client_get(client);
> +	spin_lock(&client->bos_lock);
>  	list_add_tail(&bo->client_link, &client->bos_list);
>  	spin_unlock(&client->bos_lock);
>  }
