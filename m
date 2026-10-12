Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A283CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 09:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0071610E308;
	Mon, 12 Oct 2026 09:43:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89D510EB4B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 09:43:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 088DD600E2;
 Mon, 12 Oct 2026 09:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E531F0089B;
 Mon, 12 Oct 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791798183;
 bh=c0fWiZem8RSJCjqSOG4N5vYeSLN+UAb940fVnfujUa4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DdP2cTEe+undhKROWtj+5Lr+0Dh0VLLJmqw/ZomUFHhUZ0EiA5L7SegWeesS5yOb3
 i4UHYVD93dtKuNODHdu9TYepYHGp1F1nJRjd5BC6fWNoYV8n+xFIrscM2pD9fb/FAB
 JjaSqZk3kTwwiokCOC8P5mGo/DPtin7FGQESDp167zW4v0JPhgLcTF+JPNqTDsrtoE
 6YxHTO1wR38zYHJWa6DbZuHJ9tV5vtAZa7vhP5pYafH26nfuvd5dB1/IYM5LPPJnwg
 dlGswXJlndBBaNxt6zVObSTINS+baG2rI2rw67EGr/FSv1U794v8rUJ79IV7P9QfqM
 ApcgabwnOuTHg==
Message-ID: <sashiko-outbox-167903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012093053.2103743-6-satyanarayana.k.v.p@intel.com>
References: <20261012093053.2103743-5-satyanarayana.k.v.p@intel.com>
 <20261012093053.2103743-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:43:03 +0000
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
- [High] timer: UAF and NULL pointer dereference due to un-synchronized tim=
er_delete() on self-rearming timer
--

commit 6990383ed0fa291cb7a9714db126aaef3e32f00c
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

    drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

The commit invalidates the engine name during teardown so subsequent scans
skip it, preventing VF memory IRQs from accessing a torn-down engine. It
modifies hw_engine_fini to clear the name and gt pointers under the irq
lock.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 265f95c0c8993..55ee0c892c1e8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
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
Does this code introduce a race condition with a self-rearming timer that c=
an
lead to a NULL pointer dereference or use-after-free?

The xe_execlist_port_destroy() function, called just before this block, tea=
rs
down the execlist port but deletes the timer without synchronization:

drivers/gpu/drm/xe/xe_execlist.c:xe_execlist_port_destroy() {
	...
	timer_delete(&port->irq_fail);
	...
}

However, the timer handler unconditionally rearms itself:

drivers/gpu/drm/xe/xe_execlist.c:xe_execlist_port_irq_fail_timer() {
	...
	port->irq_fail.expires =3D jiffies + msecs_to_jiffies(1000);
	add_timer(&port->irq_fail);
}

If the timer is executing concurrently on another CPU during teardown,
timer_delete() returns immediately without waiting for the handler to finis=
h.
The handler will then execute add_timer() at the end, defeating the deletio=
n.=20

When the rearmed timer fires, it will eventually dereference port->hwe->gt.
Since hw_engine_fini() clears hwe->gt to NULL immediately after calling
xe_execlist_port_destroy(), could this result in a NULL pointer dereference?
Furthermore, since the port structure itself will eventually be freed when
the DRM device unbinds, could this lead to a use-after-free if the timer
persists?

Would it be safer to use a state flag, or replace timer_delete() with
timer_delete_sync() or timer_shutdown_sync() to safely tear down the
self-rearming timer?

> +		spin_unlock_irqrestore(&xe->irq.lock, flags);
> +	} else {
> +		hwe->name =3D NULL;
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012093053.2103=
743-5-satyanarayana.k.v.p@intel.com?part=3D1
