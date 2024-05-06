Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA6C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 11:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E0610EDEB;
	Mon,  6 May 2024 11:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuTEf2bo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20C510EDEB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714996082; x=1746532082;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=esKOKTN3oSxoKqzot6E2e31PMhF8Q7TiEmv+MKnCqhs=;
 b=RuTEf2bo20eSu8I/cMri8L8kklPBikOfnEuQZndfc3KOJ9ibhILJovmG
 xwa676yAitLt8TdvdX8Q1O/G1G8M0NZUW6GszICJBvKaOr1e2Ikxu8wYh
 EwZwJ/rF3+4K7nnIYdkWEWKqTlETcu+MsolvER1sLuYIfUe5dogMBZ/+m
 j993WyfyRXCESmdj5VZovmiRW+Lbmecg0/z77/9aDGFN7fiTgZGBETD3a
 6ngRUVYvNesLYv8lg88y53n5328621Zc0R0CW1whjsEFOGUW4729oMefG
 pljWbjObWnWw0uO2EBAok0dQtQCjVDRJa0fEvCpmOMhY8mGshTQuGUbUJ g==;
X-CSE-ConnectionGUID: hK7IWK+DSfKfl5SQuUVkLA==
X-CSE-MsgGUID: 4xg6gz/URhSYetwTfC4f/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="28262564"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28262564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:48:01 -0700
X-CSE-ConnectionGUID: 78/Wc8lsTnqRjFTPOC3Ahw==
X-CSE-MsgGUID: v7g1zEphQ6a7EUZO7slZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28674974"
Received: from unknown (HELO [10.245.245.120]) ([10.245.245.120])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:47:59 -0700
Message-ID: <7fc1de2451b583b4f89f2a0d938bfba55a6acd98.camel@linux.intel.com>
Subject: Re: [PATCH 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.brost@intel.com, 
 francois.dugast@intel.com, matthew.auld@intel.com, anshuman.gupta@intel.com
Date: Mon, 06 May 2024 13:47:56 +0200
In-Reply-To: <20240503191309.7022-2-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-2-rodrigo.vivi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> Current callers of this function are already taking the result
> to a boolean and using in an if. It might be a problem because
> current function might return negative error codes on failure,
> without increasing the reference counter.
>=20
> In this scenario we could end up with extra 'put' call ending
> in unbalanced scenarios.
>=20
> Let's fix it, while aligning with the current xe_pm_get_if_in_use
> style.
>=20
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
> =C2=A0drivers/gpu/drm/xe/xe_pm.h | 2 +-
> =C2=A02 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c1831106ea4b..eca977d1e1cb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device
> *xe)
> =C2=A0 * xe_pm_runtime_get_if_active - Get a runtime_pm reference if
> device active
> =C2=A0 * @xe: xe device instance
> =C2=A0 *
> - * Returns: Any number greater than or equal to 0 for success,
> negative error
> - * code otherwise.
> + * Returns: True if device is awake (regardless the previous number
> of references)
Nit: Athough both "Returns:" and "Return:" work, the latter seems to be
the preferred.

Otherwise LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>



> + * and a new reference was taken, false otherwise.
> =C2=A0 */
> -int xe_pm_runtime_get_if_active(struct xe_device *xe)
> +bool xe_pm_runtime_get_if_active(struct xe_device *xe)
> =C2=A0{
> -	return pm_runtime_get_if_active(xe->drm.dev);
> +	return pm_runtime_get_if_active(xe->drm.dev) > 0;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 18b0613fe57b..f694005db278 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
> =C2=A0void xe_pm_runtime_get(struct xe_device *xe);
> =C2=A0int xe_pm_runtime_get_ioctl(struct xe_device *xe);
> =C2=A0void xe_pm_runtime_put(struct xe_device *xe);
> -int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +bool xe_pm_runtime_get_if_active(struct xe_device *xe);
> =C2=A0bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> =C2=A0void xe_pm_runtime_get_noresume(struct xe_device *xe);
> =C2=A0bool xe_pm_runtime_resume_and_get(struct xe_device *xe);

