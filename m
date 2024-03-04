Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A05C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 09:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAEC10E862;
	Mon,  4 Mar 2024 09:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l9xjYIYH";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF3D10E862
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 09:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1642D603F3;
 Mon,  4 Mar 2024 09:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE05C433C7;
 Mon,  4 Mar 2024 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709545126;
 bh=N4y4ZWbE3IEU6Hge0PEaUi3N6js/rulVjG1pPU1zftA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l9xjYIYH7XcwQClykC9F8UPv/UIVkNat3wS2I0qCuvj8GPg7BrmfZTXC2MDeGj17p
 48CjvQFw0NIFmxXLF9s+fxM9utDDNtddMwGzz9UOLYwVpFlTEP+/mkuzRW/2mqj09U
 e+ub5hUGgbCjgsM/u4dTC4YqRnkm8SUHoEnsHQNHjQZLAKy0WkhDVlH1zGzxw5spUl
 lJMJM3Wc+exRRiOBgBEaszBPG/MrJgN21Sorn/gmSb77+zsi55vnPn7N8RzefwynYB
 RopoabhYl0XswKNF5R7AdFDYr4QWsWMc0KsIcTvxPsXhrkwnw+EAi9yW9ts11/t5vV
 Petr+0/nMh8OA==
Date: Mon, 4 Mar 2024 11:38:41 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: Moti Haimovski <mhaimovski@habana.ai>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 lucas.demarchi@intel.com, Bharat Jauhari <bjauhari@habana.ai>
Subject: Re: [RFC v1] drm/xe: support sharing VM info between XE drivers
Message-ID: <ZeWWoVxehIbInE/V@ogabbay-vm-u22.habana-labs.com>
References: <20240303132055.2851336-1-mhaimovski@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240303132055.2851336-1-mhaimovski@habana.ai>
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

On Sun, Mar 03, 2024 at 03:20:55PM +0200, Moti Haimovski wrote:
> From: Bharat Jauhari <bjauhari@habana.ai>
> 
> This commit adds support to export a user-created VM as a FD
> to be shared between XE drivers running on the same device.
Hi Moti,

Discussing this patch is very premature at this point.

We first need to upstream the Gaudi RDMA driver and see that the RDMA
subsystem maintainers accept our idea of how to connect between the
habanalabs accel driver and the RDMA driver.

Only after that we can discuss this patch, which is an "improvement"
on what we do in Gaudi.

Therefore, let's drop this for now.

Thanks,
Oded

