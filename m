Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE4606A323
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2aXU1k8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD310E4F6;
	Fri, 27 Nov 2026 09:22:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11110E4F6;
 Fri, 27 Nov 2026 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795771320; x=1827307320;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+bchUNSV9xo+iREldJoqcEgXa7FskgVkU5KXi8GGU/Y=;
 b=P2aXU1k8f5Fz4lpfE2Hq7oDkG0CVBYQB9m8380w3BBeHanGIzbmkceIB
 858ImNBhOtJOR1Eol4hgQxevvIaXiqZ47mLSO4N3GzIUsP0mSYHgMjPPC
 5CSQ/kcDctuF22B7AQmTitOxLdyqQVSXjG9mshwfEGOzEkaEE2rbt/I+D
 QZqVJph6/4L1kq4p7cfQHAo/7VvcfueVfIzNR3ITzS75+tBmmPsfMaF6k
 QKtk8plDpUV65A3Ydj1TxGvXbyS/c15Y/D5qh/GUm2ap8Agpj/o1CLYLf
 YxSf/50IbBdEDJB2SDXpz1UbMJrnLkBPVKghDsK8OoBg0U80mik24C50n A==;
X-CSE-ConnectionGUID: d+xyn0GtQBO64P0g/wYHFA==
X-CSE-MsgGUID: ill/rX0uR9+hASnTnEuDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4586914"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4586914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:21:59 -0800
X-CSE-ConnectionGUID: 2C2HsOsZQfSIoXICZsiNmw==
X-CSE-MsgGUID: PPyHT1ZeTMGszz5b20jynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12608240"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:21:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: remove unused fake uncore lock
In-Reply-To: <awhuOnl0kFqDBqOS@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124134850.1520247-1-jani.nikula@intel.com>
 <awhuOnl0kFqDBqOS@intel.com>
Date: Fri, 27 Nov 2026 11:21:56 +0200
Message-ID: <d9c6a722a8313dfdfef3af3ab82224b94333bfdb@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Nov 24, 2026 at 03:48:50PM +0200, Jani Nikula wrote:
>> The xe fake uncore lock usage was removed in commit 527a438bf738
>> ("drm/i915/de: Introduce display->mmio.lock"). Remove the lock too.
>>=20
>> Keep the now empty uncore sub-struct in struct xe_device for a while
>> longer, as we're still using container_of() to get from the uncore
>> pointer to xe_device in the xe compat uncore code.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to din.

>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 3 ---
>>  drivers/gpu/drm/xe/xe_device_types.h    | 1 -
>>  2 files changed, 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/x=
e/display/xe_display.c
>> index 0236f69a0f88..b1a6008bf15c 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -85,9 +85,6 @@ int xe_display_init_early(struct xe_device *xe)
>>  	if (!xe->info.probe_display)
>>  		return 0;
>>=20=20
>> -	/* Fake uncore lock */
>> -	spin_lock_init(&xe->uncore.lock);
>> -
>>  	intel_display_driver_early_probe(display);
>>=20=20
>>  	intel_display_device_info_runtime_init(display);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/x=
e_device_types.h
>> index 8f2a31949073..f624c717aebf 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -637,7 +637,6 @@ struct xe_device {
>>  	 */
>>=20=20
>>  	struct intel_uncore {
>> -		spinlock_t lock;
>>  	} uncore;
>>  #endif
>>  };
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
