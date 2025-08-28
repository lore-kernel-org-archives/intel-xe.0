Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D9DCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 15:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B32510EA3A;
	Thu, 28 Aug 2025 15:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNOW74Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E7310EA3A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756395876; x=1787931876;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O+yydBuKm1Fd0N3P6BjNhLeGzacYgQVX9NdpaShooEU=;
 b=TNOW74TiNnLM584vII92Ygfs47FxVC0D6zRwrxD5BwJdVsiWO6wvZYm0
 +1cf4C1oKgHFrE0p1ewTsL0AlIGq6UVscchF9veYPC9ks5NiSdY/14BgO
 gG7PS+jKcDrxYwo6us5KqtHJMiVRr5St5K5NeZxzmTCvpkuvGOrkolfV/
 YeSv0HX1bOq6zfrF5khAe/nlwONbQW2I7uwme80hz1b5OfmcXrmquToSk
 XRBScdnYxk+DrncUTMRpLZAO2oUQCtZqSqMwyNlqZVxbIY16WQXGxdS5u
 LkkP4qmjmf8B0uAphWoA+b6/kqRssLQb+VfJnu53CUPlx4MZfBIUz+9Ho A==;
X-CSE-ConnectionGUID: qaGdg0xvQTub5OEAUbCVSQ==
X-CSE-MsgGUID: aM6aDcd9Tq6/5vGMOXMSzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="57697633"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57697633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:44:29 -0700
X-CSE-ConnectionGUID: W+gkkQpqRiaadBs/xqX28w==
X-CSE-MsgGUID: l73EgjrdQCGrEjoZaY0BOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="193803732"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 08:44:27 -0700
Message-ID: <5fbba50f6513bb24636b0adc72317104ba92c96b.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix incorrect migration of backed-up object to
 VRAM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Thu, 28 Aug 2025 17:44:25 +0200
In-Reply-To: <5d0e5447-f264-4574-a368-0891aa93ae15@intel.com>
References: <20250828134837.5709-1-thomas.hellstrom@linux.intel.com>
 <5d0e5447-f264-4574-a368-0891aa93ae15@intel.com>
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

Hi, Matthew

On Thu, 2025-08-28 at 15:00 +0100, Matthew Auld wrote:
> On 28/08/2025 14:48, Thomas Hellstr=C3=B6m wrote:
> > If an object is backed up to shmem it is incorrectly identified
> > as not having valid data by the move code. This means moving
> > to VRAM skips the -EMULTIHOP step and the bo is cleared. This
> > causes all sorts of weird behaviour on DGFX if an already evicted
> > object is targeted by the shrinker.
> >=20
> > Fix this by using ttm_tt_is_swapped() to identify backed-up
> > objects.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5996
> > Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.15+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> I guess we are missing some test coverage here?

Indeed. A bit embarrassing this has gone unnoticed for so long.

>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks for reviewing!
/Thomas

>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 3 +--
> > =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 7d1ff642b02a..4faf15d5fa6d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -823,8 +823,7 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ttm->page_flags &
> > TTM_TT_FLAG_SWAPPED));
> > +	tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
> > ttm_tt_is_swapped(ttm));
> > =C2=A0=20
> > =C2=A0=C2=A0	move_lacks_source =3D !old_mem || (handle_system_ccs ? (!b=
o-
> > >ccs_cleared) :
> > =C2=A0=C2=A0				=09
> > (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>=20

