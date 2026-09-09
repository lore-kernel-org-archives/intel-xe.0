Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F697C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F810E14E;
	Wed,  9 Sep 2026 12:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ag5+61VU";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A6310E14E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:51:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A26A60211;
 Wed,  9 Sep 2026 12:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9407C1F00A3A;
 Wed,  9 Sep 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958297;
 bh=PT8F5DQGLlTUo0WIp1N00y3s7ZnNJWgTLJv6FFQDYow=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ag5+61VU2CMaHQXI1NadqjgOdr0g84aKdaJ2bQNIHphkmfD0wFNzXCV4PwP7BUBiW
 hdKD4tjgbU65oBVdoepduyZOBp3O8jccd2vJ+kRi61PDhB1Q9MT6aj1qAa+bXyE+WP
 sLPtilX3OpJpAyYpe0tTWNJnFDusRJtQ6YUgu7yzNL3is1bPM7pJHYtvtMKDZMPdAC
 A3yaJYScJREwkFPTBVMpKOoyR2wdncD+3KH0MBBvJyWcdxaqPSfIlJPweB7kwL93Yb
 1A8TrQ68z2FYAX9S7IbnQVnDhI2BD2O4On041WvWKBsSd41SflwTWTbzke51BEXUZX
 6EveByzbjfKxw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 01/21] drm/xe: Add xe_usm_queue generic USM circular
 buffer
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-24-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:51:37 +0000
Message-Id: <20260909125137.9407C1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] CIRC_SPACE macro misuse and missing power-of-two enforcement for=
 queue size.
- [Low] Expensive integer division used in IRQ hot path instead of bitwise =
AND.
- [Low] Unused header inclusion for <linux/workqueue.h>.
--

commit 9fcff35c519c0e3d9b6f11658ca9f7a63e42fc15
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Add xe_usm_queue generic USM circular buffer

This commit introduces struct xe_usm_queue, a generic lock-protected
circular FIFO used by USM consumers to receive fixed-size entries from IRQ
context. It provides inline helpers to push and pop entries, and to check if
the queue is full.

> diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_us=
m_queue.h
> new file mode 100644
> index 0000000000000..64f708a5f835a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_usm_queue.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_USM_QUEUE_H_
> +#define _XE_USM_QUEUE_H_
> +
> +#include <linux/circ_buf.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>

[Severity: Low]
Since the embedded work_struct worker was removed from the queue in v2 of
this patch, is this header inclusion now unused?

> +
> +/**
> + * struct xe_usm_queue - Generic USM circular FIFO queue
> + *
> + * A lock-protected circular buffer used by the access counter
> + * consumer. Producers push fixed-size entries from IRQ context;
> + * workers process them asynchronously.
> + */
> +struct xe_usm_queue {
> +	/**
> +	 * @data: Raw byte buffer backing the queue, protected by @lock
> +	 */
> +	void *data;
> +	/** @size: Total size of @data in bytes */
> +	u32 size;

[Severity: Medium]
Does the size field need to enforce or document that it must be a power of
two?

If the queue is initialized with a non-power-of-two size, the CIRC_SPACE
macro used in xe_usm_queue_full() will compute incorrect free space values,
potentially leading to buffer overflows or premature 'queue full' rejection=
s.

> +	/** @head: Write cursor in bytes, moved by producer, protected by @lock=
 */
> +	u32 head;
> +	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock =
*/
> +	u32 tail;

[ ... ]

> +static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out)
> +{
> +	bool found =3D false;
> +
> +	spin_lock_irq(&q->lock);
> +	if (q->tail !=3D q->head) {
> +		memcpy(out, q->data + q->tail, q->data_size);
> +		q->tail =3D (q->tail + q->entry_size) % q->size;

[Severity: Low]
Could this expensive integer division be replaced with a bitwise AND?

Since q->size must be a power of two for CIRC_SPACE() to function correctly,
optimizing this modulo operation to & (q->size - 1) would remove an integer
division operation.

> +		found =3D true;
> +	}
> +	spin_unlock_irq(&q->lock);
> +
> +	return found;
> +}
> +
> +/**
> + * xe_usm_queue_peek - Check whether the queue has at least one entry

[ ... ]

> +static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void =
*in)
> +{
> +	lockdep_assert_held(&q->lock);
> +
> +	memcpy(q->data + q->head, in, q->data_size);
> +	q->head =3D (q->head + q->entry_size) % q->size;

[Severity: Low]
Similarly, could this integer division be optimized to a bitwise AND to avo=
id
a performance penalty in the hardware interrupt hot path?

> +}
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D1
