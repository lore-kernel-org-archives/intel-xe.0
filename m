Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C7C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC77110F13E;
	Wed,  9 Sep 2026 12:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HCNH8Be7";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02FE10F133
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:55:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F121060213;
 Wed,  9 Sep 2026 12:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895DF1F00A3A;
 Wed,  9 Sep 2026 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958510;
 bh=0LkpcVqobJHVrdm+4ZMimkM6cDtJN0EV+JGY7ACi4VM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HCNH8Be7sco0nbJfJeN/WjZnCYP+O71SuSOPOFxoihXc9nu2y1BwZPHpZ8rzH+df1
 mSQQ/h7ZzeIAgDp4JqTQCWzTwokcn6P7Y5FzNCtrKwp9Pxz91E1JQ8mK6oc176IKSF
 J7GnJRn3jVcUCJpviMyYlT9/H3ef51jshZC3BLvmiidG55zjXYZ0u2T6Sag7W5cjd8
 Ey/GTQM9dpSFL/ZUjPwPsx6+zqDP6AJva69bA8Q/YyC9oCGTx/kZtD+/UG8/VpFd6m
 YcAO7zrLqCaJPk5f03U8Aw9PkLGLOcqBu2GDe+mQ4uOCa6nsFgd/+BzgG0u5bY7BGz
 PPSVdaa05PtuQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 03/21] drm/xe: Implement xe_access_counter_init
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-26-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:55:10 +0000
Message-Id: <20260909125510.895DF1F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [Critical] Use-After-Free of pagefault_wq during driver teardown
--

commit 20e692318868f2addad6bfad38a665a6947c5cfe
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Implement xe_access_counter_init

This commit implements initialization for access counter queues and
per-queue workers. It reuses the existing page fault workqueue for
the shared USM domain.

> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/=
xe_access_counter.c
> index f3a8a93b5135d..ae939576b72da 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
[ ... ]
> @@ -35,7 +52,29 @@
>  int xe_access_counter_init(struct xe_device *xe)
>  {
[ ... ]
> +	/*
> +	 * drmm-managed so it outlives destroy_workqueue(pagefault_wq), which
> +	 * drains the shared AC workers during xe_pagefault_fini.
> +	 */

[Severity: Critical]
This is a pre-existing issue, but does reusing the page fault workqueue
here expose the driver to a use-after-free during teardown?

The pagefault_wq is destroyed in xe_pagefault_fini() (in
drivers/gpu/drm/xe/xe_pagefault.c) via a devm action, which runs early
during driver unbind or probe failure.=20

However, the GuC CT g2h_worker that receives page faults and routes
them to this workqueue is stopped via a drmm action in guc_ct_fini(),
which runs much later when the last reference to the DRM device is dropped.

This creates a lifecycle mismatch window. If the hardware generates a fault
from a still-executing workload during unbind, the driver unbinds and
destroys pagefault_wq, but the g2h_worker remains active. When the
G2H message arrives, xe_pagefault_handler() calls queue_work() on the
freed workqueue.

Could this occur deterministically during driver unbind?

> +	ac_queue->data =3D drmm_kzalloc(&xe->drm, ac_queue->size, GFP_KERNEL);
> +	if (!ac_queue->data)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ac_queue->lock);
> +	xe_access_counter_queue_init(xe, ac_queue);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D3
