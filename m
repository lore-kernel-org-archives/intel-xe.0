Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AFBCD68F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 06:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164710E31B;
	Tue, 10 Oct 2023 06:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A012D10E1B9
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696919679; x=1728455679;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zpgyh1QSlWEpk+ErK+zUrxBbfmLRq2D63gPIuFw+z74=;
 b=Ao7LXBgoFKHBT1mVNtWnlyrR9KxyJSW4oPzrDlxjpQnlbc7WhTRMu+CV
 sYcuw0vdCpkoUtX7r5v2OVKRNDuRAcM4/zGL5qP3wi9nredguOiHSHK90
 udM0dcJXjlcFb9dU8+w5zj62UTpLKAoeA1jouBtiUJQqQfm1TkloHWi0J
 COnuy++MCvMJ4Ifgh21yqyYrYcxwVxCz3v7eHqv5O1LAWX7scmexK+9f+
 9fS9cGV1yVdB9NpSqSL7MU5Nb/OjVc0tKZ630VIQJdNVNSsNFMsao7w7N
 8ZF17zpKUL1P2X3NN1eyhxFSQAmiF1yaYBpACX1TNDyc3IBLPzUJejaqX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374664946"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="374664946"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 23:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823657892"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="823657892"
Received: from agargas-mobl.ger.corp.intel.com (HELO [10.249.254.164])
 ([10.249.254.164])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 23:34:36 -0700
Message-ID: <f52ecbda-8062-1fbc-4622-0e08ea357bf3@linux.intel.com>
Date: Tue, 10 Oct 2023 08:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231006083935.3924-1-thomas.hellstrom@linux.intel.com>
 <21137789b15748d9d3e458df137ea618ccbc6aea.camel@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <21137789b15748d9d3e458df137ea618ccbc6aea.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/9/23 19:54, Zanoni, Paulo R wrote:
