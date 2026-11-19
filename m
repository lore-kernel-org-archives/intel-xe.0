Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C4606A32A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFecHBG/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B59410E578;
	Thu, 19 Nov 2026 09:32:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1CD10E22C;
 Thu, 19 Nov 2026 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795080769; x=1826616769;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QS9BsHnFIcyk4yDW9WGTEWcfxuqQvwKTqkfDjLMRxoc=;
 b=QFecHBG/V3j9umV0fuTeB6PNHpp3cx/dwLWRdRS7ud73CH5Dl6DZvnXs
 sk57i82GyCcKTQ5FhD31mQpvunSQKJJjJ46uypjZY+yyHnNqqbzBTgF64
 F+Xt7HHdxUd03z8LTHzzEz6qqnNOcGxlwv+Ul6LOwHnIi9oX2wiukXwBi
 V+WqF0SNNnRVLJSfY8WnZQnT7z+rlHHGUfP0HYFM1vkqo52dj9mpWRYwX
 gVw9tr7pP0dskT47WM8OO25MDGv+AmHiRL9+/idcVZiw7xcAzN1X52lIv
 fQbNEaBa/n4dR9gX0wt8cyRClzhxNUtnG8+spXtue9u/fTDL6XXlTnReW w==;
X-CSE-ConnectionGUID: TnG9MaJARaO8sIGnE5C/3Q==
X-CSE-MsgGUID: Wc5+yl4lTc2i93wTCnrVEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3961361"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3961361"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:32:48 -0800
X-CSE-ConnectionGUID: RK/NvZbvTyG+mq3b1kl6qw==
X-CSE-MsgGUID: 7lzK6qF4RwuhXHEQrAag2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="12337513"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:32:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/de: prefer intel_reg_offset() over
 i915_mmio_reg_offset()
In-Reply-To: <av3QdAbcdznpwqyV@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261118094508.3343569-1-jani.nikula@intel.com>
 <av3QdAbcdznpwqyV@intel.com>
Date: Thu, 19 Nov 2026 11:32:44 +0200
Message-ID: <e1f97e61963270c7da524f5050afff8847b3f911@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Nov 18, 2026 at 11:45:08AM +0200, Jani Nikula wrote:
>> intel_reg_offset() should be preferred over i915_mmio_reg_offset() in
>> display code. Convert the couple of instances that have crept in.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Sorry about that chief. I have a vague recollection of changing
> these, but evidently I either imagined it or lost it accidentally
> in some rebase.

Blame it on poor review. ;)

> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to din.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_de.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i=
915/display/intel_de.c
>> index 9ca5b27eb768..08a0027e7930 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.c
>> +++ b/drivers/gpu/drm/i915/display/intel_de.c
>> @@ -219,7 +219,7 @@ static void check_unclaimed_mmio_pre(struct intel_di=
splay *display,
>>  		drm_dbg_kms(display->drm,
>>  			    "Unclaimed access detected before %s register 0x%x\n",
>>  			    write ? "write to" : "read from",
>> -			    i915_mmio_reg_offset(reg));
>> +			    intel_reg_offset(reg));
>>  }
>>=20=20
>>  static void check_unclaimed_mmio_post(struct intel_display *display,
>> @@ -234,7 +234,7 @@ static void check_unclaimed_mmio_post(struct intel_d=
isplay *display,
>>  		     display->mmio.funcs->check_for_unclaimed_mmio(display),
>>  		     "Unclaimed %s register 0x%x\n",
>>  		     write ? "write to" : "read from",
>> -		     i915_mmio_reg_offset(reg)))
>> +		     intel_reg_offset(reg)))
>>  		/* Only report the first N failures */
>>  		display->params.mmio_debug--;
>>  }
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
