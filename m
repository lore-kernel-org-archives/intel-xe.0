Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D55C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81C10F131;
	Wed,  9 Sep 2026 12:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XBZibrBD";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F0510F131
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:54:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 270E343EB7;
 Wed,  9 Sep 2026 12:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DCC1F00ADF;
 Wed,  9 Sep 2026 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958465;
 bh=dd5ogsMtcHzf1/U8B/+dY19wBMBLN57Wu1mOa7o4wmg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XBZibrBDv+lRChgm6m4eQDIzXfSD9zPRM4gvvUQR0FpXYvInN+so2ns8imwjsNkFN
 DL1KwkIFv4rULWT80sdbHw1ijzdbvZbnTC6XhUN8SCsOfqIPd/1Iz4y4T4R6Rd+GGh
 kmr21EJDVbgdFxfG3qqPV1kI0s+wI/nS+kvi6zAouIkd1ctsjnD4VBAPDFelWdLJw6
 P2R8fYJz6OHjXTcfKXJ+VMkYntkKCEFh1grJqPUaOGwJ4RUmQgx+X+Y/3R7AGA7jJl
 SnR+zdkeHKO88OdeHKNLu8x5CyyCUXO/16HOgcG4uTmu+Sbt3zWyIxOse81eyiCc97
 nCruh4jrnZAkw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 13/21] drm/xe: Add xe_guc_access_counter layer
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-36-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-36-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:54:24 +0000
Message-Id: <20260909125424.E1DCC1F00ADF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect address computation in `xe_guc_access_counter_page_va` c=
auses middle bits of the virtual address to be lost and shifts the tracking=
 window improperly.
- [High] Handling a G2H access counter notification when the USM feature is=
 disabled causes a kernel crash due to an uninitialized spinlock and a NULL=
 pointer dereference.
--

commit 94395d3f68cfb99d219c20819de2d7f8aae519a8
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

    drm/xe: Add xe_guc_access_counter layer
   =20
    Add GuC to host (G2H) access counter notification handler to parse
    GuC firmware messages into struct xe_access_counter and forward to
    xe_access_counter_handler for processing.

> diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm=
/xe/xe_guc_access_counter.c
> new file mode 100644
> index 0000000000000..7e9b835e1ed67
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
> @@ -0,0 +1,74 @@
[ ... ]
> +static u64 xe_guc_access_counter_page_va(struct xe_device *xe, u64 addr,=
 u8 gran)
> +{
> +	u64 gran_size =3D xe_access_counter_granularity_to_size(gran);
> +	u64 sub_gran_size =3D gran_size / 32;
> +	u64 region_base =3D ALIGN_DOWN(addr, gran_size);
> +	u64 offset_in_subchunk =3D addr & (sub_gran_size - 1);
> +	u64 page_va =3D region_base + offset_in_subchunk;

[Severity: High]
Does this logic compute the correct virtual address?=20

By adding offset_in_subchunk (which only keeps the lowest log2(sub_gran_siz=
e)
bits) to region_base (which clears the lower log2(gran_size) bits), any bits
between sub_gran_size and gran_size are completely discarded.

> +
> +	xe_dbg(xe, "gran_size =3D %llx, addr =3D =3D %llx, region_base =3D %llx=
, page_va=3D%llx\n",
> +	       gran_size, addr, region_base, page_va);
> +	return page_va;
> +}
> +
> +/**
> + * xe_guc_access_counter_handler() - G2H access counter handler
[ ... ]
> +	addr =3D ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
> +		(msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
> +	ac.consumer.page_va =3D xe_guc_access_counter_page_va(xe, addr, ac.cons=
umer.granularity);
> +	ac.gran_end =3D ac.consumer.page_va +
> +		      xe_access_counter_granularity_to_size(ac.consumer.granularity);

[Severity: High]
If the page_va computation is missing the middle bits of the address, does =
this
also cause gran_end to be misaligned? This could improperly shift the track=
ing
window and cause incorrect VMA lookups.

> +	ac.consumer.asid =3D FIELD_GET(ACC_ASID, msg[1]);
> +	ac.consumer.engine_class =3D FIELD_GET(ACC_ENG_CLASS, msg[1]);
> +	ac.consumer.engine_instance =3D FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
> +	ac.consumer.vfid =3D FIELD_GET(ACC_VFID, msg[2]);
> +#undef GUC_ACC_MSG_LEN_DW
> +
> +	return xe_access_counter_handler(xe, &ac);

[Severity: High]
Is it safe to unconditionally forward this message to the access counter ba=
ckend?

If the system is initialized with has_usm =3D=3D false, the access counter =
queue
is not fully initialized. Receiving an unexpected access counter notificati=
on
message from the GuC could lead to:

drivers/gpu/drm/xe/xe_access_counter.c:xe_access_counter_handler() {
    ...
    spin_lock_irqsave(&ac_queue->lock, flags);
    ...
    xe_usm_queue_push(ac_queue, ac);
    ...
}

Attempting to acquire an uninitialized spinlock, followed by a NULL pointer
dereference of ac_queue->data in xe_usm_queue_push(). Should we verify if t=
he
feature is supported before processing the notification?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D13
