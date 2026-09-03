Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D446AC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F7210F676;
	Thu,  3 Sep 2026 15:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ClhJfz8G";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFFE10F676
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:14:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 106F5601EF;
 Thu,  3 Sep 2026 15:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6F91F000E9;
 Thu,  3 Sep 2026 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448457;
 bh=I1Wa0z4I9oC9/H7pQPmaOPGMu2EQwSUee2RXg7ZphQ0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ClhJfz8GVdtTUctEa6KWA3iuzYaqnCchHqQxtQ0+nE6APIunAyQ7ly+Fhyp8WbleB
 HyXa+t8ZN6s2pJBNFI5D0u+U6ZS+ofA5fSYp9obfoG+7BrAdte/v+qrxuZPcPUryPo
 0gM2Drd9o2n9Q6m9pBO1WNYhVb3br83tBYkG+7TgKJ/ZZZMzyHIjiKYjgTyol1xHFo
 1PFZR771RVFG6NTFwIIXPlaCa3bWaYUxpTOztghlXeQkz6Itr+oGkwGmPXFA1CfCLQ
 ugOy4Fxmin5NpOMrUPAD5bxvFOJ4099DSXUgFvZXPEZj3OcOC1rDU07rEAlOeRI+dp
 /IjV+aozESpOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/27] drm/xe: Add EUDEBUG_ENABLE exec queue property
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-6-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-6-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:14:17 +0000
Message-Id: <20260903151417.8F6F91F000E9@smtp.kernel.org>
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
- [High] The restriction preventing the combination of EUDEBUG and multi-qu=
eue (MULTI_GROUP) is incomplete and trivially bypassed due to extension cha=
ining order.
--

commit ed5a1d80f63515e05517829f344f3a806b4618aa
Author: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

drm/xe: Add EUDEBUG_ENABLE exec queue property

This commit introduces an immutable eudebug property for exec_queues.
It uses a flags value to enable eudebug-specific features like the runalone
hardware feature. This ensures that only one hardware engine in a group is
active on a tile.

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index a663c55b386de..d13f69eb025ca 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
[ ... ]
> @@ -991,6 +994,51 @@ static int exec_queue_set_state_cache_perf_fix(struc=
t xe_device *xe, struct xe_e
>  	return 0;
>  }
> =20
> +static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_q=
ueue *q,
> +				  u64 value)
> +{
[ ... ]
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_uses_pxp(q)))
> +		return -EPERM;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue_secondary(q)))
> +		return -EINVAL;

[Severity: High]
Can this state-based check be defeated if userspace chains the extensions
such that the EUDEBUG property is processed before the MULTI_GROUP extension
makes the queue secondary?

> +
> +	q->eudebug_flags =3D EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +	q->sched_props.preempt_timeout_us =3D 0;
> +
> +	return 0;
> +}
[ ... ]
> @@ -1077,6 +1126,17 @@ static int exec_queue_user_ext_check(struct xe_exe=
c_queue *q, u64 properties)
>  			 (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
>  		return -EINVAL;
> =20
> +	/*
> +	 * A debugger can inspect and modify the EU state and memory of a
> +	 * debuggable queue, so it must not be combined with protected content.
> +	 * Test the property mask rather than the queue state, as the extensions
> +	 * are applied in the order userspace chained them and either one may be
> +	 * processed first.
> +	 */
> +	if (XE_IOCTL_DBG(xe, (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPER=
TY_EUDEBUG)) &&
> +			 (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
> +		return -EINVAL;
> +

[Severity: High]
This correctly handles the extension chaining order for PXP. Should a simil=
ar
stateless bitmask check be added here for
DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP to prevent applying EUDEBUG to a
multi-queue?

Additionally, when attaching a secondary queue to a primary queue in
xe_exec_queue_group_validate():

drivers/gpu/drm/xe/xe_exec_queue.c:xe_exec_queue_group_validate() {
    ...
	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
	    XE_IOCTL_DBG(xe, q->vm !=3D primary->vm) ||
	    XE_IOCTL_DBG(xe, q->logical_mask !=3D primary->logical_mask)) {
		ret =3D -EINVAL;
		goto put_primary;
	}
    ...
}

Does this code also need to verify that the primary queue does not have
EUDEBUG/runalone enabled to prevent bypassing the restriction?

Enforcing RUNALONE on a MULTI_GROUP execution violates hardware invariants
and could cause a regression leading to GPU hangs or resets.

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D5
