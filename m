Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A29610E10E;
	Wed, 17 Jan 2024 12:37:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885F10E10E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705495049; x=1737031049;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Pi8rPj1c6J0rLtzuk+ZuwRHQwA6HAy1hKc+wimxd4iE=;
 b=kvPCnn3eu8BJ/aBl7CLlTCXXsUxaAZ0X9C00kr44CsnQzoh1xzPcHi7p
 2QS1D1wGLf7Yol3Cy6aiwNmqZzjzrQsIIqHBJx+7Kiv4zQoxjE9TugHa8
 NBNeXd7eJu7hB4Z7Jsac93mjHow9KyUoQk2TqB+jRiPOwo+VsggdaIXn3
 a4u3M6MssmxE0ceYxLJuTKHBuj5x6a9Y1ZQW0qrIaczInVOYF6923nvdi
 8esGiNSY5ohUCBzTM+SNZdgR0M1A0hfSwmn2WptBH3JZgYwxkXKu5JQpu
 lid/Gqg+oo25fZmUJneNw5nkAManTYY5rqW88RWo5d4kP0hXLuj2qdxb+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6861111"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6861111"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818505278"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="818505278"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:37:28 -0800
Message-ID: <8fc6c8bb95cf99bc6ef7cd5d4b8be559bca0710d.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/xe: make heci_gsc_irq_chip const
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 Jan 2024 13:37:25 +0100
In-Reply-To: <20240117122044.1544174-2-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
 <20240117122044.1544174-2-jani.nikula@intel.com>
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
> The irq_chip definition can be const, make it so.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_heci_gsc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c
> b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index bfdd33b9b23b..1c9d38b6f5f1 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -29,7 +29,7 @@ static void heci_gsc_irq_unmask(struct irq_data *d)
> =C2=A0	/* generic irq handling */
> =C2=A0}
> =C2=A0
> -static struct irq_chip heci_gsc_irq_chip =3D {
> +static const struct irq_chip heci_gsc_irq_chip =3D {
> =C2=A0	.name =3D "gsc_irq_chip",
> =C2=A0	.irq_mask =3D heci_gsc_irq_mask,
> =C2=A0	.irq_unmask =3D heci_gsc_irq_unmask,

