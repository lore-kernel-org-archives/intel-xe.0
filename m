Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586A606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bu6ESi5X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C4B10FB18;
	Wed, 28 Oct 2026 10:33:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF7910E403;
 Wed, 28 Oct 2026 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793183612; x=1824719612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=RMchR7ILtmjbNKbv7Rj853D+bvHKsZ/Jxvm7AvGtLRI=;
 b=Bu6ESi5X3kZUjwGUMIyzNThhwQ0Pg6t7wu566vLo8WIqhXAFWJsBv978
 xM9A+Bhcj0QJ0F94TxVBDOwshPNwVF6q4rTgmo7zXk5T08y7o5JTQjskP
 w2Szj+MeLuT6rPxhLGaN7ORJLwI0H58WamsSRvo0dI/ISIIMDLRIa6SED
 1CU6aK5ygFdWgutBDlctsXwL2ILfI1hbFSjv27PwfcGQ2+igv+vTDkyA6
 fB0UqX+UAupIQ2CXygtpWWp3/vawFoKv5j5dRyUY91KKlknEPPwBxACnq
 /QZrZtCkW4TtKaIQrQbzhAq1E6vWXtlrdWDF9mtQ5hUfkBZvZ7G1qv6Um Q==;
X-CSE-ConnectionGUID: D8piI5dKR7y8yiQJUYTGYA==
X-CSE-MsgGUID: JlfGYxBASGW0ndTFeIZvOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1912641"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1912641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:33:32 -0700
X-CSE-ConnectionGUID: +I51gv/KQvejHVn6aiYEzg==
X-CSE-MsgGUID: EyIG9h1pRPmyXudR2oLfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4789382"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:33:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Lin, Charlton" <charlton.lin@intel.com>
Subject: RE: [PATCH v4 2/2] drm/i915/display: Disable pipe joiner on WCL
In-Reply-To: <PH7PR11MB8252C032AB2E00046CC69C14896F2@PH7PR11MB8252.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
 <20261028070404.1913843-1-vidya.srinivas@intel.com>
 <20261028070404.1913843-3-vidya.srinivas@intel.com>
 <94c3c16c-50ce-444c-985f-0fc0fb009242@intel.com>
 <PH7PR11MB82526C4A1D72F22D44331A7B896F2@PH7PR11MB8252.namprd11.prod.outlook.com>
 <48da0157-6fb3-4e93-a43c-0443c5bcbbb2@intel.com>
 <fe7b9725-be64-4a34-a8b1-b2551fb0ae91@intel.com>
 <PH7PR11MB8252C032AB2E00046CC69C14896F2@PH7PR11MB8252.namprd11.prod.outlook.com>
