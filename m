Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6478CC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 10:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C359D10E1B0;
	Wed, 12 Jun 2024 10:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAiO9EGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D1510E1C7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718187202; x=1749723202;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hn7g3NNrzSqZLkwVBShgAMSRLCKVc9Kn+VmW6g8b9FA=;
 b=LAiO9EGND6HRFpg4UkKL9lultgxrDO1HDGQ4alrI3N9C9K8LZ4ulwXRT
 vNR+AiVG/yG1RuNOG94/Hh4GzdpnTfdOWLfWBgRIqUQPyFQfbxt2RqweS
 u/6QeNfbH+ituXEHUuWYoQMOSp+JO5zBOMh7ocGQVnpon1lD+5kH4Qb3k
 qS0EhSPud3PhuoayQIMyCATRAQ9E9HT2XsTXyoKRUQagFm2VI/i8FgzQv
 W4e0+HfSZX7PO9KfG49K8smsJscwZZOkQdxvgGIKE94QqcTGnKtTNWtuj
 3sZ/s2ZBKc5iiGqDvprYJVfNdD0YnlZeACfBW3EG+GyFZFuoSC24kB9d4 A==;
X-CSE-ConnectionGUID: /jQoXdgsStWakh7OsjWXlA==
X-CSE-MsgGUID: RrfsKX7JTM+G1LXa4k58Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26362614"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="26362614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:13:22 -0700
X-CSE-ConnectionGUID: DB05bZxQTG6QGMQI0RSZDA==
X-CSE-MsgGUID: VV0j0MYoSASESHRw5MlAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="62921417"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.192])
 ([10.94.248.192])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:13:20 -0700
Message-ID: <b7a2f7e6-7dfe-4ed9-a875-a54ae372146d@linux.intel.com>
Date: Wed, 12 Jun 2024 12:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe: Include additional info on failed
 force-wake operation
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240611163537.1944-4-michal.wajdeczko@intel.com>
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
> For debug purposes it might be useful to look at the values of the
> force-wake ack registers in case wake/sleep operations failures.
>
> Move xe_gt_notice() from the caller to the helper function, where
> we have the latest value of force-wake ack register available.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> v2: remove ret2 (Rodrigo)
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 48 +++++++++++++++++-------------
>   1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 8799a2544648..afbca81c12dd 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -97,9 +97,17 @@ static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>   static int domain_wake_wait(struct xe_gt *gt,
>   			    struct xe_force_wake_domain *domain)
>   {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>   }
>   
>   static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> @@ -110,9 +118,17 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>   static int domain_sleep_wait(struct xe_gt *gt,
>   			     struct xe_force_wake_domain *domain)
>   {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>   }
>   
>   #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> @@ -128,7 +144,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, woken = 0;
>   	unsigned long flags;
> -	int ret, ret2 = 0;
> +	int ret = 0;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> @@ -138,16 +154,12 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>   		}
>   	}
>   	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret = domain_wake_wait(gt, domain);
> -		ret2 |= ret;
> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> -				     domain->id, ret);
> +		ret |= domain_wake_wait(gt, domain);
>   	}
>   	fw->awake_domains |= woken;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret2;
> +	return ret;
>   }
>   
>   int xe_force_wake_put(struct xe_force_wake *fw,
> @@ -157,7 +169,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, sleep = 0;
>   	unsigned long flags;
> -	int ret, ret2 = 0;
> +	int ret = 0;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> @@ -167,14 +179,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   		}
>   	}
>   	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret = domain_sleep_wait(gt, domain);
> -		ret2 |= ret;
> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> -				     domain->id, ret);
> +		ret |= domain_sleep_wait(gt, domain);
>   	}
>   	fw->awake_domains &= ~sleep;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret2;
> +	return ret;
>   }
