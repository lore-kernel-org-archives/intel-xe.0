Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B97C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADC210E12F;
	Thu,  3 Sep 2026 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TN8l3LnZ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F3310E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:22:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 042A26053B;
 Thu,  3 Sep 2026 15:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C481F000E9;
 Thu,  3 Sep 2026 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448928;
 bh=IctZjv6+PSNg2k6OXG7r0bJNLT5vb03nptuZOzC+0cc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TN8l3LnZmr+jLo99kSYERnM5gODrwDExGUPw7Irjpd6gFKgwyzNjkZ0+nyA9H5KuR
 TvDcoVP+LKu6E4VAjttrlqluHFgLWcZPpfeS1Wkwj5kwZuyBNsOkdi9wQegrXWhcmm
 4a6qO9s/ZtA5IK/8peIJEoVDeLF7wb7lmdOfeZd300xJW6iuOtyIXevJstCnw7748R
 4f0DnJHnSEDbeZyXTKJt3AxwNkzauW4ryBFffc3hZqIFsfxuUAWcV8PfWpeI7Nh4+7
 LkJRT9iCrZ2HpypGK6MWf6vWBKFIPHapsNEerbTCy8ftIugOCS+9HdT/ikmmbuL5Xp
 v4rXPrXDmQaiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/27] drm/xe: Introduce ADD_DEBUG_DATA and
 REMOVE_DEBUG_DATA vm bind ops
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-10-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-10-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:22:08 +0000
Message-Id: <20260903152208.83C481F000E9@smtp.kernel.org>
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
- [High] Missing enforcement of the debug data extension for `ADD_DEBUG_DAT=
A` and `REMOVE_DEBUG_DATA` operations, allowing them to silently execute as=
 no-ops and pass a NULL pointer to eudebug.
--

commit 7fdd31439ab20b18aec25bd5e11c3a84839d451e
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops

This commit introduces new VM bind operations to add and remove per-VM
debug data. It adds extension parsing to the VM bind ioctl to accept
pseudopaths or file paths for mapping binary instructions to code lines.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -3903,6 +4061,10 @@ static int vm_bind_ioctl_check_args(struct xe_devi=
ce *xe, struct xe_vm *vm,
>  			err =3D -EOPNOTSUPP;
>  			goto free_bind_ops;
>  		}
> +
> +		err =3D vm_bind_ioctl_check_user_extensions(vm, op, extensions);
> +		if (err)
> +			goto free_bind_ops;
>  	}
> =20
>  	return 0;

[Severity: High]
Does this code correctly enforce that the extensions field must be
non-zero for DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA and
DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA?

If extensions is 0, vm_bind_ioctl_check_user_extensions() simply returns 0=
=20
without validating that the required debug data struct is present. This
allows a malformed VM bind ioctl to proceed.

[ ... ]
> @@ -4180,11 +4342,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *file)
>  		u64 obj_offset =3D bind_ops[i].obj_offset;
>  		u32 prefetch_region =3D bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index =3D bind_ops[i].pat_index;
> +		u64 extensions =3D bind_ops[i].extensions;
> =20
>  		ops[i] =3D vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
> -						  prefetch_region, pat_index);
> -		if (IS_ERR(ops[i])) {
> +						  prefetch_region, pat_index, extensions);
> +
> +		if (!IS_ERR(ops[i]) && extensions) {
> +			err =3D vm_bind_ioctl_process_user_extensions(vm, ops[i], op, extensi=
ons);
> +			if (err)
> +				goto unwind_ops;
> +		} else if (IS_ERR(ops[i])) {
>  			err =3D PTR_ERR(ops[i]);
>  			ops[i] =3D NULL;
>  			goto unwind_ops;

[Severity: High]
When extensions is 0, this block is skipped entirely, leaving the added and
removed pointers in op->modify_debug_data as NULL.

Later, xe_eudebug_vm_bind_execute() extracts this NULL dd pointer and
passes it to vm_bind_op_event(), where debug_data->addr is unconditionally
dereferenced. Can an unprivileged local user trigger a kernel panic by
opening the DRM device, connecting via DRM_IOCTL_XE_EUDEBUG_CONNECT, and
submitting a DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA request with extensions set
to 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D9
