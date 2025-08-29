Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D5DCA0FF7
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 10:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E410EB7F;
	Fri, 29 Aug 2025 10:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QH5jDGZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D77C10EB7F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756464941; x=1788000941;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QAVV+qlxYa6FarCkJYt7ZmOK0iY8jxX+eo476NT3NF4=;
 b=QH5jDGZZz6iPV/lyFJn2vA1Jyyl3+Z+AG53K03qQnvwr22LVzgRtovuH
 DdnfFIQ8mY/u7ZMq4uEXLUnDIL+ynHH2fqENlrxkF8idO0ErQ0oNx7Hmo
 dwYrRYEZtFgMQBtUYYbnNa4qPu1/Ok7cCiN4V3l4gUf/l4nu190+LHv1x
 7+T+DbkRuMk1pIAqHN4kIPlsqzXE/qnCW4UbiVBGD3gFJ1kzexgq9Gvrk
 /0PSCS/PzshsCzMyg6BPCoXhvOniK6UU6e/zAXJo8fWKg7JGTOGd6WFVK
 ZAcH8ki4hr6Wgj0yOiaSMzGQtPiF/2kujBqOk8ls0x/5N8tXlaVlfvKph Q==;
X-CSE-ConnectionGUID: 17JVQQUqSLG5TnUf6rK3tQ==
X-CSE-MsgGUID: nHx/ScimReevfEVpHyyKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69022815"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69022815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:55:41 -0700
X-CSE-ConnectionGUID: 2yufSrpKTrSE4wBtJVmQ5w==
X-CSE-MsgGUID: cju9cGqWR/WgXB6LXIMdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169609427"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.245])
 ([10.245.245.245])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:55:40 -0700
Message-ID: <692711fadc25a6c85c19ae16e9c04e50f1eaa3a9.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, stable@vger.kernel.org
Date: Fri, 29 Aug 2025 12:55:36 +0200
In-Reply-To: <e8a176ab-a24c-4b9d-a046-ae386f08f129@lankhorst.se>
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
 <e8a176ab-a24c-4b9d-a046-ae386f08f129@lankhorst.se>
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

On Fri, 2025-08-29 at 09:42 +0200, Maarten Lankhorst wrote:
> Hey,
>=20
> Den 2025-08-28 kl. 17:42, skrev Thomas Hellstr=C3=B6m:
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
> I'd say it this closes a bug in the original driver, although
> effectively v6.8 is no longer supported anyway.
>=20
> Should DESIRED also be set on the add_vram flags?

It looks for me from the TTM code that TTM then *skips* the placement
when doing a second pass with evictions.

So that's not really what we want IMO.

/Thomas

>=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.9+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 4faf15d5fa6d..64dea4e478bd 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -188,6 +188,8 @@ static void try_add_system(struct xe_device
> > *xe, struct xe_bo *bo,
> > =C2=A0
> > =C2=A0		bo->placements[*c] =3D (struct ttm_place) {
> > =C2=A0			.mem_type =3D XE_PL_TT,
> > +			.flags =3D (IS_DGFX(xe) && (bo_flags &
> > XE_BO_FLAG_VRAM_MASK)) ?
> > +			TTM_PL_FLAG_FALLBACK : 0,
> > =C2=A0		};
> > =C2=A0		*c +=3D 1;
> > =C2=A0	}
>=20
> Kind regards,
> ~Maarten Lankhorst

