Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E17CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16910E3BE;
	Tue, 28 Oct 2025 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cgf4hu9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33F310E3BE
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761655068; x=1793191068;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bVucNCWz0/XH1d66uOpDgSHFpfeJuRudu6ApnQc1ZzA=;
 b=Cgf4hu9IWom5n468VxHmbQMrZMZjKjtFbb9hA8r7ohHdvZQkFgyLzM0i
 5ocx9NCXItdY5yUks7FjBebfbTh2Iq1vxqZqm72V92oh0BwAaRRPGrdT2
 ztcQv8iTfKRAPBLhWWimEQy/mNGcF2b2SlmDNLXpSwj2pgiw3nLUB0JBx
 vkKHOpUMqhaDP4WTAvItxMtFox39OvzOLJ8v36ppgCn7+caZTu+4+A1NC
 6HMEY1M3MmcfE7Xj+dZObQudOIQGYfUlfppHFdwE9GCDL6ZPoq78NEYVH
 KmoqSb1aEgAjyDjqGvcXZqO77bosrY7BRLCUvsmfxH0vhqmRsYk8t9kKS A==;
X-CSE-ConnectionGUID: mOkiJUEcSA2HkZQT1LN8RQ==
X-CSE-MsgGUID: sIkdrzfhRkquSg7K3gQ0jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66369330"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="66369330"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:37:47 -0700
X-CSE-ConnectionGUID: TwAe/x86QbmbilqxfeLEiQ==
X-CSE-MsgGUID: TpDfPOJASrGKI8VQNuKLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185660268"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:37:46 -0700
Message-ID: <d2b6819e31d1bcfc032ee1be2e75204d5549f583.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/9] drm/xe/madvise: Add support for purgeable
 buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 28 Oct 2025 13:37:44 +0100
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
> This patch series introduces support for purgeable buffer objects
> (BOs) in the Xe driver.=20
> This feature allows userspace applications to provide memory usage
> hints to the kernel,
> enabling more effective memory management, especially under system
> memory pressure.
>=20
> When an application no longer needs the contents of a buffer, it can
> mark it as DONTNEED
> via the DRM_XE_MADVISE ioctl. This makes the BO a candidate for
> purging. If the kernel
> experiences memory pressure, it can reclaim the backing store of
> these BOs,
> freeing up GPU memory and helping to prevent Out-Of-Memory (OOM)
> situations.
>=20
> The lifecycle of a purgeable BO is as follows:
>=20
> A BO starts in the default WILLNEED state.
> Userspace marks it as DONTNEED when its contents are discardable.
> Under memory pressure, the kernel may purge the BO, transitioning it
> to the PURGED state.
> Any attempt to use a purged BO (e.g., binding, mapping, or CPU
> access) will result in an error,
> signaling to the application that the contents are gone. The
> application can then re-validate
> the BO by marking it WILLNEED, at which point new backing store is
> allocated. To prevent data corruption,
> a critical safety check ensures that only non-shared buffers can be
> marked as purgeable.

What happens if the bo is bound to multiple address ranges? Do we
require all of them to be marked purged?

Also with i915, when someone called WILLNEED on a purged bo, there was
an error rather than an attempt to rebind. What's the reasoning behind
re-allocating backing store here? Doesn't that mean we need to keep
vmas around even if we purge?

/Thomas

>=20
> Arvind Yadav (7):
> =C2=A0 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
> =C2=A0 drm/xe/madvise: Implement purgeable buffer object support
> =C2=A0 drm/xe/bo: Prevent purging of shared buffer objects
> =C2=A0 drm/xe/bo: Handle CPU faults on purged buffer objects
> =C2=A0 drm/xe/bo: Prevent mmap of purged buffer objects
> =C2=A0 drm/xe/vm: Prevent binding of purged buffer objects
> =C2=A0 drm/xe: Add support for querying purgeable BO states
>=20
> Himal Prasad Ghimiray (2):
> =C2=A0 drm/xe/uapi: Add UAPI support for purgeable buffer objects
> =C2=A0 drm/xe/uapi: Add UAPI for purgeable bo state to madvise query
> response
>=20
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 91 ++++++++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 51 +++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0 |=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 ++++
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 34 +++++++++++
> =C2=A06 files changed, 245 insertions(+), 12 deletions(-)
>=20

