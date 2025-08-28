Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC36FCA0FF7
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 16:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B436910EA47;
	Thu, 28 Aug 2025 16:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRJ6xhBd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34510EA44
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756397206; x=1787933206;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dveMrBkd/Q3I42a/7cYhPeRQELrk/izizBc0HDZ0d5E=;
 b=PRJ6xhBd6KymB+hQecuyTPMEWhT0iNOWMUV4pR0mcrfOIeMq9kOSnI4X
 Lf6eLTkeSIJk9PPwtLRjTg9Zeanxl+gEj+DnFoKPhjZ/CqmSAcUOsH9QO
 pGrq8SZEoLyv6/cWlEpfDNfCYE95DQPAtp8AQ0YPAXEBXBt5MvqQrbHXt
 XO0TH+yQ6qYIGD36Gdgd0KG+VgSZBG3r4oIZYSuUvZd4YpEZCojJ34ZJw
 1SQ48i8szTfThhlqda66LWoGeYUMr4fhrEcGWdQ2Dh3zy8rhOIz3EgKRd
 c2jG3QZSlwTJbUWesir+hKF8lpS97/q+7QBPGR9CFOKhMzWavlHC8w2OM Q==;
X-CSE-ConnectionGUID: ubtG2J4qQIWdXABAKa6a7w==
X-CSE-MsgGUID: lILuxNrpTQueFx3gDb/HGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="57701960"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="57701960"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:06:46 -0700
X-CSE-ConnectionGUID: NCKwXRPDQo6m3IEvxNfeUg==
X-CSE-MsgGUID: BzbfepCJTNGmQyKNbnUQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="193814018"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:06:44 -0700
Message-ID: <ba4a969ad501922974c796e354292b7d5451dac4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Thu, 28 Aug 2025 18:06:42 +0200
In-Reply-To: <8621165a-68d0-467b-8fe5-c28b500c0d5e@intel.com>
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
 <8621165a-68d0-467b-8fe5-c28b500c0d5e@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi,

On Thu, 2025-08-28 at 16:59 +0100, Matthew Auld wrote:
> On 28/08/2025 16:42, Thomas Hellstr=C3=B6m wrote:
> > VRAM+TT bos that are evicted from VRAM to TT may remain in
> > TT also after a revalidation following eviction or suspend.
> >=20
> > This manifests itself as applications becoming sluggish
> > after buffer objects get evicted or after a resume from
> > suspend or hibernation.
> >=20
> > If the bo supports placement in both VRAM and TT, and
> > we are on DGFX, mark the TT placement as fallback. This means
> > that it is tried only after VRAM + eviction.
> >=20
> > This flaw has probably been present since the xe module was
> > upstreamed but use a Fixes: commit below where backporting is
> > likely to be simple. For earlier versions we need to open-
> > code the fallback algorithm in the driver.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
> > Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags
> > v6")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.9+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 4faf15d5fa6d..64dea4e478bd 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -188,6 +188,8 @@ static void try_add_system(struct xe_device
> > *xe, struct xe_bo *bo,
> > =C2=A0=20
> > =C2=A0=C2=A0		bo->placements[*c] =3D (struct ttm_place) {
> > =C2=A0=C2=A0			.mem_type =3D XE_PL_TT,
> > +			.flags =3D (IS_DGFX(xe) && (bo_flags &
> > XE_BO_FLAG_VRAM_MASK)) ?
>=20
> I suppose we could drop the dgfx check here?

Thanks for reviewing. From a quick look it looks like the VRAM_MASK
bits can be set also on IGFX? And if so, then it's not ideal to mark
the primary placement as FALLBACK. But I might have missed a rejection
somewhere.

/Thomas


>=20
> Either way,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> > +			TTM_PL_FLAG_FALLBACK : 0,
> > =C2=A0=C2=A0		};
> > =C2=A0=C2=A0		*c +=3D 1;
> > =C2=A0=C2=A0	}
>=20

