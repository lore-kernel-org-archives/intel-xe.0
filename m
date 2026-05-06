Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B26CD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 19:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBA10EEA5;
	Wed,  6 May 2026 19:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC0MFPA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46610EEA1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778097574; x=1809633574;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ER328sLUwimCbuWTMWIiOxKHGPwMqnIBDUVIunTkos0=;
 b=EC0MFPA/CW0lfG3P7QM/0yGUYPmJ26D9LvWTyDpemU6evpDktAmVN9EL
 MhFBF615RTu4vGu18viW39nrbmnPVuJ85fmiQ1CL06hKERDN3TIkPgBuP
 I6ZfQCqGy/jSBbl+G9/kVy6+DnCoCfqX7r1Mopf/qEBIE2CQcXGW/aknf
 J/q9h2xlMZaFG7/xiQF1oAu8nKNUOAYvdcd/hcBGuFpEcH8DKtZ77xtnl
 MzDaP8LLHnUM8LESV5cn+5LjALnmmj7973XdpSjY01LqXbI/RKsqryJM4
 zWPDtbsCC71JiVOauDH02txWWuqpEoZdfKhZdK5HE3awoe5zFXQDIVYln A==;
X-CSE-ConnectionGUID: TEqm5Wh0Sk2Zt1R4o+gCRA==
X-CSE-MsgGUID: ih5AhmzWQq2icJv1bqEt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82885091"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="82885091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:59:34 -0700
X-CSE-ConnectionGUID: K28VpcpCQduqoja89Zz+xA==
X-CSE-MsgGUID: C+06mTx+SIO41zpDscydoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="236349279"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.213])
 ([10.245.244.213])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:59:33 -0700
Message-ID: <ac67eec8376792e795f37645b83c1f4c7fed8ba4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/dma-buf: handle empty bo and UAF races
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Wed, 06 May 2026 21:59:29 +0200
In-Reply-To: <20260506184332.86743-2-matthew.auld@intel.com>
References: <20260506184332.86743-2-matthew.auld@intel.com>
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

On Wed, 2026-05-06 at 19:43 +0100, Matthew Auld wrote:
> There look to be some nasty races here when triggering the
> invalidate_mappings hook:
>=20
> 1) We do xe_bo_alloc() followed by the attach, before the actual full
> bo
> =C2=A0=C2=A0 init step in xe_dma_buf_init_obj(). However the bo is visibl=
e on
> the
> =C2=A0=C2=A0 attachments list after the attach.=C2=A0 This is bad since e=
xporter
> driver,
> =C2=A0=C2=A0 say amdgpu, can at any time call back into our invalidate_ma=
ppings
> hook,
> =C2=A0=C2=A0 with an empty/bogus bo, leading to potential bugs/crashes.
>=20
> 2) Similar to 1) but here we get a UAF, when the invalidate_mappings
> =C2=A0=C2=A0 hook is triggered. For example, we get as far as
> xe_bo_init_locked()
> =C2=A0=C2=A0 but this fails in some way. But here the bo will be freed on
> error, but
> =C2=A0=C2=A0 we still have it attached from dma-buf pov, so if the
> =C2=A0=C2=A0 invalidate_mappings is now triggered then the bo we access i=
s gone
> and
> =C2=A0=C2=A0 we trigger UAF and more bugs/crashes.
>=20
> To fix this, move the attach step until after we actually have a
> fully
> set up buffer object. Note that the bo is not published to userspace
> until later, so not sure what the comment "Don't publish the bo
> until we have a valid attachment", is referring to.
>=20
> We have at least two different customers reporting hitting a NULL ptr
> deref in evict_flags when importing something from amdgpu, followed
> by
> triggering the evict flow. Hit rate is also pretty low, which would
> hint at some kind of race, so something like 1) or 2) might explain
> this.
>=20
> Assisted-by: Gemini:gemini-3 #debug
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7903
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/4055
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 23 ++++++++---------------
> =C2=A01 file changed, 8 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index b9828da15897..e6c2f7d30abb 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -357,11 +357,6 @@ struct drm_gem_object
> *xe_gem_prime_import(struct drm_device *dev,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * Don't publish the bo until we have a valid attachment,
> and a
> -	 * valid attachment needs the bo address. So pre-create a bo
> before
> -	 * creating the attachment and publish.
> -	 */
> =C2=A0	bo =3D xe_bo_alloc();
> =C2=A0	if (IS_ERR(bo))
> =C2=A0		return ERR_CAST(bo);
> @@ -371,6 +366,13 @@ struct drm_gem_object
> *xe_gem_prime_import(struct drm_device *dev,
> =C2=A0	if (test)
> =C2=A0		attach_ops =3D test->attach_ops;
> =C2=A0#endif
> +	/*
> +	 * xe_dma_buf_init_obj() takes ownership of bo on both
> success
> +	 * and failure, so we must not touch bo after this call.
> +	 */
> +	obj =3D xe_dma_buf_init_obj(dev, bo, dma_buf);
> +	if (IS_ERR(obj))
> +		return obj;

IIRC this publishes the bo on the LRUs, as per the removed comment.
What happens if, for example, the shrinker kicks in and shrinks it? But
similarly perhaps we should have obj->import_attach set already at
publish time?

If this is indeed the case we might have to revert to some trickery.
Like invalidate_mappings() returning early if the init is not complete,
and set obj->import_attach under the lock in xe_dma_buf_init_obj?

Also I think IIRC xe_bo_alloc() was created specifically for this
situation, so unless there are more users of that, and the ordering in
this patch is indeed correct, we might be able to get rid of the two-
step bo creation here.

/Thomas


> =C2=A0
> =C2=A0	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> attach_ops, &bo->ttm.base);
> =C2=A0	if (IS_ERR(attach)) {
> @@ -378,21 +380,12 @@ struct drm_gem_object
> *xe_gem_prime_import(struct drm_device *dev,
> =C2=A0		goto out_err;
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * xe_dma_buf_init_obj() takes ownership of bo on both
> success
> -	 * and failure, so we must not touch bo after this call.
> -	 */
> -	obj =3D xe_dma_buf_init_obj(dev, bo, dma_buf);
> -	if (IS_ERR(obj)) {
> -		dma_buf_detach(dma_buf, attach);
> -		return obj;
> -	}
> =C2=A0	get_dma_buf(dma_buf);
> =C2=A0	obj->import_attach =3D attach;
> =C2=A0	return obj;
> =C2=A0
> =C2=A0out_err:
> -	xe_bo_free(bo);
> +	xe_bo_put(bo);
> =C2=A0
> =C2=A0	return obj;
> =C2=A0}
