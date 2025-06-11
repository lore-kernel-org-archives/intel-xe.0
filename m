Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56822C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 19:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41710E72C;
	Wed, 11 Jun 2025 19:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjuMUd/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEA510E72C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749669875; x=1781205875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=at0MYAN5uZeDKgnO6ByqYRavpAcWmNtVPD5602OMAro=;
 b=kjuMUd/YmQESEAMWw5Gh/zdy9vxSuzg1Uswm7P8zNIc2Spv91RJr4Ftg
 Dm9xplGxRdJrzna7sZE9xtni7Rd1Y/3pvhpyIkKMtuHqmlVW8ZR7EWWzp
 fFE0udOqS5mAOPtfWDUyW2gDi1yfWe+5XyHANXWTk5Vyy7n+r9SDwSPZX
 SEyMgNQN8zbiLCccn1usfH3taNuhhszmzQrTaWAMuzvykbqA8Qt0mKr9r
 4HcjWtNzFpBkj8bFYY6xuHMZoQtfmkhb8nXJIC8LgyOJaUi/dOnNTpt7b
 ZQYaicuYIU9T84Cw9AINXPw78WjqbZP27SS5qq6agg67mzba5fRQ1DMki w==;
X-CSE-ConnectionGUID: tccXwp25Tj6OwabPuDV8yg==
X-CSE-MsgGUID: UxD6S6FxQx+2WVvrqbUX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63174532"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63174532"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:24:34 -0700
X-CSE-ConnectionGUID: 6A1Hj0YPTZqMaQF58PIfYg==
X-CSE-MsgGUID: qnU1wr+dTr+C28/cymGZbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147280314"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.201])
 ([10.245.245.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:24:33 -0700
Message-ID: <528516d9-fb17-4656-8bc0-3288aaa2bd66@linux.intel.com>
Date: Wed, 11 Jun 2025 21:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Reorder 'Get pages failed' message
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
References: <20250610045649.3149801-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250610045649.3149801-1-matthew.brost@intel.com>
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



On 2025-06-10 06:56, Matthew Brost wrote:
> Print the error from get pages failing, not the cast to -ENODATA.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 18f967ce1f1a..d18807b92b18 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2924,10 +2924,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>  		if (err) {
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
>  			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>  				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +				err = -ENODATA;
return -ENODATA; ?

Regardless,
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

>  			return err;
>  		}
>  		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");

