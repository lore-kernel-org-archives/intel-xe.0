Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB0CCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 06:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E8A10E00C;
	Thu, 12 Oct 2023 06:41:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F00210E00C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697092907; x=1728628907;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kVEUbCMSohebPwXW4AomZNQcdDCxOCnSBVDsBSo3o+c=;
 b=lM5JRlPIwwGV5xksbM+8Cs7zUy40QVTkXFyF9Z8Kkkm4ht7r43A1+Mvh
 n5Z1vxzabRAaPBBioRcydwMCklSzhxToUoPiPLmr9PfcpCHWLn6U+8WdA
 Pl1pLN7pfQKg+b3/DhlEoLW+ouF4nv0X5SxJ8LxOIUU7lrZvsIfwUbFRS
 JJPcxnldrMObrns0DKJKX6LJHVSEVmGPhmAMo296TCgz6r1c2+dpbbDyX
 /qdKyiISKJJvkk1OobSHC9XJTtwvkZnLshChPQXQGE59Y2gsFLWep8Lr6
 sJdIhGrMLIft3U4HO6IXVJ/RUmGNbM4pn8ER7KT761cS5gI8X4zMpWGsD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388708470"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388708470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877993547"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="877993547"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:41:45 -0700
Message-ID: <3d937c2eba167737eb47916b9589053d23000e02.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 12 Oct 2023 08:41:42 +0200
In-Reply-To: <3d1506a6143f36ade5c49dc3a9370f91fd8d7002.camel@intel.com>
References: <20231010135845.8594-1-thomas.hellstrom@linux.intel.com>
 <3d1506a6143f36ade5c49dc3a9370f91fd8d7002.camel@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC PATCH] Documentation/gpu: Add a VM_BIND async
 document
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2023-10-10 at 21:57 +0000, Zanoni, Paulo R wrote:
> On Tue, 2023-10-10 at 15:58 +0200, Thomas Hellstr=C3=B6m wrote:
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
> > v4:
> > - Address typos (Francois Dugast)
> > - Explain why in-fences are not allowed for VM_BIND operations for
> > long-
> > =C2=A0 running workloads (Matthew Brost)
> > v5:
> > - More typo- and style fixing
> > - Further clarify the implications of disallowing in-fences for
> > VM_BIND
> > =C2=A0 operations for long-running workloads (Matthew Brost)
> > v6:
> > - Point out that a gpu_vm is a virtual GPU Address space.
> > =C2=A0 (Danilo Krummrich)
> > - For an explanation of dma-fences point to the dma-fence
> > documentation.
> > =C2=A0 (Paolo Zanoni)
>=20
> s/Paolo/Paulo/
>=20
> > - Clarify that VM_BIND errors are reported synchronously. (Paulo
> > Zanoni)
> > - Use an rst doc reference when pointing to the async vm_bind
> > document
> > =C2=A0 from the xe merge plan.
> > - Add the VM_BIND documentation to the drm documentation table-of-
> > content,
> > =C2=A0 using an intermediate "Misc DRM driver uAPI- and feature
> > implementation
> > =C2=A0 guidelines"
> > v7:
> > - Update the error handling documentation to remove the VM error
> > state.
> >=20
> > Cc: Paulo R Zanoni <paulo.r.zanoni@intel.com>
>=20
> Reviewed-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

Thanks for the review and the feedback, Paulo.
/Thomas


