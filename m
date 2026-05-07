Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2BCD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 11:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FED210E1D3;
	Thu,  7 May 2026 11:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQCVxOrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E223110E1D3
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778152494; x=1809688494;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Py3NrPc/eqFNM9z+HmDNKtvWsJuLTKEutWYvzvxH55o=;
 b=hQCVxOrgEjCGf8UjBeblxz0vW+J9x+BP3/8hEogonIvLjDCvcn+6KGAK
 3ksXghS9Mn9mhYypMfkKOZB0sZ9I5ga8rBxaGstzQ/COlAf1YRWpOcbtz
 R9937HGbrzjDEcePa1dkawN6fr4CdWA8no5j17scDfQdhS62RV9BM5Dzt
 kuQ5YfbhDhpU3Hn+SOeLo5GHLmYVauIUJSS9s+Eual5SUAthlPPV/2XSO
 77pDtuGvEdyVOZRYKQ+RwxAOWWxbKjCSbBvmkYNuKikPAhMSNJ5y0f95n
 HU61BuNEpP8WykCcqcRm2IbW47CzLyPkiwTMfWsILdxn5pcvK8J6DCgrd A==;
X-CSE-ConnectionGUID: 6mcFo07gSkWv53SaUCYbpQ==
X-CSE-MsgGUID: hnJHLdplRoerWJF714TyhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79115912"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79115912"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 04:14:53 -0700
X-CSE-ConnectionGUID: OR4xePgbR7eh1Un7/nnVoQ==
X-CSE-MsgGUID: 5PG98wUWRjKCZD/+VvswMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241438237"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.94])
 ([10.245.245.94])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 04:14:52 -0700
Message-ID: <87936849a77c61c8f9ab15e31be16ea1e22e479c.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/dma-buf: handle empty bo and UAF races
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Thu, 07 May 2026 13:14:49 +0200
In-Reply-To: <f4957d06-3c0b-4ffe-928c-e82bf7615d75@intel.com>
References: <20260506184332.86743-2-matthew.auld@intel.com>
 <ac67eec8376792e795f37645b83c1f4c7fed8ba4.camel@linux.intel.com>
 <f4957d06-3c0b-4ffe-928c-e82bf7615d75@intel.com>
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

On Thu, 2026-05-07 at 10:03 +0100, Matthew Auld wrote:
> On 06/05/2026 20:59, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-05-06 at 19:43 +0100, Matthew Auld wrote:
> > > There look to be some nasty races here when triggering the
> > > invalidate_mappings hook:
> > >=20
> > > 1) We do xe_bo_alloc() followed by the attach, before the actual
> > > full
> > > bo
> > > =C2=A0=C2=A0=C2=A0 init step in xe_dma_buf_init_obj(). However the bo=
 is visible
