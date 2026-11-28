Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71932606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blyXxxjB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B6610E39D;
	Sat, 28 Nov 2026 06:04:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4E310E39D
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:04:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7990C440C2;
 Sat, 28 Nov 2026 06:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BA91F0089C;
 Sat, 28 Nov 2026 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795845852;
 bh=S6p2EmklckITloygCAPGEHGtYxscVsTEEowOQIHwhjo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=blyXxxjBuAZevEqN3baS/M6twFIgauJa8gY4BP953vCTvsNJSyhAAFGJkAEsUWlAO
 fFhKqHUJQMzVa4u7taPI5xmBZ9BPixTWgF4XWDWxVkDNSd20Qgr6BtpkvmhdJGl6KF
 jawmxur+vXps56AoLypMkkhmdHX+o74Mu40QIrDVQs/rzcIosrSKttxBQINATM6bna
 nztX7/eAtoy5UqCUA647n7Q8LSEwn8U4vK7SuLBQ8Ij0CyH+1zDBIdcCPvxsdFlUTH
 b4aizbZRZvZnT5HZwx6VRnqqgeTkmMpobExUitQQ6eNrslRyUDmiYYAe0ezP8jcqy3
 d0Os/CRGma3Cw==
Message-ID: <sashiko-outbox-238481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] drm/xe/pcode: Add ordered write batch helper
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-4-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:04:11 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/pcode: missing rationale and lock impact for
  xe_pcode_write_batch()
--

commit 357f40b2588787b30829671c174b780a0ae2ed24
Author: Karthik Poosa <karthik.poosa@intel.com>

> drm/xe/pcode: Add ordered write batch helper
>=20
> Add a pcode helper that issues an ordered sequence of mailbox writes
> while holding the pcode lock, so no other mailbox command can be
> interleaved.
>=20
> This will be used to write fan tables atomically with respect to other
> pcode users.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index fa9f45d565cb9..409b9ff372e99 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -124,6 +124,45 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32=
 mbox, u32 data, int timeout
>  	return err;
>  }
> =20
> +/**
> + * xe_pcode_write_batch - issue pcode writes in order under the mailbox =
lock
> + * @tile: tile
> + * @writes: mailbox/data pairs to write
> + * @count: number of entries in @writes
> + *
> + * Holds the pcode lock across all writes so no other mailbox command ca=
n be
> + * interleaved; the lock may be held for up to @count * PCODE_DEFAULT_TI=
MEOUT_MS.
> + * Stops at the first failure; earlier writes are not reverted.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_wri=
te *writes,
> +			 unsigned int count)
> +{
> +	unsigned int i;
> +	int err =3D 0;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	mutex_lock(&tile->pcode.lock);
> +	for (i =3D 0; i < count; i++) {
> +		u32 data =3D writes[i].data;
> +
> +		err =3D pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFA=
ULT_TIMEOUT_MS,
> +				       false, false);

[Severity: Low]
As reported by Rodrigo Vivi on v4 [1], the commit message and kernel-doc
still do not explain why pcode requires these writes to be issued without
interleaved mailbox commands, or assess the risk of holding
tile->pcode.lock for up to count * PCODE_DEFAULT_TIMEOUT_MS (110 ms for
an 11-entry fan table write) and starving or causing timeouts on other
pcode paths.

[1] https://lore.kernel.org/r/awcpB6s_32zyhNBi@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D3
