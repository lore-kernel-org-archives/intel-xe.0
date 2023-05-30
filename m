Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78847C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 15:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403A710E39E;
	Tue, 30 May 2023 15:12:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D00410E171
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685459537; x=1716995537;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mz2vHohHkkHxIWHl0d2J/PsTXyxkvNWsWm7LmRTW5lE=;
 b=hjUvsgCW6p64+TSICCaRvJvB6rXV7MptZsW0ADQ9yEEuPDoGUOKFB0+7
 dV5LvkYrtrhFEkfxEEwCOKftV2Bm/+H02GHwNYqt6d39nuXm7fH6zMltE
 4JSUOnUwp8jMIxbGQmsIE3nSnYSLdyycVCcGmf2pOk4NSP3kP7Rkk7lib
 smlnD9qYvd6vqDob5ru3Hz4HFEG/ofe6MrFLk91ok6dy53gw9a3HfdpH5
 h55ANFr+vMsDGjXZOJO4/2f/e/yXhDEntYuO3ZE/3+aWSH4dPO5CHCcDK
 dLPwSfHByvpqMPSAF5j6dvcsgMolI8k9152Yp7a0HplkHgZu05cGPmN3E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358196225"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="358196225"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 08:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796305772"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796305772"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 08:12:14 -0700
Message-ID: <cce294bac22c5bb6eda6b81ca59141e764963f5e.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Tue, 30 May 2023 17:12:12 +0200
In-Reply-To: <f8e86b42-0cbd-f2a2-23e5-01d3672e13e1@linux.intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
 <ZG5Xx1R2xh/tf0f8@DUT025-TGLU.fm.intel.com>
 <673b857b-412d-152f-eede-e62fe9454060@linux.intel.com>
 <f8e86b42-0cbd-f2a2-23e5-01d3672e13e1@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC PATCH 0/2] Implement vma madvise ioctl
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
Cc: intel-xe@lists.freedesktop.org, "Zhang, Carl" <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+ Carl Zhang

On Tue, 2023-05-30 at 15:19 +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> On 5/24/23 22:12, Nirmoy Das wrote:
> >=20
> > On 5/24/2023 8:30 PM, Matthew Brost wrote:
> > > On Wed, May 24, 2023 at 02:36:46PM +0200, Nirmoy Das wrote:
> > > > Sending this initial RFC patch series for vma madvise ioctl
> > > > to gether feedback if this the correct way to do that.
> > > >=20
> > > > I am adding two expected options for userspace to pass
> > > >=20
> > > > DRM_XE_VMA_MADVISE_WILLNEED:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0* Set ttm priority to normal/high(if cap pe=
rmits)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0* Make sure VMAs are in allowed placement a=
nd bound.
> > > >=20
> > > > DRM_XE_VMA_MADVISE_DONTNEED:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0* Set ttm priority to low so the BO belong =
to the vma
> > > > =C2=A0=C2=A0=C2=A0=C2=A0become early target for eviction.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0* Make sure VMAs are not bound.
> > > >=20
> > > > Questions:
> > > > Should this be part of DRM_IOCTL_XE_VM_MADVISE rather than
> > > > creating=20
> > > > new ioctl?
> > > >=20
> > > Def not a new IOCTL. Let's take a step back, what are you trying
> > > to
> > > implement that the current DRM_IOCTL_XE_VM_MADVISE IOCTL / VM
> > > bind IOCTL
> > > does not support?
> >=20
> > AFAIU at this moment:
> >=20
> > MADVISE_WILLNEED=C2=A0 =3D=3D=C2=A0 XE_VM_BIND_OP_PREFETCH +
> > DRM_XE_VM_MADVISE_PRIORITY
> > MADVISE_DONTNEED=C2=A0 =3D=3D=C2=A0 XE_VM_BIND_OP_UNMAP +
> > DRM_XE_VM_MADVISE_PRIORITY
> >=20
> > So unless we need explicit madvise ioctl or vm_madvise ioctl
> > options=20
> > for UMD,
> > I think we can have madvise equivalent with above vm bind and vm=20
> > madvise ioctl.
> >=20
> > Hi Thomas, Joonas,
> >=20
> > What do you think ?
>=20
> Hi, Nirmoy,
>=20
> the functionality we need for DONTNEED and WILLNEED would, based on
> i915=20
> and the move to vma-based would IMO be something along the lines of:
>=20
> DONTNEED
> 1) if userptr, unbind (or perhaps -EINVAL)
> 2) If bo, mark the vma as dontneed. If all other vmas of the bo are=20
> marked dontneed, mark the bo as dontneed and adjust its priority.
> 3) If a dontneed bo is marked for eviction, unbind its vmas, kill its
> storage and mark it as purged. Don't put on rebind list.
>=20
> WILLNEED
> 1) If userptr, bind (or perhaps -EINVAL)
> 2) If bo, remove dontneed marker. If bo was purged, notify user-
> space.=20
> (Need feedback from UMD whether they want an error message or just a=20
> fresh backing store). Adjust its priority, put vma on rebind list.
>=20
> =C2=A0=C2=A0So in particular, if no eviction / shrinking happens between
> DONTNEED=20
> and WILLNEED they will essentially be NOOPs.
>=20
> It sounds like this is a bit different than what can be achieved with
> prefetch/unmap/priority.
>=20
> /Thomas
>=20
> >=20
> >=20
> > Regards,
> >=20
> > Nirmoy
> >=20
> > >=20
> > > Matt
> > >=20
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > >=20
> > > > Nirmoy Das (2):
> > > > =C2=A0=C2=A0 drm/xe: Expose vma bind-unbind functions
> > > > =C2=A0=C2=A0 drm/xe: Implement madvise ioctl for vma
> > > >=20
> > > > =C2=A0 drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +
> > > > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 52 +++----
> > > > =C2=A0 drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > > =C2=A0 drivers/gpu/drm/xe/xe_vma_madvise.c | 223=20
> > > > ++++++++++++++++++++++++++++
> > > > =C2=A0 drivers/gpu/drm/xe/xe_vma_madvise.h |=C2=A0 15 ++
> > > > =C2=A0 include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 ++++
> > > > =C2=A0 7 files changed, 296 insertions(+), 28 deletions(-)
> > > > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
> > > > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h
> > > >=20
> > > > --=20
> > > > 2.39.0
> > > >=20

