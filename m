Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEE2CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 12:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C91510F0E9;
	Thu,  7 May 2026 12:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqZEozzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EFD10F0E9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778156547; x=1809692547;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wj/T+DjDc0bDFFMxMNbIil9/nzvahQqGtDwyv2zUMao=;
 b=eqZEozzVEYx4ujqwEunNbAeuAxVLhCBwKTGnuJ52i+NvuAihS0Kl5eAa
 aMIwhXpRyiNc0Evtov5ahBFGjvb1NGRjrm560OMPOJFyrVm6W35pfF5Uf
 ROJj1GPGQuHMT2Kndy7MDcZSqhbYZM5SUmWlS7HeH0IfUebieXRdqOyRB
 Rl2L5r+6OwfbLtihDSCj4TuuQOh/uOnUNVXaEBU8PHwqiKJz+QzwaMVtG
 MhCcJny9yimlt65ZKY7sr4nOMr6OlvITcD29531WDML9ES5qWenjsc5X/
 Rw3mGABvGjJ2rWvTonWxUrIPIfFeQdc4DubaPHMPXLqIGE3bxdMET+nsP g==;
X-CSE-ConnectionGUID: WN3/wChlRUOH3kp4/9C76w==
X-CSE-MsgGUID: utnb3gdnRr+6Au6fQOIPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104561504"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="104561504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:22:26 -0700
X-CSE-ConnectionGUID: Udo+t9AwTrmcARpAUnb0IA==
X-CSE-MsgGUID: 98h12M0eR16P1C4cxE8B4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="233372087"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.94])
 ([10.245.245.94])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:22:25 -0700
Message-ID: <c434737c3613a2dff0e2442e89c7ec58640efed4.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/dma-buf: fix UAF with retry loop
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Thu, 07 May 2026 14:22:22 +0200
In-Reply-To: <20260507115519.115309-4-matthew.auld@intel.com>
References: <20260507115519.115309-3-matthew.auld@intel.com>
 <20260507115519.115309-4-matthew.auld@intel.com>
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

