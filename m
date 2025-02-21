Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90560C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 13:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2B810E34D;
	Fri, 21 Feb 2025 13:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTDtglvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E0110E34D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740144209; x=1771680209;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I3wMIoDDq3s67tRnA6fayHPSj1bN696BBtQiqVaFFqE=;
 b=GTDtglvBnV2tyP0m2s5gUlZuTHY9vXpWkbrHbbGeqOkgWFfWKOZ/J4J1
 tPURxa41/3YNFZAlp/VzrGWn8+R1Qu6rFrpUFnQ769faPcL1LXvZ+ljwk
 hdsxUKECmQiJ7yAJpO/0gWi9Aw45s1M5RTMnIe4SDkBvktC5njzAD3tza
 hGdiZb7tAmlloXj9qDczOmHtIkJakQGDbFz+lb3mlitqeWCBmLVy2swkB
 AZyOA5O3lLOp1O6Ml6+cyds8J6m5sMOEYZsbuoWyj9OsIKvEtKstDcrD7
 YXmEownKVMe/8FsNE6YzpBu2HDm/Z8S7FH2VrOLvFSjMQx+J6dKWvEm+6 g==;
X-CSE-ConnectionGUID: I9EUlI02Q6S9ek/aPwpN/A==
X-CSE-MsgGUID: /CLZ/kxvR62CCkUAiEoXIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40674262"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40674262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:23:28 -0800
X-CSE-ConnectionGUID: t0NephwyQ7CyzV4yJMJeKA==
X-CSE-MsgGUID: 0/mqxkRhQGeDFkfbe/ep+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152562410"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.42])
 ([10.245.246.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:23:26 -0800
Message-ID: <18d8bdca761f2daaf4b46b81f49838be3488aa95.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/userptr: restore invalidation list on error
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Date: Fri, 21 Feb 2025 14:23:23 +0100
In-Reply-To: <f2c9136f-ecb4-4b60-92f5-6938ec242c2e@intel.com>
References: <20250214170527.272182-4-matthew.auld@intel.com>
 <Z6/ttCTrEuwNsD6w@lstrano-desk.jf.intel.com>
 <6fec16d5-cbf3-448b-9c07-85a079095f62@intel.com>
 <Z7QFUy9ZyBRhPwuY@lstrano-desk.jf.intel.com>
 <Z7fAIjU/3wW8eMQL@lstrano-desk.jf.intel.com>
 <cfbcea7a-bcba-4e7a-9b63-398a48da789d@intel.com>
 <a6ac4585efaabc710c377b786d042177e0df48ad.camel@linux.intel.com>
 <f2c9136f-ecb4-4b60-92f5-6938ec242c2e@intel.com>
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

On Fri, 2025-02-21 at 13:17 +0000, Matthew Auld wrote:
> On 21/02/2025 11:20, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2025-02-21 at 11:11 +0000, Matthew Auld wrote:
> > > On 20/02/2025 23:52, Matthew Brost wrote:
> > > > On Mon, Feb 17, 2025 at 07:58:11PM -0800, Matthew Brost wrote:
> > > > > On Mon, Feb 17, 2025 at 09:38:26AM +0000, Matthew Auld wrote:
> > > > > > On 15/02/2025 01:28, Matthew Brost wrote:
> > > > > > > On Fri, Feb 14, 2025 at 05:05:28PM +0000, Matthew Auld
> > > > > > > wrote:
> > > > > > > > On error restore anything still on the pin_list back to
> > > > > > > > the
> > > > > > > > invalidation
> > > > > > > > list on error. For the actual pin, so long as the vma
> > > > > > > > is
> > > > > > > > tracked on
> > > > > > > > either list it should get picked up on the next pin,
> > > > > > > > however it looks
> > > > > > > > possible for the vma to get nuked but still be present
> > > > > > > > on
> > > > > > > > this per vm
> > > > > > > > pin_list leading to corruption. An alternative might be
> > > > > > > > then to instead
> > > > > > > > just remove the link when destroying the vma.
> > > > > > > >=20
> > > > > > > > Fixes: ed2bdf3b264d ("drm/xe/vm: Subclass userptr
> > > > > > > > vmas")
> > > > > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> > > > > > > > Cc: <stable@vger.kernel.org> # v6.8+
> > > > > > > > ---
> > > > > > > > =C2=A0=C2=A0=C2=A0 drivers/gpu/drm/xe/xe_vm.c | 26
> > > > > > > > +++++++++++++++++++-----
> > > > > > > > --
> > > > > > > > =C2=A0=C2=A0=C2=A0 1 file changed, 19 insertions(+), 7 dele=
tions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > index d664f2e418b2..668b0bde7822 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > @@ -670,12 +670,12 @@ int xe_vm_userptr_pin(struct
> > > > > > > > xe_vm
> > > > > > > > *vm)
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	list_for_each_entry_safe(uvma, nex=
t, &vm-
> > > > > > > > > userptr.invalidated,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			=09
> > > > > > > > userptr.invalidate_link)
> > > > > > > > {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		list_del_init(&uvma-
> > > > > > > > > userptr.invalidate_link);
> > > > > > > > -		list_move_tail(&uvma-
> > > > > > > > >userptr.repin_link,
> > > > > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm-
> > > > > > > > >userptr.repin_list);
> > > > > > > > +		list_add_tail(&uvma-
> > > > > > > > >userptr.repin_link,
> > > > > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm-
> > > > > > > > >userptr.repin_list);
> > > > > > >=20
> > > > > > > Why this change?
> > > > > >=20
> > > > > > Just that with this patch the repin_link should now always
> > > > > > be
> > > > > > empty at this
> > > > > > point, I think. add should complain if that is not the
> > > > > > case.
> > > > > >=20
> > > > >=20
> > > > > If it is always expected to be empty, then yea maybe add a
> > > > > xe_assert for
> > > > > this as the list management is pretty tricky.
> > > > >=20
> > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	}
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	spin_unlock(&vm->userptr.invalidat=
ed_lock);
> > > > > > > > -	/* Pin and move to temporary list */
> > > > > > > > +	/* Pin and move to bind list */
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	list_for_each_entry_safe(uvma, nex=
t, &vm-
> > > > > > > > > userptr.repin_list,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				 userptr.repin_link) {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		err =3D xe_vma_userptr_pin_pages(=
uvma);
> > > > > > > > @@ -691,10 +691,10 @@ int xe_vm_userptr_pin(struct
> > > > > > > > xe_vm
> > > > > > > > *vm)
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			err =3D
> > > > > > > > xe_vm_invalidate_vma(&uvma-
> > > > > > > > > vma);
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			xe_vm_unlock(vm);
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			if (err)
> > > > > > > > -				return err;
> > > > > > > > +				break;
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		} else {
> > > > > > > > -			if (err < 0)
> > > > > > > > -				return err;
> > > > > > > > +			if (err)
> > > > > > > > +				break;
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			list_del_init(&uvma-
> > > > > > > > > userptr.repin_link);
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0			list_move_tail(&uvma-
> > > > > > > > > vma.combined_links.rebind,
> > > > > > > > @@ -702,7 +702,19 @@ int xe_vm_userptr_pin(struct xe_vm
> > > > > > > > *vm)
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		}
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	}
> > > > > > > > -	return 0;
> > > > > > > > +	if (err) {
> > > > > > > > +		down_write(&vm-
> > > > > > > > >userptr.notifier_lock);
> > > > > > >=20
> > > > > > > Can you explain why you take the notifier lock here? I
> > > > > > > don't
> > > > > > > think this
> > > > > > > required unless I'm missing something.
> > > > > >=20
> > > > > > For the invalidated list, the docs say:
> > > > > >=20
> > > > > > "Removing items from the list additionally requires @lock
> > > > > > in
> > > > > > write mode, and
> > > > > > adding items to the list requires the @userptr.notifer_lock
> > > > > > in
> > > > > > write mode."
> > > > > >=20
> > > > > > Not sure if the docs needs to be updated here?
> > > > > >=20
> > > > >=20
> > > > > Oh. I believe the part of comment for 'adding items to the
> > > > > list
> > > > > requires the @userptr.notifer_lock in write mode' really
> > > > > means
> > > > > something
> > > > > like this:
> > > > >=20
> > > > > 'When adding to @vm->userptr.invalidated in the notifier the
> > > > > @userptr.notifer_lock in write mode protects against
> > > > > concurrent
> > > > > VM binds
> > > > > from setting up newly invalidated pages.'
> > > > >=20
> > > > > So with above and since this code path is in the VM bind path
> > > > > (i.e. we
> > > > > are not racing with other binds) I think the
> > > > > vm->userptr.invalidated_lock is sufficient. Maybe ask Thomas
> > > > > if
> > > > > he
> > > > > agrees here.
> > > > >=20
> > > >=20
> > > > After some discussion with Thomas, removing notifier lock here
> > > > is
> > > > safe.
> > >=20
> > > Thanks for confirming.
> >=20
> > So basically that was to protect exec when it takes the notifier
> > lock
> > in read mode, and checks that there are no invalidated userptr,
> > that
> > needs to stay true as lock as the notifier lock is held.
> >=20
> > But as MBrost pointed out, the vm lock is also held, so I think the
> > kerneldoc should be updated so that the requirement is that either
> > the
> > notifier lock is held in write mode, or the vm lock in write mode.
> >=20
> > As a general comment these locking protection docs are there to
> > simplify reading and writing of the code so that when new code is
> > written and reviewed, we should just keep to the rules to avoid
> > auditing all locations in the driver where the protected data-
> > structure
> > is touched. If we want to update those docs I think a complete such
> > audit needs to be done and all use-cases are understood.
>=20
> For this patch is the preference to go with the slightly overzealous=20
> locking for now? Circling back around later, fixing the doc when
> adding=20
> the new helper, and at the same time also audit all callers?

Since it's a -fixes patch I think we should keep the locking and
documentation consistent, so either update the docs also in the stable
backports or do the overzealous locking.

/Thomas



>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > >=20
> > > > However, for adding is either userptr.notifer_lock || vm->lock
> > > > to
> > > > also
> > > > avoid races between binds, execs, and rebind worker.
> > > >=20
> > > > I'd like update the documentation and add a helper like this:
> > > >=20
> > > > void xe_vma_userptr_add_invalidated(struct xe_userptr_vma
> > > > *uvma)
> > > > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm =
=3D xe_vma_vm(&uvma->vma);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lockdep_assert(loc=
k_is_held_type(&vm->lock.dep_map, 1)
> > > > ||
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo=
ck_is_held_type(&vm-
> > > > > userptr.notifier_lock.dep_map, 1));
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&vm->use=
rptr.invalidated_lock);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_move_tail(&uv=
ma->userptr.invalidate_link,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &v=
m->userptr.invalidated);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&vm->u=
serptr.invalidated_lock);
> > > > }
> > >=20
> > > Sounds good.
> > >=20
> > > >=20
> > > > However, let's delay the helper until this series and recently
> > > > post
> > > > series of mine [1] merge as both are fixes series and hoping
> > > > for a
> > > > clean
> > > > backport.
> > >=20
> > > Makes sense.
> > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > [1] https://patchwork.freedesktop.org/series/145198/
> > > >=20
> > > > > Matt
> > > > >=20
> > > > > > >=20
> > > > > > > Matt
> > > > > > >=20
> > > > > > > > +		spin_lock(&vm-
> > > > > > > > >userptr.invalidated_lock);
> > > > > > > > +		list_for_each_entry_safe(uvma, next,
> > > > > > > > &vm-
> > > > > > > > > userptr.repin_list,
> > > > > > > > +				=09
> > > > > > > > userptr.repin_link) {
> > > > > > > > +			list_del_init(&uvma-
> > > > > > > > > userptr.repin_link);
> > > > > > > > +			list_move_tail(&uvma-
> > > > > > > > > userptr.invalidate_link,
> > > > > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm-
> > > > > > > > > userptr.invalidated);
> > > > > > > > +		}
> > > > > > > > +		spin_unlock(&vm-
> > > > > > > > > userptr.invalidated_lock);
> > > > > > > > +		up_write(&vm->userptr.notifier_lock);
> > > > > > > > +	}
> > > > > > > > +	return err;
> > > > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > > > =C2=A0=C2=A0=C2=A0 /**
> > > > > > > > --=20
> > > > > > > > 2.48.1
> > > > > > > >=20
> > > > > >=20
> > >=20
> >=20
>=20

