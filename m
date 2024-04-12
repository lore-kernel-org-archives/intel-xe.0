Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C691C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 06:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127C810F261;
	Fri, 12 Apr 2024 06:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMGgvFfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882410F263
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712904974; x=1744440974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WzNGDjG6fdrmSeAs96ZDPCqEohJg4V4nsVC3BiGkJxc=;
 b=iMGgvFfjh6QGumhchmuPMOA3gYZ9sBPE1ApmqeQu+BjLvPu7BLccxb4Q
 dtFx3QIXhyNVJPDPIze2elncE8EMR9ecSf2EuQ56c1dt38YVZuzFBb3H+
 HEa1w+lpYLhpRDBayJ2tsfNlGRE1ib4DVCmuKTGpmJYjVZFAsjYJfRqCh
 kyH9C7l9hsOeilrDJ9hSjOTNSq6bJM9f9ZTY9zEEtzXGtfYofIzNysDRb
 tzoG42p4MBzF8zVc7rgMHRwf+zpPf8BR9js8krYGPOsAj+Wm64BCSVzRv
 kzyJ1vtv0XHWGlVuC+Wndezgtgvi9zCBUW0gIZ12vVJA5ZAArQHyGHJ59 A==;
X-CSE-ConnectionGUID: nTQJZdB7QWe2UDCLBAPezw==
X-CSE-MsgGUID: B+K5TMXjQOCzz9QQz88JCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12134887"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12134887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 23:56:14 -0700
X-CSE-ConnectionGUID: zfcGDfWeQUSuFjRl6+Hi3A==
X-CSE-MsgGUID: 3AvM3Ya7R66octx1gPw9nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25598935"
Received: from gjantea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 23:56:11 -0700
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
Date: Fri, 12 Apr 2024 09:56:05 +0300
Message-ID: <87v84n3w8q.fsf@intel.com>
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

What's "oob" and why is it used unexplained everywhere?

BR,
Jani.

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

-- 
Jani Nikula, Intel
