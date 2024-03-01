Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6949C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 08:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38BB10E326;
	Fri,  1 Mar 2024 08:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkPD7RMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1D910E326
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709281342; x=1740817342;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2rPWBcwr+72sXujmrCiyvd5v4lKK3NwYrJj6asyJ1Gk=;
 b=KkPD7RMX1mwkR126d7o8ygWOUcCHHP8TGy63KCMFEZ7FluhkfOOV0FhV
 BvbERXc+TCf/rKDJX160oBHS2sAACWag/9vyrmFRCSYI94X/4pnel8qgA
 rvGJ3O0a7aFP2UU7veyTjBb/buiB/W25Oiy9CKX+LoTCgXUjHqWCKT6u2
 YAVXYAIxrCBH/Mu1IkMbIJpOK6xR4Osukv0xWHo+YWDNOfVTARdbTakVw
 zOrDtdSRTMK+CZHlx26yFlG6MoQVyY2v58sKNA6CZk9Bai87y160LkYur
 6YL5Ko8gCZE28Pi0zfPILzIQ3u4AuxmMPeVthAfJPBI6v/7snln9Zi9c0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3926343"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3926343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8064384"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:22:19 -0800
Message-ID: <394fddb5ce8505141c0dfd2ea543e64ad87c67f7.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Validate user fence during creation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 09:22:17 +0100
In-Reply-To: <ZeGKrlrFLfDp/Q+Z@DUT025-TGLU.fm.intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-3-matthew.brost@intel.com>
 <6f8409697d39299e3672fd42f7057e421cb54f19.camel@linux.intel.com>
 <ZeGKrlrFLfDp/Q+Z@DUT025-TGLU.fm.intel.com>
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

On Fri, 2024-03-01 at 07:58 +0000, Matthew Brost wrote:
> On Fri, Mar 01, 2024 at 07:55:40AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> > > Fail invalidate addresses during user fence creation.
> > >=20
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > Intel
> > > GPUs")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
> > > =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > b/drivers/gpu/drm/xe/xe_sync.c
> > > index c836a5f3a1ea..c20e1f9ad267 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -53,14 +53,18 @@ static struct xe_user_fence
> > > *user_fence_create(struct xe_device *xe, u64 addr,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 value)
> > > =C2=A0{
> > > =C2=A0	struct xe_user_fence *ufence;
> > > +	u64 __user *ptr =3D u64_to_user_ptr(addr);
> > > +
> > > +	if (!access_ok(ptr, sizeof(ptr)))
> > > +		return ERR_PTR(-EFAULT);
> >=20
> > I think we also need to enforce u64 alignment. Otherwise,
> > particularly
> > on 32-bit user-space the user fence memory could cross a page-
> > border?=20
> >=20
>=20
> We already do this in xe_sync_entry_parse:
>=20
> 221=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (XE_IOCTL_DBG(xe, sync_in.addr & 0x7))
> 222=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -EINVAL;
>=20
> Matt

Ah, Great.


>=20
> > > =C2=A0
> > > =C2=A0	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
> > > =C2=A0	if (!ufence)
> > > -		return NULL;
> > > +		return ERR_PTR(-ENOMEM);
> > > =C2=A0
> > > =C2=A0	ufence->xe =3D xe;
> > > =C2=A0	kref_init(&ufence->refcount);
> > > -	ufence->addr =3D u64_to_user_ptr(addr);
> > > +	ufence->addr =3D ptr;
> > > =C2=A0	ufence->value =3D value;
> > > =C2=A0	ufence->mm =3D current->mm;
> > > =C2=A0	mmgrab(ufence->mm);
> > > @@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > > struct xe_file *xef,
> > > =C2=A0		} else {
> > > =C2=A0			sync->ufence =3D user_fence_create(xe,
> > > sync_in.addr,
> > > =C2=A0						=09
> > > sync_in.timeline_value);
> > > -			if (XE_IOCTL_DBG(xe, !sync->ufence))
> > > -				return -ENOMEM;
> > > +			if (XE_IOCTL_DBG(xe, IS_ERR(sync-
> > > >ufence)))
> > > +				return PTR_ERR(sync->ufence);
> > > =C2=A0		}
> > > =C2=A0
> > > =C2=A0		break;
> >=20

