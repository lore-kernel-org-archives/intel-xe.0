Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0CC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5C10E2AB;
	Tue,  8 Sep 2026 14:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/05zT2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F8310E11E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788879479; x=1820415479;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F0XEjy7bX2+BnRtf1bao+fCHJ3yXp1Mnz7wOTW7vH/A=;
 b=J/05zT2dOWwdcxoHLqWKBNyVrBSrpAuafqolz286WYGCJGlus1lyXn9K
 xDJnno9PAkgOAb0D3+akE64scIdakxFlhi/IWibaNuFr/2jFXqMeZ3Vtv
 mQGPgqeilKGLO7Z1Epq5fHI5nDfn/xhRMY965Y58OsjN9IQJQ3kkWDktJ
 KUCqa5kecK3vUCMwMbvzeegH4OwmnN2C7g8zS9LYTdTMfGWIOqW51HHgy
 IA7dlN5nA2r+UDEyZDpIHe157mOxjb1SUDxIv7kYbUbhkKAFjasqEVyV4
 uZz11PlprhkermtVCeBdkaaBxHJHpNHX83BYdQa8xIXlCIOWpI3b9/wt2 w==;
X-CSE-ConnectionGUID: l91kL44WRPm+GQRFTyPhLg==
X-CSE-MsgGUID: iAJZVEgoQ+qaQxST+37BnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89314121"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89314121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:57:59 -0700
X-CSE-ConnectionGUID: M6taKRY3SCqzBoCpvRX15w==
X-CSE-MsgGUID: HoXU7EE/Q1OidrbuYjC5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="269278973"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.156])
 ([10.245.244.156])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:57:58 -0700
Message-ID: <45a437a2-0bc0-43e3-9b18-24101cb9342f@linux.intel.com>
Date: Tue, 8 Sep 2026 16:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe/mmio_gem: reject VM_EXEC and drop
 VM_DONTCOPY
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Ilia Levi <ilia.levi@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
 <20260908134955.1344429-17-matthew.auld@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260908134955.1344429-17-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 9/8/26 15:50, Matthew Auld wrote:
> Hardware MMIO registers should never be executable; reject VM_EXEC
> at mmap time and clear VM_MAYEXEC to prevent later mprotect attempts.
>
> Also drop VM_DONTCOPY so that child processes across fork() can
> inherit the mapping and lazily fault in the PFNs, matching standard
> DRM GEM semantics and making the existing drm_gem_vm_open() callback
> functional.
>
> This aligns with existing PCI_BARRIER, which will use this in the next
> patch. We don't want any noticeable behaviour change there, since this
> will be user visible. This will also be the first user.
>
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> ---
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 5ffe03d36190..3cdc9538957d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -177,9 +177,12 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>   	if ((vma->vm_flags & VM_SHARED) == 0)
>   		return -EINVAL;
>   
> +	if (vma->vm_flags & VM_EXEC)
> +		return -EINVAL;
> +
>   	vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
> -	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> -		     VM_DONTCOPY | VM_NORESERVE);
> +	vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> +		     VM_NORESERVE, VM_MAYEXEC);
>   
>   	/* Defer actual mapping to the fault handler. */
>   	return 0;
