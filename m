Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40527CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007B10E4C7;
	Tue, 13 Oct 2026 15:46:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774FF10E4C7
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 15:46:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8421A602C3;
 Tue, 13 Oct 2026 15:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7DD1F000FF;
 Tue, 13 Oct 2026 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791906378;
 bh=GKqclGEJD9Uy7xruxQMmLLdpZBXpFaeIt3KiPXGsGBs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OOIsagD6NeFtUMp6wJ/klC3CSblt4FDHcds8i9LjxqTr7NC4NWKeGurp8u1a32bI+
 wFz0PBnW18Suvvk1XpGN5/OBigsi9WmVU7951It4gCEcR6G4dU+ryQkyN9vHv/uejD
 9qoeaM5X5uNtZC1NzCSjnJy3EX99XyvuoEoCuUaTilJUb76KT87u32Egn8XOWW5Nrs
 mV/iA/Vt5bsS8XBZea1wKEkVptwLH0ktxUZG/TaNkh5JqX12Ro8JIBLjTj7A3UYq1i
 q7v6Nek3S2hGd3ZLsqbx/Ah7nZlUojSOnFmoWsVzdlqF2uRdd0u4pU/C/Gw0ymzJ+b
 +LZKX8LFIqygw==
Message-ID: <sashiko-outbox-170039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261013152417.3189567-6-satyanarayana.k.v.p@intel.com>
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
 <20261013152417.3189567-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:46:17 +0000
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
- [High] drm/xe: TOCTOU NULL pointer deref in query_engine_cycles() during =
unplug
--

commit f3434e1999c04ac6bc30530fad97ca5ad34cad2a
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

This commit invalidates the engine name during engine teardown in
hw_engine_fini() to prevent a NULL pointer dereference in IRQ handlers.
By clearing hwe->name, subsequent engine scans will skip the torn-down
engine.

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
> +		spin_unlock_irqrestore(&xe->irq.lock, flags);

[Severity: High]
Does this still leave a TOCTOU NULL pointer dereference in
query_engine_cycles() during device unplug?

Device removal (e.g., driver unbind or PCI unplug) invokes
xe_device_remove(), which calls drm_dev_unplug().

Since drm_dev_unplug() waits only for SRCU readers that called
drm_dev_enter(), and neither xe_drm_ioctl() nor query_engine_cycles()
uses drm_dev_enter(), the IOCTL can execute concurrently with the devres
teardown phase.

If hw_engine_fini() runs concurrently, it clears hwe->gt =3D NULL while
holding xe->irq.lock.

Concurrently, query_engine_cycles() can retrieve the engine via
xe_gt_hw_engine() just before hwe->name is cleared, and then call
hwe_read_timestamp():

drivers/gpu/drm/xe/xe_query.c:query_engine_cycles() {
    hwe =3D xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
                          eci->engine_instance, true);
    if (!hwe)
        return -EINVAL;

    fw_domain =3D xe_hw_engine_to_fw_domain(hwe);

    xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
        if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
            return -EIO;

        hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
                           &resp.cpu_delta, cpu_clock);
    }
}

Inside hwe_read_timestamp(), it dereferences hwe->gt without taking
xe->irq.lock:

drivers/gpu/drm/xe/xe_query.c:hwe_read_timestamp() {
    struct xe_mmio *mmio =3D &hwe->gt->mmio;
    ...
}

Can this lead to a NULL pointer dereference crash, allowing a local DoS by
triggering driver unbind while executing the query IOCTL?

> +	} else {
> +		hwe->name =3D NULL;
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013152417.3189=
567-5-satyanarayana.k.v.p@intel.com?part=3D1