> On Fri, 2023-10-06 at 10:39 +0200, Thomas Hellström wrote:
>> Add a motivation for and description of asynchronous VM_BIND operation
>>
>> v2:
>> - Fix typos (Nirmoy Das)
>> - Improve the description of a memory fence (Oak Zeng)
>> - Add a reference to the document in the Xe RFC.
>> - Add pointers to sample uAPI suggestions
>> v3:
>> - Address review comments (Danilo Krummrich)
>> - Formatting fixes
>> v4:
>> - Address typos (Francois Dugast)
>> - Explain why in-fences are not allowed for VM_BIND operations for long-
>>    running workloads (Matthew Brost)
>> v5:
>> - More typo- and style fixing
>> - Further clarify the implications of disallowing in-fences for VM_BIND
>>    operations for long-running workloads (Matthew Brost)
>> v6:
>> - Point out that a gpu_vm is a virtual GPU Address space.
>>    (Danilo Krummrich)
>> - For an explanation of dma-fences point to the dma-fence documentation.
>>    (Paolo Zanoni)
>> - Clarify that VM_BIND errors are reported synchronously. (Paulo Zanoni)
>> - Use an rst doc reference when pointing to the async vm_bind document
>>    from the xe merge plan.
>> - Add the VM_BIND documentation to the drm documentation table-of-content,
>>    using an intermediate "Misc DRM driver uAPI- and feature implementation
>>    guidelines"
>> v7:
>> - Update the error handling documentation to remove the VM error state.
>>
>> Cc: Paulo R Zanoni <paulo.r.zanoni@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/drm-vm-bind-async.rst       | 305 ++++++++++++++++++
>>   .../gpu/implementation_guidelines.rst         |   9 +
>>   Documentation/gpu/index.rst                   |   1 +
>>   Documentation/gpu/rfc/xe.rst                  |   4 +-
>>   4 files changed, 317 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
>>   create mode 100644 Documentation/gpu/implementation_guidelines.rst
>>
>> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
>> new file mode 100644
>> index 000000000000..47ca24b647dc
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-vm-bind-async.rst
>> @@ -0,0 +1,305 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +====================
>> +Asynchronous VM_BIND
>> +====================
>> +
>> +Nomenclature:
>> +=============
>> +
>> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
>> +
>> +* ``gpu_vm``: A virtual GPU address space. Typically per process, but
>> +  can be shared by multiple processes.
>> +
>> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
>> +  an IOCTL. The operations include mapping and unmapping system- or
>> +  VRAM memory.
>> +
>> +* ``syncobj``: A container that abstracts synchronization objects. The
>> +  synchronization objects can be either generic, like dma-fences or
>> +  driver specific. A syncobj typically indicates the type of the
>> +  underlying synchronization object.
>> +
>> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
>> +  for these before starting.
>> +
>> +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
>> +  signals these when the bind operation is complete.
>> +
>> +* ``dma-fence``: A cross-driver synchronization object. A basic
>> +  understanding of dma-fences is required to digest this
>> +  document. Please refer to the ``DMA Fences`` section of the
>> +  :doc:`dma-buf doc </driver-api/dma-buf>`.
>> +
>> +* ``memory fence``: A synchronization object, different from a dma-fence.
>> +  A memory fence uses the value of a specified memory location to determine
>> +  signaled status. A memory fence can be awaited and signaled by both
>> +  the GPU and CPU. Memory fences are sometimes referred to as
>> +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
>> +  the dma-fence rule of signaling within a "reasonable amount of time".
>> +  The kernel should thus avoid waiting for memory fences with locks held.
>> +
>> +* ``long-running workload``: A workload that may take more than the
>> +  current stipulated dma-fence maximum signal delay to complete and
>> +  which therefore needs to set the gpu_vm or the GPU execution context in
>> +  a certain mode that disallows completion dma-fences.
>> +
>> +* ``exec function``: An exec function is a function that revalidates all
>> +  affected gpu_vmas, submits a GPU command batch and registers the
>> +  dma_fence representing the GPU command's activity with all affected
>> +  dma_resvs. For completeness, although not covered by this document,
>> +  it's worth mentioning that an exec function may also be the
>> +  revalidation worker that is used by some drivers in compute /
>> +  long-running mode.
>> +
>> +* ``bind context``: A context identifier used for the VM_BIND
>> +  operation. VM_BIND operations that use the same bind context can be
>> +  assumed, where it matters, to complete in order of submission. No such
>> +  assumptions can be made for VM_BIND operations using separate bind contexts.
>> +
>> +* ``UMD``: User-mode driver.
>> +
>> +* ``KMD``: Kernel-mode driver.
>> +
>> +
>> +Synchronous / Asynchronous VM_BIND operation
>> +============================================
>> +
>> +Synchronous VM_BIND
>> +___________________
>> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
>> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
>> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
>> +for example swap-in or clearing, or even previous binds.
>> +
>> +Asynchronous VM_BIND
>> +____________________
>> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
>> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
>> +before modifying the GPU page-tables, and signal the out-syncobjs when
>> +the modification is done in the sense that the next exec function that
>> +awaits for the out-syncobjs will see the change. Errors are reported
>> +synchronously.
>> +In low-memory situations the implementation may block, performing the
>> +VM_BIND synchronously, because there might not be enough memory
>> +immediately available for preparing the asynchronous operation.
>> +
>> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
>> +the in-syncobjs needs to signal before the first operation starts to
>> +execute, and the out-syncobjs signal after the last operation
>> +completes. Operations in the operation list can be assumed, where it
>> +matters, to complete in order.
>> +
>> +Since asynchronous VM_BIND operations may use dma-fences embedded in
>> +out-syncobjs and internally in KMD to signal bind completion,  any
>> +memory fences given as VM_BIND in-fences need to be awaited
>> +synchronously before the VM_BIND ioctl returns, since dma-fences,
>> +required to signal in a reasonable amount of time, can never be made
>> +to depend on memory fences that don't have such a restriction.
>> +
>> +The purpose of an Asynchronous VM_BIND operation is for user-mode
>> +drivers to be able to pipeline interleaved gpu_vm modifications and
>> +exec functions. For long-running workloads, such pipelining of a bind
>> +operation is not allowed and any in-fences need to be awaited
>> +synchronously. The reason for this is twofold. First, any memory
>> +fences gated by a long-running workload and used as in-syncobjs for the
>> +VM_BIND operation will need to be awaited synchronously anyway (see
>> +above). Second, any dma-fences used as in-syncobjs for VM_BIND
>> +operations for long-running workloads will not allow for pipelining
>> +anyway since long-running workloads don't allow for dma-fences as
>> +out-syncobjs, so while theoretically possible the use of them is
>> +questionable and should be rejected until there is a valuable use-case.
>> +Note that this is not a limitation imposed by dma-fence rules, but
>> +rather a limitation imposed to keep KMD implementation simple. It does
>> +not affect using dma-fences as dependencies for the long-running
>> +workload itself, which is allowed by dma-fence rules, but rather for
>> +the VM_BIND operation only.
>> +
>> +An asynchronous VM_BIND operation may take substantial time to
>> +complete and signal the out_fence. In particualr if the operation is
> s/particualr/particular/
>
>
>
>> +deeply pipelined behind other VM_BIND operations and workloads
>> +submitted using exec functions. In that case, UMD might want to avoid a
>> +subsequent VM_BIND operation to be queued behind the first one if
>> +there are no explicit dependencies. In order to circumvent such a queue-up, a
>> +VM_BIND implementation may allow for VM_BIND contexts to be
>> +created. For each context, VM_BIND operations will be guaranteed to
>> +complete in the order they were submitted, but that is not the case
>> +for VM_BIND operations executing on separate VM_BIND contexts. Instead
>> +KMD will attempt to execute such VM_BIND operations in parallel but
>> +leaving no guarantee that they will actually be executed in
>> +parallel. There may be internal implicit dependencies that only KMD knows
>> +about, for example page-table structure changes. A way to attempt
>> +to avoid such internal dependencies is to have different VM_BIND
>> +contexts use separate regions of a VM.
>> +
>> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
>> +select memory fences as out-fences since that gives greater flexibility for
>> +the kernel mode driver to inject other operations into the bind /
>> +unbind operations. Like for example inserting breakpoints into batch
>> +buffers. The workload execution can then easily be pipelined behind
>> +the bind completion using the memory out-fence as the signal condition
>> +for a GPU semaphore embedded by UMD in the workload.
>> +
>> +Multi-operation VM_BIND IOCTL error handling and interrupts
>> +===========================================================
> Is multi-operation exclusive to Asynchronous? Or will it be allowed to
> happen with Synchronous ioctls too? Please write that in the document.
> The last time I checked this was not allowed on xe.ko.

