Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EA5CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 08:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCF210E7D3;
	Wed, 10 Jun 2026 08:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWJYc8Q4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46BC10E7CA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781080656; x=1812616656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v84Xybkh5rwRRXRTSZ5wJjKxKJMFt1/sdB83rXDqM00=;
 b=UWJYc8Q4nKqy9FrVbF4Z7Q2LwY+dxh8X/ppv/Ug4xp66Glyo4OxfSWmD
 y41bFdyRZK4t34bDEFBTAuAkS/TdMZ2fSChvpgSTlBc18eCxUyl72A2Jz
 2U4Zm1K4BmvynHjKjinizblLgFxH6x2CPF4ksHicaH1eP/dgo9qhRl1h+
 J09ypeBwg5TRMWmYpFojsdVa2n4UjdU4Fh1Kl8zn6Vajw4hSiy06nR9Vv
 5OtQTxBI9mJ6JqSZTZWKwSyS2CXjW+f+QHLfd+BmfDYTrySe9mstspVS2
 NmjG9yzDJx43XYB1Pr2EUloIHRcEpyGOwxtBCOPPCRqM/CinKGRA3CFs5 g==;
X-CSE-ConnectionGUID: /uvx0DSiQNK5kiIUe9znGA==
X-CSE-MsgGUID: Bo3mSTDURFqGmyBaGjoeaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99445467"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99445467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 01:37:35 -0700
X-CSE-ConnectionGUID: tnjqbXnnSmmZU/rft5X9Zw==
X-CSE-MsgGUID: JJSEFIW6RcqJTM5G1ovxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="247966361"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.17])
 ([10.245.244.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 01:37:34 -0700
Message-ID: <f98bc6f4-aab6-4be9-8ec6-5d479bec551b@intel.com>
Date: Wed, 10 Jun 2026 09:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pat: Fix invalid L4 cache policy in xe2_pat_ats
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
References: <20260610065923.3382050-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260610065923.3382050-2-nitin.r.gote@intel.com>
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

On 10/06/2026 07:59, Nitin Gote wrote:
> The xe2_pat_ats entry was programmed with L4_CACHE_POLICY=3 (UC) and
> COH_MODE=3 (2-way coherent). Per bspec, when COH_MODE is 2-way (11b),
> L4_CACHE_POLICY values 01/10/11 are all reserved and forced to WB by
> hardware. This caused a mismatch between the programmed value (0xf) and
> the readback value (0x3), resulting in igt@xe_pat@pat-* failures.

Do you have a link to the issue? I assume this is just a sw/igt issue, 
and not a real bug?

> 
> Fix by setting L4_CACHE_POLICY=0 (WB), which is the only valid L4 value
> when 2-way coherency is enabled.
> 
> Bspec: 71189, 71582
> 
> Fixes: f6a22e686273 ("drm/xe/pat: annotate pat_index with coherency mode")

I don't think this is the right fixes tag? It was already that value 
prior to this AFAICT.

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a9797d09f054..b36b64307ff0 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -217,7 +217,7 @@ static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
>   	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>   };
>   /* Special PAT values programmed outside the main table */
> -static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> +static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 0, 3 );

This previously matched the spec programming though. Not sure if we 
should ever be diverging here? Do we fully know all the ramifications here?

IMO we should just always mirror the spec exactly for the PAT 
programming. Or get them to change the spec, if something is not right.

>   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>   
>   /*

