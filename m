Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B984DCD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7D10EF79;
	Thu,  7 May 2026 06:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp8NjghW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A51E10EF79
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778136433; x=1809672433;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=46I9ZYcWbKPd+bwhV/LJ/dko9Tb3stvru5mGOV83EHE=;
 b=bp8NjghWgcv5bfOQ+jeukgabh+u9ScX+7K/4KH4K76mzvcrllY5kybJT
 tLfeyZyV7AJySIxTeFY0lKZfc4qKZDwQ6JN/xMg1lWcnVE2rEXhh2nyuV
 zW/We7pBk8Dx/ujGCX6lvmLVCDxbVsOEGAJFqe7NyI9+1aDcV5af5WLTt
 1xY4Wd+us4wnGJi9V7xJ4waTYmcb+mQt8JmXJTC3DtU2ql8YAcKgL21Zp
 e28H5JrjZtJvFzuKUw40s5UIu+HnwH8Uisoc0U9kt6pcB5Txk5aWv0/tK
 ReuukGtYRYxmGvhFJ7uS1x0aMwSYdDhv4dvGPpQ8PylKJ/ytWl4HNal1F Q==;
X-CSE-ConnectionGUID: DWOWH48TTMOifJ+DipHXuw==
X-CSE-MsgGUID: GVf9bSZyQjqv2ROlbFU6uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79260857"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="79260857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:47:12 -0700
X-CSE-ConnectionGUID: folBRKZwReqjfEZ6TCuiJg==
X-CSE-MsgGUID: z7sS4FeiSvm4irwDOfgtKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="274515596"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.94])
 ([10.245.245.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:47:10 -0700
Message-ID: <8bad8080780f3a1c2c45cc1385322edf09284414.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Add bounds check for num_binds to prevent
 memory exhaustion
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ramesh Adhikari <adhikari.resume@gmail.com>, 
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: stable@vger.kernel.org
Date: Thu, 07 May 2026 08:47:07 +0200
In-Reply-To: <20260507055352.61017-1-adhikari.resume@gmail.com>
References: <20260507055352.61017-1-adhikari.resume@gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Thu, 2026-05-07 at 11:23 +0530, Ramesh Adhikari wrote:
> The xe_vm_bind_ioctl function accepts user-controlled num_binds
> without
> bounds checking, allowing arbitrarily large memory allocations. This
> follows the same vulnerability pattern that was fixed for num_syncs
> in
> commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge
> allocations").
>=20
> Add DRM_XE_MAX_BINDS (2048) limit and validate num_binds before
> allocation.
>=20
> v2: Increased limit from 1024 to 2048 based on Mesa source analysis:
> =C2=A0=C2=A0=C2=A0 - Mesa's maximum usage: 960 binds (conformance test dE=
QP-VK)
> =C2=A0=C2=A0=C2=A0 - Confirmed by Intel Mesa developer in commit ba6bbdc

Please use the standard way of referring to commits.

This is the maximum usage in the conformance suite. That commit does
not mention maximum usage for applications in the wild, for which we
can't have any regressions.=20


> =C2=A0=C2=A0=C2=A0 - 2048 provides 2.13x safety margin while limiting all=
ocation to
> 64KB
> =C2=A0=C2=A0=C2=A0 - Prevents unbounded allocation (attacker could send 2=
68M binds =3D
> 18.8GB)

Referring to my previous email, it actually looks like most if not all
allocations in this path use __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL |
__GFP_NOWARN, Did you actually verify that a malicious bind
significantly can exceed the cgroup limits?


>=20
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Ramesh <adhikari.resume@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 5 +++++
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0 | 1 +
> =C2=A02 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a717a2b8dea..1ff66874f43 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	err =3D vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
> +
> +	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS)) {
> +		err =3D -EINVAL;

If we end up concluding that this is indeed needed, we should return=C2=A0
-ENOBUFS here to trigger a graceful retry.

Thanks,
Thomas


> +		goto put_vm;
> +	}
> =C2=A0	if (err)
> =C2=A0		goto put_vm;
> =C2=A0
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ae2fda23ce7..e666b73c81d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1606,6 +1606,7 @@ struct drm_xe_exec {
> =C2=A0	__u32 exec_queue_id;
> =C2=A0
> =C2=A0#define DRM_XE_MAX_SYNCS 1024
> +#define DRM_XE_MAX_BINDS 2048
> =C2=A0	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> =C2=A0	__u32 num_syncs;
> =C2=A0