>=20
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > =C2=A0Documentation/gpu/drm-vm-bind-async.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 309
> > ++++++++++++++++++
> > =C2=A0.../gpu/implementation_guidelines.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
> > =C2=A0Documentation/gpu/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> > =C2=A0Documentation/gpu/rfc/xe.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 4 +-
> > =C2=A04 files changed, 321 insertions(+), 2 deletions(-)
> > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> > =C2=A0create mode 100644 Documentation/gpu/implementation_guidelines.rs=
t
> >=20
> > diff --git a/Documentation/gpu/drm-vm-bind-async.rst
> > b/Documentation/gpu/drm-vm-bind-async.rst
> > new file mode 100644
> > index 000000000000..3d709d02099c
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > @@ -0,0 +1,309 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
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
> > +* ``gpu_vm``: A virtual GPU address space. Typically per process,
> > but
> > +=C2=A0 can be shared by multiple processes.
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
> > +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND
> > operation
> > +=C2=A0 signals these when the bind operation is complete.
> > +
> > +* ``dma-fence``: A cross-driver synchronization object. A basic
> > +=C2=A0 understanding of dma-fences is required to digest this
> > +=C2=A0 document. Please refer to the ``DMA Fences`` section of the
> > +=C2=A0 :doc:`dma-buf doc </driver-api/dma-buf>`.
> > +
> > +* ``memory fence``: A synchronization object, different from a
> > dma-fence.
> > +=C2=A0 A memory fence uses the value of a specified memory location to
> > determine
> > +=C2=A0 signaled status. A memory fence can be awaited and signaled by
> > both
> > +=C2=A0 the GPU and CPU. Memory fences are sometimes referred to as
> > +=C2=A0 user-fences, userspace-fences or gpu futexes and do not
> > necessarily obey
> > +=C2=A0 the dma-fence rule of signaling within a "reasonable amount of
> > time".
> > +=C2=A0 The kernel should thus avoid waiting for memory fences with
> > locks held.
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
> > +=C2=A0 affected gpu_vmas, submits a GPU command batch and registers th=
e
> > +=C2=A0 dma_fence representing the GPU command's activity with all
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
> > +for example swap-in or clearing, or even previous binds.
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
> > +synchronously.
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
> > +Since asynchronous VM_BIND operations may use dma-fences embedded
> > in
> > +out-syncobjs and internally in KMD to signal bind completion,=C2=A0 an=
y
> > +memory fences given as VM_BIND in-fences need to be awaited
> > +synchronously before the VM_BIND ioctl returns, since dma-fences,
> > +required to signal in a reasonable amount of time, can never be
> > made
> > +to depend on memory fences that don't have such a restriction.
> > +
> > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > +drivers to be able to pipeline interleaved gpu_vm modifications
> > and
> > +exec functions. For long-running workloads, such pipelining of a
> > bind
> > +operation is not allowed and any in-fences need to be awaited
> > +synchronously. The reason for this is twofold. First, any memory
> > +fences gated by a long-running workload and used as in-syncobjs
> > for the
> > +VM_BIND operation will need to be awaited synchronously anyway
> > (see
> > +above). Second, any dma-fences used as in-syncobjs for VM_BIND
> > +operations for long-running workloads will not allow for
> > pipelining
> > +anyway since long-running workloads don't allow for dma-fences as
> > +out-syncobjs, so while theoretically possible the use of them is
> > +questionable and should be rejected until there is a valuable use-
> > case.
> > +Note that this is not a limitation imposed by dma-fence rules, but
> > +rather a limitation imposed to keep KMD implementation simple. It
> > does
> > +not affect using dma-fences as dependencies for the long-running
> > +workload itself, which is allowed by dma-fence rules, but rather
> > for
> > +the VM_BIND operation only.
> > +
> > +An asynchronous VM_BIND operation may take substantial time to
> > +complete and signal the out_fence. In particular if the operation
> > is
> > +deeply pipelined behind other VM_BIND operations and workloads
> > +submitted using exec functions. In that case, UMD might want to
> > avoid a
> > +subsequent VM_BIND operation to be queued behind the first one if
> > +there are no explicit dependencies. In order to circumvent such a
> > queue-up, a
> > +VM_BIND implementation may allow for VM_BIND contexts to be
> > +created. For each context, VM_BIND operations will be guaranteed
> > to
> > +complete in the order they were submitted, but that is not the
> > case
> > +for VM_BIND operations executing on separate VM_BIND contexts.
> > Instead
> > +KMD will attempt to execute such VM_BIND operations in parallel
> > but
> > +leaving no guarantee that they will actually be executed in
> > +parallel. There may be internal implicit dependencies that only
> > KMD knows
> > +about, for example page-table structure changes. A way to attempt
> > +to avoid such internal dependencies is to have different VM_BIND
> > +contexts use separate regions of a VM.
> > +
> > +Also for VM_BINDS for long-running gpu_vms the user-mode driver
> > should typically
> > +select memory fences as out-fences since that gives greater
> > flexibility for
> > +the kernel mode driver to inject other operations into the bind /
> > +unbind operations. Like for example inserting breakpoints into
> > batch
> > +buffers. The workload execution can then easily be pipelined
> > behind
> > +the bind completion using the memory out-fence as the signal
> > condition
> > +for a GPU semaphore embedded by UMD in the workload.
> > +
> > +There is no difference in the operations supported or in
> > +multi-operation support between asynchronous VM_BIND and
> > synchronous VM_BIND.
> > +
> > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The VM_BIND operations of the IOCTL may error for various reasons,
> > for
> > +example due to lack of resources to complete and due to
> > interrupted
> > +waits.
> > +In these situations UMD should preferably restart the IOCTL after
> > +taking suitable action.
> > +If UMD has over-committed a memory resource, an -ENOSPC error will
> > be
> > +returned, and UMD may then unbind resources that are not used at
> > the
> > +moment and rerun the IOCTL. On -EINTR, UMD should simply rerun the
> > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > +system memory resources or fail. In case of UMD deciding to fail a
> > +bind operation, due to an error return, no additional action is
> > needed
> > +to clean up the failed operation, and the VM is left in the same
> > state
> > +as it was before the failing IOCTL.
> > +Unbind operations are guaranteed not to return any errors due to
> > +resource constraints, but may return errors due to, for example,
> > +invalid arguments or the gpu_vm being banned.
> > +In the case an unexpected error happens during the asynchronous
> > bind
> > +process, the gpu_vm will be banned, and attempts to use it after
> > banning
> > +will return -ENOENT.
> > +
> > +Example: The Xe VM_BIND uAPI
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +
> > +Starting with the VM_BIND operation struct, the IOCTL call can
> > take
> > +zero, one or many such operations. A zero number means only the
> > +synchronization part of the IOCTL is carried out: an asynchronous
> > +VM_BIND updates the syncobjects, whereas a sync VM_BIND waits for
> > the
> > +implicit dependencies to be fulfilled.
> > +
> > +.. code-block:: c
> > +
> > +=C2=A0=C2=A0 struct drm_xe_vm_bind_op {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @obj: GEM object to opera=
te on, MBZ for MAP_USERPTR, MBZ
> > for UNMAP
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 obj;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * @obj_offset: Offset into the object for MAP.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__u64 obj_offset;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/** @userptr: user virtual address for MAP_USERPTR
> > */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__u64 userptr;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @range: Number of bytes f=
rom the object to bind to addr,
> > MBZ for UNMAP_ALL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 range;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @addr: Address to operat=
e on, MBZ for UNMAP_ALL */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 addr;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @tile_mask: Mask for whic=
h tiles to create binds for, 0
> > =3D=3D All tiles,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * only applies to creating =
new VMAs
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 tile_mask;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Map (parts of) an object into =
the GPU virtual address
> > range.
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_OP_MAP=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Unmap a GPU virtual addr=
ess range */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_OP_UNMAP=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Map a CPU virtual address=
 range into a GPU virtual
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address range.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_OP_MAP_USERPTR=C2=A0=C2=A00x2
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Unmap a gem object from =
the VM. */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_OP_UNMAP_ALL=C2=A0=C2=A0=C2=A0=
=C2=A00x3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make the backing memory o=
f an address range resident if
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * possible. Note that this =
doesn't pin backing memory.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_OP_PREFETCH=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x4
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Make the GPU map readonl=
y. */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_FLAG_READONLY=C2=A0=C2=A0=C2=A0(=
0x1 << 16)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Valid on a faulting VM on=
ly, do the MAP operation
> > immediately rather
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * than deferring the MAP to=
 the page fault handler.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_FLAG_IMMEDIATE=C2=A0=C2=A0(0x1 <=
< 17)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * When the NULL flag is set=
, the page tables are setup
> > with a special
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bit which indicates write=
s are dropped and all reads
> > return zero.=C2=A0 In
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the future, the NULL flag=
s will only be valid for
> > XE_VM_BIND_OP_MAP
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * operations, the BO handle=
 MBZ, and the BO offset MBZ.
> > This flag is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * intended to implement VK =
sparse bindings.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_FLAG_NULL=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0(0x1 << 18)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @op: Operation to perfor=
m (lower 16 bits) and flags
> > (upper 16 bits) */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 op;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @mem_region: Memory regi=
on to prefetch VMA to, instance
> > not a mask */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 region;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @reserved: Reserved */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 reserved[2];
> > +=C2=A0=C2=A0 };
> > +
> > +
> > +The VM_BIND IOCTL argument itself, looks like follows. Note that
> > for
> > +synchronous VM_BIND, the num_syncs and syncs fields must be zero.
> > Here
> > +the ``exec_queue_id`` field is the VM_BIND context discussed
> > previously
> > +that is used to facilitate out-of-order VM_BINDs.
> > +
> > +.. code-block:: c
> > +
> > +=C2=A0=C2=A0=C2=A0 struct drm_xe_vm_bind {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @extensions: Pointer to =
the first extension struct, if
> > any */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 extensions;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM=
 to bind to */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @exec_queue_id: exec_queu=
e_id, must be of class
> > DRM_XE_ENGINE_CLASS_VM_BIND
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and exec queue must have =
same vm_id. If zero, the
> > default VM bind engine
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is used.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 exec_queue_id;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @num_binds: number of bi=
nds in this IOCTL */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_binds;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If set, perform an async=
 VM_BIND, if clear a sync
> > VM_BIND */
> > +=C2=A0=C2=A0=C2=A0 #define XE_VM_BIND_IOCTL_FLAG_ASYNC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x1 << 0)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @flag: Flags controlling=
 all operations in this ioctl.
> > */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/** @bind: used if num_binds =3D=3D 1 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct drm_xe_vm_bind_op bind;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/**
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * @vector_of_binds: userptr to array of struct
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 * drm_xe_vm_bind_op if num_binds > 1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__u64 vector_of_binds;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @num_syncs: amount of sy=
ncs to wait for or to signal on
> > completion. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_syncs;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @pad2: MBZ */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad2;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @syncs: pointer to struc=
t drm_xe_sync array */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 syncs;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @reserved: Reserved */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 reserved[2];
> > +=C2=A0=C2=A0=C2=A0 };
> > diff --git a/Documentation/gpu/implementation_guidelines.rst
> > b/Documentation/gpu/implementation_guidelines.rst
> > new file mode 100644
> > index 000000000000..138e637dcc6b
> > --- /dev/null
> > +++ b/Documentation/gpu/implementation_guidelines.rst
> > @@ -0,0 +1,9 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Misc DRM driver uAPI- and feature implementation guidelines
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. toctree::
> > +
> > +=C2=A0=C2=A0 drm-vm-bind-async
> > diff --git a/Documentation/gpu/index.rst
> > b/Documentation/gpu/index.rst
> > index e45ff0915246..37e383ccf73f 100644
> > --- a/Documentation/gpu/index.rst
> > +++ b/Documentation/gpu/index.rst
> > @@ -18,6 +18,7 @@ GPU Driver Developer's Guide
> > =C2=A0=C2=A0=C2=A0 vga-switcheroo
> > =C2=A0=C2=A0=C2=A0 vgaarbiter
> > =C2=A0=C2=A0=C2=A0 automated_testing
> > +=C2=A0=C2=A0 implementation_guidelines
> > =C2=A0=C2=A0=C2=A0 todo
> > =C2=A0=C2=A0=C2=A0 rfc/index
> > =C2=A0
> > diff --git a/Documentation/gpu/rfc/xe.rst
> > b/Documentation/gpu/rfc/xe.rst
> > index b67f8e6a1825..c29113a0ac30 100644
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -97,8 +97,8 @@ memory fences. Ideally with helper support so
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
> > +:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
> > =C2=A0
> > =C2=A0Userptr integration and vm_bind
> > =C2=A0-------------------------------
>=20

