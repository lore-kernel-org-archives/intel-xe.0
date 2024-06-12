Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AA9C27C75
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 10:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8B310E1C7;
	Wed, 12 Jun 2024 10:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyGQKgmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6D10E261
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718187299; x=1749723299;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6cACkvGMBKegYuKWz7EvAU3KMpLwKVe9wxX2vPK1bNU=;
 b=eyGQKgmDX7yTGPGOucgIIHXs+mz1RjGFJ4/dvyAIKFsyVgL5gjB+JMN8
 VFm6Q9KU+zUPnJvnaRC3zwd9kBRcoQcggX+HcBdQb57rULxT2H03Bi0kn
 kfj80qZ1pG6X237tP2v+T656uzI/Uvd763Ck35txjpFkMQ1WAMgEqGH9f
 s7oecsf6jETzbEH9+TI+pvewSwMnGCQ6nlHAS0/xFpDKq0cxDKpj9NmQR
 /FlLN6IqBnvehJIj2yDI5Kx2GTB+HDDVMwWRu1lJRsl8XyMrcjH77TLxq
 7Zd95g3gn491gxFYL4LSF0V6kbhjRsmJJQpfGVhfqBr812tGleQQwsiVR Q==;
X-CSE-ConnectionGUID: zChrLE0LQ1+8BF00xvp0Og==
X-CSE-MsgGUID: Foyo29A9TGu5a7WKfqYArg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14783886"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14783886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:14:59 -0700
X-CSE-ConnectionGUID: yYspmBg8S+GemIWwUbqE7g==
X-CSE-MsgGUID: MiWwT+0HTICHEYAiMfcZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="44682594"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.192])
 ([10.94.248.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:14:57 -0700
Message-ID: <cf7a8224-b83c-43fb-b59b-3c74a22b98bf@linux.intel.com>
Date: Wed, 12 Jun 2024 12:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe: Combine common force-wake code into helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240611163537.1944-5-michal.wajdeczko@intel.com>
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


On 6/11/2024 6:35 PM, Michal Wajdeczko wrote:
> The code of 'control' and 'wait' force-wake operations are very
> similar for both 'wake' and 'sleep' cases. Add helpers to maximize
> code reuse.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> v2: rename str_wake_sleep helper param (Rodrigo)
>      drop inline from str_wake_sleep helper (Michal)
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 54 +++++++++++++++++-------------
>   1 file changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index afbca81c12dd..468aabd72d6b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -15,6 +15,11 @@
>   
>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>   
> +static const char *str_wake_sleep(bool wake)
> +{
> +	return wake ? "wake" : "sleep";
> +}
> +
>   static void domain_init(struct xe_force_wake_domain *domain,
>   			enum xe_force_wake_domain_id id,
>   			struct xe_reg reg, struct xe_reg ack)
> @@ -89,46 +94,47 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   			    FORCEWAKE_ACK_GSC);
>   }
>   
> +static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
> +{
> +	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
> +}
> +
> +static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> +			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			     domain->reg_ack.addr, value);
> +
> +	return ret;
> +}
> +
>   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>   {
> -	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
> +	__domain_ctl(gt, domain, true);
>   }
>   
>   static int domain_wake_wait(struct xe_gt *gt,
>   			    struct xe_force_wake_domain *domain)
>   {
> -	u32 value;
> -	int ret;
> -
> -	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> -			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			     &value, true);
> -	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
> -			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> -
> -	return ret;
> +	return __domain_wait(gt, domain, true);
>   }
>   
>   static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>   {
> -	xe_mmio_write32(gt, domain->reg_ctl, domain->mask);
> +	__domain_ctl(gt, domain, false);
>   }
>   
>   static int domain_sleep_wait(struct xe_gt *gt,
>   			     struct xe_force_wake_domain *domain)
>   {
> -	u32 value;
> -	int ret;
> -
> -	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> -			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			     &value, true);
> -	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
> -			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> -
> -	return ret;
> +	return __domain_wait(gt, domain, false);
>   }
>   
>   #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
