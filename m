Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78725C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 13:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5C010EDC3;
	Fri,  1 Mar 2024 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDsEzNJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF16910EDC2
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709299911; x=1740835911;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P8m0cpIJtPjvn7cae2Q5QulxA3vAETqCQhhUQUcXXUg=;
 b=jDsEzNJ7vCC9Q/Azxym9oohxlO6GBn9l82E1Vnxf2nPPK/0I3cJOvmMr
 2ijiswn2Q0pf2CoMqIwAwkZs/w8W9hfIUFmu8A7Omn7ZHNszJ6HxQh5Pb
 PFwR/IekgVFum/CZx1QRNPuBOdQTSmsURJu88MN4QbJaDlTYhfombJyjR
 tGDKj+AmJMzc9Tf4cYM75UfS7HcJd6RIKHbFpkL9ut7DhRw3pjp/JXHdz
 zX/+crT7Ne59GyQCZ78E8+c0BcEh0Ws6wOFkmGv1t5GSy2/Yj4RwQcqHQ
 4QamLEmIY66OBeD7slPgGeKtTZ175WVWzqqT37p7l45BSsjZF86ymxf8y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7650931"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7650931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 05:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8428688"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 05:31:50 -0800
Message-ID: <40f34e9547577df7ce4925cbd5e96d1d9fde5dec.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Get page on user fence creation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 14:31:47 +0100
In-Reply-To: <e278d2f506078a50d072f132cd51835391f3b3a9.camel@linux.intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-4-matthew.brost@intel.com>
 <6235b4c6c6d537d928795cd2dde24c27ce77ecce.camel@linux.intel.com>
 <ZeGHwQZ7tLj9oAv8@DUT025-TGLU.fm.intel.com>
 <e278d2f506078a50d072f132cd51835391f3b3a9.camel@linux.intel.com>
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

