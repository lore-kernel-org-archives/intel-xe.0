Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D3C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 09:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131A810EA6A;
	Mon,  6 May 2024 09:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWO4Sspb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B6E10E9EA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714986234; x=1746522234;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=881U6z+/gsQn2OPsRFxJkpaA782JSxJYFu7FaXaK/HY=;
 b=cWO4SspbnNzhoD3kxGEX6Rmv9tPaMORRS8XZ2qsHa41fD4t96c2yLeOp
 319cvrEph01hDf35QbzsFGZe3t5GC+cjxHYEkwaHkFJLicZ2Z4uNRsiTx
 518bLJU9qrx4jkJLWwmgIMrIJ1uHYgBwN0/SlvQpiv6/0Fs0tZIE8Fwdp
 /GSyB8wbtCuu2paBI4qOAVx/nT1kGT0MGHuDn1459rA9MoO05cwnKDRO+
 Cl+v+2DbNcKkZubfLGXe8SYiEZ2NOHJaBGR5HeFlvQtumsMiYYdJeh7qF
 x6dSKKXZcpuVlN99TLfyeB6KedFwHkhQDXNxAflrz913S6gGHMZ5ecRfW A==;
X-CSE-ConnectionGUID: q12jhXfqRpSOmHLwNi2SuQ==
X-CSE-MsgGUID: ZNFIr2Z9S/KrKb0zQkaMag==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10565371"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="10565371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:03:54 -0700
X-CSE-ConnectionGUID: oUzM9aSfTAGHuhOeHOdiig==
X-CSE-MsgGUID: w8X1z8q1RpaLnI6hqXOe3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28117494"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:03:52 -0700
Message-ID: <c6c29847-fa3e-47ff-9324-5cf0a94d830a@intel.com>
Date: Mon, 6 May 2024 11:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/xe/guc: move guc_fini over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-12-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-12-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Make sure to actually call this when the device is removed. Currently we
> only trigger it when the driver instance goes away, but that doesn't
> work too well with hotunplug, since device can be removed and re-probed
> with a new driver instance, where the guc_fini() is called too late.
> Move the fini over to devm to ensure this is called when device is
> removed.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_guc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0c9938e0ab8c..97e2b62df486 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -239,7 +239,7 @@ static void guc_write_params(struct xe_guc *guc)
>   		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
>   }
>   
> -static void guc_fini(struct drm_device *drm, void *arg)
> +static void guc_fini(void *arg)
>   {
>   	struct xe_guc *guc = arg;
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -323,7 +323,7 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (ret)
>   		goto out;
>   
> -	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
> +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
>   	if (ret)
>   		goto out;
>   

