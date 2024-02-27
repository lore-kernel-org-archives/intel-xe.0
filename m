Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47730C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 12:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1029510E133;
	Tue, 27 Feb 2024 12:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L87OLgSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EB689BAE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709037513; x=1740573513;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=fR01K6WY0I8BtluPduDh8WpP4IkZ5t4wBKa4AUk5tT8=;
 b=L87OLgSfOL9Tv2CGlamSqFo+DrPy0WyBnCweBSnXbug0V1aXnON8/4Gb
 ItMNtFsozGwYZKpyvrSEY7w3L4mCRqqq+iIGBClQQfnaOoZVorltL84wj
 uUuxAYXmUa42pOIceNrla+6dkunFr5sTXFiEaerck8Ci+LlS1EBABONrC
 cQfw/MyztEphhP6lD88t+hfzTUigSxCQxXvj0JSNb2HSGGDKPVnB9zhDl
 xjCIQsE3lE+rwDeAh/Tj2jLO0nYPlTffw8rJy0dhlCr3ydCHs53af4dSv
 B9QgmYRyh863uw8/QbSXLrurRcD6pDciulan1xIWoIxIIoKnhfR0PLM4w A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3294405"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3294405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 04:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6994532"
Received: from rbriscox-mobl1.ger.corp.intel.com (HELO [10.252.3.86])
 ([10.252.3.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 04:38:30 -0800
Message-ID: <21393f027f1b019442800e17ca5ee1be19083e0f.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Get page on user fence creation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 13:38:27 +0100
In-Reply-To: <43e740230aa41475a6539e2b198e9885b34571e3.camel@linux.intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
 <20240227024337.141585-4-matthew.brost@intel.com>
 <43e740230aa41475a6539e2b198e9885b34571e3.camel@linux.intel.com>
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

On Tue, 2024-02-27 at 12:01 +0100, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2024-02-26 at 18:43 -0800, Matthew Brost wrote:
> > Attempt to get page on user fence creation and kmap_local_page on
> > signaling. Should reduce latency and can ensure 64 bit atomicity
> > compared to copy_to_user.
> >=20
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_sync.c | 45 ++++++++++++++++++++++++++++---=
-
> > --
> > --
> > =C2=A01 file changed, 36 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 022e158d28d9..2f3e062c0101 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -6,6 +6,7 @@
> > =C2=A0#include "xe_sync.h"
> > =C2=A0
> > =C2=A0#include <linux/dma-fence-array.h>
> > +#include <linux/highmem.h>
> > =C2=A0#include <linux/kthread.h>
> > =C2=A0#include <linux/sched/mm.h>
> > =C2=A0#include <linux/uaccess.h>
> > @@ -25,6 +26,7 @@ struct user_fence {
> > =C2=A0	struct dma_fence_cb cb;
> > =C2=A0	struct work_struct worker;
> > =C2=A0	struct mm_struct *mm;
> > +	struct page *page;
> > =C2=A0	u64 __user *addr;
> > =C2=A0	u64 value;
> > =C2=A0};
> > @@ -34,7 +36,10 @@ static void user_fence_destroy(struct kref
> > *kref)
> > =C2=A0	struct user_fence *ufence =3D container_of(kref, struct
> > user_fence,
> > =C2=A0						 refcount);
> > =C2=A0
> > -	mmdrop(ufence->mm);
> > +	if (ufence->page)
> > +		put_page(ufence->page);
> > +	else if (ufence->mm)
> > +		mmdrop(ufence->mm);
> > =C2=A0	kfree(ufence);
> > =C2=A0}
> > =C2=A0
> > @@ -53,6 +58,7 @@ static struct user_fence
> > *user_fence_create(struct
> > xe_device *xe, u64 addr,
> > =C2=A0{
> > =C2=A0	struct user_fence *ufence;
> > =C2=A0	u64 __user *ptr =3D u64_to_user_ptr(addr);
> > +	int ret;
> > =C2=A0
> > =C2=A0	if (!access_ok(ptr, sizeof(ptr)))
> > =C2=A0		return ERR_PTR(-EFAULT);
> > @@ -66,7 +72,11 @@ static struct user_fence
> > *user_fence_create(struct
> > xe_device *xe, u64 addr,
> > =C2=A0	ufence->addr =3D ptr;
> > =C2=A0	ufence->value =3D value;
> > =C2=A0	ufence->mm =3D current->mm;
> > -	mmgrab(ufence->mm);
> > +	ret =3D get_user_pages_fast(addr, 1, FOLL_WRITE, &ufence-
> > > page);
>=20
> Hmm. This is mid-term pinning a page-cache page. We shouldn't really
> do
> that since it interferes with huge pages and numa migration.
>=20
> What about just prefaulting and dropping the refcount and then we
> do this again when signalling?
>=20
> > +	if (ret !=3D 1) {
> > +		mmgrab(ufence->mm);
> > +		ufence->page =3D NULL;
> > +	}
> > =C2=A0
> > =C2=A0	return ufence;
> > =C2=A0}
> > @@ -74,13 +84,30 @@ static struct user_fence
> > *user_fence_create(struct xe_device *xe, u64 addr,
> > =C2=A0static void user_fence_worker(struct work_struct *w)
> > =C2=A0{
> > =C2=A0	struct user_fence *ufence =3D container_of(w, struct
> > user_fence, worker);
> > -
> > -	if (mmget_not_zero(ufence->mm)) {
> > -		kthread_use_mm(ufence->mm);
> > -		if (copy_to_user(ufence->addr, &ufence->value,
> > sizeof(ufence->value)))
> > -			XE_WARN_ON("Copy to user failed");
> > -		kthread_unuse_mm(ufence->mm);
> > -		mmput(ufence->mm);
> > +	struct mm_struct *mm =3D ufence->mm;
> > +
> > +	if (mmget_not_zero(mm)) {
> > +		if (ufence->page) {
> > +			u64 *ptr;
> > +			void *va;
>=20
>=20
> > +
> > +			va =3D kmap_local_page(ufence->page);
> > +			ptr =3D va + offset_in_page(ufence->addr);
> > +			xchg(ptr, ufence->value);
>=20
> Does this compile on 32-bit?

It doesn't. Would probably need a try_cmpxchg64() loop.

/Thomas

