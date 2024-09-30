Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20041CDD1D6
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5810E57C;
	Mon, 30 Sep 2024 19:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8Lq45jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5943310E2FC
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727725870; x=1759261870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7H/Uc0/wDSsyiNLQw9sf4XgVoPJwL8lFhtK+5NT7BB4=;
 b=K8Lq45jW6wD9NT8FqBx0/4f0aJBkaPKDphICO7a17Lts9AZjq49xOusg
 dS3g0AqgyQXLlZ7TDp4zBuP2MdMwNIuLg5/ZO4Uir71n8uTlCEcdxXIYO
 iJPP4SC2S9pcBy24ntdmKgdr6g5SEcDuil65LZUtfXuWruIkj+ToF7IM/
 5Vfl5ijuUCo3Ywtoi484LB3kMlsgEC9Ey2wMqtAZoj2MaRjFvp1950e3P
 fLDoqTxmfvtYQ/WRZuavNICkYxVzjotiYzCLvipsbrHdIhqt11P+IWGPF
 VPDUrt1TeTlS3wpTq2wkLPmGUn7aY02UtA/moXHNuSV8DMU0coc2rwkvt Q==;
X-CSE-ConnectionGUID: 0A3r4YQnQn67HaN1DLACPQ==
X-CSE-MsgGUID: aJ6UfQf+Rlm3jghXEbXH8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38190969"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="38190969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:51:10 -0700
X-CSE-ConnectionGUID: K4vVgQZBTW+p9vMQPRWZtg==
X-CSE-MsgGUID: Mnuc607aQqu0F8Iu1WYbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="96755824"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 12:51:08 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 266CA28789;
 Mon, 30 Sep 2024 20:51:07 +0100 (IST)
Message-ID: <bf859513-171b-4b2f-b342-1ca3c07f508b@intel.com>
Date: Mon, 30 Sep 2024 21:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/25] drm/xe: Add member initialized_domains to
 xe_force_wake()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240930053149.1246339-2-himal.prasad.ghimiray@intel.com>
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



On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
> This field serves as a bitmask representing all initialized forcewake
> domains on the GT.
> 
> While at it, fix the datatype for awake_domains since it can have
> value different from enum xe_force_wake_domains.

up to maintainers, but for me this is unrelated change

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 24 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  4 +++-
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..5ce9e912818a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -21,15 +21,25 @@ static const char *str_wake_sleep(bool wake)
>  	return wake ? "wake" : "sleep";
>  }
>  
> -static void domain_init(struct xe_force_wake_domain *domain,
> +static void mark_domain_initialized(struct xe_force_wake *fw,
> +				    enum xe_force_wake_domain_id id)
> +{
> +	fw->initialized_domains |= BIT(id);
> +}
> +
> +static void domain_init(struct xe_force_wake *fw,

since this function is no longer taking 'domain' as param, then IMO it
should be named like:

	init_domain(fw, id, reg, ack)

>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
>  {
> +	struct xe_force_wake_domain *domain = &fw->domains[id];
> +
>  	domain->id = id;
>  	domain->reg_ctl = reg;
>  	domain->reg_ack = ack;
>  	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>  	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> +
> +	mark_domain_initialized(fw, id);
>  }
>  
>  void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -43,12 +53,12 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (xe->info.graphics_verx100 >= 1270) {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT_MTL);

likely above alignment could be optimized at least to:

	init_domain(fw, XE_FW_DOMAIN_ID_GT,
		    FORCEWAKE_GT,
		    FORCEWAKE_ACK_GT_MTL);


>  	} else {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT);
> @@ -63,7 +73,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (!xe_gt_is_media_type(gt))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_RENDER,
>  			    FORCEWAKE_RENDER,
>  			    FORCEWAKE_ACK_RENDER);
> @@ -72,7 +82,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>  			    FORCEWAKE_MEDIA_VDBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
> @@ -82,14 +92,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>  			    FORCEWAKE_MEDIA_VEBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
>  	}
>  
>  	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
> +		domain_init(fw,
>  			    XE_FW_DOMAIN_ID_GSC,
>  			    FORCEWAKE_GSC,
>  			    FORCEWAKE_ACK_GSC);
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index ed0edc2cdf9f..fde17dc3d01e 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -78,7 +78,9 @@ struct xe_force_wake {
>  	/** @lock: protects everything force wake struct */
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
> -	enum xe_force_wake_domains awake_domains;
> +	unsigned int awake_domains;
> +	/** @initialized_domains: mask of all initialized domains */
> +	unsigned int initialized_domains;
>  	/** @domains: force wake domains */
>  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>  };

