Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E19C4829B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 15:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA4410EC7B;
	Mon, 12 Feb 2024 15:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFdJed43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1155C10ED33
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707751312; x=1739287312;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4efHziirS9LQgucyg1OmkCHmte/TKspnTd7QlCWaNqs=;
 b=oFdJed433oeWGomCq5i5T3sysRpNONiiESxrFt/G/qQLwlA9B7vCrh2G
 LJgRUM/XFk+oF93we4sOLMRAaPt90vbRd1L81yu7wDRobkc3tnhYP4scl
 EvzSWa3kb6n+TfY5NvSFOm7hCnLIW4cU2hzStbQlSeRsZvON+xrUgZwFR
 erbM+Nrr8b0VVoPK9p42xWMhaT0yKeFZt1LbX5z3/0mpIU10bHTynPN04
 BthUpSQBbd0RdMkfM7Z3MM7l8U6L1tEQRhY79OTNZPgbejePNSsYngd+b
 z+YMoZAPI/17zKg9AaBijSSCdDwtpPMN/Z+t8aMTE5hD84/wefut6VT+H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396164440"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="396164440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:21:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2920897"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.80])
 ([10.249.254.80])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:21:50 -0800
Message-ID: <26e8d3c2ef45e64dc07f568222e709ac64ad6b35.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: use drm based debugging instead of dev
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 16:21:46 +0100
In-Reply-To: <20240212145757.645094-1-jani.nikula@intel.com>
References: <20240212145757.645094-1-jani.nikula@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-12 at 16:57 +0200, Jani Nikula wrote:
> Prefer drm_dbg() over dev_dbg().
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_irq.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c
> b/drivers/gpu/drm/xe/xe_irq.c
> index 17b3affdb6a0..2f5d179e0d00 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -442,7 +442,7 @@ static irqreturn_t dg1_irq_handler(int irq, void
> *arg)
> =C2=A0		 * irq as device is inaccessible.
> =C2=A0		 */
> =C2=A0		if (master_ctl =3D=3D REG_GENMASK(31, 0)) {
> -			dev_dbg(tile_to_xe(tile)->drm.dev,
> +			drm_dbg(&tile_to_xe(tile)->drm,
> =C2=A0				"Ignore this IRQ as device might be
> in DPC containment.\n");
> =C2=A0			return IRQ_HANDLED;
> =C2=A0		}

