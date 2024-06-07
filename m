Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE7C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 11:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B085010EC01;
	Fri,  7 Jun 2024 11:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXDOzRBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1B410EC01
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717761043; x=1749297043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dig3oXWcbWjxCsL7PTMHsOsgwRsRnIPLJc6xw2un+Lk=;
 b=CXDOzRBDaRfgTB2m7tseZ8n0ssyUdSRN1tAmWCqjTwnvn3i597HLbDqc
 XlfHthY2g0/UdKLaWZ5/VhxIRD9fLrCdP59NCZ/Af6TEbl3uskYGu2qPg
 Tyis2SsNuwdas9LWCoMisvLbbUsGO2AlQmzbZZQZGxY/+p3JhDiMbgMZ9
 WJoPHPtSp2yG/2aAB94juIu80xUnRtwu0y+As/Th7NxXAnaEVvnYXr4hK
 U4lrHBimbc8Rhf1oaH3Zdofgmm6iz9uApWJDAhNnaTJ/RhzpZ+o6IOwMD
 tdddvOlWDFS4P1XDoGh2JGELiwV7ki2JDqTzgN8X2wZ4C2Dqxohu2gT2o Q==;
X-CSE-ConnectionGUID: mtGdA7NxSPC9T9dDMQp6gg==
X-CSE-MsgGUID: h0zT0rHpTL+C4JtkKy+8TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25581019"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25581019"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:50:42 -0700
X-CSE-ConnectionGUID: uE5axesAQwWa+zYiqfToeg==
X-CSE-MsgGUID: sIIjxIFvTgKkQeOyJDKGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42758744"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jun 2024 04:50:40 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AD3FE28763;
 Fri,  7 Jun 2024 12:50:38 +0100 (IST)
Message-ID: <cbb037d2-43fd-491d-b8d1-d023b32c9758@intel.com>
Date: Fri, 7 Jun 2024 13:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Check valid domain is passed in
 xe_force_wake_ref
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
 <20240607052213.1391082-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240607052213.1391082-3-himal.prasad.ghimiray@intel.com>
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



On 07.06.2024 07:22, Himal Prasad Ghimiray wrote:
> Assert in case of XE_FORCEWAKE_ALL is passed.

We assert that XE_FORCEWAKE_ALL is *not* passed ;)

> 
> v2
> - use domain != XE_FORCEWAKE_ALL (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 651ea1e62c63..346785df3b49 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -24,7 +24,7 @@ static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
>  		  enum xe_force_wake_domains domain)
>  {
> -	xe_gt_assert(fw->gt, domain);
> +	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);

IMO we still need to document our assumptions about enum values (as
kernel-doc for enum xe_force_wake_domains) that all of them but ALL are
single BIT values, so below trick to convert it back to index must work
by design

then we can also add code more consistent with such description:

	xe_gt_assert(fw->gt, is_power_of_2(domain));
	return fw->domains[ilog2(domain)].ref;

but this patch is still a good move, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  	return fw->domains[ffs(domain) - 1].ref;
>  }
>  
