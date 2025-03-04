Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB2C282D0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 12:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC310E595;
	Tue,  4 Mar 2025 12:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBb1wRlm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550A510E595
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741090916; x=1772626916;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aHRl6Ae7kU/cMonIRCrJ3zwGwLCTsIQ+JGHO8lCt2D4=;
 b=mBb1wRlmiBR0Ob1DfH8bvHwB8j+g0i8vRhJA1JskSpQCegybnv3h66fS
 xPzQS6JIRtv3BFbvqzFprA45tsabNlYkWSBaJ8erRM2UOXmmtfM3Iozdj
 tRVf4NbmjTeN1iKKY+MFeNyN0bsFrCjaHsO7D9sXacZsKQp6JbPbREssh
 9MG69L1iXbUaTLI8Q5pA+jmv1drekDjVWF7XrfDJXKt2gO9UvPtflQspN
 NpdVIXqR1tNYse0Xu9uuPPjU6gMZ5SI2DNojlVYeVGL1luTD1919s+HJn
 UPN9DJXmsA2SM/p1z41xGGnSkf2bIAH3uXle+L7PxtgRXlElNASUK3xJr A==;
X-CSE-ConnectionGUID: zNkno5xASZqEw6oytF3NwQ==
X-CSE-MsgGUID: DJy9vNiyTVOYJzCmAK8x8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52650900"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="52650900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 04:21:55 -0800
X-CSE-ConnectionGUID: 7vHNE4dGR7S/tFGdg8Pztg==
X-CSE-MsgGUID: LQBfMOJbQ2yI1xwq8Y1GsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="123296614"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 04:21:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe/hmm: Style- and include fixes
In-Reply-To: <20250304113758.67889-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
 <20250304113758.67889-2-thomas.hellstrom@linux.intel.com>
Date: Tue, 04 Mar 2025 14:21:50 +0200
Message-ID: <87jz95yoip.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 04 Mar 2025, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> Add proper #ifndef around the xe_hmm.h header, proper spacing
> and since the documentation mostly follows kerneldoc format,
> make it kerneldoc. Also prepare for upcoming -stable fixes.
>
> Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Doing this also flags xe_pcode_api.h:

index 856b14fe1c4d..ac635efa224b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -328,7 +328,7 @@ always-$(CONFIG_DRM_XE_WERROR) +=3D \
 	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrte=
st_find_args)))
=20
 quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest =3D $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_fla=
gs)) -S -o /dev/null -x c /dev/null -include $<; touch $@
+      cmd_hdrtest =3D $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_fla=
gs)) -S -o /dev/null -x c /dev/null -include $< -include $<; touch $@
=20
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)

BR,
Jani.

> ---
>  drivers/gpu/drm/xe/xe_hmm.c | 9 +++------
>  drivers/gpu/drm/xe/xe_hmm.h | 5 +++++
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> index 089834467880..c56738fa713b 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -19,11 +19,10 @@ static u64 xe_npages_in_range(unsigned long start, un=
signed long end)
>  	return (end - start) >> PAGE_SHIFT;
>  }
>=20=20
> -/*
> +/**
>   * xe_mark_range_accessed() - mark a range is accessed, so core mm
>   * have such information for memory eviction or write back to
>   * hard disk
> - *
>   * @range: the range to mark
>   * @write: if write to this range, we mark pages in this range
>   * as dirty
> @@ -43,11 +42,10 @@ static void xe_mark_range_accessed(struct hmm_range *=
range, bool write)
>  	}
>  }
>=20=20
> -/*
> +/**
>   * xe_build_sg() - build a scatter gather table for all the physical pag=
es/pfn
>   * in a hmm_range. dma-map pages if necessary. dma-address is save in sg=
 table
>   * and will be used to program GPU page table later.
> - *
>   * @xe: the xe device who will access the dma-address in sg table
>   * @range: the hmm range that we build the sg table from. range->hmm_pfn=
s[]
>   * has the pfn numbers of pages that back up this hmm address range.
> @@ -112,9 +110,8 @@ static int xe_build_sg(struct xe_device *xe, struct h=
mm_range *range,
>  	return ret;
>  }
>=20=20
> -/*
> +/**
>   * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> - *
>   * @uvma: the userptr vma which hold the scatter gather table
>   *
>   * With function xe_userptr_populate_range, we allocate storage of
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> index 909dc2bdcd97..9602cb7d976d 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -3,9 +3,14 @@
>   * Copyright =C2=A9 2024 Intel Corporation
>   */
>=20=20
> +#ifndef _XE_HMM_H_
> +#define _XE_HMM_H_
> +
>  #include <linux/types.h>
>=20=20
>  struct xe_userptr_vma;
>=20=20
>  int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_m=
m_mmap_locked);
> +
>  void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> +#endif

--=20
Jani Nikula, Intel
