Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F4C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C910E35F;
	Tue, 18 Aug 2026 10:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kvum/Z7J";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EDE10E35F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:57:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1963340BEA;
 Tue, 18 Aug 2026 10:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D101F00A3A;
 Tue, 18 Aug 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050634;
 bh=JgKlj5mHh8iFARwJrZeOR2Xj62MT5/bsqoG5FUFxCsQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Kvum/Z7J5J/2OGUI6TPJkN3ltJCxBGNDSk5WimVhlmQ+bQDHbm8vJnZS9o+tQZxvj
 w7iCmcUpu+Sr++3JS1r7g/HsLme5hsAKPQr7dllgyIngIaUqx+wxq2UjX+391TN62G
 X/Qsx9/fuuQGeAXwvHL84naP+wbgQ4wyLIwligBkbDLgZGr1JFh1kw1einDw806JJk
 QoRlWD9tefcOJfE8fIKCzx46xiy5TrE18kCTDW7r4qpgdAf+V6jY2+14qR9g+2lR81
 qZlb7I3nql6y1FQPk8GlHD+yK9FqNqAZYwzYBsd+RsDhVxR3Cxj+vgVpkfI+rdtDv2
 qjJDCDr1YJ2jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 09/12] drm/xe/configfs: Add vram bad page
 reservation policy
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-23-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:57:13 +0000
Message-Id: <20260818105713.C5D101F00A3A@smtp.kernel.org>
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
- [Medium] Dynamic configfs lookup at runtime causes state loss if the dire=
ctory is removed.
- [Medium] Silent hardware corruption offlining under default policy (skips=
 logging).
- [Low] Redundant `#include "xe_configfs.h"` directive.
--

--- Patch [9]: [PATCH V17 09/12] drm/xe/configfs: Add vram bad page reserva=
tion policy ---
commit ce0caab1275a7dd6bc0fdd6afde67d346ea6c808
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/configfs: Add vram bad page reservation policy

The interface enables setting the policy for how bad pages are
handled in VRAM. This is crucial for maintaining system
stability in scenarios where VRAM degradation occurs.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 9311aa3728f84..51b98460481d9 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -15,6 +15,8 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs.h"

[Severity: Low]
This isn't a bug, but is it intentional to include xe_configfs.h twice
on consecutive lines here?

>  #include "xe_device.h"
>  #include "xe_exec_queue.h"

[ ... ]

> @@ -860,6 +862,14 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *=
xe, u64 addr)
>  	vram_mgr =3D &vr->ttm;
>  	mm =3D &vram_mgr->mm;
> =20
> +	policy =3D xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev)=
);

[Severity: Medium]
Is it safe to dynamically query the configfs tree during the hardware fault
handler?

If userspace removes the configfs directory via rmdir,
xe_configfs_get_bad_page_reservation() will fail to find the group and
silently revert to the default policy.

Since the attribute can only be set before binding, would it be more
robust to cache this value in struct xe_device at probe time rather than
evaluating it dynamically at runtime?

> +	if (!policy) {
> +		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
> +			addr);
> +		/* Let RAS report to FW to drop addr from SRAM queue */
> +		return -EOPNOTSUPP;
> +	}

[Severity: Medium]
Does this skip logging when the policy is set to offlining?

The commit message states that policy 1 means "Logging and offlining"
and 0 means "Logging only". However, the error logging is placed inside
the if (!policy) block. If policy is 1 (the default), the handler bypasses
this block and proceeds to reserve the page without logging the
degradation in dmesg.

> +
>  	/* Reserve page at address */
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D9
