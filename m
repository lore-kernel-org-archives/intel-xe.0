Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C757C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 08:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121AB10EA3F;
	Fri, 21 Feb 2025 08:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRcxO0Dq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AE10EA3F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740128269; x=1771664269;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uq3VM59gz1BJKt7iugpp7WFWZJZLeL2gyMus5SZknLQ=;
 b=iRcxO0Dq0ErHKlZ1N1bPR4JwTwokidYcrB3MeF68ugYUAObgguHOx00M
 eivIKMYybnOoPa46srqcYgT2sJigAT3bb2miPDumRmaHrGKy7BIZQjdhJ
 xHgCM14ER+gWZ8LSgAuHja36z2O1fKKFBlmgpX58AIjCISSw2RSfvXuyz
 W0y9c9WjEVylMLULwRAnFIIqnqT1Uh9NazmmZ7qYLtV0vyJAN71j80EoQ
 1LvuhVxJL1n3ENjlRjW8c170JeohfeK0GO8yPSyZEo8muLM3qp/iH4ayd
 HIbK5zF/nbX2r20CvnciV2jpB285XrojgVpUDwzQqbPYqxbZ/Oiu88LKN w==;
X-CSE-ConnectionGUID: UWx+XKkmSg69QB4IUzUZVw==
X-CSE-MsgGUID: i9V8B5/9R+m9qvdE35H79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63412985"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="63412985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:57:49 -0800
X-CSE-ConnectionGUID: VDVVjXa2SaCiPeyc5S1XpQ==
X-CSE-MsgGUID: KO6I9oWTTwWlD9TFW4HHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115960167"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.42])
 ([10.245.246.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:57:47 -0800
Message-ID: <2beb17194f3793664fbf26747e2b5c6adff62905.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/userptr: fix EFAULT handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Date: Fri, 21 Feb 2025 09:57:44 +0100
In-Reply-To: <20250220234557.2613010-2-matthew.brost@intel.com>
References: <20250220234557.2613010-1-matthew.brost@intel.com>
 <20250220234557.2613010-2-matthew.brost@intel.com>
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

On Thu, 2025-02-20 at 15:45 -0800, Matthew Brost wrote:
> From: Matthew Auld <matthew.auld@intel.com>
>=20
> Currently we treat EFAULT from hmm_range_fault() as a non-fatal error
> when called from xe_vm_userptr_pin() with the idea that we want to
> avoid
> killing the entire vm and chucking an error, under the assumption
> that
> the user just did an unmap or something, and has no intention of
> actually touching that memory from the GPU.=C2=A0 At this point we have
> already zapped the PTEs so any access should generate a page fault,
> and
> if the pin fails there also it will then become fatal.
>=20
> However it looks like it's possible for the userptr vma to still be
> on
> the rebind list in preempt_rebind_work_func(), if we had to retry the
> pin again due to something happening in the caller before we did the
> rebind step, but in the meantime needing to re-validate the userptr
> and
> this time hitting the EFAULT.
>=20
> This might explain an internal user report of hitting:
>=20
> [=C2=A0 191.738349] WARNING: CPU: 1 PID: 157 at
> drivers/gpu/drm/xe/xe_res_cursor.h:158
> xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
> [=C2=A0 191.738551] Workqueue: xe-ordered-wq preempt_rebind_work_func [xe=
]
> [=C2=A0 191.738616] RIP: 0010:xe_pt_stage_bind.constprop.0+0x60a/0x6b0
> [xe]
> [=C2=A0 191.738690] Call Trace:
> [=C2=A0 191.738692]=C2=A0 <TASK>
> [=C2=A0 191.738694]=C2=A0 ? show_regs+0x69/0x80
> [=C2=A0 191.738698]=C2=A0 ? __warn+0x93/0x1a0
> [=C2=A0 191.738703]=C2=A0 ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
> [=C2=A0 191.738759]=C2=A0 ? report_bug+0x18f/0x1a0
> [=C2=A0 191.738764]=C2=A0 ? handle_bug+0x63/0xa0
> [=C2=A0 191.738767]=C2=A0 ? exc_invalid_op+0x19/0x70
> [=C2=A0 191.738770]=C2=A0 ? asm_exc_invalid_op+0x1b/0x20
> [=C2=A0 191.738777]=C2=A0 ? xe_pt_stage_bind.constprop.0+0x60a/0x6b0 [xe]
> [=C2=A0 191.738834]=C2=A0 ? ret_from_fork_asm+0x1a/0x30
> [=C2=A0 191.738849]=C2=A0 bind_op_prepare+0x105/0x7b0 [xe]
> [=C2=A0 191.738906]=C2=A0 ? dma_resv_reserve_fences+0x301/0x380
> [=C2=A0 191.738912]=C2=A0 xe_pt_update_ops_prepare+0x28c/0x4b0 [xe]
> [=C2=A0 191.738966]=C2=A0 ? kmemleak_alloc+0x4b/0x80
> [=C2=A0 191.738973]=C2=A0 ops_execute+0x188/0x9d0 [xe]
> [=C2=A0 191.739036]=C2=A0 xe_vm_rebind+0x4ce/0x5a0 [xe]
> [=C2=A0 191.739098]=C2=A0 ? trace_hardirqs_on+0x4d/0x60
> [=C2=A0 191.739112]=C2=A0 preempt_rebind_work_func+0x76f/0xd00 [xe]
>=20
> Followed by NPD, when running some workload, since the sg was never
> actually populated but the vma is still marked for rebind when it
> should
> be skipped for this special EFAULT case. And from the logs it does
> seem
> like we hit this special EFAULT case before the explosions.
>=20
> v2 (MattB):
> =C2=A0- Move earlier
>=20
> Fixes: 521db22a1d70 ("drm/xe: Invalidate userptr VMA on page pin
> fault")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..ea2e287e6526 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -681,6 +681,18 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> =C2=A0		err =3D xe_vma_userptr_pin_pages(uvma);
> =C2=A0		if (err =3D=3D -EFAULT) {
> =C2=A0			list_del_init(&uvma->userptr.repin_link);
> +			/*
> +			 * We might have already done the pin once
> already, but
> +			 * then had to retry before the re-bind
> happened, due
> +			 * some other condition in the caller, but
> in the
> +			 * meantime the userptr got dinged by the
> notifier such
> +			 * that we need to revalidate here, but this
> time we hit
> +			 * the EFAULT. In such a case make sure we
> remove
> +			 * ourselves from the rebind list to avoid
> going down in
> +			 * flames.
> +			 */
> +			if (!list_empty(&uvma-
> >vma.combined_links.rebind))
> +				list_del_init(&uvma-
> >vma.combined_links.rebind);
> =C2=A0
> =C2=A0			/* Wait for pending binds */
> =C2=A0			xe_vm_lock(vm, false);

