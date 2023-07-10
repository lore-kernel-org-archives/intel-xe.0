Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B61EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 18:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6E510E0A4;
	Mon, 10 Jul 2023 18:59:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC0D10E0A4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 18:59:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BEAA611A8;
 Mon, 10 Jul 2023 18:59:40 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id BA12BC433C7;
 Mon, 10 Jul 2023 18:59:37 +0000 (UTC)
Date: Mon, 10 Jul 2023 14:59:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZKxVFyqMgRPyek8u@rdvivi-mobl4>
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
 <ZJw0_7x9uJ5D9pBk@fdugast-desk.home>
 <eb511785c4ce4e0d580c4849ce680e2b8a39ff57.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb511785c4ce4e0d580c4849ce680e2b8a39ff57.camel@linux.intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023 at 09:44:16AM +0200, Thomas Hellström wrote:
> Hi, Francois,
> 
> On Wed, 2023-06-28 at 15:26 +0200, Francois Dugast wrote:
> > Hi Thomas,
> > 
> > On Wed, Jun 28, 2023 at 02:51:46PM +0200, Thomas Hellström wrote:
> > > Add a motivation for and description of asynchronous VM_BIND
> > > operation
> > > 
> > > v2:
> > > - Fix typos (Nirmoy Das)
> > > - Improve the description of a memory fence (Oak Zeng)
> > > - Add a reference to the document in the Xe RFC.
> > > - Add pointers to sample uAPI suggestions
> > > v3:
> > > - Address review comments (Danilo Krummrich)
> > > - Formatting fixes
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >  Documentation/gpu/drm-vm-bind-async.rst | 150
> > > ++++++++++++++++++++++++
> > >  Documentation/gpu/rfc/xe.rst            |   4 +-
> > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> > > 
> > > diff --git a/Documentation/gpu/drm-vm-bind-async.rst
> > > b/Documentation/gpu/drm-vm-bind-async.rst
> > > new file mode 100644
> > > index 000000000000..8f9e2d5c8f0f
> > > --- /dev/null
> > > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > > @@ -0,0 +1,150 @@
> > > +====================
> > > +Asynchronous VM_BIND
> > > +====================
> > > +
> > > +Nomenclature:
> > > +=============
> > > +
> > > +* ``VRAM``: On-device memory. Sometimes referred to as device
> > > local memory.
> > > +
> > > +* ``gpu_vm``: A GPU address space. Typically per process, but can
> > > be shared by
> > > +  multiple processes.
> > > +
> > > +* ``VM_BIND``: An operation or a list of operations to modify a
> > > gpu_vm using
> > > +  an IOCTL. The operations include mapping and unmapping system-
> > > or
> > > +  VRAM memory.
> > > +
> > > +* ``syncobj``: A container that abstracts synchronization objects.
> > > The
> > > +  synchronization objects can be either generic, like dma-fences
> > > or
> > > +  driver specific. A syncobj typically indicates the type of the
> > > +  underlying synchronization object.
> > > +
> > > +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND
> > > operation waits
> > > +  for these before starting.
> > > +
> > > +* ``out-syncbj``: Argument to a VM_BIND_IOCTL, the VM_BIND
> > > operation
> > > +  signals these when the bind operation is complete.
> > > +
> > > +* ``memory fence``: A synchronization object, different from a
> > > dma-fence.
> > > +  A memory fence uses the value of a specified memory location to
> > > determine
> > > +  signaled status. A memory fence can be awaited and signaled by
> > > both
> > > +  the GPU and CPU. Memory fences are sometimes referred to as
> > > +  user-fences, and do not necessarily bey the dma-fence rule of
> > 
> > s/bey/obey/
> > 
> > > +  signalling within a "reasonable amount of time". The kernel
> > > should
> > > +  thus avoid waiting for memory fences with locks held.
> > > +
> > > +* ``long-running workload``: A workload that may take more than
> > > the
> > > +  current stipulated dma-fence maximum signal delay to complete
> > > and
> > > +  which therefore needs to set the gpu_vm or the GPU execution
> > > context in
> > > +  a certain mode that disallows completion dma-fences.
> > > +
> > > +* ``exec function``: An exec function is a function that
> > > revalidates all
> > > +  affected vmas, submits a gpu command batch and registers the
> > 
> > The document sometimes uses "GPU" and sometimes "gpu", maybe we can
> > stick to
> > "GPU" everywhere?
> > 
> > > +  dma_fence representing the gpu command's activity with all
> > > affected
> > > +  dma_resvs. For completeness, although not covered by this
> > > document,
> > > +  it's worth mentioning that an exec function may also be the
> > > +  revalidation worker that is used by some drivers in compute /
> > > +  long-running mode.
> > > +
> > > +* ``bind context``: A context identifier used for the VM_BIND
> > > +  operation. VM_BIND operations that use the same bind context can
> > > be
> > > +  assumed, where it matters, to complete in order of submission.
> > > No such
> > > +  assumptions can be made for VM_BIND operations using separate
> > > bind contexts.
> > > +
> > > +* ``UMD``: User-mode driver.
> > > +
> > > +* ``KMD``: Kernel-mode driver.
> > > +
> > > +
> > > +Synchronous / Asynchronous VM_BIND operation
> > > +============================================
> > > +
> > > +Synchronous VM_BIND
> > > +___________________
> > > +With Synchronous VM_BIND, the VM_BIND operations all complete
> > > before the
> > > +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> > > +out-fences. Synchronous VM_BIND may block and wait for GPU
> > > operations;
> > > +for example swapin or clearing, or even previous binds.
> > 
> > s/swapin/swapping/ ?
> 
> It should say swap-in,
> 
> > 
> > > +
> > > +Asynchronous VM_BIND
> > > +____________________
> > > +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs.
> > > While the
> > > +IOCTL may return immediately, the VM_BIND operations wait for the
> > > in-syncobjs
> > > +before modifying the GPU page-tables, and signal the out-syncobjs
> > > when
> > > +the modification is done in the sense that the next exec function
> > > that
> > > +awaits for the out-syncobjs will see the change. Errors are
> > > reported
> > > +synchronously assuming that the asynchronous part of the job never
> > > errors.
> > > +In low-memory situations the implementation may block, performing
> > > the
> > > +VM_BIND synchronously, because there might not be enough memory
> > > +immediately available for preparing the asynchronous operation.
> > > +
> > > +If the VM_BIND IOCTL takes a list or an array of operations as an
> > > argument,
> > > +the in-syncobjs needs to signal before the first operation starts
> > > to
> > > +execute, and the out-syncobjs signal after the last operation
> > > +completes. Operations in the operation list can be assumed, where
> > > it
> > > +matters, to complete in order.
> > > +
> > > +To aid in supporting user-space queues, the VM_BIND may take a
> > > bind context.
> > > +
> > > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > > +drivers to be able to pipeline interleaved gpu_vm modifications
> > > and
> > > +exec functions. For long-running workloads, such pipelining of a
> > > bind
> > > +operation is not allowed and any in-fences need to be awaited
> > > +synchronously.
> > > +
> > > +Also for VM_BINDS for long-running gpu_vms the user-mode driver
> > > should typically
> > > +select memory fences as out-fences since that gives greater
> > > flexibility for
> > > +the kernel mode driver to inject other  operations into the bind /
> > 
> > s/other  operations/other operations/ (extra white space)
> 
> Thanks. I'll fix this and the other review comments.

