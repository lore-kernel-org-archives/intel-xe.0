Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CBAD3EE86
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 15:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7958610E9DC;
	Thu, 22 Jan 2026 15:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaArx5dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97E010E9DC
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769097290; x=1800633290;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fQpPKpiqvL5fB1vN24u+VYqhIhxWmBATQISPUeeitzY=;
 b=kaArx5dhsBv0ipnO5BsHKehzUiXKFhnS/c+0X9+y649K94lW7Ppk9OrX
 NwpTD9IparlQEZhj7KnBt+nWr0N5fYtNq19HNziQqzPPGgiiNq66lDAxR
 KaQkj1ggPod/YfHC9XjP00skR/rz0xnyJnScPleISDx2FwvhYZnX/Kl67
 AvuPAvyU2w4Haekd8ISeS0LSdjBvsrROqa9td2OUxtdEapVK/thNYVMsT
 f5lDcok67PoYu0xuN5qpAktlAOhdUf24EImVYicbB2trCZPgg9pn7DXxg
 Hn/mEf0NNfYLZRfOCy9ofH9YVTXc4n7Vd1/qrbdZ+U9yWGAJDhdgQB0qH A==;
X-CSE-ConnectionGUID: 3+YJvphlSXasztaFkxSHBg==
X-CSE-MsgGUID: rx7YkTd2QVqwapuau/Xa/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74201816"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="74201816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:54:50 -0800
X-CSE-ConnectionGUID: HXSXgN7ARR68dAVcv9SmsA==
X-CSE-MsgGUID: dk1cuBWyRhqzbe4MXN/VXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237435590"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:54:48 -0800
Message-ID: <bcb86a19a6b52689b208bf806352524063331eaa.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/8] drm/xe/bo: Handle CPU faults on purged buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 22 Jan 2026 16:54:46 +0100
In-Reply-To: <20260120060900.3137984-5-arvind.yadav@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-5-arvind.yadav@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2026-01-20 at 11:38 +0530, Arvind Yadav wrote:
> Return error when CPU attempts to access a purged buffer object.
> Purged BOs have their backing store reclaimed by the kernel, making
> CPU access invalid. The fault handler returns SIGBUS to userspace,
> matching i915 semantics.
>=20
> The purged check is added to both CPU fault paths:
> - Fastpath (xe_bo_cpu_fault_fastpath): Returns error immediately
> =C2=A0 under dma-resv lock, preventing attempts to migrate/validate freed
> pages
> - Slowpath (xe_bo_cpu_fault): Returns -EFAULT under drm_exec lock,
> =C2=A0 converted to VM_FAULT_SIGBUS
>=20
> Without the fastpath check, accessing existing mmap mappings of
> purged BOs
> would trigger xe_bo_fault_migrate() on freed backing store, causing
> kernel
> hangs or crashes.
>=20
> v2:
> =C2=A0 - Added xe_bo_is_purged(bo) instead of atomic_read.
> =C2=A0 - Avoids leaks and keeps drm_dev_exit() while returning.
>=20
> v3:
> =C2=A0 - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)
>=20
> v4:
> =C2=A0 - Add purged check to fastpath (xe_bo_cpu_fault_fastpath) to
> prevent
> =C2=A0=C2=A0=C2=A0 hang when accessing existing mmap of purged BO
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d0a6d340b255..cc547915161d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1934,6 +1934,12 @@ static vm_fault_t
> xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
> =C2=A0	if (!dma_resv_trylock(tbo->base.resv))
> =C2=A0		goto out_validation;
> =C2=A0
> +	/* Purged BOs have no backing store - fault to userspace */
> +	if (xe_bo_is_purged(bo)) {
> +		ret =3D VM_FAULT_SIGBUS;
> +		goto out_unlock;
> +	}
> +
> =C2=A0	if (xe_ttm_bo_is_imported(tbo)) {
> =C2=A0		ret =3D VM_FAULT_SIGBUS;
> =C2=A0		drm_dbg(&xe->drm, "CPU trying to access an imported
> buffer object.\n");
> @@ -2024,6 +2030,12 @@ static vm_fault_t xe_bo_cpu_fault(struct
> vm_fault *vmf)
> =C2=A0		if (err)
> =C2=A0			break;
> =C2=A0
> +		/* Purged BOs have no backing store - fault to
> userspace */
> +		if (xe_bo_is_purged(bo)) {
> +			err =3D -EFAULT;
> +			break;
> +		}
> +
> =C2=A0		if (xe_ttm_bo_is_imported(tbo)) {
> =C2=A0			err =3D -EFAULT;
> =C2=A0			drm_dbg(&xe->drm, "CPU trying to access an
> imported buffer object.\n");
