Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43661EB64D9
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 21:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B5410E011;
	Sun,  2 Jul 2023 21:14:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024F410E011
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Jul 2023 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688332446; x=1719868446;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T3AnzwZhIFwKWJPU6kiiq7Sx68T/V3NCnSXOO0yJZbw=;
 b=NGzHm5VZyy/KTJBtD+IjLsW9mNjcTNUji31XFSXJlrjTs5JaXsWenoe1
 FkF+z1E93a5rs1fFkKtxmKc9pN1d6tg4K2EqwzqtDrOSWFwd6ThQYtdEM
 LOi8/E0NkwQROgymFChVnN5RfPuUGJ2fcMXAlwJJ1aGXTZgk8cJV9PsvN
 X9NgErIeApJYar0pMV4LiLJn1KMILusKdkZgfRtRqrfwgiwISeSVeRcna
 Uw6W51j/oQ/+VwExHmM6TzGxa/m8OVYIxRvNHONb9Xri9Ws8pJBmyw7IF
 ff3UqAiZP+rdRuZUzekMYljOcPEKZWz7JwONYGNWG2XOCrS9NmrEwbq+g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361598008"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="361598008"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 14:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695596620"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="695596620"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO [10.249.254.207])
 ([10.249.254.207])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 14:14:02 -0700
Message-ID: <197d3d5ce233a42884e75e0a743c9faad33639e1.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Date: Sun, 02 Jul 2023 23:13:43 +0200
In-Reply-To: <ZJ+pyeDZ84w4kZMB@DUT025-TGLU.fm.intel.com>
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
 <20230629205134.111849-3-thomas.hellstrom@linux.intel.com>
 <ZJ+pyeDZ84w4kZMB@DUT025-TGLU.fm.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix the separate bind-engine
 race using coarse-granularity dependencies
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, 2023-07-01 at 04:21 +0000, Matthew Brost wrote:
> On Thu, Jun 29, 2023 at 10:51:34PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Separate bind-engines operating on the same VM range might race
> > updating
> > page-tables. To make sure that doesn't happen, each page-table
> > update
> > operation needs to collect internal dependencies to await before
> > the
> > job is executed.
> >=20
> > Provide an infrastructure to do that. Initially we save a single
> > dma-fence
> > for the entire VM, which thus removes the benefit of separate bind-
> > engines
> > in favour of fixing the race, but a more fine-grained dependency
> > tracking can be achieved by using, for example, the same method as
> > the
> > i915 vma_resources (an interval tree storing unsignaled fences).
> > That
> > of course comes with increasing code complexity.
> >=20
> > This patch will break the xe_vm@bind-engines-independent igt test,
> > but that
> > would need an update anyway to avoid the independent binds using
> > the
> > same address range. In any case, such a test would not work with
> > the
> > initial xe implementation unless the binds were using different
> > vms.
> >=20
>=20
> We need to do better than this as this makes bind engines useless as
> everything is serialized.

Yes, agreed, and as mentioned in the commit message this fixes the bug
and provides an infrastructure to do a better follow-up. Note that a
client can never *rely* on bind-engines executing separately since they
use common resources that may become restricted, even if they would
typically execute separately.


>=20
> Hmm, how about a mtree where we store fences for un/bind jobs with
> the
> key being the highest level in which the tree is pruned or unpruned?
>=20
> Let's do an example on an empty tree with 48 bits of VA /w 4k pages
>=20
> - Bind 0x0000 to 0x1000 <- Inserts mtree entry with key of 0x0 ->
> (0x1 << 39), fence A
>=20
> - Bind 0x1000 to 0x2000 <- Waits on fence as lookup find fence A, no
> new
> =C2=A0 fence inserted as the only entry inserted was a level 0 leaf
>=20
> - Bind (0x1 << 39) to (0x1 << 39) + 0x1000 <- no need to wait on
> fence A
> =C2=A0 as lookup fails, insert new fence B with key (0x1 << 39) -> (0x2 <=
<
> 39)
>=20
> - Unbind 0x1000 to 0x2000 <- no need to wait on fence A as lookup
> fails,
> =C2=A0 no new fence inserted as the only entry removed was a level 0 leaf
>=20
> - Unbind 0x0000 to 0x1000 <- Waits on fence as lookup find fence A,
> =C2=A0 insert fence C with key of 0x0 -> (0x1 << 39)
>=20
> I think this would be fairly simple to implement. The GPUVA series
> has
> examples of how to implement mtrees with range keys [1].
>=20
> One thing more thing is how to cleanup the mtree fences, I think a
> garage collector which traverses mtree every so often which removes
> signaled fences should work just fine.
>=20
> What do you think? Crazy idea or does it seem reasonable? If it is
> the
> later,

This is more or less exactly what the commit message suggests, is done
for i915 vma resources handling, except the latter uses an overlapping
interval tree (map / unmap ranges would overlap which I figure makes it
impossible to use an mtree?) Did you have a chance to look at the vma
resources implementation?

The fences in the interval tree there are cleaned up using fence
signalling callbacks.


>  lets talk on who should code this up.

I had a plan to do that as a follow-up patch. IMO the functionality of
this patch is good for a bugfix, and can be built upon for a complete
solution. Separate execution of bind engines is a (probably important)
optimization, but I think at this point priority must be in fixing the
bug.

/Thomas
=20

