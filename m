Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6744C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 15:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966D310E82C;
	Wed,  7 May 2025 15:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXT8Qd+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF51910E82C
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746631925; x=1778167925;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HfCXdcE9FekA+JCTlIsoySfYWkiGIWpI1WKYsvS6YCA=;
 b=XXT8Qd+e0qmG7jfOFTRUq3i7VC2IpvO3gVt9Igr5uE8+0loJHlj2Jn5u
 5+RZuHfdw5dXw7z/OV2tOLXyxIm7UjiIiKzjDwuicSRlxjBCh9jvS/PkH
 4NMJFPNdRKyg7+RNK+I1AwHhnYTxcwVf64rzewh1gPJlRwSVigGqEq5dd
 8sdiEs73kDoQaaokwgPHLoDOBSo7vjI0rwMeHxTYbmFW7uYXUAcEO61qx
 T14vUjenCdjVBJ803m5N/fjEgl9GiEDuvGo0vSTZSnBgBFmlr/VrXQHnm
 sdcxpWcrwZ4zsihDAg3wIjbRZuy/2kF4DTnL222OwafxIIrsWspj1MhZ0 g==;
X-CSE-ConnectionGUID: gssxlDPuTaKy0RnZZ33R7g==
X-CSE-MsgGUID: rISquzu7Rb+C2AiLuUEjXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51028609"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="51028609"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:32:04 -0700
X-CSE-ConnectionGUID: wkXi7dRwQiuiDrgvqesrTg==
X-CSE-MsgGUID: mg3pPyUHSGOFIshZh4aAbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135698501"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 07 May 2025 08:32:03 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4BFAD2FC6F;
 Wed,  7 May 2025 16:32:01 +0100 (IST)
Message-ID: <3834b63f-2c0d-4a91-81ea-eb8c57f12b31@intel.com>
Date: Wed, 7 May 2025 17:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
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



On 07.05.2025 15:15, Satyanarayana K V P wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_should_fail_ct_dead_capture() helper function,
> ct dead capture is avoided which suppresses ct dumps in the log.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> ---
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> V2 -> V3:
> - Added inline function to avoid compilation error in the absence of
> CONFIG_FUNCTION_ERROR_INJECTION.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2447de0ebedf..d959cc2e7b40 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1770,6 +1770,24 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +/**
> + * xe_should_fail_ct_dead_capture - Helper function to inject fault.

this is a static function, likely we don't want full kernel-doc for it

> + *
> + * This is a helper function to inject fault into ct_dead_capture().
> + * As fault is injected using this function, need to make sure that
> + * the compiler does not optimize and make it as a inline function.
> + * To prevent compile optimization, "noinline" is added.
> + */
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +static noinline int xe_should_fail_ct_dead_capture(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);

hmm, but do we really need to abuse the error-injection framework to
suppress GuC log dump? maybe cleaner option would be to just add module
parameter (maybe under CONFIG_XE_DEBUG) that we can setup in the test
and check here?

> +#else
> +static inline int xe_should_fail_ct_dead_capture(void) { return 0; }
> +#endif
> +
>  static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>  {
>  	struct xe_guc_log_snapshot *snapshot_log;
> @@ -1778,6 +1796,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  	unsigned long flags;
>  	bool have_capture;
>  
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_should_fail_ct_dead_capture())
> +		return;

shouldn't we exit *after* the below statement?

we want to skip just a dump, not to skip 'broken' markup

> +
>  	if (ctb)
>  		ctb->info.broken = true;
>  

