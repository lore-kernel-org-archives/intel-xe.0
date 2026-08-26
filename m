Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A85FC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CF010E20E;
	Wed, 26 Aug 2026 10:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WJC4G7Fe";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074C510E20E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:47:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 04CB4601E9;
 Wed, 26 Aug 2026 10:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858801F000E9;
 Wed, 26 Aug 2026 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787741266;
 bh=vgGioBb7nzxmwnYk4kl0Cj2wxVM3xjYe7zhsRXY2qfY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WJC4G7Fe7HPbKfcduJ15RpCxO9UPFQ5EKmClfKVwDKgBbdNWoOcSBi2zQMPRlfWpL
 lBtpeTcdOtC31UH+czUSsBtCdXA7hLq4VIe/g1i+J1k44tlAw/gXKfPjptI9caCpci
 riARE8lcP+1vbbqNKWyDISgPGac2T9Kk5+CAagWS95UZrYc7BCSHDVV6o2BgFDJOC5
 oc/vt2uYvNZ1krl6xL6JS2EoH5awofqiPIyqaoaHX0YMbnzEDFYpsjAobXBdCAXAU5
 uiJLHdHVr+140Kz/AitfeK3xXzR+qzjSYfDLr4lrTA/77DTgQzlSyhN65JJXT6L+k+
 sGT4C/TcoVn3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826103156.3233208-3-tilak.tirumalesh.tangudu@intel.com>
References: <20260826103156.3233208-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826103156.3233208-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:47:46 +0000
Message-Id: <20260826104746.858801F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] send_tlb_inval_ggtt_full() converts all transmission errors to -EC=
ANCELED, which are silently ignored by the caller, causing TLB invalidation=
 failures to be treated as success.
--

commit 1e4a83a630897165bf2a8c3138c9949149a7404b
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT invalidation helper

This commit introduces the xe_tlb_inval_ggtt_full() helper and its GuC
backend send_tlb_inval_ggtt_full(). It implements full engine TLB
invalidation within the requesting VF across all engines.

> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/x=
e_guc_tlb_inval.c
> index 046d0655122f1..c2f56be833a29 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
[ ... ]
> @@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tl=
b_inval, u32 seqno)
>  	return -ECANCELED;
>  }
> =20
> +/*
> + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engin=
es
> + * within the VF.
> + */
> +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 =
seqno)
> +{
> +	struct xe_guc *guc =3D tlb_inval->private;
> +	u32 action[] =3D {
> +		XE_GUC_ACTION_TLB_INVALIDATION,
> +		seqno,
> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> +	};
> +
> +	if (send_tlb_inval(guc, action, ARRAY_SIZE(action)))
> +		return -ECANCELED;

[Severity: High]
Does squashing all transmission errors from send_tlb_inval() into -ECANCELED
mask failures?

If send_tlb_inval() fails (e.g., returning -EBUSY when the CT buffer is full
under heavy load), this returns -ECANCELED. The pre-existing macro
xe_tlb_inval_issue() translates -ECANCELED into a synchronous success (0)
and signals the fence, hiding the failure from upper layers:

    __ret =3D op((__tlb_inval), (__fence)->seqno, ##args);
    ...
    __ret =3D=3D -ECANCELED ? 0 : __ret;

This could cause the hardware to proceed with stale translations in the TLB,
potentially leading to memory corruption or use-after-free if the memory has
been reallocated.

> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe=
/xe_tlb_inval_types.h
> index 3d1797d186fd7..d77be1aedc918 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
[ ... ]
> @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
>  	 */
>  	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> =20
> +	/**
> +	 * @ggtt_full: Full engine TLB invalidation within a VF
> +	 * @tlb_inval: TLB invalidation client
> +	 * @seqno: Seqno of TLB invalidation
> +	 *
> +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> +	 * failure
> +	 */
> +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);

[Severity: High]
Could we pass the actual error code back instead? The documentation here
specifies the contract expects "error on failure", but the implementation in
send_tlb_inval_ggtt_full() unconditionally returns -ECANCELED instead of the
real error from send_tlb_inval(), which violates this contract.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103156.3233=
208-1-tilak.tirumalesh.tangudu@intel.com?part=3D2
