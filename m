Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8ECC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45DE10E12F;
	Thu,  3 Sep 2026 15:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DCQ3lu7O";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277310E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:31:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B3D860A55;
 Thu,  3 Sep 2026 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7861F00A3A;
 Thu,  3 Sep 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449517;
 bh=Yq6NqzFQ/M8wtEhAayPKRqLSw6VSYnlQUhM6TOHgw6M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DCQ3lu7On4WWHqnlJBdLjQVSupFVoD1k9ewXrWnN1Fi/SCw0z8J/ARsHPeLZoKI4n
 eus4H/Dh5Hz476XMmTo8AgrZyRt7pzvqaj6nV12qPGUohbMdR3lC+hx9AcRK9M0oV8
 sKcDkjF01sufNMhQxQX55svE/WjgrpvRVL72ywkQlU7uxgxPYiNx+GB++i5IiOUtU6
 tXXZsPan0Zz+6yp+bh5hEBSE6OLmNlHidkir1bxWfqc60pn7A12vG0QyZaCs/1iAvp
 +l6EWgSsbU8XtzCT6CXbARGpTq2lWESIjzxbQ0z+Da9EzbF9iJNbZew6gfNDaqcg0a
 h3M5cVcBbmYqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 21/27] drm/xe/eudebug: Add read/count/compare helper
 for eu attention
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-22-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-22-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:31:56 +0000
Message-Id: <20260903153156.DA7861F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unaligned memory access and endianness bugs due to incorrect type =
punning in `xe_eu_attentions_count`.
- [High] Unbounded CPU stall / soft lockup due to 1.5-second `udelay()` bus=
y-waiting in `xe_gt_eu_attentions_read`.
- [Medium] Silent failure when reading hardware attentions causes the debug=
ger to process zeroed memory as valid EU threads.
- [Medium] Meaningful code and commit message mismatch: The patch claims to=
 add an EU thread compare function, but the implementation is completely mi=
ssing.
--

commit a0b2cd07131e7090249ddf2ff617e3c4283b5549
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

drm/xe/eudebug: Add read/count/compare helper for eu attention

This commit adds the xe_eu_attentions structure to capture and store EU
attention bits. It also introduces functions to read and count the number of
EU threads that have triggered attentions.

>     drm/xe/eudebug: Add read/count/compare helper for eu attention
>    =20
>     Add xe_eu_attentions structure to capture and store eu attention bits.
>     Add a function to count the number of eu threads that have turned on =
from
>     eu attentions, and add a function to count the number of eu threads t=
hat
>     have changed on a state between eu attentions.

[Severity: Medium]
This isn't a bug, but the commit message states it adds a compare helper "to
count the number of eu threads that have changed on a state between eu
attentions." Does the patch actually include this function? It appears to be
missing from the implementation.

> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_=
debug.c
> index b20e42e66c5bc..bff78c0b232a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debug.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.c
[ ... ]
> @@ -199,3 +202,50 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt =
*gt)
> =20
>  	return err < 0 ? 0 : err;
>  }
> +
> +static inline unsigned int
> +xe_eu_attentions_count(const struct xe_eu_attentions *a)
> +{
> +	return bitmap_weight((void *)a->att, a->size * BITS_PER_BYTE);
> +}

[Severity: High]
Does casting this u8 array to an unsigned long pointer cause unaligned memo=
ry
accesses?

In drivers/gpu/drm/xe/xe_gt_debug_types.h, the xe_eu_attentions struct
declares att as a u8 array, meaning the struct has at most a 4-byte
alignment (dictated by unsigned int size).=20

When xe_eu_attentions_count() in drivers/gpu/drm/xe/xe_gt_debug.c casts this
array to void * and passes it to bitmap_weight(), which expects an unsigned
long *, it can cause undefined behavior. Dereferencing a 4-byte aligned
address as an 8-byte unsigned long can cause faults on architectures with
strict alignment requirements, or incorrect bit counting on big-endian syst=
ems.

> +
> +void xe_gt_eu_attentions_read(struct xe_gt *gt,
> +			      struct xe_eu_attentions *a,
> +			      const unsigned int settle_time_ms)
> +{
> +	unsigned int attn, prev =3D 0;
> +	ktime_t end, now;
> +
> +	now =3D ktime_get_raw();
> +	/* Initially wait longer for attentions to appear */
> +	end =3D ktime_add_ms(now, settle_time_ms * 10);
> +
> +	a->size =3D min_t(int,
> +			xe_gt_eu_attention_bitmap_size(gt),
> +			sizeof(a->att));
> +
> +	do {
> +		if (xe_gt_eu_attention_bitmap(gt, a->att, a->size) < 0)
> +			return;

[Severity: Medium]
Will this early return swallow the error code and corrupt the debugger's
data flow?

If xe_gt_eu_attention_bitmap() fails in xe_gt_eu_attentions_read(), it
returns early but leaves a->size set to a positive value. Since the function
signature is void, the caller has no way of knowing a failure occurred.

Could the caller then process the structure's att array (which contains
zeroes) and falsely report that no threads triggered an attention?

> +
> +		if (!settle_time_ms)
> +			break;
> +
> +		attn =3D xe_eu_attentions_count(a);
> +
> +		now =3D ktime_get_raw();
> +
> +		if (attn > prev) {
> +			prev =3D attn;
> +			end =3D ktime_add_ms(now, settle_time_ms);
> +		}
> +
> +		udelay(15);
> +
> +		/*
> +		 * XXX We are gathering data for production SIP to find
> +		 * the upper limit of settle time. For now, we wait full
> +		 * timeout value regardless.
> +		 */
> +	} while ((attn < a->size * 8) && ktime_before(now, end));
> +}

[Severity: High]
Can this loop cause an unbounded CPU stall or soft lockup?

The loop in xe_gt_eu_attentions_read() waits for a timeout of
settle_time_ms * 10. When called from a pagefault handler with
XE_GT_ATTENTION_TIMEOUT_MS (150ms), the timeout is 1.5 seconds. Inside the
loop, it busy-waits using udelay(15) instead of a sleeping delay.

Additionally, if any DSS in the middle of the topology is fused off, attn
will never reach a->size * 8 because a->size overestimates the valid bits.
Does this guarantee the loop will always busy-wait for the full 1.5 seconds
per call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D21