> > > on
> > > the
> > > =C2=A0=C2=A0=C2=A0 attachments list after the attach.=C2=A0 This is b=
ad since
> > > exporter
> > > driver,
> > > =C2=A0=C2=A0=C2=A0 say amdgpu, can at any time call back into our
> > > invalidate_mappings
> > > hook,
> > > =C2=A0=C2=A0=C2=A0 with an empty/bogus bo, leading to potential bugs/=
crashes.
> > >=20
> > > 2) Similar to 1) but here we get a UAF, when the
> > > invalidate_mappings
> > > =C2=A0=C2=A0=C2=A0 hook is triggered. For example, we get as far as
> > > xe_bo_init_locked()
> > > =C2=A0=C2=A0=C2=A0 but this fails in some way. But here the bo will b=
e freed on
> > > error, but
> > > =C2=A0=C2=A0=C2=A0 we still have it attached from dma-buf pov, so if =
the
> > > =C2=A0=C2=A0=C2=A0 invalidate_mappings is now triggered then the bo w=
e access is
> > > gone
> > > and
> > > =C2=A0=C2=A0=C2=A0 we trigger UAF and more bugs/crashes.
> > >=20
> > > To fix this, move the attach step until after we actually have a
> > > fully
> > > set up buffer object. Note that the bo is not published to
> > > userspace
> > > until later, so not sure what the comment "Don't publish the bo
> > > until we have a valid attachment", is referring to.
> > >=20
> > > We have at least two different customers reporting hitting a NULL
> > > ptr
> > > deref in evict_flags when importing something from amdgpu,
> > > followed
> > > by
> > > triggering the evict flow. Hit rate is also pretty low, which
> > > would
> > > hint at some kind of race, so something like 1) or 2) might
> > > explain
> > > this.
> > >=20
> > > Assisted-by: Gemini:gemini-3 #debug
> > > Link:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7903
> > > Link:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/4055
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > Intel
> > > GPUs")
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <stable@vger.kernel.org> # v6.8+
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 23 ++++++++------------=
---
> > > =C2=A0=C2=A01 file changed, 8 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index b9828da15897..e6c2f7d30abb 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -357,11 +357,6 @@ struct drm_gem_object
> > > *xe_gem_prime_import(struct drm_device *dev,
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	/*
> > > -	 * Don't publish the bo until we have a valid
> > > attachment,
> > > and a
> > > -	 * valid attachment needs the bo address. So pre-create
> > > a bo
> > > before
> > > -	 * creating the attachment and publish.
> > > -	 */
> > > =C2=A0=C2=A0	bo =3D xe_bo_alloc();
> > > =C2=A0=C2=A0	if (IS_ERR(bo))
> > > =C2=A0=C2=A0		return ERR_CAST(bo);
> > > @@ -371,6 +366,13 @@ struct drm_gem_object
> > > *xe_gem_prime_import(struct drm_device *dev,
> > > =C2=A0=C2=A0	if (test)
> > > =C2=A0=C2=A0		attach_ops =3D test->attach_ops;
> > > =C2=A0=C2=A0#endif
> > > +	/*
> > > +	 * xe_dma_buf_init_obj() takes ownership of bo on both
> > > success
> > > +	 * and failure, so we must not touch bo after this call.
> > > +	 */
> > > +	obj =3D xe_dma_buf_init_obj(dev, bo, dma_buf);
> > > +	if (IS_ERR(obj))
> > > +		return obj;
> >=20
> > IIRC this publishes the bo on the LRUs, as per the removed comment.
> > What happens if, for example, the shrinker kicks in and shrinks it?
> > But
> > similarly perhaps we should have obj->import_attach set already at
> > publish time?
>=20
> I don't think anything bad will happen? I would view it as an sg
> object=20
> without any real backing store or attachment. Trying to=20
> move/shrink/evict should be a noop, like moving from SYS -> SYS=20
> (starting placement for type_sg). But since this a type_sg bo, I
> think=20
> shrinker will already ignore it right?
>=20
> =C2=A0From user POV, the handle is only published until much later at the
> end=20
> of drm_gem_prime_fd_to_handle(), after our import callback here,
> AFAICT.=20
> So I don't think there is a risk of the user somehow using the
> imported=20
> bo in an ioctl, before we have done the attach etc.
>=20
> One other data point is perhaps amdgpu, which does seem to do the
> create=20
> + attach as normal steps.

OK, Yeah if there's no way the bo can see other unexpected callbacks
after initializing it, then

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> >=20
> > If this is indeed the case we might have to revert to some
> > trickery.
> > Like invalidate_mappings() returning early if the init is not
> > complete,
> > and set obj->import_attach under the lock in xe_dma_buf_init_obj?
> >=20
> > Also I think IIRC xe_bo_alloc() was created specifically for this
> > situation, so unless there are more users of that, and the ordering
> > in
> > this patch is indeed correct, we might be able to get rid of the
> > two-
> > step bo creation here.
> >=20
> > /Thomas
> >=20
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> > > attach_ops, &bo->ttm.base);
> > > =C2=A0=C2=A0	if (IS_ERR(attach)) {
> > > @@ -378,21 +380,12 @@ struct drm_gem_object
> > > *xe_gem_prime_import(struct drm_device *dev,
> > > =C2=A0=C2=A0		goto out_err;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	/*
> > > -	 * xe_dma_buf_init_obj() takes ownership of bo on both
> > > success
> > > -	 * and failure, so we must not touch bo after this call.
> > > -	 */
> > > -	obj =3D xe_dma_buf_init_obj(dev, bo, dma_buf);
> > > -	if (IS_ERR(obj)) {
> > > -		dma_buf_detach(dma_buf, attach);
> > > -		return obj;
> > > -	}
> > > =C2=A0=C2=A0	get_dma_buf(dma_buf);
> > > =C2=A0=C2=A0	obj->import_attach =3D attach;
> > > =C2=A0=C2=A0	return obj;
> > > =C2=A0=20
> > > =C2=A0=C2=A0out_err:
> > > -	xe_bo_free(bo);
> > > +	xe_bo_put(bo);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return obj;
> > > =C2=A0=C2=A0}
