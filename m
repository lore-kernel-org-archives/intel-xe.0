Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B4DEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 12:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E610E460;
	Wed, 21 Jun 2023 12:28:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50710E463
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687350495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ODNtWxPrS+P3+kIG6eN3JMpMKb409eCF7GB5U3shNc=;
 b=avJcUV9pdIcEK0ke9te7v27Lp9VLS02hq1aNZZdloVOpmA50hn/IWfEgCq5wQE+4IBasbN
 9EgudYgEXuEHIC+hpcAglenWbqHGkAtZlP/wFy6M4Iu7L1zkalXs68nCLrF+pT/HhmAj5u
 1NfcNdpXNxv5EUx+zF+fGcOMq7gqp30=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-yDNcSZ25PYq7PJBi3rJC7A-1; Wed, 21 Jun 2023 08:28:13 -0400
X-MC-Unique: yDNcSZ25PYq7PJBi3rJC7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f9b0f64149so16668695e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 05:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350488; x=1689942488;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ODNtWxPrS+P3+kIG6eN3JMpMKb409eCF7GB5U3shNc=;
 b=QbC1BAFF7dyJwO+xrCMy7YNRYV+Xk/GiniAvCihoCuX6InGFY2THYoQ0MmdNHGWlDp
 iCzU8OQEzSSA5ayT2fg+9OzyQKKMPbmUC/g2WGpUkkokGOECqbFpl4TQ7Vv56mANhNem
 et/XFLH9U51vtViJiLHYLvJm4Fk/S4RNmYbXHTTzxPYLEJuC1hP2Y9Ng/by1SZI/iYoi
 2DmMykXokTemcIE0N6/Z4a3CBfPCreG5meZN2G8crurXxjTFvpGXuZqVyL+4LWUj3MpP
 +zGHy0xNwhN3XFxJLV1vH+qo+3uc70AnItWhEUWRL09bGFcXvYzsnuT1LIDP9yGzE2ly
 dLew==
X-Gm-Message-State: AC+VfDxABJWLZnKlSb3KDVtIt4uLDKgc0Ua/Yxbb4E2oO/guskvIjG/t
 5DX4ldI4aKkanif77NTctN9VUYgVScJs3E95zZjCc+2Zp9t58YnkUMSE97gHI1dVSTHom4FjZ0l
 MC0uZBIUikUqOE7YC/g5LormIW+I=
X-Received: by 2002:a05:600c:ad2:b0:3f9:bb86:bdd3 with SMTP id
 c18-20020a05600c0ad200b003f9bb86bdd3mr2415718wmr.7.1687350488705; 
 Wed, 21 Jun 2023 05:28:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mKPIqC0zu/ys7v5WXi42P0HPx5eqJ40K+RrFb+Y9/XEgYKSJYwTw9GWYWtVs1pNoEsyuBQw==
X-Received: by 2002:a05:600c:ad2:b0:3f9:bb86:bdd3 with SMTP id
 c18-20020a05600c0ad200b003f9bb86bdd3mr2415691wmr.7.1687350488258; 
 Wed, 21 Jun 2023 05:28:08 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c240900b003f93c450657sm4833810wmp.38.2023.06.21.05.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:28:07 -0700 (PDT)
Date: Wed, 21 Jun 2023 13:23:12 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJLdoPznXusy8l51@pollux>
References: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230621100435.54425-1-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] Documentation/gpu: Add a VM_BIND async
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 12:04:35PM +0200, Thomas Hellström wrote:
> Add a motivation for and description of asynchronous VM_BIND operation
> 
> v2:
> - Fix typos (Nirmoy Das)
> - Improve the description of a memory fence (Oak Zeng)
> - Add a reference to the document in the Xe RFC.
> - Add pointers to sample uAPI suggestions
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-async.rst | 145 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/xe.rst            |   4 +-
>  2 files changed, 147 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> new file mode 100644
> index 000000000000..69aff250b62f
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-async.rst
> @@ -0,0 +1,145 @@
> +====================
> +Asynchronous VM_BIND
> +====================
> +
> +Nomenclature:
> +=============
> +
> +* VRAM: On-device memory. Sometimes referred to as device local memory.
> +
> +* vm: A GPU address space. Typically per process, but can be shared by
> +  multiple processes.

Rather obvious, but maybe specify as "GPU virtual address space" or just
"GPU VA space".

Personally, I don't like "vm" as an abbreviation for "GPU VA space" or "virtual
address space" in general, but it is commonly used and I fail to find a better
one to be honest.

> +
> +* VM_BIND: An operation or a list of operations to modify a vm using
> +  an IOCTL. The operations include mapping and unmapping system- or
> +  VRAM memory.
> +
> +* syncobj: A container that abstracts synchronization objects. The
> +  synchronization objects can be either generic, like dma-fences or
> +  driver specific. A syncobj typically indicates the type of the
> +  underlying synchronization object.
> +
> +* in-syncobj: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> +  for these before starting.
> +
> +* out-syncbj: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> +  signals these when the bind operation is complete.
> +
> +* memory fence: A synchronization object, different from a dma-fence.
> +  A memory fence uses the value of a specified memory location to determine
> +  signaled status. A memory fence can be awaited and signaled by both
> +  the GPU and CPU. Memory fences are sometimes referred to as
> +  user-fences, and do not necessarily bey the dma-fence rule of
> +  signalling within a "reasonable amount of time". The kernel should
> +  thus avoid waiting for memory fences with locks held.
> +
> +* long-running workload: A workload that may take more than the
> +  current stipulated dma-fence maximum signal delay to complete and
> +  which therefore needs to set the VM or the GPU execution context in
> +  a certain mode that disallows completion dma-fences.
> +
> +* UMD: User-mode driver.
> +
> +* KMD: Kernel-mode driver.
> +
> +
> +Synchronous / Asynchronous VM_BIND operation
> +============================================
> +
> +Synchronous VM_BIND
> +___________________
> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> +ioctl returns. A synchronous VM_BIND takes neither in-fences nor

