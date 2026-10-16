Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31059CCA46C
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 14:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AD210E185;
	Fri, 16 Oct 2026 14:06:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F710E185
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792159582; x=1823695582;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=3ihSU1bRa6ZTNgtCnnbwtISqWamEcfvYXxnrAGIzOa8=;
 b=jgiUiv6BH9qrjB3kQG97aV8XKdLg/x5OnxX+yK7QBgOvDXr1vYKA1Gou
 p2VfKGN/4SlS/xD5lLYBqRxUUMncCeLeb33+9sQV7mq79W6DsrxGaglek
 +cTgfP1bHuOP8UFf85FHPQP2jRfv6pGmB14DaMOZ4eiKzIq3XnuHkqCvg
 b13ZCNHdewEsT/HR5VxWZiKd/UQ6TqauLXoInPtOeRKQtcqlAWTZNemGH
 WUJZEOuBAc0Aj1RFesdlihOKqRyDbHnh3zITeTjq4Hu+gLwj+W2hxyYiL
 gM7pImfncLpgXno1SkJg4JQr/rcCYnDn3lArTMBZUH8xvDItyeu92bBOC A==;
X-CSE-ConnectionGUID: W6+D6nwFS+Wc/GjEBX9j1A==
X-CSE-MsgGUID: 1v5E2kbdSsuhARriAoAFdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="823619"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="823619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 07:06:22 -0700
X-CSE-ConnectionGUID: mNsJTkXPSqWVhvaVhOqGXw==
X-CSE-MsgGUID: B/Kzryf+Qte/k3ah8VccvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1964467"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.54])
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 07:06:21 -0700
Message-ID: <1ae33b56ae85d938aab41458e289d5124468cf5f.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size
 based on average BO size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 16:06:18 +0200
In-Reply-To: <sashiko-outbox-174403@kernel.org>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
 <sashiko-outbox-174403@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Fri, 2026-10-16 at 13:45 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] drm/xe: shrinker count callback serializes direct reclaim
> via write_lock
> --
>=20
> commit a78bd8842e67f957a2ced6d827e1c4a6430ff29b
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> drm/xe: Update non-purgeable shrinker batch size based on average BO
> size
>=20
> This commit updates the preferred vmscan batch size for the non-
> purgeable=20
> shrinker based on the average buffer object size. It introduces an=20
> exponential moving average that is updated during the shrinker count
> phase.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 8e3fe675e0f34..955908b3bdf3e 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> [ ... ]
> > @@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0	unsigned long num_pages;
> > =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > =C2=A0
> > +	if (!can_backup)
> > +		return SHRINK_EMPTY;
> > +
> > =C2=A0	num_pages =3D ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > -	read_lock(&shrinker->lock);
> > +	/* Consistently use write_lock() for simplicity. */
> > +	write_lock(&shrinker->lock);
>=20
> [Severity: Medium]
> Will this exclusive write lock create a system-wide performance
> bottleneck
> during memory reclaim?
>=20
> The core mm subsystem frequently calls the shrinker's count_objects
> callback
> (xe_shrinker_count) from do_shrink_slab() during direct reclaim. This
> occurs
> concurrently across multiple allocating tasks and CPUs when under
> memory
> pressure.
>=20
> By changing read_lock() to write_lock() to update the batch_avg
> heuristic,
> this forces all concurrent direct reclaimers system-wide to serialize
> on this
> single lock, which could lead to severe lock contention and
> performance
> degradation.

This is grossly overstated. False positive.

/Thomas



>=20
> > =C2=A0
> > -	if (can_backup)
> > -		num_pages =3D min_t(unsigned long, num_pages,
> > shrinker->shrinkable_pages);
> > -	else
> > -		num_pages =3D 0;
> > +	num_pages =3D min_t(unsigned long, num_pages, shrinker-
> > >shrinkable_pages);
> > =C2=A0
> > -	read_unlock(&shrinker->lock);
> > +	if (shrinker->populated_tts) {
> > +		unsigned long avg =3D 2 * (shrinker-
> > >shrinkable_pages +
> > +					 shrinker-
> > >purgeable_pages) /
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 shrinker->populated_tts;
> > +
> > +		shrinker->batch_avg =3D max((shrinker->batch_avg +
> > (long)avg) >> 1,
> > +					=C2=A0 128L /* default
> > SHRINK_BATCH */);
> > +		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
> > +	}
> > +
> > +	write_unlock(&shrinker->lock);
> > =C2=A0
> > =C2=A0	return num_pages ? num_pages : SHRINK_EMPTY;
> > =C2=A0}
