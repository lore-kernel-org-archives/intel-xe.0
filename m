Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F917CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695110E81D;
	Thu,  8 Oct 2026 12:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gssYJLZL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE3A10E81D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:36:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 29B5D601DB;
 Thu,  8 Oct 2026 12:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E251F00893;
 Thu,  8 Oct 2026 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791462982;
 bh=TJMwkHFTGfYuqShrvIqEjY4gqFvrlep6v27x4zrVVko=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gssYJLZL3PyJLnJuOTz5h2TEEJv4tq5bqGIt4nQnIosD7Pr+KdpT/2YLz+h3hRzZa
 dCpmPrrVvvE8W9r/xWObr42XzuAlsVDt+yHoxATJDN2IaWhavzuDNaJCElObMuEKPb
 WSye7nu/aB2N3NixOBkbgx7rUTXGOFrRfgst5xNWw5UQUc481i1ZrZc9QckvzB+YmV
 hy5IIv8yYYcqkVTMEwJRTWwYQWk99qPLag/xn6/V9yFLw9RZC1LcGX3I3NB1061f5l
 nO4Y8qqla0wUxz3K1dxS1xGtZ3vGEZ85ARxYqI6b8B2ogEgBtQncjQCEWeD6kv+8qM
 rL8hDKYmuFoOw==
Message-ID: <sashiko-outbox-164158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261008122543.390356-4-satyanarayana.k.v.p@intel.com>
References: <20261008122543.390356-3-satyanarayana.k.v.p@intel.com>
 <20261008122543.390356-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 12:36:22 +0000
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
- [High] xe: TOCTOU race in hw_engine_fini() allows NULL pointer dereferenc=
e despite hwe->name invalidation
--

commit 582041e3254f04e73ce6e909225432f284799ee4
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

The commit attempts to fix a NULL pointer dereference in the VF memory IRQ
handler by clearing hwe->name before hwe->gt during engine teardown, aiming
to have the handler skip the torn-down engine.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index 9680d2a5adec7..2267249c26894 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -279,6 +279,7 @@ static void hw_engine_fini(void *arg)
>  	if (hwe->exl_port)
>  		xe_execlist_port_destroy(hwe->exl_port);
> =20
> +	hwe->name =3D NULL;
>  	hwe->gt =3D NULL;

[Severity: High]
Does this leave a Time-Of-Check to Time-Of-Use (TOCTOU) race window that
still allows a NULL pointer dereference?

Because xe_irq_install() is called before xe_gt_init() in xe_device_probe(),
and devm actions execute in LIFO order, hw_engine_fini() can run while
hardware interrupts are still active.

If an interrupt fires concurrently with teardown, the VF memory IRQ handler
xe_memirq_handler() iterates locklessly and can observe a valid hwe->name
via xe_hw_engine_is_valid():

drivers/gpu/drm/xe/xe_memirq.c:xe_memirq_handler() {
    ...
    for_each_hw_engine(hwe, gt, id)
        xe_memirq_hwe_handler(memirq, hwe);
    ...
}

Concurrently, hw_engine_fini() clears both hwe->name and hwe->gt without any
locks or memory barriers. The IRQ handler then proceeds to dereference the
now-NULL hwe->gt:

drivers/gpu/drm/xe/xe_hw_engine.c:xe_hw_engine_handle_irq() {
    ...
    wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
    ...
}

Furthermore, the lack of memory barriers (such as WRITE_ONCE and
smp_store_release) allows the CPU or compiler to reorder the nullification
of name and gt, widening the race window.

Is proper synchronization (such as synchronize_irq(), locking, or disabling
IRQs prior to engine teardown) required here to safely close the race?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008122543.3903=
56-3-satyanarayana.k.v.p@intel.com?part=3D1