Date: Wed, 28 Oct 2026 12:33:26 +0200
Message-ID: <126b26709bd8fcd42552c81ec551ecd21dbdc614@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026, "Srinivas, Vidya" <vidya.srinivas@intel.com> wrote:
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: 28 October 2026 15:07
>> To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesk=
top.org
>> Cc: intel-xe@lists.freedesktop.org; stable@vger.kernel.org; Shankar, Uma
>> <uma.shankar@intel.com>; jani.nikula@linux.intel.com; Lin, Charlton
>> <charlton.lin@intel.com>
>> Subject: Re: [PATCH v4 2/2] drm/i915/display: Disable pipe joiner on WCL
>>=20
>>=20
>>=20
>> On 10/28/2026 2:58 PM, Borah, Chaitanya Kumar wrote:
>> >
>> >
>> > On 10/28/2026 2:27 PM, Srinivas, Vidya wrote:
>> >>
>> >>
>> >>> -----Original Message-----
>> >>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> >>> Sent: 28 October 2026 14:08
>> >>> To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-
>> >>> gfx@lists.freedesktop.org
>> >>> Cc: intel-xe@lists.freedesktop.org; stable@vger.kernel.org; Shankar,
>> >>> Uma <uma.shankar@intel.com>; jani.nikula@linux.intel.com; Lin,
>> >>> Charlton <charlton.lin@intel.com>
>> >>> Subject: Re: [PATCH v4 2/2] drm/i915/display: Disable pipe joiner on
>> >>> WCL
>> >>>
>> >>>
>> >>>
>> >>> On 10/28/2026 12:34 PM, Vidya Srinivas wrote:
>> >>>> Pipe joining is not supported in the WCL display configuration.
>> >>>> Report no joiner support on WCL so that modes which would require
>> >>>> joining are rejected, matching the 4k 60Hz maximum resolution
>> >>>> documented for the platform.
>> >>>>
>> >>>> v2: Rebase onto latest upstream
>> >>>> v3: Fix up the commit message
>> >>>> v4: Split the scaler and joiner changes into separate patches
>> >>>> (Jani)
>> >>>>
>> >>>> Bspec: 74286
>> >>>> Cc: stable@vger.kernel.org
>> >>>
>> >>> Won't we need a Fixes tag to tell where this change need to go to?
>> >>
>> >> Hello Chaitanya,
>> >>
>> >> Thank you. Yes, I did check checkpatch gave the same warning but I
>> >> couldn=E2=80=99t find the exact patch to call out the fixes There are=
 patches
>> >> like Extend the max dotclock limit to WCL, Restrict max source rate
>> >> for WCL to HBR3,
>> >> drm/i915/wcl: Add display device info, Add power well mapping for WCL
>> >> etc.
>> >> git log shows under merge tag the "Add support for Wildcat Lake (WCL)
>> >> display, version 30.02"
>> >> So, could not find the patch for which I could mention fixes.
>> >
>> > Fixes: 632633d095b6 ("drm/i915/wcl: Add display device info")
>> >
>> > Should be sufficient.
>> >
>>=20
>> Sorry, support for the device id was added even before that.
>>=20
>> Better fit.
>>=20
>> Fixes: f8e1c3e07db1 ("drm/i915/xe3lpd: Add support for display version
>> 30.02")
>>=20
>> It would be worth checking though if these patches applies as is or might
>> need some rebase.
>
> Thank you Chaitanya. Will use this and float again.

You *never* need to resend patches just to add git commit message
trailers.

Doing so means another round of CI and delay for absolutely nothing.

We apply patches using b4, and simply replying with the trailers is
enough to have them picked up.

BR,
Jani.


>
> Regards
> Vidya
>
>>=20
>> =3D=3D
>> Chaitanya
>>=20
>> >>
>> >> Regards
>> >> Vidya
>> >>
>> >>>
>> >>>> Suggested-by: Charlton Lin <charlton.lin@intel.com>
>> >>>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> >>>> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
>> >>>> ---
>> >>>> =C2=A0=C2=A0 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>> >>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>> >>>>
>> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> >>>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> >>>> index 00e02e019d25..ef164a797618 100644
>> >>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> >>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> >>>> @@ -485,9 +485,9 @@ bool intel_dp_has_joiner(struct intel_dp
>> >>>> *intel_dp)
>> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return false;
>> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>>>
>> >>>> -=C2=A0=C2=A0=C2=A0 return DISPLAY_VER(display) >=3D 12 ||
>> >>>> +=C2=A0=C2=A0=C2=A0 return ((DISPLAY_VER(display) >=3D 12 &&
>> >>>> +DISPLAY_VERx100(display) !=3D
>> >>>> +3002) ||
>> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (DISPL=
AY_VER(display) =3D=3D 11 &&
>> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 encoder->port !=
=3D PORT_A);
>> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 encoder->port !=
=3D PORT_A));
>> >>>> =C2=A0=C2=A0 }
>> >>>>
>> >>>> =C2=A0=C2=A0 static int dg2_max_source_rate(struct intel_dp *intel_=
dp)
>> >>
>> >
>

--=20
Jani Nikula, Intel
