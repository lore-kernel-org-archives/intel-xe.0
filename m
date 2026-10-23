Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CBD606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OP8ahQ/T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55268112AEA;
	Fri, 23 Oct 2026 11:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325C112B05
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792756729; x=1824292729;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Hj4tRDuHe3v1BpZXivXDQx1MJ9AJvc5HnGawkxJFtF4=;
 b=OP8ahQ/T4q6QYQfP8SstGEBDkKI1o5X4ppNcJd4IjtSFB6PyTCzXTJrE
 vWbv7QrhI8GAMnL2WbPL/S6HqbuPPgYHXgHgyz9JRclT/5HDPH0d3UE6Y
 0FLQ7DXrOy/GUvRJje3gl9WNhzVqw2datIAB1fQNVakzqUHZ+KRu5cmYg
 x63KX6vHcvyNKLMcrLnKlEHfLOp7Esal2H6IIkeZMwE5Dx3Qo0sd2Gwn4
 Xozropa94eE8yI8yOiJtv7kIiYvDeVKN0Ca0nKSJLMF1HLKreUPK2WmFL
 wM7R9RzJifQfnHvh1C0hX7FxfenbI6PaDqONUemnitQ7cZvn8EXUTpA3S g==;
X-CSE-ConnectionGUID: nE2FU0VrRTaS0RLZ3VGuGw==
X-CSE-MsgGUID: p4BtHkgaScOffeaKiXkzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1535874"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1535874"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 04:58:10 -0700
X-CSE-ConnectionGUID: cEoFNOfIQsawvF33icJLiw==
X-CSE-MsgGUID: ls+CRbloRpeqcIupUb3HNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3541774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 04:58:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Restrict LONG_MAX overflow check to
 32-bit builds
In-Reply-To: <20261023082939.387258-2-mallesh.koujalagi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261023082939.387258-2-mallesh.koujalagi@intel.com>
Date: Fri, 23 Oct 2026 14:58:04 +0300
Message-ID: <e5d55f7adef63e5ff054b1493f1759c83cf5e33b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
> The temperature decoding code stores the intermediate result in an
> s64 and checks it against LONG_MAX before assigning it to a long.
>
> This check is only needed on 32-bit architectures, where long is
> narrower than s64. On 64-bit systems, long and s64 are both 64 bits,
> so the condition can never be true.
>
> Wrap the check with BITS_PER_LONG == 32 so it is only compiled where
> it is needed, preserving the existing overflow protection on 32-bit
> architectures while eliminating the dead branch on 64-bit builds.

Why would it matter? Why make the code harder to read with the inline
#ifdef?

>
> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..2ee51921acf5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1322,9 +1322,14 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>  		value = 0;
>  	}
>  
> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> +#if BITS_PER_LONG == 32
> +	/*
> +	 * On 32-bit systems, long is smaller than s64, so the value may
> +	 * still overflow long even if it fits in s64.
> +	 */
>  	if (value > LONG_MAX)
>  		return -ERANGE;
> +#endif
>  
>  	if (reg_val & IEEE754_SIGN)
>  		value = -value;

-- 
Jani Nikula, Intel
