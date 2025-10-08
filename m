Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA27CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 12:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4910E0F2;
	Wed,  8 Oct 2025 12:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7bp3/8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5411110E0F2
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759925604; x=1791461604;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=64uEKQwBDbTu/5OnR0oE/zzgDHVxpw/6KCy0l2+FtFY=;
 b=h7bp3/8CqKjslz2P1w3N6qvF4VoCku5i8ecbp7NC500NdsNmBwZk4C3E
 bppNs8HtsWKq5bEZC1i8LZXhmlWYdDKCAvG1yrs2qyqsY+cXlp/+wfoTJ
 Cm1WROwrcLa5h0FO/mu8ON3bpTdsYYtdyZTbiwUjAsTxTG3pC4xUfRwUT
 txxIYxdFy6+A6YbdivM99BWIFi1kzDmevpuBtBL5r6V3iFO2AN9yLpjtz
 bF9jz/u6S15Mor4wPuI48DQOqvyPUpWaf97cZdmxx4Fp7GqZJ4CYYLwIa
 l04XhgPQ/JkB3Dh9z0euT6jRy1OcYKCZGtu1PrdEfDZIPnFAmkkAt3tJj g==;
X-CSE-ConnectionGUID: RHLEyQUJQ9aPBqRxuESisQ==
X-CSE-MsgGUID: q+Lak+kgSqu3MM3b7Jej6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65942508"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65942508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:13:24 -0700
X-CSE-ConnectionGUID: FGVP43VTQjSYx9JyOhEBMw==
X-CSE-MsgGUID: bBuQKkHoSXKp9cVjy8NUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="211072271"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.126])
 ([10.245.244.126])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 05:13:23 -0700
Message-ID: <c58cf7c7ec15b384bf1213e7202054bbd6da37c5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Fix an error path
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Date: Wed, 08 Oct 2025 14:13:03 +0200
In-Reply-To: <aOZRMGpSUeC-IbUn@fdugast-desk>
References: <20250910160939.103473-1-thomas.hellstrom@linux.intel.com>
 <aOZRMGpSUeC-IbUn@fdugast-desk>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-10-08 at 13:55 +0200, Francois Dugast wrote:
> On Wed, Sep 10, 2025 at 06:09:39PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The exhaustive eviction accidently changed an error path goto to
> > a return. Fix this.
> >=20
> > Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for
> > exhaustive eviction")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thanks, Francois!
/Thomas


>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 6fad5d469629..1ffff251d763 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -425,7 +425,7 @@ int xe_migrate_init(struct xe_migrate *m)
> > =C2=A0		xe_validation_retry_on_oom(&ctx, &err);
> > =C2=A0	}
> > =C2=A0	if (err)
> > -		return err;
> > +		goto err_out;
> > =C2=A0
> > =C2=A0	if (xe->info.has_usm) {
> > =C2=A0		struct xe_hw_engine *hwe =3D
> > xe_gt_hw_engine(primary_gt,
> > --=20
> > 2.51.0
> >=20