On Fri, 2024-03-01 at 09:56 +0100, Thomas Hellstr=C3=B6m wrote:
> On Fri, 2024-03-01 at 07:46 +0000, Matthew Brost wrote:
> > On Fri, Mar 01, 2024 at 07:36:01AM +0100, Thomas Hellstr=C3=B6m wrote:
> > > On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> > > > Attempt to get page on user fence creation and kmap_local_page
> > > > on
> > > > signaling. Should reduce latency and can ensure 64 bit
> > > > atomicity
> > > > compared to copy_to_user.
> > > >=20
> > > > v2:
> > > > =C2=A0- Prefault page and drop ref (Thomas)
> > > > =C2=A0- Use set_page_dirty_lock (Thomas)
> > > > =C2=A0- try_cmpxchg64 loop (Thomas)
> > > >=20
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_sync.c | 52
> > > > +++++++++++++++++++++++++++++++---
> > > > --
> > > > =C2=A01 file changed, 45 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > > b/drivers/gpu/drm/xe/xe_sync.c
> > > > index c20e1f9ad267..bf7f22519cc5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > > @@ -6,6 +6,7 @@
> > > > =C2=A0#include "xe_sync.h"
> > > > =C2=A0
> > > > =C2=A0#include <linux/dma-fence-array.h>
> > > > +#include <linux/highmem.h>
> > > > =C2=A0#include <linux/kthread.h>
> > > > =C2=A0#include <linux/sched/mm.h>
> > > > =C2=A0#include <linux/uaccess.h>
> > > > @@ -28,6 +29,7 @@ struct xe_user_fence {
> > > > =C2=A0	u64 __user *addr;
> > > > =C2=A0	u64 value;
> > > > =C2=A0	int signalled;
> > > > +	bool use_page;
> > > > =C2=A0};
> > > > =C2=A0
> > > > =C2=A0static void user_fence_destroy(struct kref *kref)
> > > > @@ -53,7 +55,9 @@ static struct xe_user_fence
> > > > *user_fence_create(struct xe_device *xe, u64 addr,
> > > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 value)
> > > > =C2=A0{
> > > > =C2=A0	struct xe_user_fence *ufence;
> > > > +	struct page *page;
> > > > =C2=A0	u64 __user *ptr =3D u64_to_user_ptr(addr);
> > > > +	int ret;
> > > > =C2=A0
> > > > =C2=A0	if (!access_ok(ptr, sizeof(ptr)))
> > > > =C2=A0		return ERR_PTR(-EFAULT);
> > > > @@ -69,19 +73,53 @@ static struct xe_user_fence
> > > > *user_fence_create(struct xe_device *xe, u64 addr,
> > > > =C2=A0	ufence->mm =3D current->mm;
> > > > =C2=A0	mmgrab(ufence->mm);
> > > > =C2=A0
> > > > +	/* Prefault page */
> > > > +	ret =3D get_user_pages_fast(addr, 1, FOLL_WRITE, &page);
> > > > +	if (ret =3D=3D 1) {
> > > > +		ufence->use_page =3D true;
> > > > +		put_page(page);
> > > > +	}
> > > > +
> > > > =C2=A0	return ufence;
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static void user_fence_worker(struct work_struct *w)
> > > > =C2=A0{
> > > > =C2=A0	struct xe_user_fence *ufence =3D container_of(w, struct
> > > > xe_user_fence, worker);
> > > > -
> > > > -	if (mmget_not_zero(ufence->mm)) {
> > > > -		kthread_use_mm(ufence->mm);
> > > > -		if (copy_to_user(ufence->addr, &ufence->value,
> > > > sizeof(ufence->value)))
> > > > -			XE_WARN_ON("Copy to user failed");
> > > > -		kthread_unuse_mm(ufence->mm);
> > > > -		mmput(ufence->mm);
> > > > +	struct mm_struct *mm =3D ufence->mm;
> > > > +
> > > > +	if (mmget_not_zero(mm)) {
> > > > +		kthread_use_mm(mm);
> > > > +		if (ufence->use_page) {
> > > > +			struct page *page;
> > > > +			int ret;
> > > > +
> > > > +			ret =3D get_user_pages_fast((unsigned
> > > > long)ufence->addr,
> > > > +						=C2=A0 1,
> > > > FOLL_WRITE,
> > > > &page);
> > > > +			if (ret =3D=3D 1) {
> > > > +				atomic64_t *ptr;
> > > > +				u64 old =3D 0;
> > > > +				void *va;
> > > > +
> > > > +				va =3D kmap_local_page(page);
> > > > +				ptr =3D va +
> > > > offset_in_page(ufence-
> > > > > addr);
> > > > +				while (!try_cmpxchg64(ptr,
> > > > &old,
> > > > ufence->value))
> > > > +					continue;
>=20
> I'm still a little worried about the availability of this, like when
> the build-bot tests on all available architectures, and Linus has
> already pulled the stuff. It's definitely there on i386, and it seems
> to be used generically in sched/clock.c. Might be worth-wile to CC
> dri-
> devel/lkml and have the build bots pick it up...
>=20
>=20
> > > > +				kunmap_local(va);
> > > > +
> > > > +				set_page_dirty_lock(page);
> > > > +				put_page(page);
> > > > +			} else {
> > > > +				ufence->use_page =3D false;
> > > > +			}
> > > > +		}
> > > > +		if (!ufence->use_page) {
> > >=20
> > > Hmm. Trying to figure out the semantics here. If ever used on 32-
> > > bit,
> > > and get_user_pages() fails, then I figure we can't guarantee
> > > atomicity.
> > > That would typically be if the user-fence is in buffer-object or
> > > device
> > > memory?
> > >=20
> >=20
> > I think so, based on [1] if the ufence is a mapped BO on TGL
> > get_user_pages_fast doesn't work and !use_page path is used. Hence
> > I
> > add
> > malloc ufence section in [1].
> >=20
> > [1]
> > https://patchwork.freedesktop.org/patch/580147/?series=3D130417&rev=3D1
> >=20
> > > > +			if (copy_to_user(ufence->addr,
> > > > &ufence-
> > > > > value,
> > > > +					 sizeof(ufence-
> > > > >value)))
> > >=20
> > > We should probably use put_user() here. On 64-bit I think that
> > > always
> > > translates to an atomic write. And we should IMO precede with an
> > > mb()
> > > to avoid in-kernel reordering. That would typically need to pair
> > > with
> > > an mb() in the reader as well.
> > >=20
> >=20
> > Got on on the put_user(), seems to work.
> >=20
> > A little unclear on mb() usage.
> >=20
> > Would it be?
> > mb()
> > put_user()
>=20
> Yes, this is correct. Actually we'd want smp_store_release()
> semantics
> here, but this is stricter.
>=20
>=20
> >=20
> > And then in xe_wait_user_fence.c:do_compare?
> > mb()
> > copy_from_user
>=20
> Here we'd want smp_read_acquire() but we'd have to do with the below.
> get_user()
> mb();

Oh, and actually smp_mb() should be sufficient here.


>=20
> And user-space should use a similar mb() as well if they need to be
> sure things are indeed done after the signalling.
>=20
> /Thomas
>=20
> >=20
> > Matt
> >=20
> > >=20
> > > > +				drm_warn(&ufence->xe->drm,
> > > > "Copy
> > > > to
> > > > user failed\n");
> > > > +		}
> > > > +		kthread_unuse_mm(mm);
> > > > +		mmput(mm);
> > > > =C2=A0	}
> > > > =C2=A0
> > > > =C2=A0	wake_up_all(&ufence->xe->ufence_wq);
> > >=20
>=20

