Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CC2C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 10:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569F10E8E7;
	Tue, 27 Feb 2024 10:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnWrOZiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CF210F2EA
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709030250; x=1740566250;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=jaCsgNIwCrz5aEm9UeV5x/tisIwxZ9Itx1PtcAE1ork=;
 b=mnWrOZiQlZlX5JmN/beCGbO5iB3CpAsDgajl3U0Cqyz9vFX8oXf52YvE
 DB/e8ZD2/9a7stp64aHIwIjs6PnCDcqjsTJEeAxO9y/LyriKJ7qNKgdMA
 40+aGwx4DD4bd+tDQFLYrrgQuwFchQ2SEt+ALL2ZEpwmUOiQxu9rEh+KJ
 z7MQ64uGSQ7J/4wYX/cq2CCLyt5xVEzZhVBWkY+Qp/3UI5XHzFDLkP9QH
 yfizuUtzk3/CcgKpPi2p1nupbXUQLYVKBCcN5FPgmSLypexRSkkJg3veA
 OLDnj9TKcFAZ9pIZiQKgcoZbRjBw032poqBgg1sBhMlwWXaVp+jkDHFNA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3480785"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3480785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 02:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11571094"
Received: from rbriscox-mobl1.ger.corp.intel.com (HELO [10.252.3.86])
 ([10.252.3.86])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 02:37:27 -0800
Message-ID: <fad1ce00bc6d1edd7a518f323082f5a75fb2d165.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Remove used xe_sync_entry_wait
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 11:37:25 +0100
In-Reply-To: <20240227024337.141585-2-matthew.brost@intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
 <20240227024337.141585-2-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-26 at 18:43 -0800, Matthew Brost wrote:
> xe_sync_entry_wait is no longer used, remove it.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_sync.c | 8 --------
> =C2=A0drivers/gpu/drm/xe/xe_sync.h | 1 -
> =C2=A02 files changed, 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index aab92bee1d7c..da8799bf7237 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -198,14 +198,6 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -int xe_sync_entry_wait(struct xe_sync_entry *sync)
> -{
> -	if (sync->fence)
> -		dma_fence_wait(sync->fence, true);
> -
> -	return 0;
> -}
> -
> =C2=A0int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct
> xe_sched_job *job)
> =C2=A0{
> =C2=A0	int err;
> diff --git a/drivers/gpu/drm/xe/xe_sync.h
> b/drivers/gpu/drm/xe/xe_sync.h
> index f43cdcaca6c5..8c231ce643c4 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -22,7 +22,6 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> =C2=A0			struct xe_sync_entry *sync,
> =C2=A0			struct drm_xe_sync __user *sync_user,
> =C2=A0			unsigned int flags);
> -int xe_sync_entry_wait(struct xe_sync_entry *sync);
> =C2=A0int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> =C2=A0			=C2=A0=C2=A0 struct xe_sched_job *job);
> =C2=A0void xe_sync_entry_signal(struct xe_sync_entry *sync,

