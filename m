Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BE606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JAB8fY6d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417FA10FC97;
	Wed,  4 Nov 2026 16:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FBD10FD16
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793809585; x=1825345585;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Fyks7zztx2LHsitsc8IJXHY5lLtdtW2maTMGnm5dVww=;
 b=JAB8fY6djEW8lC7s0en2Kep+5TUHsy8Kj86R13KAcbABSvdOfC7PAcYm
 PM7p5lzNt99iD6pAMhIh5sgr0hnyIml0nM3HODORnBKRakJv6KK9uTEap
 00Ujm4dpYu8v2ClGbZ+xxu4FY4sE74APQZAganM/V51nrXRsZ6IjAGRy+
 Whu7szGo5nc/Oswff6yIOKrLQd6HYQtVUI7ZEf1UrvwgMYYdFXpO/HNZo
 roncBfiTAdFZzVdmvssMXwZRIHJGOAGpNIPqP2WKBSGjLgp6QiOCW3bky
 G8cPz7IcijJyqKC7DMpzMYsQa1doTgWmyKdKA9VfvD5UDJ88C74qzDavd A==;
X-CSE-ConnectionGUID: ZfdKJQ5qRAuu7en8lLkiRw==
X-CSE-MsgGUID: GqS+2KCES2WYviWmReRODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2449414"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2449414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 08:26:24 -0800
X-CSE-ConnectionGUID: 2xlSKPaySAC87JVZWbdq5g==
X-CSE-MsgGUID: QFtI30AxQKaxxQpR68wzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6590090"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.20])
 ([10.245.244.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 08:26:22 -0800
Message-ID: <593e16359e311d7206c0bf9ea960d271020950ba.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pm: Refuse suspend/hibernate when used VRAM
 exceeds available memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, 	raag.jadav@intel.com, riana.tauro@intel.com,
 himal.prasad.ghimiray@intel.com, 	joonas.lahtinen@intel.com
Date: Wed, 04 Nov 2026 17:26:19 +0100
In-Reply-To: <20261104135133.139627-1-karthik.poosa@intel.com>
References: <20261104135133.139627-1-karthik.poosa@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

On Wed, 2026-11-04 at 19:21 +0530, Karthik Poosa wrote:
> On PM_SUSPEND_PREPARE and PM_HIBERNATION_PREPARE the driver evicts
> VRAM
> contents to system memory. If more VRAM is in use than system memory
> can
> hold, eviction fails in the notifier, which only logs it, and the
> transition then fails later during device suspend.
>=20
> Compare VRAM usage across all VRAM regions with available system
> memory
> (si_mem_available()) plus free swap, since evicted user BOs can be
> swapped out by the shrinker. If it doesn't fit, fail with -ENOMEM
> before
> taking the runtime PM reference or starting eviction, so the
> transition
> is cancelled cleanly up front.
>=20
> This is a best-effort check: usage can change between the check and
> the
> eviction, and pinned BO backups cannot be swapped.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

We have this one here:
https://patchwork.freedesktop.org/patch/761451/?series=3D176481&rev=3D1

See also the link for the upstream issue.

But there are complications. Even if the suspend doesn't drain all
available system memory due to the above, then other allocators may due
to the suspend has already drained all memory.

Also zram swap may give incorrect values of available swap,
and multiple devices suspending may be more subject to TOCTOU errors.

So in addition to all of these suggestions here, IMO want a variant
that checks for each bo about to be evicted the available memory + swap
and leave a reasonable amount of memory.

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9615

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_pm.c | 20 ++++++++++++++++++++
> =C2=A01 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f7e2770252ec..85698361f2ba 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -9,6 +9,8 @@
> =C2=A0#include <linux/pm_runtime.h>
> =C2=A0#include <linux/suspend.h>
> =C2=A0#include <linux/dmi.h>
> +#include <linux/mm.h>
> +#include <linux/swap.h>
> =C2=A0
> =C2=A0#include <drm/drm_managed.h>
> =C2=A0#include <drm/ttm/ttm_placement.h>
> @@ -439,6 +441,24 @@ static int xe_pm_notifier_callback(struct
> notifier_block *nb,
> =C2=A0	case PM_SUSPEND_PREPARE:
> =C2=A0	{
> =C2=A0		struct xe_validation_ctx ctx;
> +		struct ttm_resource_manager *man;
> +		u64 vram_used =3D 0, sys_avail;
> +		int i;
> +
> +		for (i =3D XE_PL_VRAM0; i <=3D XE_PL_VRAM1; ++i) {
> +			man =3D ttm_manager_type(&xe->ttm, i);
> +			if (man)
> +				vram_used +=3D
> ttm_resource_manager_usage(man);
> +		}
> +
> +		/* Evicted user BOs may be swapped out by the
> shrinker */
> +		sys_avail =3D (u64)(si_mem_available() +
> get_nr_swap_pages()) << PAGE_SHIFT;
> +		if (vram_used > sys_avail) {
> +			drm_warn(&xe->drm,
> +				 "Used VRAM %llu MiB exceeds
> available system memory %llu MiB, refusing suspend/hibernate\n",
> +				 vram_used / SZ_1M, sys_avail /
> SZ_1M);
> +			return notifier_from_errno(-ENOMEM);
> +		}
> =C2=A0
> =C2=A0		reinit_completion(&xe->pm_block);
> =C2=A0		xe_pm_block_begin_signalling();
