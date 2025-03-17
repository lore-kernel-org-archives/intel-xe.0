Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33398C28B30
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 13:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888110E3FC;
	Mon, 17 Mar 2025 13:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcxsKeA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49010E3FC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742216552; x=1773752552;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=07ASgQ2y1FdU110f0v/QL/+YfJvvDq3yDkw9HQiR1mU=;
 b=HcxsKeA1d+yNa4MCMK85lOkRQ8ZgKlvoxHKSTRbammOMfNKtvF+FQzhg
 nhzeyikX3pFDd0FPqBcPTBAx9Njco1ehCZ4ZV01+O15vi4mBOD6Bk3xqh
 Ktgn15F7sbQz40fqJCNFNqhVY/id4l5BrU6EH5gLnL6tQkUUBhkdU1NfF
 GSlSMdbiDdOF6PzAzXpQBj2fMGKgNyJh3w3wVdAYpUzINTClMcwlDDCL7
 tlro9nqpr/8zTwvQos5BHk+K4Zozejwx0Dgrii9eolbF+MX+6+X/XMfMl
 uYgcFSbmmZSihEY7b/BgX4Rmvg0HLGmUzNv/v4+ea2bG20q7csJV7Ojfj A==;
X-CSE-ConnectionGUID: JVWdZ+2ASjaYAUdRAhv08w==
X-CSE-MsgGUID: CyORK9+pT8SRJcZIs2YbNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43175022"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="43175022"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 06:02:28 -0700
X-CSE-ConnectionGUID: x/qS31Q4RmuDUM0uEVMJ0Q==
X-CSE-MsgGUID: 1pC0QRdCTaWP73JVd/lM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="126792917"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.66])
 ([10.245.246.66])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 06:02:26 -0700
Message-ID: <471650d18746045024220697f5858af141662711.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Flush delayed frees and retry on user object
 allocation failure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 17 Mar 2025 14:02:23 +0100
In-Reply-To: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
References: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Tvrtko,

On Fri, 2025-03-14 at 14:57 +0000, Tvrtko Ursulin wrote:
> If userspace workload is operating near the limit of available memory
> and
> it moves from one large working set to another, in other words free
> some
> large buffers and immediately allocate some new ones, the TTM
> eviction
> attempt during new resource allocation may not be effective due the
> combination of relying on trylock and the fact released buffer might
> have
> ended on the delayed release path.
>=20
> From userspace point of view this reflects as sporadic
> VK_ERROR_OUT_OF_DEVICE_MEMORY ie. sometimes the application will
> work,
> sometimes will fail, even if it does exactly the same thing on an
> otherwise idle system.
>=20
> Good examples are two tests from the VK CTS suite:
>=20
> =C2=A0- dEQP-VK.pipeline.monolithic.render_to_image.core.*
> =C2=A0- dEQP-VK.memory.allocation.random*
>=20
> To improve this we can flush the TTM delayed object free workqueue
> and
> retry when encountering ENOMEM, which so far looks like a significant
> improvement in mean-time-to-failure.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++++---
> =C2=A01 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..53f45c766e59 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1900,9 +1900,25 @@ struct xe_bo *xe_bo_create_user(struct
> xe_device *xe, struct xe_tile *tile,
> =C2=A0				u16 cpu_caching,
> =C2=A0				u32 flags)
> =C2=A0{
> -	struct xe_bo *bo =3D __xe_bo_create_locked(xe, tile, vm, size,
> 0, ~0ULL,
> -						 cpu_caching,
> ttm_bo_type_device,
> -						 flags |
> XE_BO_FLAG_USER, 0);
> +	unsigned int retry =3D 3;
> +	struct xe_bo *bo;
> +
> +	while (retry--) {
> +		bo =3D __xe_bo_create_locked(xe, tile, vm, size, 0,
> ~0ULL,
> +					=C2=A0=C2=A0 cpu_caching,
> ttm_bo_type_device,
> +					=C2=A0=C2=A0 flags | XE_BO_FLAG_USER,
> 0);
> +		if (!IS_ERR(bo) || PTR_ERR(bo) !=3D -ENOMEM)
> +			break;
> +
> +		/*
> +		 * TTM eviction may sporadically fail due reliance
> on trylock
> +		 * and delayed ttm_bo deletion causing trylock to
> fail. Work
> +		 * around it by retrying after currently pending
> delayed
> +		 * releases have been processed.
> +		 */
> +		flush_workqueue(xe->ttm.wq);
> +	}

We should use xe_vm_validate_should_retry() for this. (I think actually
I saw a patch for that floating around somewhere). IIRC the bos are
lockable also when in the delayed object free workqueue?

So could you try with that instead? If you think that doesn't help, we
should perhaps consider also flushing the we ttm wq from within that
function instead.

Thanks,
Thomas



> +
> =C2=A0	if (!IS_ERR(bo))
> =C2=A0		xe_bo_unlock_vm_held(bo);
> =C2=A0

