Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A38C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 21:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1210E099;
	Fri, 19 Jul 2024 21:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRNVkMsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EE110E099
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721426361; x=1752962361;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BKHuDI+WJS4WWUMBP6+No1/69fR3IsE7i5VyNv4jKpA=;
 b=jRNVkMsdbklkWXPwSYyGTfDKuCLU8WEQh90Bjyq3E3gnNT4sPmlRPUs4
 +jsJR34f+tLnBLFuVwwSZzjTZT7pK5vqIR1HcrofZCTpcO6SHXQJdjXaF
 82IIyWpr8usT2TcHJK/b2i8L5OGEwQ0Fro4wB72qxAA7G8ygZ2H93CUhN
 TtaCccE/5zjc+4oi/nluo/Gwr6inuLkylnZF2oVVG2K1GzlEVIEBhU+CD
 C/QAr9P/kLJrE/yzKQJC7WIcMScuf6/J2mtWe1LuLWkEagmw7ze5xgHiV
 95f36oZJf88IVhLNGlmrjSrumbUBcxyj+9sCGZNXh4PBdGr2ydMJctBmE w==;
X-CSE-ConnectionGUID: 2j7VRw+xTLmKY5EqYsYKxA==
X-CSE-MsgGUID: 3OFzbtgAT3y18NJAl0gG7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="12626289"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="12626289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 14:59:20 -0700
X-CSE-ConnectionGUID: umYdOIznTtmZJ0H2kNrWQA==
X-CSE-MsgGUID: i9Tv1rLaSR6KCNqHQfSSfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51270597"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 19 Jul 2024 14:59:19 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8770128785;
 Fri, 19 Jul 2024 22:59:17 +0100 (IST)
Message-ID: <44d38698-8a89-49a9-8fe2-2e6d67c55490@intel.com>
Date: Fri, 19 Jul 2024 23:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix warning on unreachable statement
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240719191534.3845469-1-lucas.demarchi@intel.com>
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



On 19.07.2024 21:15, Lucas De Marchi wrote:
> eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
> it handles all enum values. However it's perfectly legal to pass an int
> to that function so in the end that function may happen to return
> nothing. A smart compiler could notice eu_type is never assigned to
> anything other than those values.
> 
> Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
> triggered for me, but this was reported in a different system with
> gcc-10:
> 
> 	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()
> 
> Since that is not really possible, just take the simple approach and
> return NULL.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 5a1559edf3e9..0662f71c6ede 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>  		return "simd8";
>  	}
>  
> -	unreachable();
> +	return NULL;
>  }
>  
>  void