Just some nit-picking: IOCTL is mostly written in caps, maybe you want to stick
to either of the two variants.

> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> +for example swapin or clearing, or even previous binds.
> +
> +Asynchronous VM_BIND
> +____________________
> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> +before modifying the GPU page-tables, and signal the out-syncobjs when
> +the modification is done in the sense that the next execbuf that

Maybe add "execbuf" to the nomenclature.

> +awaits for the out-syncobjs will see the change. Errors are reported
> +synchronously assuming that the asynchronous part of the job never errors.
> +In low-memory situations the implementation may block, performing the
> +VM_BIND synchronously, because there might not be enough memory
> +immediately available for preparing the asynchronous operation.
> +
> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> +the in-syncobjs needs to signal before the first operation starts to
> +execute, and the out-syncobjs signal after the last operation
> +completes. Operations in the operation list can be assumed, where it
> +matters, to complete in order.
> +
> +To aid in supporting user-space queues, the VM_BIND may take a bind context

I think "bind context" should also be explained in the nomenclature.

> +AKA bind engine identifier argument. All VM_BIND operations using the same
> +bind engine can then be assumed, where it matters, to complete in
> +order. No such assumptions can be made between VM_BIND operations
> +using separate bind contexts.
> +
> +The purpose of an Asynchronous VM_BIND operation is for user-mode
> +drivers to be able to pipeline interleaved vm modifications and
> +execbufs. For long-running workloads, such pipelining of a bind
> +operation is not allowed and any in-fences need to be awaited
> +synchronously.
> +
> +Also for VM_BINDS for long-running VMs the user-mode driver should typically
> +select memory fences as out-fences since that gives greater flexibility for
> +the kernel mode driver to inject other  operations into the bind /
> +unbind operations. Like for example inserting breakpoints into batch
> +buffers. The workload execution can then easily be pipelined behind
> +the bind completion using the memory out-fence as the signal condition
> +for a gpu semaphore embedded by UMD in the workload.
> +
> +Multi-operation VM_BIND IOCTL error handling and interrupts
> +========================================
> +
> +The VM_BIND operations of the ioctl may error due to lack of resources
> +to complete and also due to interrupted waits. In both situations UMD
> +should preferably restart the IOCTL after taking suitable action. If
> +UMD has overcommitted a memory resource, an -ENOSPC error will be
> +returned, and UMD may then unbind resources that are not used at the
> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> +IOCTL and on -ENOMEM user-space may either attempt to free known
> +system memory resources or abort the operation. If aborting as a
> +result of a failed operation in a list of operations, some operations
> +may still have completed, and to get back to a known state, user-space
> +should therefore attempt to unbind all virtual memory regions touched
> +by the failing IOCTL.
> +Unbind operations are guaranteed not to cause any errors due to
> +resource constraints.
> +In between a failed VM_BIND ioctl and a successful restart there may
> +be implementation defined restrictions on the use of the VM. For a
> +description why, please see KMD implementation details under [error
> +state saving]_.
> +
> +Sample uAPI implementations
> +======================
> +Suggested uAPI implementations at the moment of writing can be found for
> +the Nouveau driver `here: https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6`
> +and for the Xe driver `here: https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7`
> +
> +KMD implementation details
> +==========================

Maybe we can mention the GPUVA manager as a helper for implementing such an
interface.

Anyway, I will surely add a link pointing to this document to the documentation
of the GPUVA manager.

- Danilo

> +
> +.. [error state saving] Open: When the VM_BIND ioctl returns an error, some
> +			or even parts of an operation may have been
> +			completed. If the ioctl is restarted, in order
> +			to know where to restart, the KMD can
> +			either put the VM in an error state and save
> +			one instance of the needed restart state
> +			internally. In this case, KMD needs to block
> +			further modifications of the VM state that may
> +			cause additional failures requiring a restart
> +			state save, until the error has been fully resolved.
> +			If the uAPI instead defines a pointer to a
> +			UMD allocated cookie in the IOCTL struct, it
> +			could also choose to store the restart state
> +			in that cookie.
> +
> +			The restart state may, for example, be the
> +			number of successfully completed operations.
> +
> +			Easiest for UMD would of course be if KMD did
> +			a full unwind on error so that no error state
> +			needs to be saved.
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..0f062e1346d2 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>  possible ways.
>  
>  As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> -various flavors, error handling and a sample API should be documented here or in
> -a separate document pointed to by this document.
> +various flavors, error handling and sample API suggestions are documented in
> +Documentation/gpu/drm-vm-bind-async.rst
>  
>  Userptr integration and vm_bind
>  -------------------------------
> -- 
> 2.40.1
> 

