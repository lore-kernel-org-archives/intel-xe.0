Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544EBC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 11:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F8C10E6EE;
	Thu, 25 Apr 2024 11:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZK4qpqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995310E6EE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714043991; x=1745579991;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WKrlrpO320qe1nvXIZIJs8i1sz3RA1mZfQEOVfnLrdc=;
 b=BZK4qpqSGFYcIsLb+kfH3LX2kDDHsCDBGG0BetHkl4ZJEmVdun4sWvq6
 0cMti3UbIpH1TD+3EyDmY5FBztDd1zTdGi1aoGvH7P3zxBpxHSovApNgn
 KzfKXzfKnzTJuBJ48JTpxUH9fHDKw5P4A6FOiLDNRS7BQmfmpOUE4wEH3
 CBsVt7F5eJRPvmAFWBw2dl5j656p5JrA/HAVDbtmrpT/T+X8VjCbXiiWK
 9gJCPBh4jgR5m0Y3QdvAo9oc7n+I5bBnBwAzibA5xnvHpJ5SYFAq95wJf
 1zDws1Vdd0RxzJb6C8KbPuKNfK5oqAmf2MjowxkfQ/6LF/igIbbkGlGIp Q==;
X-CSE-ConnectionGUID: VUNoL83QRY6MlbcIK9080Q==
X-CSE-MsgGUID: ygNtw1pWRPyjTAFTGh5Yhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21141536"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="21141536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:19:50 -0700
X-CSE-ConnectionGUID: 7jtqSC11T9u0lH6HjE0TpA==
X-CSE-MsgGUID: ppKQJewgQRm6PcUcf0BfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29516069"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:19:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nathan Chancellor <nathan@kernel.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Matt Roper <matthew.d.roper@intel.com>, Niranjana
 Vishwanathapura <niranjana.vishwanathapura@intel.com>, Thomas =?utf-8?Q?H?=
 =?utf-8?Q?ellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Generate oob before compiling anything
In-Reply-To: <20240411210703.3296782-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
Date: Thu, 25 Apr 2024 14:19:45 +0300
Message-ID: <87le51pu3y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Instead of keep adding more dependencies as WAs are needed in different
> places of the driver, just add a rule with all the objects so the code
> generation happens before anything else.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6015c9e41f24..a5809b3ec8a5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -46,18 +46,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  		 $(srctree)/$(src)/xe_wa_oob.rules
>  	$(call cmd,wa_oob)
>  
> -uses_generated_oob := \
> -	$(obj)/xe_gsc.o \
> -	$(obj)/xe_guc.o \
> -	$(obj)/xe_guc_ads.o \
> -	$(obj)/xe_migrate.o \
> -	$(obj)/xe_ring_ops.o \
> -	$(obj)/xe_vm.o \
> -	$(obj)/xe_wa.o \
> -	$(obj)/xe_ttm_stolen_mgr.o
> -
> -$(uses_generated_oob): $(generated_oob)
> -
>  # Please keep these build lists sorted!
>  
>  # core driver code
> @@ -319,3 +307,7 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>  	$(call if_changed_dep,hdrtest)
> +
> +# make sure the generated header is done before any
> +# compilation unit is attempted
> +$(xe-y): $(generated_oob)

I'm sorry, I don't understand why this would ensure the order.

Moreover, I think there should be a way to express the dependency
accurately and automatically. I'm just not sure how. I guess it's the
system include <generated/...> that prevents the usual dep handling from
working.

BR,
Jani.


-- 
Jani Nikula, Intel
