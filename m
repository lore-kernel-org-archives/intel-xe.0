Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3244FFCE064
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34C510E915;
	Thu, 26 Feb 2026 12:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDnGErm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BC810E915
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772109072; x=1803645072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R+kYRXhblJTuxRu49bYlOkFoz7md4LIa70E2I17YMwE=;
 b=NDnGErm2j4yPU6md2hRpdv7eJRoWSYA4SSu5uRA0vpLHyHLZpvKhanhx
 YhFguUk2+OyF+IaxBoaLkM030cMz23MBC05vneMFb+BjA+zSnKMmvJJ9K
 JdIGuEt5S3+E1SD9Xi/wni7WkKZvKELyAub/G5SEgWDVU0kmxnPielSZs
 h/3BQxLgXeFBe8B8+JL5dN3Gn9wmHbHGfn65ARkBk1H7/JxxCOpH7ZIWP
 yKhj1G3BP8PgzQkxJA2gs5PrMtsy28mkaZ9/y/e4me4mxAWeDidVic7Hj
 ep3+cnvEE3cRl1pakIKUpaZ6V9GPv7PumN5iJLvGXBlBSLOzPGwJu8OgJ g==;
X-CSE-ConnectionGUID: 5aGNCyQZRryayTv9OWGprQ==
X-CSE-MsgGUID: ACPaEsC7RmKIacQm7Zomug==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73212157"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73212157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:31:11 -0800
X-CSE-ConnectionGUID: DVibYv4aTLmG+IHPO0W8Ww==
X-CSE-MsgGUID: Njg9sWULRqexHf5Y66Dbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221170004"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:31:09 -0800
Date: Thu, 26 Feb 2026 13:31:06 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
Message-ID: <aaA9CgXBe20TYD89@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <db16f21d4533dbcb7a6653ddfaf4f3df07878064@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db16f21d4533dbcb7a6653ddfaf4f3df07878064@intel.com>
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

On Thu, Feb 26, 2026 at 12:28:52PM +0200, Jani Nikula wrote:
> On Tue, 24 Feb 2026, Raag Jadav <raag.jadav@intel.com> wrote:
> > Here's my humble attempt at introducing PCIe FLR support in xe driver.
> > This is ofcourse a half baked implementation and only limited to reloading
> > uC firmwares. This needs to be extended for a lot of different components
> > which I've skipped here for my lack of competence, so feel free to join
> > in and support them.
> 
> It wouldn't hurt to spell out Function Level Reset (FLR) somewhere in
> the commit messages and in the xe_pci_err.c file.

Ofcourse. A paper on acronym burnout had been on my todo list for years.
Never thought I'd be on the other side of the argument :D

Raag

> > PS: This works enough to allow a single exec test run after FLR but it
> > follows with a GuC crash on subsequent runs which I'm still investigating.
> >
> > Raag Jadav (6):
> >   drm/xe/uc_fw: Allow reloading firmware
> >   drm/xe/uc: Introduce FLR helpers
> >   drm/xe/irq: Introduce FLR helper
> >   drm/xe: Introduce xe_device_assert_lmem_ready()
> >   drm/xe/bo_evict: Introduce xe_bo_restore_map()
> >   drm/xe/pci: Introduce PCIe FLR
> >
> >  drivers/gpu/drm/xe/Makefile      |   1 +
> >  drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
> >  drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
> >  drivers/gpu/drm/xe/xe_device.c   |   4 +-
> >  drivers/gpu/drm/xe/xe_device.h   |   1 +
> >  drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
> >  drivers/gpu/drm/xe/xe_gsc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_gt.c       |  10 +++
> >  drivers/gpu/drm/xe/xe_gt.h       |   2 +
> >  drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
> >  drivers/gpu/drm/xe/xe_guc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
> >  drivers/gpu/drm/xe/xe_huc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_irq.c      |   7 +-
> >  drivers/gpu/drm/xe/xe_irq.h      |   1 +
> >  drivers/gpu/drm/xe/xe_pci.c      |   1 +
> >  drivers/gpu/drm/xe/xe_pci.h      |   2 +
> >  drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
> >  drivers/gpu/drm/xe/xe_uc.h       |   2 +
> >  drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
> >  drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
> >  22 files changed, 295 insertions(+), 27 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> 
> -- 
> Jani Nikula, Intel