for the next rounds, please include dri-devel

> /Thomas
> 
> > 
> > Francois
> > 
> > > +unbind operations. Like for example inserting breakpoints into
> > > batch
> > > +buffers. The workload execution can then easily be pipelined
> > > behind
> > > +the bind completion using the memory out-fence as the signal
> > > condition
> > > +for a gpu semaphore embedded by UMD in the workload.
> > > +
> > > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > > +===========================================================
> > > +
> > > +The VM_BIND operations of the IOCTL may error due to lack of
> > > resources
> > > +to complete and also due to interrupted waits. In both situations
> > > UMD
> > > +should preferably restart the IOCTL after taking suitable action.
> > > If
> > > +UMD has overcommitted a memory resource, an -ENOSPC error will be
> > > +returned, and UMD may then unbind resources that are not used at
> > > the
> > > +moment and restart the IOCTL. On -EINTR, UMD should simply restart
> > > the
> > > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > > +system memory resources or abort the operation. If aborting as a
> > > +result of a failed operation in a list of operations, some
> > > operations
> > > +may still have completed, and to get back to a known state, user-
> > > space
> > > +should therefore attempt to unbind all virtual memory regions
> > > touched
> > > +by the failing IOCTL.
> > > +Unbind operations are guaranteed not to cause any errors due to
> > > +resource constraints.
> > > +In between a failed VM_BIND IOCTL and a successful restart there
> > > may
> > > +be implementation defined restrictions on the use of the gpu_vm.
> > > For a
> > > +description why, please see `KMD implementation details`_ under
> > > [error
> > > +state saving]_.
> > > +
> > > +Sample uAPI implementations
> > > +===========================
> > > +Suggested uAPI implementations at the moment of writing can be
> > > found for
> > > +the Nouveau driver `here
> > > +<
> > > https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6
> > > >`_.
> > > +and for the Xe driver `here
> > > +<
> > > https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_dr
> > > m.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> > > +
> > > +KMD implementation details
> > > +==========================
> > > +
> > > +Open: When the VM_BIND IOCTL returns an error, some or even parts
> > > of
> > > +an operation may have been completed. If the IOCTL is restarted,
> > > in
> > > +order to know where to restart, the KMD can either put the gpu_vm
> > > in
> > > +an error state and save one instance of the needed restart state
> > > +internally. In this case, KMD needs to block further modifications
> > > of
> > > +the gpu_vm state that may cause additional failures requiring a
> > > +restart state save, until the error has been fully resolved. If
> > > the
> > > +uAPI instead defines a pointer to a UMD allocated cookie in the
> > > IOCTL
> > > +struct, it could also choose to store the restart state in that
> > > cookie.
> > > +
> > > +The restart state may, for example, be the number of successfully
> > > +completed operations.
> > > +
> > > +Easiest for UMD would of course be if KMD did a full unwind on
> > > error
> > > +so that no error state needs to be saved.
> > > diff --git a/Documentation/gpu/rfc/xe.rst
> > > b/Documentation/gpu/rfc/xe.rst
> > > index 2516fe141db6..0f062e1346d2 100644
> > > --- a/Documentation/gpu/rfc/xe.rst
> > > +++ b/Documentation/gpu/rfc/xe.rst
> > > @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so
> > > people don't get it wrong in all
> > >  possible ways.
> > >  
> > >  As a key measurable result, the benefits of ASYNC VM_BIND and a
> > > discussion of
> > > -various flavors, error handling and a sample API should be
> > > documented here or in
> > > -a separate document pointed to by this document.
> > > +various flavors, error handling and sample API suggestions are
> > > documented in
> > > +Documentation/gpu/drm-vm-bind-async.rst
> > >  
> > >  Userptr integration and vm_bind
> > >  -------------------------------
> > > -- 
> > > 2.40.1
> > > 
> 