On Thu, 2026-05-07 at 12:55 +0100, Matthew Auld wrote:
> Retry doesn't work here, since bo will be freed on error, leading to
> UAF. However, now that we do the alloc & init before the attach, we
> can
> now combine this as one unit and have the init do the alloc for us.
> This
> should make the retry safe.
>=20
> Reported by Sashiko.
>=20
> Closes:
> https://sashiko.dev/#/patchset/20260506184332.86743-2-matthew.auld%40inte=
l.com
> Fixes: eb289a5f6cc6 ("drm/xe: Convert xe_dma_buf.c for exhaustive
> eviction")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.18+

lgtm.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>



> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 42 +++++++++---------------------=
-
> --
> =C2=A01 file changed, 11 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 2332db502c8b..a54ec278a915 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -258,16 +258,8 @@ struct dma_buf *xe_gem_prime_export(struct
> drm_gem_object *obj, int flags)
> =C2=A0	return ERR_PTR(ret);
> =C2=A0}
> =C2=A0
> -/*
> - * Takes ownership of @storage: on success it is transferred to the
> returned
> - * drm_gem_object; on failure it is freed before returning the
> error.
> - * This matches the contract of xe_bo_init_locked() which frees
> @storage on
> - * its error paths, so callers need not (and must not) free @storage
> after
> - * this call.
> - */
> =C2=A0static struct drm_gem_object *
> -xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> -		=C2=A0=C2=A0=C2=A0 struct dma_buf *dma_buf)
> +xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf
> *dma_buf)
> =C2=A0{
> =C2=A0	struct dma_resv *resv =3D dma_buf->resv;
> =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> @@ -278,10 +270,8 @@ xe_dma_buf_init_obj(struct drm_device *dev,
> struct xe_bo *storage,
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dummy_obj =3D drm_gpuvm_resv_object_alloc(&xe->drm);
> -	if (!dummy_obj) {
> -		xe_bo_free(storage);
> +	if (!dummy_obj)
> =C2=A0		return ERR_PTR(-ENOMEM);
> -	}
> =C2=A0
> =C2=A0	dummy_obj->resv =3D resv;
> =C2=A0	xe_validation_guard(&ctx, &xe->val, &exec, (struct
> xe_val_flags) {}, ret) {
> @@ -290,8 +280,7 @@ xe_dma_buf_init_obj(struct drm_device *dev,
> struct xe_bo *storage,
> =C2=A0		if (ret)
> =C2=A0			break;
> =C2=A0
> -		/* xe_bo_init_locked() frees storage on error */
> -		bo =3D xe_bo_init_locked(xe, storage, NULL, resv,
> NULL, dma_buf->size,
> +		bo =3D xe_bo_init_locked(xe, NULL, NULL, resv, NULL,
> dma_buf->size,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, /* Will require 1way or
> 2way for vm_bind */
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_sg,
> XE_BO_FLAG_SYSTEM, &exec);
> =C2=A0		drm_exec_retry_on_contention(&exec);
> @@ -342,7 +331,6 @@ struct drm_gem_object *xe_gem_prime_import(struct
> drm_device *dev,
> =C2=A0	const struct dma_buf_attach_ops *attach_ops;
> =C2=A0	struct dma_buf_attachment *attach;
> =C2=A0	struct drm_gem_object *obj;
> -	struct xe_bo *bo;
> =C2=A0
> =C2=A0	if (dma_buf->ops =3D=3D &xe_dmabuf_ops) {
> =C2=A0		obj =3D dma_buf->priv;
> @@ -357,22 +345,14 @@ struct drm_gem_object
> *xe_gem_prime_import(struct drm_device *dev,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	bo =3D xe_bo_alloc();
> -	if (IS_ERR(bo))
> -		return ERR_CAST(bo);
> -
> =C2=A0	/*
> -	 * xe_dma_buf_init_obj() takes ownership of the raw bo, so
> do not touch
> -	 * on fail, since it will already take care of cleanup. On
> success we
> -	 * still need to drop the ref, if something later fails.
> -	 *
> -	 * In addition this needs to happen before the attach, since
> -	 * it will create a new attachment for this, and add it to
> the list of
> -	 * attachments, at which point it is globally visible, and
> at any point
> -	 * the export side can call into on invalidate_mappings
> callback, which
> -	 * require a working object.
> +	 * This needs to happen before the attach, since it will
> create a new
> +	 * attachment for this, and add it to the list of
> attachments, at which
> +	 * point it is globally visible, and at any point the export
> side can
> +	 * call into on invalidate_mappings callback, which require
> a working
> +	 * object.
> =C2=A0	 */
> -	obj =3D xe_dma_buf_init_obj(dev, bo, dma_buf);
> +	obj =3D xe_dma_buf_create_obj(dev, dma_buf);

Cant you just use xe_bo_create_novm() here?


> =C2=A0	if (IS_ERR(obj))
> =C2=A0		return obj;
> =C2=A0
> @@ -382,7 +362,7 @@ struct drm_gem_object *xe_gem_prime_import(struct
> drm_device *dev,
> =C2=A0		attach_ops =3D test->attach_ops;
> =C2=A0#endif
> =C2=A0
> -	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> attach_ops, &bo->ttm.base);
> +	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> attach_ops, obj);
> =C2=A0	if (IS_ERR(attach)) {
> =C2=A0		obj =3D ERR_CAST(attach);
> =C2=A0		goto out_err;
> @@ -393,7 +373,7 @@ struct drm_gem_object *xe_gem_prime_import(struct
> drm_device *dev,
> =C2=A0	return obj;
> =C2=A0
> =C2=A0out_err:
> -	xe_bo_put(bo);
> +	xe_bo_put(gem_to_xe_bo(obj));
> =C2=A0
> =C2=A0	return obj;
> =C2=A0}
