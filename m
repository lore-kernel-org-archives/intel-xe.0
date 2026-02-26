Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C41FCE07F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 13:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1796810E931;
	Thu, 26 Feb 2026 13:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtYm+4Zw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EA010E931
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772113414; x=1803649414;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qJbl+lFJBr4atgfKpU8xzZCZ9BUnLiCwpr/NRBK41Dc=;
 b=gtYm+4ZwGLdRqWePWt+dOrWaMdeUkKcrwE7M19raWQHwcuMNZsUsnUJz
 MqCvExk9jh5r9p612K+Nh7f8h/teLgAxY4gzan2qEsrWNqwfU2n6mauyK
 5oJXTnzDplsnFNspc+7GLts68AuD9tlJK4d3V5idrap1mVe032xKHYS6/
 8TQBxJJbnRhAWAjIUyg7Bn7mYGyfdyp/Sacr7kjD5Wg+07s+519fF6slf
 XxcrLJbUB33fzicssrNezx4/Lqzi7vYdZeO1piT2q/qsjnNXnztSdojid
 ZKDIwobAAog1vNtm1SVwD+xe07HNS0bsV1ZbfZPTkuuMWhP5v8PMHZGsu A==;
X-CSE-ConnectionGUID: CF3Qr4RaR0e9Js/SpyuANw==
X-CSE-MsgGUID: MW+92y94TBSaB8NnGVUY7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76779651"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="76779651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:43:33 -0800
X-CSE-ConnectionGUID: A8HEANc/ThOaAKrMcGP9qQ==
X-CSE-MsgGUID: QQrf/tgdRJux9m3q5XNAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221082387"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:43:31 -0800
Message-ID: <e967bf81cd917fa3086568458cd9100a4528517a.camel@linux.intel.com>
Subject: Re: [PATCH v4 00/12] Fine grained fault locking, threaded prefetch,
 storm cache
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com, 
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com
Date: Thu, 26 Feb 2026 14:43:29 +0100
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
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

Hi, Matt.

On Wed, 2026-02-25 at 20:28 -0800, Matthew Brost wrote:
> Fine-grained fault locking provides immediate benefits: it allows
> page
> faults from the same VM to be processed in parallel (unless they
> target
> the same range) and enables a sane multi-threaded prefetch
> implementation. UMD prefetch benchmarks see 10% to 50% improvement in
> prefetch performance on BMG depending on PCIe bus speed.
>=20
> Once parallel fault processing is available, the pagefault queue can
> be
> unified into a single queue with multiple workers pulling faults to
> process. A single queue then allows a sensible pagefault cache to be
> implemented, so that multiple faults targeting the same region can be
> batched together and acknowledged in, ideally, a single pass. This
> saves
> CPU cycles during pagefault handling and improves overall throughput
> of
> the fault handler.
>=20
> Significant improvements in UMD pagefault benchmarks can be seen when
> utilizing this caching.
>=20
> v3:
> =C2=A0- Fix kunit build (CI)
> v4:
> =C2=A0- Actually fix kunit build (CI)
>=20
> Matt
>=20
> Matthew Brost (12):
> =C2=A0 drm/xe: Fine grained page fault locking
> =C2=A0 drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
> =C2=A0 drm/xe: Thread prefetch of SVM ranges
> =C2=A0 drm/xe: Use a single page-fault queue with multiple workers
> =C2=A0 drm/xe: Add num_pf_work modparam
> =C2=A0 drm/xe: Engine class and instance into a u8
> =C2=A0 drm/xe: Track pagefault worker runtime
> =C2=A0 drm/xe: Chain page faults via queue-resident cache to avoid fault
> =C2=A0=C2=A0=C2=A0 storms
> =C2=A0 drm/xe: Add pagefault chaining stats
> =C2=A0 drm/xe: Add debugfs pagefault_info
> =C2=A0 drm/xe: batch CT pagefault acks with periodic flush
> =C2=A0 drm/xe: Track parallel page fault activity in GT stats
>=20
> =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/gpu/drm/xe/xe_defaults.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +-
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +=
-
> =C2=A0drivers/gpu/drm/xe/xe_gt_stats.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 7 +
> =C2=A0drivers/gpu/drm/xe/xe_gt_stats_types.h=C2=A0 |=C2=A0=C2=A0 7 +
> =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 94 +++-
> =C2=A0drivers/gpu/drm/xe/xe_guc_ct.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +-
> =C2=A0drivers/gpu/drm/xe/xe_guc_pagefault.c=C2=A0=C2=A0 |=C2=A0 35 +-
> =C2=A0drivers/gpu/drm/xe/xe_guc_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/gpu/drm/xe/xe_module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0drivers/gpu/drm/xe/xe_module.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 675 ++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 74 +++
> =C2=A0drivers/gpu/drm/xe/xe_pagefault_types.h | 109 +++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 129 +++--
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 59 ++-
> =C2=A0drivers/gpu/drm/xe/xe_userptr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 20 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 215 ++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 37 +-
> =C2=A021 files changed, 1309 insertions(+), 246 deletions(-)

Before I get to reviewing this, some suggestions from Claude:

  Confirmed regressions (3 commits with issues):

  c664c1b91090 =E2=80=94 Fine grained page fault locking

   - Reference leak in vm_bind_ioctl_ops_create (xe_vm.c).=20
  xe_svm_range_find_or_insert() was changed to take a reference, but
two paths
   don't put it: (1) when xe_svm_range_validate() returns true =E2=86=92 go=
to=20
  check_next_range, and (2) when xa_alloc() fails =E2=86=92 goto
unwind_prefetch_ops.=20
  The validate path is on every prefetch of an already-populated range,
so=20
  refcounts grow unbounded.

  80012f80c75f =E2=80=94 Chain page faults

   - Commit message typos only: "samr ASID" =E2=86=92 "same ASID", "IRQ pat=
hd"
=E2=86=92 "IRQ=20
  paths". No code issues.

  569104fb76ed =E2=80=94 batch CT pagefault acks with periodic flush

   - Off-by-one in flush period: guc_ack_fault_begin initialises=20
  pagefault_ack_counter to PERIOD - 2 =3D 14, but the comment says first
flush=20
  should be at ack #2. With counter=3D14 the first flush fires at ack #3=
=20
  (counter hits 16, 16&15=3D=3D0). Fix: =3D XE_GUC_PAGEFAULT_FLUSH_PERIOD -
1.
   - Commit message typo: "Assistent-by" =E2=86=92 "Assisted-by".

/Thomas



