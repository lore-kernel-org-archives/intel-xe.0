Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3Zemlo5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD910E9AE;
	Thu, 26 Nov 2026 14:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E1610E9AE;
 Thu, 26 Nov 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795702201; x=1827238201;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CfojkDmzfVf1IAAAG8GvMbO3+44orj1p84MmF7wtqy0=;
 b=C3Zemlo5zKYOUkrf7SUSxpWIyHYHYJCAgpbYADKjm6ajMCE0y08K9EN2
 EHG9w6eETY7xZ7uJT9uX2lPchcXU7hoC2HrbCk0HTTLxMtDRR+oSvCUnQ
 AcS7SXGmHEL5vBdEzPYKyRXb/c18mOPSDsnNqwD5ysKQ9ODVXUsKovN2c
 89QV+8jSYB4rMha1cjEmlqvn1iODjQzGMqJdDvcE2Ohta1vbdD0eC1ocZ
 CUFbbc4YKV5yvWAEr52jw9O7KqWnHMj/gIaUAZzPQlP6roBQ0i9aj5tN5
 7n4VhifX02ms3UXKgQpB8FRyTucdHzeAAeRYfcSyHQb1j8scoPsCifRkZ A==;
X-CSE-ConnectionGUID: 3cERKQ0MTxGRzDvrlyuW6w==
X-CSE-MsgGUID: uYta5KycS5+pgSK0mMq84w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4522036"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4522036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:10:00 -0800
X-CSE-ConnectionGUID: 3knpX4rqTt2JJD8W4/T5JQ==
X-CSE-MsgGUID: Og2YUN7ARpmaTAev9TByGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12221749"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:10:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/compat: remove leftover
 intel_uncore_arm_unclaimed_mmio_detection()
In-Reply-To: <paa4pkftdmgke2oqxa44gcjt5n4iowy4keqlmzws6yduu5g6dq@grxks4zi65zt>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124133804.1509493-1-jani.nikula@intel.com>
 <paa4pkftdmgke2oqxa44gcjt5n4iowy4keqlmzws6yduu5g6dq@grxks4zi65zt>
Date: Thu, 26 Nov 2026 16:09:56 +0200
Message-ID: <7cf43261183a04010bf04fdfd9b9353449b92b73@intel.com>
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

On Tue, 24 Nov 2026, Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com> w=
rote:
> On Tue, Nov 24, 2026 at 03:38:04PM GMT, Jani Nikula wrote:
>> When the unclaimed MMIO detection was moved to display, an xe compat
>> inline functionw was left behind. Remove it.
>
> nit: *function
>
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

Gah, forgot to fix the typo while pushing. *facepalm*

Thanks for the review.

>
> BR,
> Micha=C5=82
>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 6 ------
>>  1 file changed, 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/dri=
vers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> index 238addc1e5fc..707f7ad0378d 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> @@ -63,10 +63,4 @@ static inline void intel_uncore_write_fw(struct intel=
_uncore *uncore,
>>  	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>>  }
>>=20=20
>> -static inline bool
>> -intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
>> -{
>> -	return false;
>> -}
>> -
>>  #endif /* __INTEL_UNCORE_H__ */
>> --=20
>> 2.47.3
>>=20

--=20
Jani Nikula, Intel
