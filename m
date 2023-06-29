Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C28EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 07:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537310E3BD;
	Thu, 29 Jun 2023 07:44:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430B710E095
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688024661; x=1719560661;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j4h43mK1WI+Fj8XX7ADr6we0vOp20WbCVR6qnvSw1tQ=;
 b=LD/hnur4UMp6a+Y3bI50cnePfQqodsAG+vS+XWp38Zl1fwf+3G2wtWZN
 df39IEnhbcdquOo0cpmuCJKyyI7BIP67EOGD/9GIyRIaOWjjp7Y+QBYuw
 wjtXhYjb2ZBRKUx6xDFmDKfajp9pXQ/6q1Dk8M+Gv0+vGzPzEXfpkQoR7
 LBH4aIcDHhkUwddJLJrL67Klo0AxllYFLsKPAyizNCcHcBoPLKmOwF00f
 wdW3nUYwWaAgmSt70jpiLFBQPLF8USlc+uQSblnLzESsQRuR+I8/Dr+tv
 EUaNeuOYWWVr26nUE6vVRioV2x0LQECdNBktlcPc378BI3TU9h8G8PrYH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362083895"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="362083895"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 00:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841363926"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="841363926"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO [10.249.254.200])
 ([10.249.254.200])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 00:44:18 -0700
Message-ID: <eb511785c4ce4e0d580c4849ce680e2b8a39ff57.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Date: Thu, 29 Jun 2023 09:44:16 +0200
In-Reply-To: <ZJw0_7x9uJ5D9pBk@fdugast-desk.home>
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
 <ZJw0_7x9uJ5D9pBk@fdugast-desk.home>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: Add a VM_BIND async
 draft document
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
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Francois,