> 
> There can be devices which offer multiple hardware features each
> requiring its own driver. In such case, there is always only one
> primary driver which registers itself with the device. All other
> drivers work as auxiliary drivers to the primary driver.
> Based on software use case of the application there can be a
> requirement to share virtual memory information between these drivers.
> In current  design virtual memory is exposed as an integer, this number
> is tightly coupled with the application context. In this integer form,
> VM information cannot be shared with other auxiliary drivers by the
> application.
> Taking inspiration from dma-buf framework, adding a new interface to
> export the VM id as an FD. This FD is unique across the host and
> encapsulates VM related configurations. Using this FD each application
> can opaquely share VM info with other aux drivers.
> This feature doesn't allow inter application sharing of VM information,
> its purpose is to allow application for sharing its VM with another
> driver contexts.
> 
> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> ---
> V1:
>  * Rebase code
> 
>  drivers/gpu/drm/xe/xe_device.c   |   1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 180 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h       |   4 +
>  drivers/gpu/drm/xe/xe_vm_types.h |  26 +++++
>  include/uapi/drm/xe_drm.h        |  27 +++++
>  5 files changed, 238 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495a..e3502e32ded7c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -134,6 +134,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_EXPORT, xe_vm_export_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d28260351af2e..8c1e7a2be1ee2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,8 @@
>  #include <linux/kthread.h>
>  #include <linux/mm.h>
>  #include <linux/swap.h>
> +#include <linux/anon_inodes.h>
> +#include <linux/file.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> @@ -1992,6 +1994,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  		err = -ENOENT;
>  	else if (XE_IOCTL_DBG(xe, vm->preempt.num_exec_queues))
>  		err = -EBUSY;
> +	else if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm)))
> +		err = -EBUSY;
>  	else
>  		xa_erase(&xef->vm.xa, args->vm_id);
>  	mutex_unlock(&xef->vm.lock);
> @@ -3472,3 +3476,179 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +static int xe_vm_file_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_vm_file *vm_file = file->private_data;
> +	struct xe_vm *vm = vm_file->vm;
> +
> +	down_write(&vm->lock);
> +	vm->scale_info.exported_fd = -1;
> +	vm->scale_info.exported_vm = false;
> +	up_write(&vm->lock);
> +
> +	xe_vm_put(vm_file->vm);
> +
> +	kfree(vm_file);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations xe_vm_file_fops = {
> +	.release = xe_vm_file_release,
> +};
> +
> +static int xe_vm_get_fd(struct xe_file *xef, struct xe_vm *vm, u32 vm_id, int *p_fd)
> +{
> +	struct xe_vm_file *vm_file;
> +	struct file *file;
> +	int fd, err;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	vm_file = kzalloc(sizeof(*vm_file), GFP_KERNEL);
> +	if (!vm_file) {
> +		err = -ENOMEM;
> +		goto put_fd;
> +	}
> +
> +	vm_file->vm = vm;
> +
> +	file = anon_inode_getfile("xe_vm_file", &xe_vm_file_fops, vm_file, 0);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto free_vm_file;
> +	}
> +
> +	fd_install(fd, file);
> +
> +	*p_fd = fd;
> +	vm->scale_info.exported_fd = fd;
> +	vm->scale_info.exported_vm = true;
> +
> +	xe_vm_get(vm);
> +
> +	return 0;
> +
> +free_vm_file:
> +	kfree(vm_file);
> +put_fd:
> +	put_unused_fd(fd);
> +
> +	return err;
> +}
> +
> +int xe_vm_export_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_export *args = data;
> +	struct xe_vm *vm;
> +	int err, fd = -1;
> +
> +	if (XE_IOCTL_DBG(xe, args->pad) || XE_IOCTL_DBG(xe, args->pad1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	err = down_write_killable(&vm->lock);
> +	if (err)
> +		goto put_vm;
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto release_vm_lock;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_scale_in_use(vm))) {
> +		err = -EEXIST;
> +		goto release_vm_lock;
> +	}
> +
> +	err = xe_vm_get_fd(xef, vm, args->vm_id, &fd);
> +	args->fd = fd;
> +
> +release_vm_lock:
> +	up_write(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> +
> +/**
> + * xe_vm_get_exported() - Get VM from exported FD
> + *
> + * @xe: The xe device we work with
> + * @vm_export_fd: The FD representing the exported VM.
> + *
> + * Get and extract the vm from the FD exported it.
> + *
> + * Return: pointer to the exported VM on success, ERR_PTR(err) otherwise.
> + */
> +struct xe_vm *xe_vm_get_exported(struct xe_device *xe, int vm_export_fd)
> +{
> +	struct xe_vm_file *vm_file;
> +	struct xe_vm *vm;
> +	struct file *file;
> +	int err;
> +
> +	file = fget(vm_export_fd);
> +	if (!file)
> +		return ERR_PTR(-EBADF);
> +
> +	if (file->f_op != &xe_vm_file_fops) {
> +		err = -EINVAL;
> +		goto err_fput;
> +	}
> +
> +	/* xe_vm_file info is stored in the file's private data */
> +	vm_file = file->private_data;
> +	if (!vm_file || !vm_file->vm) {
> +		err = -ENOENT;
> +		goto err_fput;
> +	}
> +
> +	/* prevent xe_file_close from freeing the vm */
> +	vm = xe_vm_get(vm_file->vm);
> +	if (!vm) {
> +		err = -ENOENT;
> +		goto err_fput;
> +	}
> +
> +	down_read(&vm->lock);
> +
> +	if (xe_vm_is_closed_or_banned(vm)) {
> +		err = -ENOENT;
> +		goto err_vm_unlock;
> +	}
> +
> +	if (vm->xe != xe) {
> +		err = -EINVAL;
> +		goto err_vm_unlock;
> +	}
> +
> +	if (vm->scale_info.exported_fd != vm_export_fd) {
> +		err = -EINVAL;
> +		goto err_vm_unlock;
> +	}
> +
> +	up_read(&vm->lock);
> +
> +	fput(file);
> +
> +	return vm;
> +
> +err_vm_unlock:
> +	up_read(&vm->lock);
> +	xe_vm_put(vm);
> +err_fput:
> +	fput(file);
> +
> +	return ERR_PTR(err);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6df1f1c7f85d9..62c43597700fc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -180,6 +180,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_export_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file);
> +
> +struct xe_vm *xe_vm_get_exported(struct xe_device *xe, int vm_export_fd);
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 79b5cab577119..0238b792bcafe 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -126,6 +126,10 @@ struct xe_userptr_vma {
>  
>  struct xe_device;
>  
> +#define xe_vm_scale_in_use(vm)			\
> +		({ struct xe_vm *_vm = (vm);	\
> +		   _vm->scale_info.exported_vm || _vm->scale_info.registered_vm; })
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -269,8 +273,19 @@ struct xe_vm {
>  
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
> +
>  	/** @xef: XE file handle for tracking this VM's drm client */
>  	struct xe_file *xef;
> +
> +	/** @scale_info: aux/scale information related to this VM */
> +	struct {
> +		/** @exported FD: fd exported to the user for this VM */
> +		int exported_fd;
> +		/** @exported_vm: VM had been exported via the vm_export ioctl */
> +		bool exported_vm;
> +		/** @registered_vm: Indicates the exported-VM is registered with the XE driver */
> +		bool registered_vm;
> +	} scale_info;
>  };
>  
>  /** struct xe_vma_op_map - VMA map operation */
> @@ -355,4 +370,15 @@ struct xe_vma_op {
>  		struct xe_vma_op_prefetch prefetch;
>  	};
>  };
> +
> +/**
> + * struct xe_vm_file - VM file private data
> + *
> + * This structure stores the exported VM info in the filep of the exported FD.
> + */
> +struct xe_vm_file {
> +	/** @vm: a pointer to the VM object to be exported */
> +	struct xe_vm *vm;
> +};
> +
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 2fc19177d2b0c..426317e4ba65d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -80,6 +80,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> + *  - &DRM_IOCTL_XE_VM_EXPORT
>   */
>  
>  /*
> @@ -100,6 +101,7 @@ extern "C" {
>  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
> +#define DRM_XE_VM_EXPORT		0x0b
>  /* Must be kept compact -- no holes */
>  
>  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -113,6 +115,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> +#define DRM_IOCTL_XE_VM_EXPORT			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct drm_xe_vm_export)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1352,6 +1355,30 @@ struct drm_xe_wait_user_fence {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vm_export - Export VM ID as an FD which can be shared by another driver.
> + *
> + * As part of networking support, application needs to work with both XE and IB driver
> + * sharing VM. VM ID by itself is not unique therefore we export the VM ID as a FD which
> + * can be shared.
> + */
> +struct drm_xe_vm_export {
> +	/** @vm_id: VM ID allocated during DRM_IOCTL_XE_VM_CREATE */
> +	__u32 vm_id;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @fd: Returned FD */
> +	__s32 fd;
> +
> +	/** @pad1: MBZ */
> +	__u32 pad1;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
