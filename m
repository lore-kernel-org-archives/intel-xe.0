Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C64EC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B0210EC5D;
	Fri,  6 Jun 2025 21:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcZHVyV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAFB10ED2E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749244382; x=1780780382;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BZfG/JiTPMDLTP+ThgiXGMgS/UzyBkDfeH+1C4LQM/A=;
 b=RcZHVyV8Z/2sjrzV4BC7fyneFPhIuORiUa7FDmmbEHAsAJvX/fC7Dx1b
 YavqyMOH8KlEBmx33yoL2Vhj87E9ML4z8aSmpSc/W6hQ4cKnDpioiecif
 ok4IcDWyTZfNmg/lcrsc1KfTFZbs0zsodtnthR7jSV9bxHqUBHe/DCtkx
 0e1l0IVWdZZlPJzekOxFSdfj37XY7V9/k4FWzvpxTucyul5wfeAJRYBXJ
 AKL8HO85Tdq+2z+kL004VpuVC+eXD8gNZk0sElVInbM6Sn2vMflyyTane
 L8PgeOLQ1WEtbdBB8BHt62j4/7OGztqpaXu/P0+gUe6hALtdk6JD9KlFD A==;
X-CSE-ConnectionGUID: IkdVFcHeTbWxe4P64FBQDQ==
X-CSE-MsgGUID: pVGeLpKuTny90mMHgSbzcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61670274"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61670274"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:13:02 -0700
X-CSE-ConnectionGUID: 5NTXCKjkRsWzSmAvsiprVQ==
X-CSE-MsgGUID: CO0sCSa0TLqB/K6yoo3E4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150764814"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:12:57 -0700
Message-ID: <de8a20f75094e0bc62d9459afbe7689cc6f1aab8.camel@linux.intel.com>
Subject: Re: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:12:56 -0700
In-Reply-To: <20250605184444.515556-4-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
 <20250605184444.515556-4-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
>=20
> Update the VSEC header with correct sizing and count.
>=20
> Since the crashlog entries are "merged" (num_entries =3D 2), the
> separate capabilities entries must be merged as well.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Fixes tag?

David

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
> =C2=A01 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry =3D {
> =C2=A0	.offset =3D BMG_DISCOVERY_OFFSET,
> =C2=A0};
> =C2=A0
> -static struct intel_vsec_header bmg_punit_crashlog =3D {
> -	.length =3D 0x10,
> +static struct intel_vsec_header bmg_crashlog =3D {
> +	.length =3D 0x18,
> =C2=A0	.id =3D VSEC_ID_CRASHLOG,
> -	.num_entries =3D 1,
> -	.entry_size =3D 4,
> +	.num_entries =3D 2,
> +	.entry_size =3D 6,
> =C2=A0	.tbir =3D 0,
> =C2=A0	.offset =3D BMG_DISCOVERY_OFFSET + 0x60,
> =C2=A0};
> =C2=A0
> -static struct intel_vsec_header bmg_oobmsm_crashlog =3D {
> -	.length =3D 0x10,
> -	.id =3D VSEC_ID_CRASHLOG,
> -	.num_entries =3D 1,
> -	.entry_size =3D 4,
> -	.tbir =3D 0,
> -	.offset =3D BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
> =C2=A0static struct intel_vsec_header *bmg_capabilities[] =3D {
> =C2=A0	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,
> =C2=A0	NULL
> =C2=A0};
> =C2=A0