>=20
> Lastly, I have IGTs to expose these races, [2], [3], I think the IGTs
> should work after these changes.
>=20
> Matt
>=20
> [1]
> https://patchwork.freedesktop.org/patch/544863/?series=3D120000&rev=3D3
> [2]
> https://gitlab.freedesktop.org/drm/xe/igt-gpu-tools/-/merge_requests/13/d=
iffs?commit_id=3D2de056f6e9213a804f8b0489bbd91b989834d158
> [3]
> https://gitlab.freedesktop.org/drm/xe/igt-gpu-tools/-/merge_requests/13/d=
iffs?commit_id=3D23ea98fce7523b2aa252f4fe19411f5591a5623b
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0 |=C2=A0 2 ++
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0 |=C2=A0 2 ++
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
48
> > ++++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 8 ++++++
> > =C2=A05 files changed, 61 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 41c90f6710ee..ff0a422f59a5 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1073,6 +1073,7 @@ xe_migrate_update_pgtables_cpu(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-ETIME);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ops->pre_commit) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pt_update->job =3D NULL;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D ops->pre_commit(pt_update);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return ERR_PTR(err);
> > @@ -1294,6 +1295,7 @@ xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_job;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ops->pre_commit) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pt_update->job =3D job;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D ops->pre_commit(pt_update);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
goto err_job;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index 204337ea3b4e..b4135876e3f7 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -69,6 +69,8 @@ struct xe_migrate_pt_update {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct xe_migrate=
_pt_update_ops *ops;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @vma: The vma we're=
 updating the pagetable for. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_vma *vma;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @job: The job if a GPU p=
age-table update. NULL
> > otherwise */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_sched_job *job;
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index fe1c77b139e4..f38e7b5a3b32 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1119,6 +1119,42 @@ struct xe_pt_migrate_pt_update {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool locked;
> > =C2=A0};
> > =C2=A0
> > +/*
> > + * This function adds the needed dependencies to a page-table
> > update job
> > + * to make sure racing jobs for separate bind engines don't race
> > writing
> > + * to the same page-table range, wreaking havoc. Initially use a
> > single
> > + * fence for the entire VM. An optimization would use smaller
> > granularity.
> > + */
> > +static int xe_pt_vm_dependencies(struct xe_sched_job *job, struct
> > xe_vm *vm)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!vm->last_update_fence)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dma_fence_is_signaled(vm=
->last_update_fence)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->last_update_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0vm->last_update_fence =3D NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Is this a CPU update? GPU=
 is busy updating, so return an
> > error */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!job)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -ETIME;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_get(vm->last_updat=
e_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D drm_sched_job_add_de=
pendency(&job->drm, vm-
> > >last_update_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->last_update_fence);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return err;
> > +}
> > +
> > +static int xe_pt_pre_commit(struct xe_migrate_pt_update
> > *pt_update)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return xe_pt_vm_dependencies=
(pt_update->job, pt_update-
> > >vma->vm);
> > +}
> > +
> > =C2=A0static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update
> > *pt_update)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_pt_migrate_pt=
_update *userptr_update =3D
> > @@ -1126,6 +1162,10 @@ static int xe_pt_userptr_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_vma *vma =3D =
pt_update->vma;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long notifier_=
seq =3D vma->userptr.notifier_seq;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_vm *vm =3D vm=
a->vm;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err =3D xe_pt_vm_depende=
ncies(pt_update->job, vm);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return err;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0userptr_update->locked =
=3D false;
> > =C2=A0
> > @@ -1164,6 +1204,7 @@ static int xe_pt_userptr_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> > =C2=A0
> > =C2=A0static const struct xe_migrate_pt_update_ops bind_ops =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.populate =3D xe_vm_pop=
ulate_pgtable,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pre_commit =3D xe_pt_pre_co=
mmit,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct xe_migrate_pt_update_ops userptr_bind_ops =3D=
 {
> > @@ -1345,6 +1386,9 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct
> > xe_vma *vma, struct xe_engine *e,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(fence)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0LLIST_HEAD(deferred);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->last_update_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0vm->last_update_fence =3D dma_fence_get(fence);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* TLB invalidation must be done before signalin=
g
> > rebind */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ifence) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
int err =3D invalidation_fence_init(tile-
> > >primary_gt, ifence, fence,
> > @@ -1591,6 +1635,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
> > =C2=A0
> > =C2=A0static const struct xe_migrate_pt_update_ops unbind_ops =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.populate =3D xe_migrat=
e_clear_pgtable_callback,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pre_commit =3D xe_pt_pre_co=
mmit,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct xe_migrate_pt_update_ops userptr_unbind_ops =
=3D
> > {
> > @@ -1666,6 +1711,9 @@ __xe_pt_unbind_vma(struct xe_tile *tile,
> > struct xe_vma *vma, struct xe_engine *e
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!IS_ERR(fence)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->last_update_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0vm->last_update_fence =3D dma_fence_get(fence);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* TLB invalidation must be done before signalin=
g
> > unbind */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D invalidation_fence_init(tile->primary_gt=
,
> > ifence, fence, vma);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 8b8c9c5aeb01..f90f3a7c6ede 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1517,6 +1517,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_xe_vm_free(vm);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->rebin=
d_fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_put(vm->last_updat=
e_fence);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_fini(&vm->resv=
);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(vm);
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index c148dd49a6ca..5d9eebe5c6bb 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -343,6 +343,14 @@ struct xe_vm {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0bool capture_once;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} error_capture;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @last_update_fence: fence=
 representing the last page-
> > table
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * update on this VM. Used t=
o avoid races between separate
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bind engines. Ideally thi=
s should be an interval tree of
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * unsignaled fences. Protec=
ted by the vm resv.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_fence *last_updat=
e_fence;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @batch_invalidate_t=
lb: Always invalidate TLB before
> > batch start */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool batch_invalidate_t=
lb;
> > =C2=A0};
> > --=20
> > 2.40.1
> >=20

