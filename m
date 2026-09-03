Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27781C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6CE10E12F;
	Thu,  3 Sep 2026 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KYJblS43";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B8A10E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:34:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5637843369;
 Thu,  3 Sep 2026 15:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196B31F00A3A;
 Thu,  3 Sep 2026 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449695;
 bh=AixwKP9xkKTvPHBeu7wDEThOf29TcCn7j6v2vRePVow=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KYJblS43W/oEbBlDgSod1sGKEoqgHoolWR82jycrQIZ4rvUhd/CACXd3qZREktRuz
 7uKO7LI1a0G2oxiYP2/+5zxu86BeglE3nh4iIe6oZfPwiVpwaPgbLFhJqZyVUdON/O
 5nAR3A9I3YVb4Os7nN5RG2eCEQD4zcsPZzfjBF+2ga4exDFeWVXFYHEzmbEDVM+tn2
 i6C0+Qxf7ic3UzGJiex3Pql+TESXDHyXIiuYTUZ1RV7WiVZaB7KXUf4XPOw8Qap/5U
 jQR292ZSGWI5JEvh1VvbBEQr4OItsFYTSVqvRlzkbwrSrHMCkQbug9fZqPwra68ROX
 vVXVBF2GEMobw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 15/27] drm/xe/eudebug: Introduce EU control interface
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-16-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-16-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:34:54 +0000
Message-Id: <20260903153455.196B31F00A3A@smtp.kernel.org>
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
- [High] Incorrect hardware engine (hwe) used to read RING_CURRENT_LRCA for=
 virtual exec queues, causing valid EU interruption to fail with -EBUSY.
- [High] Calling `xe_eudebug_exec_queue_get` triggers a use-after-free beca=
use the debugger handle map stores raw pointers to queues that can be freed=
 when the target process exits.
--

commit ae12753c8db49bf5356301911889cee3d0b8fe63
Author: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

    drm/xe/eudebug: Introduce EU control interface

This commit introduces the EU control interface, allowing the EU debugger
to interrupt, resume, and query the state of EU threads. It provides an
abstraction layer for the GuC to hook into in the future.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index 188a4c60513c5..ecd6d4c5d63ca 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
[ ... ]
> @@ -738,6 +741,33 @@ struct xe_vm *xe_eudebug_vm_get(struct xe_eudebug *d=
, u32 id)
>  	return vm;
>  }
> =20
> +struct xe_exec_queue *xe_eudebug_exec_queue_get(struct xe_eudebug *d, u3=
2 id)
> +{
> +	struct xe_eudebug_resource *r =3D
> +		resource_from_type(d, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE);
> +	struct xe_exec_queue *eq;
> +
> +	mutex_lock(&r->lock);
> +	eq =3D find_resource__unlocked(r, id);
> +	if (eq)
> +		xe_exec_queue_get(eq);
> +	mutex_unlock(&r->lock);
> +
> +	return eq;
> +}

[Severity: High]
Does this code introduce a use-after-free risk during target process exit?

The debugger handle map (d->target.res) stores raw pointers to target
resources like exec queues. When the target process closes its DRM fd,
xe_file_close() sets d->target.xef =3D NULL via xe_eudebug_file_close(), and
proceeds to drop references to all target exec queues, freeing them.

However, the raw pointers remain in the debugger's resource map until the
debugger itself is closed. If a debugger races with the target process
exit and invokes the DRM_XE_EUDEBUG_IOCTL_EU_CONTROL ioctl, it can pass
the xe_eudebug_detached() check before the target clears d->target.xef.
Then do_eu_control() calls xe_eudebug_exec_queue_get(), which retrieves the
freed pointer and calls xe_exec_queue_get(eq), performing a kref_get() on
freed memory.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_e=
udebug_hw.c
> index aa31b4c917133..d14e4e4775f2f 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
[ ... ]
> +struct xe_exec_queue *
> +xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
> +{
> +	struct xe_hw_engine *active;
> +
> +	active =3D get_runalone_active_hw_engine(gt);
> +	if (IS_ERR(active))
> +		return ERR_CAST(active);
> +
> +	return active_hwe_to_exec_queue(active, lrc_idx);
> +}

[Severity: High]
Does returning only the exec queue here discard the specific active
physical engine context?=20

This discovers the correct active hardware engine but discards it by
returning only the queue, removing context necessary for subsequent hw
access. For virtual queues, the physical engine where the queue is actively
running might not be the primary assigned engine. When
active_hwe_to_exec_queue() returns the queue, the knowledge of which
physical engine it was found on is lost.

[ ... ]
> +static int xe_eu_control_interrupt_all(struct xe_eudebug *d,
> +				       struct xe_exec_queue *active,
> +				       struct xe_lrc *lrc)
> +{
> +	unsigned int fw_ref =3D 0;
> +	u32 lrc_hw, lrc_hw_post;
> +	u32 td_ctl;
> +	int err =3D -EINVAL;
> +
> +	fw_ref =3D xe_force_wake_get(gt_to_fw(active->gt), active->hwe->domain);
> +	if (!fw_ref) {
> +		err =3D -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	/* Additional check just before issuing MMIO writes */
> +	err =3D read_hw_lrca_fw(active->hwe, &lrc_hw);
> +	if (err)
> +		goto out;
> +
> +	if (!lrca_equals(lower_32_bits(xe_lrc_descriptor(lrc)), lrc_hw)) {
> +		err =3D -EBUSY;
> +		goto out;
> +	}

[Severity: High]
Is active->hwe always the correct physical engine to read
RING_CURRENT_LRCA from?

When do_eu_control() passes a virtual exec queue into this function,
active->hwe represents the primary assigned engine rather than the actual
physical engine where the runalone workload is currently executing. This
can cause read_hw_lrca_fw(active->hwe, ...) to target the wrong physical
engine, making the LRCA check fail and erroneously return -EBUSY, preventing
the EU interruption from succeeding on virtual queues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D15
