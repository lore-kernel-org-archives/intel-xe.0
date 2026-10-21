Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A3606A32E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dSoZAdoO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637510E02C;
	Wed, 21 Oct 2026 15:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F5810E039
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792595974; x=1824131974;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ULpDr1+rUPCdSres7S3dstuiM5d6KmYwt0077EWqOLQ=;
 b=dSoZAdoOyam14M4t2nL3b8EFLOXi1wn18/mBtH5Zo0XsrTg2JIi77pr4
 aZRJIjAf9juYJhoF3fXICdhNfN5D6D1XmhApy/gkUqRIXkVxlwUCBZWXj
 ONkN5JyH2BYuT0wA3KdKm5sHLtbVvcuOh2ijzcWpcdDCqM0l3zfBJCNdP
 aS9Ds1bEMjIgRz+4+RuxvQu0ausOzOseIOVjtssK8Je1b+2MsOXbXwtjZ
 feFP/YZoXsLHU5ustwlPpSaFkzKgU+C64DBbHfAz98smXIfZXPz5p5TQP
 6bezpCt9XfGFbc8SvffRxZrCis5Z9sbQpT7jkP/eh7Lp5WFVIFPIBj6TX Q==;
X-CSE-ConnectionGUID: fgXY3LiWRmKDq7nVMJcskg==
X-CSE-MsgGUID: 0OurY5daSNGdqGETxFTOtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1305760"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1305760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 08:19:33 -0700
X-CSE-ConnectionGUID: 5fpXuWE+ThWdE7/v2i2BZA==
X-CSE-MsgGUID: KvadopIeRXiVF02RcDjrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3127372"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.16])
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 08:19:31 -0700
Message-ID: <871b54cbf3d6ac1937891e57a8353d00ca740ca4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't fail runtime suspend permanently on VRAM
 eviction -ENOMEM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Date: Wed, 21 Oct 2026 17:19:29 +0200
In-Reply-To: <atfMwPZB4l01xna5@intel.com>
References: <20261020100545.46715-1-thomas.hellstrom@linux.intel.com>
 <atduGDrVk7kc-PPe@intel.com> <ateSC6dTa0M3Qc8n@gsse-cloud1.jf.intel.com>
 <atfMwPZB4l01xna5@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 16:19 -0400, Rodrigo Vivi wrote:
> On Tue, Oct 20, 2026 at 09:08:43AM -0700, Matthew Brost wrote:
> > On Tue, Oct 20, 2026 at 09:35:20AM -0400, Rodrigo Vivi wrote:
> > > On Tue, Oct 20, 2026 at 12:05:45PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > If evicting VRAM to system memory fails with -ENOMEM during
> > > > runtime
> > > > suspend to D3cold, the error is returned to the runtime PM
> > > > core.
> > > > Runtime PM treats any error other than -EAGAIN or -EBUSY from
> > > > the
> > > > ->runtime_suspend() callback as fatal, records it in
> > > > dev->power.runtime_error, and refuses further runtime PM
> > > > operations
> > > > on the device until the error is cleared.
> > >=20
> > > oh!
> > >=20
> >=20
> > I'm poked around core PM code but had a hard time verifying the
> > above
> > claim is correct.
> >=20
> > Any code references to help me verify this is correct?
>=20
> drivers/base/power/runtime.c
> rpm_callback()
>=20
> if (retval !=3D -EAGAIN && retval !=3D -EBUSY)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dev->power.runtime_error =3D retval;
>=20
> that prevents new calls while this is not cleared.

This patch needs a prereq change, since if we return -ENOMEM, there's
nothing that drops any allocated backup for pinned bos.

So will hold off this patch for a while since it increases the
likelyhood that this will happen.

/Thomas


>=20
> >=20
> > Matt
> >=20
> > > >=20
> > > > Memory shortage is a transient condition, and with eviction now
> > > > using
> > > > __GFP_RETRY_MAYFAIL it is also more likely to occur. Convert -
> > > > ENOMEM
> > > > from the eviction to -EAGAIN so that the device stays active
> > > > and
> > > > runtime suspend is retried at a later idle transition.
> > > >=20
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > Intel GPUs")
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > Cc: <stable@vger.kernel.org> # v6.8+
> > > > Assisted-by: LLM
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_pm.c | 10 +++++++++-
> > > > =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > b/drivers/gpu/drm/xe/xe_pm.c
> > > > index daa7ba2df317..9bf57ed1ea59 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -649,8 +649,16 @@ int xe_pm_runtime_suspend(struct xe_device
> > > > *xe)
> > > > =C2=A0
> > > > =C2=A0	if (xe->d3cold.allowed) {
> > > > =C2=A0		err =3D xe_bo_evict_all(xe);
> > > > -		if (err)
> > > > +		if (err) {
> > > > +			/*
> > > > +			 * Runtime PM treats errors other than
> > > > -EAGAIN and
> > > > +			 * -EBUSY as fatal, so report memory
> > > > shortage as
> > > > +			 * transient to allow a later retry.
> > > > +			 */
> > > > +			if (err =3D=3D -ENOMEM)
> > > > +				err =3D -EAGAIN;
> > >=20
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >=20
> > > > =C2=A0			goto out_resume;
> > > > +		}
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	for_each_gt(gt, xe, id) {
> > > > --=20
> > > > 2.56.0
> > > >=20
