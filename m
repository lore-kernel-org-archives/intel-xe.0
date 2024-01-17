Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4698EC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065E710E067;
	Wed, 17 Jan 2024 12:38:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1509110E067
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705495096; x=1737031096;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=fQ24mMySclHo6HZ9gJDRwz62QJ1s1KWu2svTy0B/7dU=;
 b=h13WBCluBKMxNcDx0In+bcuOqQ+uMCpDNdkuXZzV+GhJGN800YlTb8sQ
 RhC5oYMTj1gZVKBTzRly4gdeRJm2kWpYK9vfGc1BTeVM8NRLTMWak6xm6
 oebADEtSjw+xqwyNKphNa01lDAT+kgnMSqDs38+wEmce9N2XUYXiVlbjj
 yzfu9sYxskzT8+9jK0fyux2ytM0MSjF0u3+qdZMP95KOHh8R2EFH35E0r
 meAETpHjaqbPkU28FRIlE8eMTfPOFWa5Y1d0O0G/qb2hma8nQekvblfJg
 RWoLdjfSBUZ07Fghi8fReztQDsEAyimBld46jF2WnJ9UJjeybZB5vSNwQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7545820"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7545820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26479072"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:38:15 -0800
Message-ID: <53f0feffdaece8a49ace72451b568439ed5a973d.camel@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/xe: make hwmon_info const
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 Jan 2024 13:38:12 +0100
In-Reply-To: <20240117122044.1544174-3-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
 <20240117122044.1544174-3-jani.nikula@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Wed, 2024-01-17 at 14:20 +0200, Jani Nikula wrote:
> Make hwmon_info a const array of const pointers, and let it be placed
> in
> rodata.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> ---
>=20
> Note: Lots more in this file will end up in rodata with the hwmon
> change:
>=20
> https://lore.kernel.org/r/20240117114405.1506775-1-jani.nikula@intel.com
> ---
> =C2=A0drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c
> index 6ef2aa1eae8b..e6acdf682d2a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -402,7 +402,7 @@ static const struct attribute_group
> *hwmon_groups[] =3D {
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> -static const struct hwmon_channel_info *hwmon_info[] =3D {
> +static const struct hwmon_channel_info * const hwmon_info[] =3D {
> =C2=A0	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX |
> HWMON_P_CRIT),
> =C2=A0	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> =C2=A0	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),

