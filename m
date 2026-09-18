Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C2C982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345610E51E;
	Fri, 18 Sep 2026 00:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G+x7joIq";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047610E51E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 00:06:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E871E413E9;
 Fri, 18 Sep 2026 00:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACED1F000FF;
 Fri, 18 Sep 2026 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789689976;
 bh=ovQYRUHTVJkz0owTPm/sbtmkonS+s31rVmPnBL/BhP4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=G+x7joIqK6CB+/CnzGbhKfus2M0ZLtlknY0euPMY11EPXreBf9JP65uUmI3a6jWId
 83+lg7DkfFqhLvgJvpQR3gK4wm1ny8GA17EDtaKFOa+/AUvjQYh/uJ0uIda6UBQLFX
 c3Nc4fT9D1BsC6GIUYE1Ue6aFLqksQSxF4ZTedTCF/LJ3jLHLBWNMPtGKcUjQwwePp
 PPOZTTWZTfPOGEv6aQsMK/3c6Em0FFuykBi7nLDBtSpucYZyLRAhCJmSXEwMtldjDv
 cYBu8SHNM2iQdwoc5bUQN9aJma+RHqKvN8ebeJ9aYAilP5zfMLZE9yyC9tMuDjHF3t
 /O+xYM6chsE9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917235923.1521112-12-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
 <20260917235923.1521112-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:06:16 +0000
Message-Id: <20260918000616.AACED1F000FF@smtp.kernel.org>
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
- [Low] build: xe_guc_ct compile error on !CONFIG_DRM_XE_DEBUG
--

commit 1f4499efdc2f257f0698c2212dc79db666b74590
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/guc: Make ct_dead_capture available on non-debug config

Define ct_dead_capture for non-debug as well to simplify future
refactor.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index b3a6aa37808b4..3353515aa8747 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -59,6 +59,9 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
>  	return gt_to_xe(ct_to_gt(ct));
>  }
> =20
> +#define ct_id(reason_code)  CT_DEAD_##reason_code
> +#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), ct_id=
(reason_code))
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
>  	/* Internal states, not error conditions */

[Severity: Low]
Will this break compilation for non-debug builds?

The macro CT_DEAD now unconditionally references CT_DEAD_##reason_code, but
the enumeration defining these reason codes remains strictly guarded by
#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) just below.

Any invocation of CT_DEAD in common code could cause an undeclared identifi=
er
error when CONFIG_DRM_XE_DEBUG is disabled.

[ ... ]

> @@ -2376,4 +2369,10 @@ static void ct_dead_worker_func(struct work_struct=
 *w)
> =20
>  	spin_unlock_irq(&ct->dead.lock);
>  }
> +#else
> +static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u=
32 reason_code)
> +{
> +	if (ctb)
> +		ctb->info.broken =3D true;
> +}
>  #endif

[Severity: Low]
Does ct_dead_capture() also need a forward declaration for the non-debug
path?

Since this non-debug implementation is defined at the end of the file with
no preceding forward declaration, calling CT_DEAD() earlier in the file may
result in an implicit function declaration error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917235923.1521=
112-9-umesh.nerlige.ramappa@intel.com?part=3D3