On Wed, 2023-06-28 at 15:26 +0200, Francois Dugast wrote:
> Hi Thomas,
>=20
> On Wed, Jun 28, 2023 at 02:51:46PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Add a motivation for and description of asynchronous VM_BIND
> > operation
> >=20
> > v2:
> > - Fix typos (Nirmoy Das)
> > - Improve the description of a memory fence (Oak Zeng)
> > - Add a reference to the document in the Xe RFC.
> > - Add pointers to sample uAPI suggestions
> > v3:
> > - Address review comments (Danilo Krummrich)
> > - Formatting fixes
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> > =C2=A0Documentation/gpu/drm-vm-bind-async.rst | 150
> > ++++++++++++++++++++++++
> > =C2=A0Documentation/gpu/rfc/xe.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A02 files changed, 152 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> >=20
> > diff --git a/Documentation/gpu/drm-vm-bind-async.rst
> > b/Documentation/gpu/drm-vm-bind-async.rst
> > new file mode 100644
> > index 000000000000..8f9e2d5c8f0f
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > @@ -0,0 +1,150 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Asynchronous VM_BIND
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Nomenclature:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +* ``VRAM``: On-device memory. Sometimes referred to as device
> > local memory.
> > +
> > +* ``gpu_vm``: A GPU address space. Typically per process, but can
> > be shared by
> > +=C2=A0 multiple processes.
> > +
> > +* ``VM_BIND``: An operation or a list of operations to modify a
> > gpu_vm using
> > +=C2=A0 an IOCTL. The operations include mapping and unmapping system-
> > or
> > +=C2=A0 VRAM memory.
> > +
> > +* ``syncobj``: A container that abstracts synchronization objects.
> > The
> > +=C2=A0 synchronization objects can be either generic, like dma-fences
> > or
> > +=C2=A0 driver specific. A syncobj typically indicates the type of the
> > +=C2=A0 underlying synchronization object.
> > +
> > +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND
> > operation waits
> > +=C2=A0 for these before starting.
> > +
> > +* ``out-syncbj``: Argument to a VM_BIND_IOCTL, the VM_BIND
> > operation
> > +=C2=A0 signals these when the bind operation is complete.
> > +
> > +* ``memory fence``: A synchronization object, different from a
> > dma-fence.
> > +=C2=A0 A memory fence uses the value of a specified memory location to
> > determine
> > +=C2=A0 signaled status. A memory fence can be awaited and signaled by
> > both
> > +=C2=A0 the GPU and CPU. Memory fences are sometimes referred to as
> > +=C2=A0 user-fences, and do not necessarily bey the dma-fence rule of
>=20
> s/bey/obey/
>=20
> > +=C2=A0 signalling within a "reasonable amount of time". The kernel
> > should
> > +=C2=A0 thus avoid waiting for memory fences with locks held.
> > +
> > +* ``long-running workload``: A workload that may take more than
> > the
> > +=C2=A0 current stipulated dma-fence maximum signal delay to complete
> > and
> > +=C2=A0 which therefore needs to set the gpu_vm or the GPU execution
> > context in
> > +=C2=A0 a certain mode that disallows completion dma-fences.
> > +
> > +* ``exec function``: An exec function is a function that
> > revalidates all
> > +=C2=A0 affected vmas, submits a gpu command batch and registers the
>=20
> The document sometimes uses "GPU" and sometimes "gpu", maybe we can
> stick to
> "GPU" everywhere?
>=20
> > +=C2=A0 dma_fence representing the gpu command's activity with all
> > affected
> > +=C2=A0 dma_resvs. For completeness, although not covered by this
> > document,
> > +=C2=A0 it's worth mentioning that an exec function may also be the
> > +=C2=A0 revalidation worker that is used by some drivers in compute /
> > +=C2=A0 long-running mode.
> > +
> > +* ``bind context``: A context identifier used for the VM_BIND
> > +=C2=A0 operation. VM_BIND operations that use the same bind context ca=
n
> > be
> > +=C2=A0 assumed, where it matters, to complete in order of submission.
> > No such
> > +=C2=A0 assumptions can be made for VM_BIND operations using separate
> > bind contexts.
> > +
> > +* ``UMD``: User-mode driver.
> > +
> > +* ``KMD``: Kernel-mode driver.
> > +
> > +
> > +Synchronous / Asynchronous VM_BIND operation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Synchronous VM_BIND
> > +___________________
> > +With Synchronous VM_BIND, the VM_BIND operations all complete
> > before the
> > +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> > +out-fences. Synchronous VM_BIND may block and wait for GPU
> > operations;
> > +for example swapin or clearing, or even previous binds.
>=20
> s/swapin/swapping/ ?

It should say swap-in,

>=20
> > +
> > +Asynchronous VM_BIND
> > +____________________
> > +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs.
> > While the
> > +IOCTL may return immediately, the VM_BIND operations wait for the
> > in-syncobjs
> > +before modifying the GPU page-tables, and signal the out-syncobjs
> > when
> > +the modification is done in the sense that the next exec function
> > that
> > +awaits for the out-syncobjs will see the change. Errors are
> > reported
> > +synchronously assuming that the asynchronous part of the job never
> > errors.
> > +In low-memory situations the implementation may block, performing
> > the
> > +VM_BIND synchronously, because there might not be enough memory
> > +immediately available for preparing the asynchronous operation.
> > +
> > +If the VM_BIND IOCTL takes a list or an array of operations as an
> > argument,
> > +the in-syncobjs needs to signal before the first operation starts
> > to
> > +execute, and the out-syncobjs signal after the last operation
> > +completes. Operations in the operation list can be assumed, where
> > it
> > +matters, to complete in order.
> > +
> > +To aid in supporting user-space queues, the VM_BIND may take a
> > bind context.
> > +
> > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > +drivers to be able to pipeline interleaved gpu_vm modifications
> > and
> > +exec functions. For long-running workloads, such pipelining of a
> > bind
> > +operation is not allowed and any in-fences need to be awaited
> > +synchronously.
> > +
> > +Also for VM_BINDS for long-running gpu_vms the user-mode driver
> > should typically
> > +select memory fences as out-fences since that gives greater
> > flexibility for
> > +the kernel mode driver to inject other=C2=A0 operations into the bind =
/
>=20
> s/other=C2=A0 operations/other operations/ (extra white space)

