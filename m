Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E423CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470C310ED9B;
	Mon, 12 Oct 2026 06:07:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AB510ED9B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:07:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BDCB060AB0;
 Mon, 12 Oct 2026 06:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DF01F0089B;
 Mon, 12 Oct 2026 06:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791785235;
 bh=8+XhalmfIZlwHZ7vMkKJZ9MC3l0y6Mcicird5BFo6m4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hrJ3hr4+HWJ3zymtO5Xz0a5V3gauxrCxipZzslN8Rn7jhHjBHsTVgnpJJNHwKnUjk
 UfGbgyPZTVuSZ1t45do5nRUBHZKg8qUfgava3KZvhgb44z6QbaujA3/XX8f9uBdjQ7
 MBwhBsQvRj7+MYpHO3NnPGVk2b1Gnap9B6XwatwMXsB6xFnqNxqHOOhXQYwaQkAaww
 QOeZq2OMMkL3qA4iBeT3p8lJP1BWIZ8LNr1PyfBdmsFwKERs8UtfG6cVsps20YCbzr
 K+w285U67SRSPE351L5RO5MTBBJ8CfcpZ0DJS3IdW7RCVHphD2yVRXtyQjDvCXWw3v
 VtiGLDWc/30Hg==
Message-ID: <sashiko-outbox-167710@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012055053.964468-6-satyanarayana.k.v.p@intel.com>
References: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
 <20261012055053.964468-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:07:14 +0000
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
- [High] drm/xe: NULL pointer dereference due to incomplete locking in hw_e=
ngine_fini
--

commit 888f9d1be166404e1216f8d0d23505412e283b23
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

This commit fixes a NULL pointer dereference by invalidating the engine
name and GT pointer during teardown in hw_engine_fini() under the
irq.lock, preventing the VF memory IRQ handler from scanning it.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 265f95c0c8993..55ee0c892c1e8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c

[ ... ]

> @@ -275,11 +275,22 @@ static const struct engine_info engine_infos[] =3D {
>  static void hw_engine_fini(void *arg)
>  {
>  	struct xe_hw_engine *hwe =3D arg;
> +	struct xe_gt *gt =3D hwe->gt;
> +
> +	if (gt) {
> +		struct xe_device *xe =3D gt_to_xe(gt);
> +		unsigned long flags;
> =20
> -	if (hwe->exl_port)
> -		xe_execlist_port_destroy(hwe->exl_port);
> +		if (hwe->exl_port)
> +			xe_execlist_port_destroy(hwe->exl_port);
> =20
> -	hwe->gt =3D NULL;
> +		spin_lock_irqsave(&xe->irq.lock, flags);
> +		hwe->name =3D NULL;
> +		hwe->gt =3D NULL;

[Severity: High]
Can this still cause a NULL pointer dereference for lockless IOCTL callers?

Unprivileged userspace can call the DRM_IOCTL_XE_DEVICE_QUERY ioctl
(specifically query_engine_cycles) concurrently with device unbind or unplu=
g.
Since the ioctl is not guarded by drm_dev_enter(), it can proceed
concurrently with devres_release_all() and hw_engine_fini().

The ioctl looks up the hardware engine via xe_gt_hw_engine() in
query_engine_cycles():

drivers/gpu/drm/xe/xe_query.c:query_engine_cycles() {
    ...
    hwe =3D xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
                          eci->engine_instance, true);
    if (!hwe)
        return -EINVAL;
    ...
}

Immediately after this check, hw_engine_fini() can execute and clear
hwe->gt =3D NULL (guarded only by xe->irq.lock, which the ioctl does not ho=
ld).

The ioctl then calls hwe_read_timestamp(), which dereferences hwe->gt:

drivers/gpu/drm/xe/xe_query.c:hwe_read_timestamp() {
    struct xe_mmio *mmio =3D &hwe->gt->mmio;
    ...
}

Does this lockless path need additional protection against concurrent
teardown?

> +		spin_unlock_irqrestore(&xe->irq.lock, flags);
> +	} else {
> +		hwe->name =3D NULL;
> +	}
>  }
> =20
>  /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012055053.9644=
68-5-satyanarayana.k.v.p@intel.com?part=3D1
