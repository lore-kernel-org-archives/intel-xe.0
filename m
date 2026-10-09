Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AFDCA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EFA1120DB;
	Fri,  9 Oct 2026 12:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JDT1/hX5";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EEE1120DB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:29:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C8BB06020C;
 Fri,  9 Oct 2026 12:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A461F000FF;
 Fri,  9 Oct 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791548995;
 bh=/KNPx8AigGGuxeibteF2rgBxhjwRx7fsT44f74l+3+E=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JDT1/hX5MyuBCNVQQUv8/N8PMDzia3+uCN00oDqG/B2Mx5UKOeBx0Gd03VctwT4RT
 UrPXEcsUUy8vprph9dvr/xjSDkMInvYoz/zYijGiiwCGBGJNDUsfe+ayLWOU755CRR
 rHC/In0dP7uBfR33hUnKx2aeZiSWiXi8K4u28uGFa7Z7h89DeU61umONgpygWCLTeO
 rkKostVeaSDAGTAMlTFmcYxzNTd0ZE3xuJ9Q5EpyBGJEEtGq+Ob1lgfN/HHu4ujE3Q
 RKR1b0+F/DaPgrqD4bTBScN50txjbZWK53Ky1LwKeWw+hMCdy62pP0tu1lYjRahY8g
 Ga385ZCxLLXJQ==
Message-ID: <sashiko-outbox-165540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009121921.818671-6-satyanarayana.k.v.p@intel.com>
References: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
 <20261009121921.818671-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:29:54 +0000
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
- [Critical] drm/xe: NULL Pointer Dereference in xe_execlist_port_destroy a=
nd timer due to early hwe->gt clearing
--

commit 0f76e8a7471aad3de71482c37a1644b32699ef4e
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

The commit fixes a NULL pointer dereference by invalidating the engine name
and clearing hwe->gt earlier in the teardown process. However, this
reordering appears to introduce a new issue where xe_execlist_port_destroy()
encounters a NULL pointer.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 9680d2a5adec7..3a6b9a4fe63ff 100644
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
> +
> +		spin_lock_irqsave(&xe->irq.lock, flags);
> +		hwe->name =3D NULL;
> +		hwe->gt =3D NULL;
> +		spin_unlock_irqrestore(&xe->irq.lock, flags);
> +	} else {
> +		hwe->name =3D NULL;
> +	}
> =20
>  	if (hwe->exl_port)
>  		xe_execlist_port_destroy(hwe->exl_port);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Critical]
Will this call to xe_execlist_port_destroy() cause a kernel panic now that
hwe->gt has been cleared to NULL?

Looking at xe_execlist_port_destroy() in drivers/gpu/drm/xe/xe_execlist.c, =
it
dereferences port->hwe->gt:

void xe_execlist_port_destroy(struct xe_execlist_port *port)
{
	timer_delete(&port->irq_fail);

	/* Prevent an interrupt while we're destroying */
	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
	...
}

Because hwe->gt is set to NULL right before this call, gt_to_xe(NULL) will
dereference a NULL pointer (specifically gt_to_tile(NULL)->xe) when acquiri=
ng
the spinlock.

This problem wasn't introduced by this patch, but doesn't calling
timer_delete() instead of timer_delete_sync() on port->irq_fail allow the
timer to execute concurrently during or after destruction? If the timer
fires and calls read_execlist_status(port->hwe) which also accesses hwe->gt,
would it hit the same NULL pointer dereference now that the pointer is clea=
red
earlier?

> -
> -	hwe->gt =3D NULL;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009121921.8186=
71-5-satyanarayana.k.v.p@intel.com?part=3D1
