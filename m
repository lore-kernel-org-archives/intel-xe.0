Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D162FC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853FC10E940;
	Thu,  6 Jun 2024 13:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OK+jOc37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C7C10E947
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717678838; x=1749214838;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bJKP/yB4n8/poJ4UjntQTdWuPLlJIWjyMqpceZEuJsQ=;
 b=OK+jOc37k7L/tM1M3XAgiXCqkKJ+Yp37b7FHJJtoDnfk8pEhFkyksfo/
 NPtohmASaC7o3mHphabKR+WfZX9polxrGUkoUEHCxR8ceDozw8QtTnpIs
 YM8/hiKooBqyFuhMWnGolG/ANVLUohNhtbXsxTm7GuZ5G6uD+XB9x6SY4
 qKQKtbblbHlEvkW2EEimImQukD0kBIBhDi5Cqp7t9gRajgP0C104aoIj2
 N0irIAPdMvKSb7VoEmwmQofBPnA42mDK5D81/GnaDg4wDVtsM5G7wJx6x
 p1oWaWc09u3nGbVc0utx1gWgk+NQOc6Q3hmHtyXamVLWjvq92a7WT6rsL A==;
X-CSE-ConnectionGUID: nx0r51XHT5G3ismF4tseig==
X-CSE-MsgGUID: VuYiJU6bSEuQyjkm9hrBDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14303150"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14303150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:00:37 -0700
X-CSE-ConnectionGUID: kLd43g5JR/qU+oLhRk5+zQ==
X-CSE-MsgGUID: WAM5agsVRWi3cbugGPtY0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="68757621"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 06 Jun 2024 06:00:36 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 55F1433BEC;
 Thu,  6 Jun 2024 14:00:34 +0100 (IST)
Message-ID: <85d93db4-9d56-4ded-9e2e-d221795f5b15@intel.com>
Date: Thu, 6 Jun 2024 15:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Check valid domain is passed in
 xe_force_wake_ref
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
 <20240606124133.1353738-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240606124133.1353738-3-himal.prasad.ghimiray@intel.com>
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



On 06.06.2024 14:41, Himal Prasad Ghimiray wrote:
> Assert in case of multiple or invalid domains are passed.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index cee8ff039f83..067afcdde429 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -24,7 +24,9 @@ static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
>  		  enum xe_force_wake_domains domain)
>  {
> -	xe_gt_assert(fw->gt, domain);
> +	xe_gt_assert(fw->gt, domain && (domain < XE_FORCEWAKE_ALL));
> +	xe_gt_assert(fw->gt, !(domain & (domain - 1)));
> +

that should be sufficient:

	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);

but if you really want to be paranoid then add:

	xe_gt_assert(fw->gt, is_power_of_2(domain));

and then you can likely use ilog2 below:

 	return fw->domains[ilog2(domain)].ref;

>  	return fw->domains[ffs(domain) - 1].ref;
>  }
>  
