Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D6CAC587
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 10:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8310E697;
	Tue,  9 Sep 2025 10:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd5koHa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F4010E697
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757413626; x=1788949626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kaSXEHnuE+DyhAyVGPhbY4HjqHaEixRY1jbwk1u3Np4=;
 b=hd5koHa6zfNI/c3KNl+2P2M2uvMb89atJbNUl1ICNVABQvbFiyqmlIIv
 hgscfrFNsxPDll+nH2lRG3/1fibSenfRR/D5ole8UzQgNeFsQ8cQUfzr0
 2LzihMnKXMLC5lqFkf+mg7aFQ6iEREp0dEWMcv8SPAqTAOwd+muKVvgil
 L8igZAdDbVgqx1VPp3Eg/u6fDkSErjMwwRNiNncO3LajQIFnt7hLrbRK8
 gkiqmQOlcEy2VOj0vVew0NLQHcQNi8ZIA6+I7Pxv6dDasFN530CGnzNPo
 MbfffUXvKEUHquZITNcnCcYfMxEBdsq7fxazj81oTcnC2Xx/eyZQ9+AOz w==;
X-CSE-ConnectionGUID: cznr10k3TC+08c9PsX48jQ==
X-CSE-MsgGUID: GSS0dHB9S5q78ic+f8VDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58906919"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="58906919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:27:06 -0700
X-CSE-ConnectionGUID: 5DCXsuesRcqhngC/gtOzyw==
X-CSE-MsgGUID: 9ggHVvxNSxmd5al5+8eZKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173511435"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:27:04 -0700
Date: Tue, 9 Sep 2025 12:27:01 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <aMAA9V14iZqHK8fz@black.igk.intel.com>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
 <20250905-wa-bb-cmds-v3-4-3da2b7bdc73e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-wa-bb-cmds-v3-4-3da2b7bdc73e@intel.com>
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

On Fri, Sep 05, 2025 at 10:50:32PM -0700, Lucas De Marchi wrote:
> For a future configfs attribute, it's desirable to select by engine mask
> only as the instance doesn't make sense.
> 
> Rename the function lookup_engine_mask() to lookup_engine_info() and
> make it return the entry. This allows parse_engine() to still return an
> item if the caller wants to allow parsing a class-only string like
> "rcs", "bcs", "ccs", etc.

...

> -static bool lookup_engine_mask(const char *pattern, u64 *mask)
> +/*
> + * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> + * instance in @pattern.
> + *
> + * Examples of inputs:
> + * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> + * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> + *   mask == XE_HW_ENGINE_RCS_MASK
> + * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> + */
> +static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)

Now that we're returning engine_info, I'm wondering if we have any use for
mask parameter?

Raag

>  {
>  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>  		u8 instance;
> @@ -263,29 +275,33 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>  			continue;
>  
>  		pattern += strlen(engine_info[i].cls);
> +		if (!mask && !*pattern)
> +			return &engine_info[i];
>  
>  		if (!strcmp(pattern, "*")) {
>  			*mask = engine_info[i].mask;
> -			return true;
> +			return &engine_info[i];
>  		}
>  
>  		if (kstrtou8(pattern, 10, &instance))
> -			return false;
> +			return NULL;
>  
>  		bit = __ffs64(engine_info[i].mask) + instance;
>  		if (bit >= fls64(engine_info[i].mask))
> -			return false;
> +			return NULL;
>  
>  		*mask = BIT_ULL(bit);
> -		return true;
> +		return &engine_info[i];
>  	}
>  
> -	return false;
> +	return NULL;
>  }