Thanks. I'll fix this and the other review comments.
/Thomas

>=20
> Francois
>=20
> > +unbind operations. Like for example inserting breakpoints into
> > batch
> > +buffers. The workload execution can then easily be pipelined
> > behind
> > +the bind completion using the memory out-fence as the signal
> > condition
> > +for a gpu semaphore embedded by UMD in the workload.
> > +
> > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The VM_BIND operations of the IOCTL may error due to lack of
> > resources
> > +to complete and also due to interrupted waits. In both situations
> > UMD
> > +should preferably restart the IOCTL after taking suitable action.
> > If
> > +UMD has overcommitted a memory resource, an -ENOSPC error will be
> > +returned, and UMD may then unbind resources that are not used at
> > the
> > +moment and restart the IOCTL. On -EINTR, UMD should simply restart
> > the
> > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > +system memory resources or abort the operation. If aborting as a
> > +result of a failed operation in a list of operations, some
> > operations
> > +may still have completed, and to get back to a known state, user-
> > space
> > +should therefore attempt to unbind all virtual memory regions
> > touched
> > +by the failing IOCTL.
> > +Unbind operations are guaranteed not to cause any errors due to
> > +resource constraints.
> > +In between a failed VM_BIND IOCTL and a successful restart there
> > may
> > +be implementation defined restrictions on the use of the gpu_vm.
> > For a
> > +description why, please see `KMD implementation details`_ under
> > [error
> > +state saving]_.
> > +
> > +Sample uAPI implementations
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +Suggested uAPI implementations at the moment of writing can be
> > found for
> > +the Nouveau driver `here
> > +<
> > https://patchwork.freedesktop.org/patch/543260/?series=3D112994&rev=3D6
> > >`_.
> > +and for the Xe driver `here
> > +<
> > https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_dr
> > m.h?h=3Ddrm-xe-next&id=3D9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> > +
> > +KMD implementation details
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +Open: When the VM_BIND IOCTL returns an error, some or even parts
> > of
> > +an operation may have been completed. If the IOCTL is restarted,
> > in
> > +order to know where to restart, the KMD can either put the gpu_vm
> > in
> > +an error state and save one instance of the needed restart state
> > +internally. In this case, KMD needs to block further modifications
> > of
> > +the gpu_vm state that may cause additional failures requiring a
> > +restart state save, until the error has been fully resolved. If
> > the
> > +uAPI instead defines a pointer to a UMD allocated cookie in the
> > IOCTL
> > +struct, it could also choose to store the restart state in that
> > cookie.
> > +
> > +The restart state may, for example, be the number of successfully
> > +completed operations.
> > +
> > +Easiest for UMD would of course be if KMD did a full unwind on
> > error
> > +so that no error state needs to be saved.
> > diff --git a/Documentation/gpu/rfc/xe.rst
> > b/Documentation/gpu/rfc/xe.rst
> > index 2516fe141db6..0f062e1346d2 100644
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so
> > people don't get it wrong in all
> > =C2=A0possible ways.
> > =C2=A0
> > =C2=A0As a key measurable result, the benefits of ASYNC VM_BIND and a
> > discussion of
> > -various flavors, error handling and a sample API should be
> > documented here or in
> > -a separate document pointed to by this document.
> > +various flavors, error handling and sample API suggestions are
> > documented in
> > +Documentation/gpu/drm-vm-bind-async.rst
> > =C2=A0
> > =C2=A0Userptr integration and vm_bind
> > =C2=A0-------------------------------
> > --=20
> > 2.40.1
> >=20

