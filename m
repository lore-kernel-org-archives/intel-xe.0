Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500FCD6E2AF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDD410E0C3;
	Thu, 18 Dec 2025 15:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1CHaZLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CEA10E0C3
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766073454; x=1797609454;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DNKhp844NO1vIgJRZvGpNaDemwm5KvBONpG8I9wD+zY=;
 b=f1CHaZLbl3HgTAPn1Fi9UqW8TB5cmaTMH3DNi4ZcrB0E6osFJ3vn6wVP
 PAo6VUnGG8VhyqdkKYdsZp5DLDouk3YGlv8r5f5TEuqSGRNG8tlKWhMmx
 3Y0hza33BPATbXdHW18m0e/P4i8Y+3+Xqm2l9+duvPK5/wChIeyU511BL
 Z4Dr2pKPAlE04/PraPu/9lqIfA+nmyme3dTmhjTqamrGLpN16zOvmvZum
 TId2oLQ1WBZF1hBX6EMGQLqM5ibtc5rwHGVsQ540u3OLAvbIVXvCmP480
 eV7e3V00nenUHTWGQeNBGz7ZFuIt95TiKlwIN3MRCc56FH72yj5adwNyq w==;
X-CSE-ConnectionGUID: LJlrFKJwTvCYz0DG9RK2Pg==
X-CSE-MsgGUID: FJ+UhkPJSjGPtyqG1iuYDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68101595"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68101595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:57:33 -0800
X-CSE-ConnectionGUID: y+/OmiGeQz2AAm2URbPbaw==
X-CSE-MsgGUID: aOT53BgVSPurrv3RSOKLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198218463"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.97])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:57:32 -0800
Date: Thu, 18 Dec 2025 17:57:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Message-ID: <aUQkaeP3aMEcCZNL@intel.com>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
 <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Dec 17, 2025 at 03:12:29PM -0800, Matt Roper wrote:
> On Wed, Dec 17, 2025 at 06:21:43PM +0530, Balasubramani Vivekanandan wrote:
> > Prior to lmem init check, driver is waiting for the pcode uncore_init
> > status. uncore_init status will be asserted after the complete boot and
> > initialization of the SoC by the pcode. uncore_init confirms that lmem
> > init and mmio unblock has been already completed.
> > It makes no sense to check for lmem init after the pcode uncore_init
> > check. So it can be removed.
> 
> While I think this should be fine on our current platforms, one thing
> that worries me is that we'll bypass xe_pcode_ready() if we ever have a
> device that sets skip_pcode in xe_pci.c.  No such device exists today,
> but if one shows up in the future it may not be obvious when enabling
> the platform that we'd need to add back the GU_CNTL check (or something
> equivalent).
> 
> A couple thoughts:
> 
>  - Maybe we should have an initial patch that drops 'skip_pcode' from
>    xe_device_desc since it's not being used today.  If it becomes
>    necessary in the future, then we can easily re-add it, and the
>    process of doing so may help remind us that we also need to do other
>    checks to make sure the device/lmem is fully initialized and ready to
>    use.
> 
>  - Maybe we should replace wait_for_lmem_ready() with an
>    "assert_lmem_ready()" function that will just do a quick sanity check
>    on debug builds.
> 
>         static void assert_lmem_ready(struct xe_device *xe) {
>                 if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>                         return;
> 
>                 xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT);
>         }
> 
>    That eliminates all the looping/polling logic, but still helps make
>    sure we don't miss anything if we ever need to skip the pcode step on
>    a future platform (or if the init flows change and our ordering
>    assumptions are no longer true).  And since it's an xe_assert() it's
>    only active on debug/CI builds and will be compiled out on release
>    builds.

This stuff doesn't look performance critical in any way,
so there is no good reason to compile it out from release
builds.

-- 
Ville Syrjälä
Intel