Multi-operation will be allowed with synchronous VM_BINDs too. It is not 
currently in xe, but that will change,
will update that in the document.

>
> If it's allowed on Synchronous, can things fail after only a certain
> amount of operations was completed? If yes, does the Kernel undo things
> before returning, or does it leave things in undefined state?
No undefined state. KMD will unwind and rollback.
>
>
>> +
>> +The VM_BIND operations of the IOCTL may error for various reasons, for
>> +example due to lack of resources to complete and due to interrupted
>> +waits.
>> +In these situations UMD should preferably restart the IOCTL after
>> +taking suitable action.
>> +If UMD has over-committed a memory resource, an -ENOSPC error will be
>> +returned, and UMD may then unbind resources that are not used at the
>> +moment and rerun the IOCTL. On -EINTR, UMD should simply rerun the
>> +IOCTL and on -ENOMEM user-space may either attempt to free known
>> +system memory resources or fail. In case of UMD deciding to fail a
>> +bind operation, due to an error return, no additional action is needed
>> +to clean up the failed operation.
> Ok, so no state machine, this is clearer.
>
> Since this is is all asynchronous, I would assume that when the ioctl
> returns an error the VM is left exactly in the same state it was before
> the ioctl that failed. Is that correct? If yes, can you please write
> that out in the comment?
That's correct, yes will do.
> If no, you'll have to explain how would this
> be even possible (since it's supposed to be an async ioctl).
>
>
>> +Unbind operations are guaranteed not to return any errors due to
>> +resource constraints, but may return errors due to, for example,
>> +invalid arguments or the gpu_vm being banned.
>> +In the case an unexpected error happens during the asynchronous bind
>> +process, the gpu_vm will be banned, and attempts to use it after banning
>> +will return -ENOENT.
>> +
>> +Example: The Xe VM_BIND uAPI
>> +============================
>> +
>> +Starting with the VM_BIND operation struct, the IOCTL call can take
>> +zero, one or many such operations. A zero number means only the
>> +synchronization part of the IOCTL is carried out: an asynchronous
>> +VM_BIND updates the syncobjects, whereas a sync VM_BIND waits for the
>> +implicit dependencies to be fulfilled.
>> +
>> +.. code-block:: c
>> +
>> +   struct drm_xe_vm_bind_op {
>> +	/**
>> +	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
>> +	 */
>> +	__u32 obj;
>> +
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>> +
>> +	union {
>> +		/**
>> +		 * @obj_offset: Offset into the object for MAP.
>> +		 */
>> +		__u64 obj_offset;
>> +
>> +		/** @userptr: user virtual address for MAP_USERPTR */
>> +		__u64 userptr;
>> +	};
>> +
>> +	/**
>> +	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
>> +	 */
>> +	__u64 range;
>> +
>> +	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
>> +	__u64 addr;
>> +
>> +	/**
>> +	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
>> +	 * only applies to creating new VMAs
>> +	 */
>> +	__u64 tile_mask;
>> +
>> +       /* Map (parts of) an object into the GPU virtual address range.
>> +    #define XE_VM_BIND_OP_MAP		0x0
>> +        /* Unmap a GPU virtual address range */
>> +    #define XE_VM_BIND_OP_UNMAP		0x1
>> +        /*
>> +	 * Map a u CPU virtual address range into a GPU virtual
> I guess "a u" is a typo here.
Yes. Will fix.
>
>
>> +	 * address range.
>> +	 */
>> +    #define XE_VM_BIND_OP_MAP_USERPTR	0x2
>> +        /* Unmap a gem object from the VM. */
>> +    #define XE_VM_BIND_OP_UNMAP_ALL	0x3
>> +        /*
>> +	 * Make the backing memory of an address range resident if
>> +	 * possible. Note that this doesn't pin backing memory.
>> +	 */
>> +    #define XE_VM_BIND_OP_PREFETCH	0x4
>> +
>> +        /* Make the GPU map readonly. */
>> +    #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
>> +	/*
>> +	 * Valid on a faulting VM only, do the MAP operation immediately rather
>> +	 * than deferring the MAP to the page fault handler.
>> +	 */
>> +    #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 17)
>> +	/*
>> +	 * When the NULL flag is set, the page tables are setup with a special
>> +	 * bit which indicates writes are dropped and all reads return zero.  In
>> +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
>> +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>> +	 * intended to implement VK sparse bindings.
>> +	 */
>> +    #define XE_VM_BIND_FLAG_NULL	(0x1 << 18)
>> +	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>> +	__u32 op;
>> +
>> +	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>> +	__u32 region;
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +   };
>> +
>> +
>> +The VM_BIND IOCTL argument itself, looks like follows. Note that for
>> +synchronous VM_BIND, the num_syncs and syncs fields must be zero. Here
>> +the ``exec_queue_id`` field is the VM_BIND context discussed previously
>> +that is used to facilitate out-of-order VM_BINDs.
>> +
>> +.. code-block:: c
>> +
>> +    struct drm_xe_vm_bind {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: The ID of the VM to bind to */
>> +	__u32 vm_id;
>> +
>> +	/**
>> +	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
>> +	 * and exec queue must have same vm_id. If zero, the default VM bind engine
>> +	 * is used.
>> +	 */
>> +	__u32 exec_queue_id;
>> +
>> +	/** @num_binds: number of binds in this IOCTL */
>> +	__u32 num_binds;
> Regarding my question above, this is not documented as ">1 not allowed
> for synchronous ops" (which I believe was the case on xe.ko the last
> time I checked, so: is it going to change?).
>
Yes.
>> +
>> +        /* If set, perform an async VM_BIND, if clear a sync VM_BIND */
>> +    #define XE_VM_BIND_IOCTL_FLAG_ASYNC	(0x1 << 0)
>> +
>> +	/** @flag: Flags controlling all operations in this ioctl. */
>> +	__u32 flags;
>> +
>> +	union {
>> +		/** @bind: used if num_binds == 1 */
>> +		struct drm_xe_vm_bind_op bind;
>> +
>> +		/**
>> +		 * @vector_of_binds: userptr to array of struct
>> +		 * drm_xe_vm_bind_op if num_binds > 1
>> +		 */
>> +		__u64 vector_of_binds;
>> +	};
>> +
>> +	/** @num_syncs: amount of syncs to wait for or to signal on completion. */
>> +	__u32 num_syncs;
>> +
>> +	/** @pad2: MBZ */
>> +	__u32 pad2;
>> +
>> +	/** @syncs: pointer to struct drm_xe_sync array */
>> +	__u64 syncs;
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +    };
>> diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
>> new file mode 100644
>> index 000000000000..138e637dcc6b
>> --- /dev/null
>> +++ b/Documentation/gpu/implementation_guidelines.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +===========================================================
>> +Misc DRM driver uAPI- and feature implementation guidelines
>> +===========================================================
>> +
>> +.. toctree::
>> +
>> +   drm-vm-bind-async
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index e45ff0915246..37e383ccf73f 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -18,6 +18,7 @@ GPU Driver Developer's Guide
>>      vga-switcheroo
>>      vgaarbiter
>>      automated_testing
>> +   implementation_guidelines
>>      todo
>>      rfc/index
>>   
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index b67f8e6a1825..c29113a0ac30 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -97,8 +97,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>>   possible ways.
>>   
>>   As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
>> -various flavors, error handling and a sample API should be documented here or in
>> -a separate document pointed to by this document.
>> +various flavors, error handling and sample API suggestions are documented in
>> +:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
>>   
>>   Userptr integration and vm_bind
>>   -------------------------------

Thanks,

Thomas


