Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49EC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A636F10E27D;
	Fri, 21 Aug 2026 11:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SYbceaUT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6BF10E27D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:43:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 17AA5432E8;
 Fri, 21 Aug 2026 11:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51481F000E9;
 Fri, 21 Aug 2026 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312612;
 bh=29c4JqXiBEVeT9l0YIRQLtaubu7yZPOCEmdwL3fsHOY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SYbceaUT2Yr2UnB7Tt4e+Df9Dy9Kgq4843RyZanwAwg+9dqbjSfcuTszz0dH/X1hg
 9jB8BacUnEuqEZADQ3mdcW1MuOS+ZtbPfYdHlNnKUGKQiAZR0cISPfRdLvZKfG3h+S
 EzY1vLLv+kng9ziR52/zE23/Ngml+uptRYwSAPmUZENMEbKgK4ncmdxVdY3p0FiJuJ
 QY2XxOYyy83WW+n6XZ9jRkNsGB4SjCUY86uVxkdLGEwm90Rfzbi8JCShcRuw2J3303
 P9n5+58O/OA36rcgRFad0YFbQIVgr/VBw1n4KkOkqQPT/puJzrf1kkvITHLc0MtYz6
 fS/WxGhC29Fug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/10] drm/xe/exec_queue: Introduce
 xe_exec_queue_reinit()
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-6-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:43:31 +0000
Message-Id: <20260821114331.C51481F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] A local denial of service (kernel panic) is possible when a user s=
pace application sets the DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE property =
on platforms where default_lrc is not populated.
--

--- Patch [5]: [PATCH v10 05/10] drm/xe/exec_queue: Introduce xe_exec_queue=
_reinit() ---
commit a8c85ce636fedba930156524ab6e248c40456eee
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/exec_queue: Introduce xe_exec_queue_reinit()

In preparation of usecases which require re-initializing exec queue
after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
queue LCRs already exist but the context is lost on PCIe FLR and needs
re-initialization.

> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 35b4e8289b5fe..79b363978ea49 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c

[ ... ]

> @@ -1486,8 +1486,19 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc=
 *lrc, enum xe_multi_queue_pri
>  	lrc->desc |=3D FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc,=
 priority));
>  }
> =20
> -static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,=
 struct xe_vm *vm,
> -			   void *replay_state, u16 msix_vec, u32 init_flags)
> +/**
> + * xe_lrc_ctx_init() - Initialize LRC with context details
> + * @lrc: Pointer to the LRC
> + * @hwe: Hardware Engine
> + * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
> + * @init_flags: LRC initialization flags
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct=
 xe_vm *vm,
> +		    void *replay_state, u16 msix_vec, u32 init_flags)
>  {
>  	struct xe_gt *gt =3D hwe->gt;
>  	struct xe_tile *tile =3D gt_to_tile(gt);

[Severity: High]
This is a pre-existing issue, but can this code cause a NULL pointer
dereference when replay_state is set?

If a user space application calls the xe_exec_queue_create IOCTL with the
DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE extension, q->replay_state is
populated. Inside xe_lrc_ctx_init(), the code checks:

    if (gt->default_lrc[hwe->class] || replay_state) {
        xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);
        xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
                         gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
                         lrc->size - LRC_PPHWSP_SIZE);

If the queue is created on a platform where GuC submission is disabled,
gt->default_lrc is not populated during initialization and remains NULL.

Because replay_state is true, the condition passes, and we unconditionally
evaluate gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE as the source pointer
for xe_map_memcpy_to(), leading to a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D5
