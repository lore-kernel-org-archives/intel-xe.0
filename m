Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED402E9E2F9
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 12:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795FB10E189;
	Wed, 11 Feb 2026 12:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZOuA7Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FD310E145;
 Wed, 11 Feb 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811414; x=1802347414;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0PVnu6077kn/sHrMX4M1V4c92Bf0gx2QSofA7b0udz4=;
 b=mZOuA7Y1c1V7xo5vOo/VN41NFX+dGoObDBjB6NIst8TOOYHVhCcw+dzh
 LClgvdzWFlsJrlVp2YDusl9yp8Z8r7bvJwXd0zx/Nbj3n/WowaKTT2YFU
 PVu5tp7LF0oraqB32DDLlP+cgn45xA8hrm7ofzgUTKVoS2dYLs0ymyrYi
 YpVPA1r3yGapuUHHZzXakul5lY4FPNQmArIJeaMf3cx7Dxl89ZJpwdxjr
 gJmlCRNnID93trQUlZCEevJfgkerBk6KdciccW7NTMmEWiifLa+ksqhRI
 ntkPYiPi5JTOoY6y0nEaf/Q4+5qTRGaZGMS8T1klArFjgTVkdm4dJS/93 Q==;
X-CSE-ConnectionGUID: Md+YAGQYTmqAMAEv7kL5og==
X-CSE-MsgGUID: AyRtLBUgSHOFc9f57qoO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75805444"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75805444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:03:33 -0800
X-CSE-ConnectionGUID: nrv8QZY2T4ScCuaTUH+7dw==
X-CSE-MsgGUID: t2K0X/OLTZSViwWVnL8H+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216735823"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:03:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] drm/i915: free _DSM package when no connectors
In-Reply-To: <fcef7bb595e9197eec717a3876d8bc0c869a4b25@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109032549.1826303-1-kaushlendra.kumar@intel.com>
 <fcef7bb595e9197eec717a3876d8bc0c869a4b25@intel.com>
Date: Wed, 11 Feb 2026 14:03:27 +0200
Message-ID: <b6b359780b7b46802feff0f1db18f63aed8adab1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 09 Jan 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Subject prefix "drm/i915/acpi:"
>
> On Fri, 09 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrot=
e:
>> acpi_evaluate_dsm_typed() returns an ACPI package in pkg.
>> When pkg->package.count =3D=3D 0, we returned without freeing pkg,
>> leaking memory. Free pkg before returning on the empty case.
>
> Fixes: 337d7a1621c7 ("drm/i915: Fix invalid access to ACPI _DSM objects")
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.14+
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.



>
>> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_acpi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm=
/i915/display/intel_acpi.c
>> index 68c01932f7b4..e06f324027be 100644
>> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>> @@ -96,6 +96,7 @@ static void intel_dsm_platform_mux_info(acpi_handle dh=
andle)
>>=20=20
>>  	if (!pkg->package.count) {
>>  		DRM_DEBUG_DRIVER("no connection in _DSM\n");
>> +		ACPI_FREE(pkg);
>>  		return;
>>  	}

--=20
Jani Nikula, Intel
