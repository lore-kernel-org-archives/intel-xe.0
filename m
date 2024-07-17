Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C1C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 08:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF9E10E9E7;
	Wed, 17 Jul 2024 08:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yrq8ASWX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892F810E9E7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 08:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721203507; x=1752739507;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hggz/ljJyvACXl08IUCT3poWWcXbSsUDKKDZVvnFXQg=;
 b=Yrq8ASWXboK+CTfMUACooQgSwqbVniUu1Jhv9YTf/Ellsy7B06s+SM6z
 q4aTeBDpH2FguZMC6oJzMpiF6iOpNQZHNMtn7KICYiLtBURyZ5Ow+5YTN
 bs8TCCVrB6hUB/jpPrfxxX5JpbSGz1ol6Ht9SrHLGfxA7nOPrYAVjZl9v
 zv0G5vaQRK+yQpmoTUFvyEB0qRhJyqj8MSrwNWE3MsLnMaDSYXx6QeV9q
 kQkcckXym9mOG3VkQih2On8JjnKKdvLTcfIGUTvLyc+7W5c5AbCzY1PW3
 rza7RNPwB+rb+rPaZBuoAyc4x6z8cEuKLXvX949OufScsfrVghC6fjZCe g==;
X-CSE-ConnectionGUID: cTOiffOrQSyWADcdPi/6MQ==
X-CSE-MsgGUID: XOiTtgSXT+OlE5crbMFmpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18387665"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18387665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 01:05:02 -0700
X-CSE-ConnectionGUID: i4YmQ7GUT0KKqrQZ9JG20Q==
X-CSE-MsgGUID: Rdll/DVCSD6BfYsZYM/FhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87792385"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 17 Jul 2024 01:05:00 -0700
Received: from [10.246.36.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.36.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0C3B012591;
 Wed, 17 Jul 2024 09:04:56 +0100 (IST)
Message-ID: <0b92ab50-8bcd-4f1b-a095-651f6e8f955f@intel.com>
Date: Wed, 17 Jul 2024 10:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe: modify GuC CTB enable communication
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 karthik.poosa@intel.com
References: <20240717055558.4169407-1-riana.tauro@intel.com>
 <20240717055558.4169407-2-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240717055558.4169407-2-riana.tauro@intel.com>
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



On 17.07.2024 07:55, Riana Tauro wrote:
> Modify GuC CTB enable communication function to only set the
> CTB state if registration is not required.
> This will be used while resuming from D3Hot where
> registration of CTB is not necessary.
> 
> Also move xe_guc_ct_set_state to header file.

hmm, but this will expose internals of the guc_ct layer to the outside
see below for alternate solution

> 
> v2: split patches (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 25 +++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc.h    |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c |  3 +--
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  drivers/gpu/drm/xe/xe_uc.c     |  4 ++--
>  5 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb655cee19f7..8131c290a4f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
>  	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>  }
>  
> -int xe_guc_enable_communication(struct xe_guc *guc)
> +/**
> + * xe_guc_enable_communication - Enable GuC CTB communication
> + * @guc: GuC object
> + * @register_ctb: true to register CTB, false otherwise
> + *
> + * Enables GuC CTB Communication and IRQ
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int err;
> @@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> -	if (err)
> -		return err;
> +	if (register_ctb) {
> +		err = xe_guc_ct_enable(&guc->ct);
> +		if (err)
> +			return err;
> +	} else {
> +		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);
> +	}

maybe better option would be to pass the register_ctb flag to the
xe_guc_ct_enable() so it can do either full enabling (including CTB
registration) or just change the internal state:

int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
{
	err = xe_guc_ct_enable(&guc->ct, register_ctb);
	...
}

int xe_guc_ct_enable(struct xe_guc_ct *ct, bool register_ctb)
{
	if (register_ctb) {
		...
	}

	ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
	return 0;
}

>  
>  	guc_handle_mmio_msg(guc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index af59c9545753..b49444297eb0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -20,7 +20,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> -int xe_guc_enable_communication(struct xe_guc *guc);
> +int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d2e937da1d8..44c44e086a98 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -318,8 +318,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> -				enum xe_guc_ct_state state)
> +void xe_guc_ct_set_state(struct xe_guc_ct *ct, enum xe_guc_ct_state state)
>  {
>  	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 190202fce2d0..60d46739548c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,8 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> +void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> +			 enum xe_guc_ct_state state);
>  
>  struct xe_guc_ct_snapshot *
>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0f240534fb72..eb9c1443c849 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_enable_communication(&uc->guc);
> +	err = xe_guc_enable_communication(&uc->guc, true);
>  	if (err)
>  		return err;
>  
> @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(&uc->guc);
> +	ret = xe_guc_enable_communication(&uc->guc, true);
>  	if (ret)
>  		return ret;
>  
