Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF822EEE26A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6094610E157;
	Thu, 12 Sep 2024 21:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOfuJS5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCD810E157
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726176690; x=1757712690;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O9lszn2qHtAstdpRH0aGoPXmpUw8FoV8QPKP/+uGGmM=;
 b=LOfuJS5os7/I4yxTAg1MH5VXJYkzp72PI7lP9ybTqYUpFaMmYqWWy0aw
 MuBou0A/tDe3MAlaQp4Ek2+3OzAhLoaaWnnHJOfrxiIgEXPDiqYRoQqJb
 xOz4Ju9GJO+jjuIdF5EUQEpnHmVk58FdhJrdsATQ3TpNPMuNKqBOrCZqW
 k6VSHS9RPEtEVK/BMacl9ZD7ORpijlQ0YpWcDh7ZMT+qlugicRdaoHtEi
 I8znyVjojqHo/OTQvymFmfBuLoCzcuFkIkdl+wRc6/VzPiAwozMdQzkIJ
 ZjjzGMmVlpUU6TJev9n//kSm2m89PReYpkZi+tgnvkdN37SCD671R0PGl Q==;
X-CSE-ConnectionGUID: XDMAXzoCQ8GnGbhS9w4wPw==
X-CSE-MsgGUID: fLAGwUU6TY2/lEcuEamsJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="27975904"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="27975904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:31:29 -0700
X-CSE-ConnectionGUID: 49wktLNWTru3imhGX86uIw==
X-CSE-MsgGUID: 5au5+GuIQjOtnSp7aohIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="72192248"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2024 14:31:28 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 808152877A;
 Thu, 12 Sep 2024 22:31:26 +0100 (IST)
Message-ID: <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
Date: Thu, 12 Sep 2024 23:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
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



On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a domain awake request, do not
> increment the reference count for the domain. This ensures that
> subsequent _get calls do not incorrectly assume the domain is awake. The
> return value is a mask of domains whose reference counts were
> incremented, and these domains need to be released using
> xe_force_wake_put.
> 
> The caller needs to compare the return value with the input domains to
> determine the success or failure of the operation and decide whether to
> continue or return accordingly.
> 
> While at it, add simple kernel-doc for xe_force_wake_get()
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 35 +++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..fa42d652d23f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  					 (ffs(tmp__) - 1))) && \
>  					 domain__->reg_ctl.addr)
>  
> +/**
> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain

while likely this is still recognized by the kernel-doc tool, this is
not correct notation for the function() documentation

[1] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * Increment refcount for the force-wake domain. If the domain is
> + * asleep, awaken it and wait for acknowledgment within the specified
> + * timeout. If a timeout occurs, decrement the refcount.

not sure if doc shall be 1:1 of low level implementation details

> + * The caller should compare the return value with the @domains to
> + * determine the success or failure of the operation.
> + *
> + * Return: mask of refcount increased domains. 

if we return a 'mask' then maybe it should be of 'unsigned int' type?

> If the return value is
> + * equal to the input parameter @domains, the operation is considered
> + * successful. Otherwise, the operation is considered a failure, and
> + * the caller should handle the failure case, potentially returning
> + * -ETIMEDOUT.

it looks that all problems with the nice API is due to the
XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care

maybe there should be different pair of functions:

// for single domain where ret=0 is success, ret<0 is error
int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);

and

// for all domain where ret=0 is success, ret<0 is error
int int xe_force_wake_get_all(fw);
void xe_force_wake_put_all(fw);

and

// input: mask of domains, return: mask of domain
unsigned int xe_force_wake_get_mask(fw, mask);
void xe_force_wake_put_mask(fw, mask);

this last one can be just main implementation (static or public if we
really want to continue with random set of enabled domains)

> + */
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;

it looks that you're abusing even more all enum variables by treating
them as plain integers

>  	unsigned long flags;
> -	int ret = 0;
> +	int ret = domains;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>  			domain_wake(gt, domain);
>  		}
>  	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);
> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0) {
> +			awake_ack |= BIT(domain->id);
> +		} else {
> +			ret &= ~BIT(domain->id);
> +			--domain->ref;
> +		}
>  	}
> -	fw->awake_domains |= woken;
> +
> +	fw->awake_domains |= awake_ack;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret;
