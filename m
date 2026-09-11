Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FBCC88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 19:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9210E363;
	Fri, 11 Sep 2026 19:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hjjROwSw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C760110E363
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 19:39:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 339EE4326E;
 Fri, 11 Sep 2026 19:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD401F00899;
 Fri, 11 Sep 2026 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789155544;
 bh=zld9KbTVGsMItaIUT3rwK0ks4LJXl6BWFLIKkQl7CX0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hjjROwSwdpuHHbidJ+osFZzsD2wJonY2spGW6lvAaISVpUCe92O5KgbZZdPtOWncN
 57lKKO3yOOBCC9/iR59+438syzH8wLf1lvKvthLZadG3nZIJQSjn803mV3QLd3SvmQ
 qSHfoLxc8n5OBPHmlpSiYfiqQniunObaq1lEeMre5rs2xWvQ+QwG9qPo/yMpJ0PwLq
 3Z91IsLp5EDpoAPLo3ME7VADBThU4+DWLjtotUthc/anucBW1uv7xq6I0shlURRBGr
 URCdQEe1I41ADpDXjl221LdJ3iEogBDn3bI4geWfZhI7IRcVXp3V6OSjpqfzkbBkt6
 9GAWFQ/q1unvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 19:39:03 +0000
Message-Id: <20260911193903.EAD401F00899@smtp.kernel.org>
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
- [High] Unconditional `drm_info` logging in the page fault handler causes =
dmesg spam and potential DoS.
- [High] Setting identical start and end addresses breaks fault chaining, l=
eading to O(N^2) requeuing loops.
- [Medium] Incomplete implementation of the commit message claim regarding =
ASIDs mapped to non-fault-capable VMs.
--

commit cb9b15da640021d0a9305672434a725603f3f8a3
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

drm/xe: Don't wedge shared engine on stale faults from torn-down VMs

This commit modifies the page fault handler to drain stale page faults=20
associated with closed VMs or removed ASIDs rather than returning an error.=
=20
This prevents shared engines from wedging when handling unserviceable=20
faults from abruptly terminated processes.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> index aeb56ff5d58e5..18687e19bceed 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -238,8 +238,10 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct =
xe_device *xe, u32 asid)
>  	vm =3D xa_load(&xe->usm.asid_to_vm, asid);
>  	if (vm && xe_vm_in_fault_mode(vm))
>  		xe_vm_get(vm);
> -	else
> +	else if (vm)
>  		vm =3D ERR_PTR(-EINVAL);
> +	else
> +		vm =3D ERR_PTR(-ENOENT);
>  	up_read(&xe->usm.lock);
> =20
>  	return vm;
> @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct xe_pagefault=
 *pf)
>  		return -EFAULT;
> =20
>  	vm =3D xe_pagefault_asid_to_vm(xe, asid);
> -	if (IS_ERR(vm))
> +	if (IS_ERR(vm)) {
> +		if (PTR_ERR(vm) =3D=3D -ENOENT) {

[Severity: Medium]
The commit message mentions we should drain faults for ASIDs that no longer
map to a fault-capable VM. However, xe_pagefault_asid_to_vm() returns
-EINVAL for that case, while this check in xe_pagefault_service() only
intercepts -ENOENT. Will this cause non-fault-capable VM errors to still
wedge the shared engine?

> +			drm_info(&xe->drm,
> +				 "xe_pf_debug: drain stale fault (no VM) asid=3D%u addr=3D0x%llx\n",
> +				 asid, pf->consumer.page_addr);

[Severity: High]
Does this unconditional drm_info() log in xe_pagefault_service() allow
userspace to spam dmesg? Since any userspace process can create a VM,
schedule GPU work, and abruptly exit, it seems this could generate a flood
of log messages. Would a debug log or rate-limited output be more
appropriate?

> +			xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> +			xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);

[Severity: High]
Does setting start and end to the same address break fault chaining?
When xe_pagefault_queue_pop() processes subsequent faults, it appears to
use xe_pagefault_match() to check if the address falls within the exclusive
bounds (page_addr >=3D start && page_addr < end). Since start equals end he=
re,
creating a zero-length range, the condition can never be met. Can this lead
to O(N^2) unchained requeuing?

> +			return 0;
> +		}
>  		return PTR_ERR(vm);
> +	}
> =20
>  	down_read(&vm->lock);
> =20
>  	if (xe_vm_is_closed(vm)) {
> -		err =3D -ENOENT;
> +		drm_info(&xe->drm,
> +			 "xe_pf_debug: drain stale fault (closed VM) asid=3D%u addr=3D0x%llx\=
n",
> +			 asid, pf->consumer.page_addr);

[Severity: High]
Similar to the no VM case above, could this unconditional drm_info() log
be abused by userspace to trigger dmesg spam by creating and closing VMs
with pending work?

> +		xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> +		xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);

[Severity: High]
As with the previous block, setting the start and end to the same address
creates a zero-length range, which might break the exclusive bounds check
in xe_pagefault_match(). Can this lead to subsequent identical faults not
being coalesced properly?

> +		err =3D 0;
>  		goto unlock_vm;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911192300.1561=
972-2-sanjay.kumar.yadav@intel.com?part=3D1
