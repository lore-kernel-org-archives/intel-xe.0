Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C7DC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849810E10B;
	Thu,  3 Sep 2026 15:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nr/Fq/W7";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF5610E10B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:26:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6911840799;
 Thu,  3 Sep 2026 15:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E0A1F00A3A;
 Thu,  3 Sep 2026 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449167;
 bh=dr7WJ2j7iMyfBuDYiADw4VYVa8LHWUXPbww+V83umXM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nr/Fq/W7Im6zCWyC7ZCP87uqHXykI/lIukXCb8C/kM4rOtSmgZV+VzOwkx/Sk7pBU
 oqcGG7tbgpohZTarCwJbfwrkPr46aLWYbnfTXy+8gvt7pdynhGNnsokXB5HBt5jr4O
 ogEHZQaSIX2z3wobB/oJSXJqQ4DYje3kLoKPlZgY9SCGkh10FuVpW/V6mLqz9Orv1j
 uAXw7zdL0IuUOG0RHZsSHMMLBkJqH7NbuYny1vOQ1GyI1t07q30rAZoRXyt2ClHtNc
 2J52GduCYfz6mcbbprpPtxX0pIJnHgiBcybm88j4muWa2kqNKfIjn3inOIR/n2nuhW
 D/IHRC8/LSa8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/27] drm/xe/eudebug: Introduce vm bind and vm bind
 debug data events
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-11-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-11-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:26:06 +0000
Message-Id: <20260903152607.21E0A1F00A3A@smtp.kernel.org>
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
- [High] Missing `xe_vm_in_lr_mode(vm)` check in `vm_discover_binds` causes=
 debugger discovery to fail if non-LR VMs have debug data.
--

commit c9fa46a5dd0ac097fb655eda186ce81f79cd82c1
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/eudebug: Introduce vm bind and vm bind debug data events

This commit introduces events to track bind ioctls and their associated
debug data add and remove operations. It adds a bind event to signal debugg=
er
execution and implements discovery of existing binds when attaching.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index d70970f70a8bc..fe3b2ae06a31f 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c

[ ... ]

> @@ -942,13 +1118,57 @@ static struct xe_file *xe_eudebug_target_get(struc=
t xe_eudebug *d)
>  	return xef;
>  }
> =20
> +static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
> +{
> +	struct xe_debug_data *dd;
> +	struct list_head *pos;
> +	unsigned int ops, count;
> +	u64 ref_seqno;
> +	int err;
> +
> +	/*
> +	 * Walked without vm->debug_data.lock. The caller holds the target's
> +	 * eudebug.ioctl_lock for write, and everything that adds to or
> +	 * removes from this list runs under DRM_XE_VM_BIND, which takes that
> +	 * same rwsem for read, so the list cannot change under us here.
> +	 */
> +	if (list_empty(&vm->debug_data.list))
> +		return 0;

[Severity: High]
Is it intentional that vm_discover_binds() lacks a check for LR mode?=20
If a userspace client adds debug data to a non-LR VM, this function will
still attempt to process it since it's missing a check like
if (!xe_vm_in_lr_mode(vm)).

[ ... ]

> @@ -980,6 +1200,12 @@ static void discover_client(struct xe_eudebug *d)
>  		if (err)
>  			goto out;
>  		vm_count++;
> +
> +		err =3D vm_discover_binds(d, vm);
> +		if (err < 0)
> +			goto out;

[Severity: High]
Can this sequence cause the debugger discovery to fail completely?

In discover_client(), vm_create_event() correctly skips creating events=20
and handles for non-LR VMs. However, vm_discover_binds() is called=20
unconditionally for all VMs.

If userspace adds debug data to a non-LR VM, vm_discover_binds() will=20
attempt to send bind events via vm_bind_event(). Because the VM handle was=
=20
never registered, find_handle() will fail with -ENOENT.

This error will propagate to the out label, immediately disconnecting the
eudebug session. Could an unprivileged userspace client use this to
intentionally break the eudebug facility for their process?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D10
