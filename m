Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2FBC35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 09:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FB710E520;
	Tue, 25 Mar 2025 09:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC2phOJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E6D10E520
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893627; x=1774429627;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3IzTc6lgtXyB3IsP9fK+kOYJvz6yDH0/qpUJEpLwmxw=;
 b=MC2phOJFZ+I9p6IaEmxcgeaNcwOcsNEdWqKLlHQM48Tp5W0nvhYZ3ZSx
 QYZuxd637yqJ9dDQ2TUh/KhZffYR6++GaegSmS2vQ6KzIEn51fq+L+bgt
 p62ZT+m/goER8Sg0hBmdrefHZucVk1UJ0PTqTWEgJG13NUQSpdmCcc+Pk
 LgcXruatJZ8OtPP8T5+ZXIWot/1LN0PwB9NmQ1psKBBwKnpipgk9SGqhW
 ojiVq8XDTm2lgFDhPRBP2fITSMdBha62MHsSxuPuhnQOwwTvHnhiHpKib
 R+4rjsS+fxs5T3tkrlnfj8DVOop60pYGuhnaL94CMWHoThbsTXKo5G3VK g==;
X-CSE-ConnectionGUID: vuxZsWMfSJmYCi0lTKmNgg==
X-CSE-MsgGUID: ne+JGectR6aQcDNkgnmkUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="46868948"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="46868948"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:07:06 -0700
X-CSE-ConnectionGUID: k+7aOyLqTNujSNTbtFULVA==
X-CSE-MsgGUID: h2UVTYvwRkqRIDR3nQy87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124840245"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.125])
 ([10.245.246.125])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:07:05 -0700
Message-ID: <4edfc75d575412439efd6dcad15d875eb1c557f5.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/bo: Add a bo remove callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 25 Mar 2025 10:07:01 +0100
In-Reply-To: <8be75eef-2baf-4606-a8cc-1b392db6d918@intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
 <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
 <8be75eef-2baf-4606-a8cc-1b392db6d918@intel.com>
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

On Tue, 2025-03-25 at 09:02 +0000, Matthew Auld wrote:
> On 24/03/2025 16:54, Thomas Hellstr=C3=B6m wrote:
> > On device unbind, migrate exported bos, including pagemap bos to
> > system. This allows importers to take proper action without
> > disruption. In particular, SVM clients on remote devices may
> > continue as if nothing happened, and can chose a different
> > placement.
> >=20
> > The evict_flags() placement is chosen in such a way that bos that
> > aren't exported are purged.
> >=20
> > For pinned bos, we unmap DMA, but their pages are not freed yet
> > since we can't be 100% sure they are not accessed.
> >=20
> > All pinned external bos (not just the VRAM ones) are put on the
> > pinned.external list with this patch. But this only affects the
> > xe_bo_pci_dev_remove_pinned() function since !VRAM bos are
> > ignored by the suspend / resume functionality. As a follow-up we
> > could look at removing the suspend / resume iteration over
> > pinned external bos since we currently don't allow pinning
> > external bos in VRAM, and other external bos don't need any
> > special treatment at suspend / resume.
> >=20
> > v2:
> > - Address review comments. (Matthew Auld).
> > v3:
> > - Don't introduce an external_evicted list (Matthew Auld)
> > - Add a discussion around suspend / resume behaviour to the
> > =C2=A0=C2=A0 commit message.
> > - Formatting fixes.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20

Actually, there is a CI failure on LNL indicating that the pinned
kernel-bo dma-maps are actually needed at devm-managed release.

I'm in the process on testing this out on LNL, and if so I'll drop
these dma-unmaps and we'd continue down the route of ensuring that
these subsystems are indeed devm_ managed and not drmm_ managed.

Thanks,
Thomas



