Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230AACD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 14:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C0111A8BE;
	Fri,  5 Jun 2026 14:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQYk/WgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0501011A8BE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780668834; x=1812204834;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1VmnZPO/CYKCwitU7813nmmMCsbAkZmWsA+q+6yOQh0=;
 b=KQYk/WgQDgn9i948CyuUo0Y7xUFZzdq/bq8U883/+BYQ6QBt3eIZa/si
 Tnh9Y4Dxuhw5XLICJEXEfULid/3fRw9h/1ydJ8S41gzDk3lfSx55tnaOP
 cdYAB52It2O562JHXajw/GDfa5K5IxpAK5LIj2YD4hSVteQIXWQouC/Gs
 sWhUFemvFBYZbAahaHmVRnm5HskxvTtBDOAo/dQ5jaYIU/NVxliJNKjEd
 zsBGcKj59rLhoaQSrtT39+YEFUFwKYNNVIq8AXM+zxA0wjNL1fA0+nBEe
 XF5hvO6FOQ/PVibt/FTSJgHFKlq5z7L2FkqIUezOwFfwMTyrP12oCWxCU A==;
X-CSE-ConnectionGUID: B11YU4xvRYuft6sfyQB6iA==
X-CSE-MsgGUID: vXL5lFdhQi6yHKZgm1hQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92877338"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92877338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:13:53 -0700
X-CSE-ConnectionGUID: mwbA7UJ0STmG6ivZv1iCIg==
X-CSE-MsgGUID: zEJ+rh0lQRaPyBkQIsvKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="248782376"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.251])
 ([10.245.245.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:13:51 -0700
Message-ID: <d811704a4342e2f3bed4ca0ca7ce7f0df76c9bd7.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/rtp: Fix build error with clang < 21 and
 non-const initializers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Violet Monti	
 <violet.monti@intel.com>, Matthew Brost <matthew.brost@intel.com>, Rodrigo
 Vivi	 <rodrigo.vivi@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Mark Brown	 <broonie@kernel.org>
Date: Fri, 05 Jun 2026 16:13:49 +0200
In-Reply-To: <87ecilt7lh.fsf@intel.com>
References: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
 <87ecilt7lh.fsf@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-06-05 at 10:55 -0300, Gustavo Sousa wrote:
> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> writes:
>=20
> > Clang < 21 treats const-qualified compound literals at function
> > scope as
> > having static storage duration, which requires all initializer
> > elements
> > to be compile-time constants.=C2=A0 When xe_hw_engine.c initializes a
> > local
> > struct xe_rtp_table_sr using XE_RTP_TABLE_SR(), the compound
> > literals in
> > XE_RTP_TABLE_SR end up containing runtime values (e.g.
> > blit_cctl_val
> > derived from gt->mocs.uc_index), triggering:
> >=20
> > =C2=A0 xe_hw_engine.c:361: error: initializer element is not a compile-
> > time constant
> > =C2=A0 xe_hw_engine.c:416: error: initializer element is not a compile-
> > time constant
> >=20
> > ARRAY_SIZE() cannot be used as a replacement because it expands
> > through
> > __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert
> > inside
> > sizeof(struct{}), which clang < 21 also rejects in the same
> > context.
> >=20
> > Replace ARRAY_SIZE() with an open-coded sizeof(arr)/sizeof(elem) in
> > XE_RTP_TABLE_SR and XE_RTP_TABLE to avoid both issues.
> >=20
> > Fixes: 5ff004fdc737 ("drm/xe/rtp: Add struct types for RTP tables")
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Violet Monti <violet.monti@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes:
> > https://lore.kernel.org/intel-xe/bfb0dee8-b243-47ba-a89d-71472b0d51c5@s=
irena.org.uk/
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++--
> > =C2=A01 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h
> > b/drivers/gpu/drm/xe/xe_rtp.h
> > index 4e3cfd69f922..2cc65053cd07 100644
> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > @@ -461,14 +461,22 @@ struct xe_reg_sr;
> > =C2=A0		XE_RTP_PASTE_FOREACH(ACTION_, COMMA,
> > (__VA_ARGS__))	\
> > =C2=A0	}
> > =C2=A0
> > +/*
> > + * Note: ARRAY_SIZE() cannot be used here because it expands
> > through
> > + * __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() ->
> > _Static_assert inside
> > + * sizeof(struct{}), which clang < 21 rejects when the compound
> > literal
> > + * contains non-compile-time-constant initializers.
> > + */
> > =C2=A0#define XE_RTP_TABLE_SR(...) { \
> > =C2=A0	.entries =3D (const struct xe_rtp_entry_sr[]){__VA_ARGS__},
> > \
> > -	.n_entries =3D ARRAY_SIZE(((const struct
> > xe_rtp_entry_sr[]){__VA_ARGS__})), \
> > +	.n_entries =3D sizeof((const struct
> > xe_rtp_entry_sr[]){__VA_ARGS__}) / \
> > +		sizeof(struct xe_rtp_entry_sr), \
>=20
> What would happen if we used
>=20
> =C2=A0 ARRAY_SIZE(((struct xe_rtp_entry_sr[]){__VA_ARGS__}))
>=20
> instead?

That was the first fix attempt, but didn't work either.

>=20
> Anyways, the patch looks correct to me as-is.=C2=A0 Hopefully we'll
> remember
> to go back to use ARRAY_SIZE() when we bump the minimal clang version
> required.
>=20
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Thanks,
Thomas

>=20
> --
> Gustavo Sousa
>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0#define XE_RTP_TABLE(...) { \
> > =C2=A0	.entries =3D (const struct xe_rtp_entry[]){__VA_ARGS__}, \
> > -	.n_entries =3D ARRAY_SIZE(((const struct
> > xe_rtp_entry[]){__VA_ARGS__})), \
> > +	.n_entries =3D sizeof((const struct
> > xe_rtp_entry[]){__VA_ARGS__}) / \
> > +		sizeof(struct xe_rtp_entry), \
> > =C2=A0}
> > =C2=A0
> > =C2=A0#define XE_RTP_PROCESS_CTX_INITIALIZER(arg__)
> > _Generic((arg__),							\
> > --=20
> > 2.54.0
