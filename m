Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C6DCDD1D6
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5273610E597;
	Mon, 30 Sep 2024 20:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chxuYJYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3AE10E597
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726702; x=1759262702;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EhhX7gfyHRuIQs3/D/kILQmYPMnyElqm5lngaHrJH/c=;
 b=chxuYJYkykXbA1QQtuiUes0P7L2dTTavl6KVEzMmoOyos2WocUXJb/Qt
 cMlnv7qGBBDd3jeXNAK9/IcPBuZR1h8B9e9Iq0zo8aT1yQjVktiCEmaaP
 IovlJqBPYfLZMtv/4IdiAkhGtgg6QthZ8DhpwLJ9f+3CpuP70gFpZxax1
 vbQPo9PJ95JkQfubCMVLeAe8LoOn9gUIiHfvX+PVn8GX0Bepvi/XU8ZtF
 /erv6UkBcG+1cAu5oaMe/00IIZmqCXPkpCHipVCqyx+6L46IEop4+vgSG
 vOn6JUXppCQYou6fFqHYjwjcyyWHftS09svxUW6JEotE+LF//je3m8NrJ w==;
X-CSE-ConnectionGUID: 2ZpvkDC6QTSa5u70ktc5Ow==
X-CSE-MsgGUID: TfrUn9vxRYyYSxM9l3IxSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30632324"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="30632324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 13:05:01 -0700
X-CSE-ConnectionGUID: Rl+UweZCQ6a6gylxvpm4vA==
X-CSE-MsgGUID: tTiED8xaS3+NnpbTfX+SSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73467746"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2024 13:05:00 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 042F033EA6;
 Mon, 30 Sep 2024 21:04:55 +0100 (IST)
Message-ID: <f6e6ebd2-de76-4466-9374-9bba7e5d2ae0@intel.com>
Date: Mon, 30 Sep 2024 22:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/25] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240930053149.1246339-3-himal.prasad.ghimiray@intel.com>
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



On 30.09.2024 07:31, Himal Prasad Ghimiray wrote:
> The helper xe_force_wake_ref_has_domain() checks if the input domain
> has been successfully reference-counted and awakened in the reference
> returned by the xe_force_wake_get() call.

hmm
but at this point of the series, xe_force_wake_get() still returns errno

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..de720881a300 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -46,4 +46,23 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
>  	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>  }
>  
> +/**
> + * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
> + * @fw_ref : Return of xe_force_wake_get()

for now you may only refer to this only as: "the force_wake reference"
and once you update xe_force_wake_get() you may say there that it
returns "a force_wake reference" that could be checked by this helper

> + * @domain : forcewake domains to verify

domain or domains ?

> + *
> + * xe_force_wake_ref_has_domain() confirms whether xe_force_wake_get()
> + * is success or not for @domain.

This function confirms whether the @fw_ref includes a reference to the
specified @domain.

> + * In the event of a failure, if the caller chooses to abort or return,
> + * they must call xe_force_wake_put(fw, @fw_ref) if the @domain
> + * parameter is XE_FORCE_WAKE_ALL

hmm, this last sentence is IMO not applicable here, it should be rather
placed in xe_force_wake_get() doc that may refer to this function

> + *
> + * Return: true on domain is refcounted.

s/on/if

> + */
> +static inline bool
> +xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
> +{
> +	return (fw_ref & domain);

you don't need these ( )

> +}
> +
>  #endif

