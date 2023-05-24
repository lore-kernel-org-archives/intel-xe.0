Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2601DC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 23:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AD610E0E8;
	Wed, 24 May 2023 23:43:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2277510E0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 23:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684971813; x=1716507813;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xbJvTbYea/hRaEp0f81g0869gP5+yTus5vJ2TMwyjS4=;
 b=G46kh8+aL7onbv/TgXbiyQceE+pJe9pmPS5hRG8tLiXsoTGVI3bTu6jk
 r0fGeq+qcQRfhXHaFsgxqkSagUnXlx6tLWp23HNjnI1/OuQdJkjOuLjyM
 JeO40VY2UMzuOvjWLr/DzluvZncZiyPzhtYSHPXVPJ3es4dTnNjUKbCcb
 zW7WtGf+iPRzixI2pnZTFFRc4Bb/tXSzYz8CF7rxaphKDpBqyB1m9wRD2
 UsdSydI1fEYRyndaSK6seoV0ZIJDKBorbSnT8HtcLDbbpmH2Z5MezuhqS
 0AdbvgHKxJrvFHoW9iWjP15b7YDR78gtyhm9xnCMAKrxwO9QS98YDM2oU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356076849"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="356076849"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 16:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034743894"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="1034743894"
Received: from unknown (HELO ldmartin-desk2) ([10.24.12.130])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 16:43:31 -0700
Date: Wed, 24 May 2023 16:43:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <salfd6ebuhmgfpij4s3egc7akn6ziifuq427xtssmlnl4mpcnr@jzfc74dpjm3m>
X-Patchwork-Hint: comment
References: <20230524033131.2000480-1-kode54@gmail.com>
 <20230524033131.2000480-3-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230524033131.2000480-3-kode54@gmail.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Validate uAPI padding and
 reserved fields
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

On Tue, May 23, 2023 at 08:31:31PM -0700, Christopher Snowhill wrote:
>Padding and reserved fields are declared such that they must be
>zeroed, so verify that they're all zero in the respective ioctl
>functions.
>
>Derived from original patch by mlankhorst.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Christopher Snowhill <kode54@gmail.com>
>---
> drivers/gpu/drm/xe/xe_bo.c              |  6 ++++--
> drivers/gpu/drm/xe/xe_engine.c          | 19 +++++++++++++++----
> drivers/gpu/drm/xe/xe_exec.c            |  4 +++-
> drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
> drivers/gpu/drm/xe/xe_query.c           |  3 ++-
> drivers/gpu/drm/xe/xe_sync.c            |  4 +++-
> drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++++++++---
> drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 +++-
> drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
> 9 files changed, 53 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index c82e995df779..de713348ccc1 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1644,7 +1644,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> 	u32 handle;
> 	int err;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, args->flags &
>@@ -1714,7 +1715,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> 	struct drm_xe_gem_mmap_offset *args = data;
> 	struct drm_gem_object *gem_obj;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, args->flags))
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 094ec17d3004..8c3a722d91c6 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -348,7 +348,8 @@ static int engine_user_ext_set_property(struct xe_device *xe,
> 		return -EFAULT;
>
> 	if (XE_IOCTL_ERR(xe, ext.property >=
>-			 ARRAY_SIZE(engine_set_property_funcs)))
>+			 ARRAY_SIZE(engine_set_property_funcs)) ||
>+	    XE_IOCTL_ERR(xe, ext.pad))
> 		return -EINVAL;
>
> 	idx = array_index_nospec(ext.property, ARRAY_SIZE(engine_set_property_funcs));
>@@ -380,7 +381,8 @@ static int engine_user_extensions(struct xe_device *xe, struct xe_engine *e,
> 	if (XE_IOCTL_ERR(xe, err))
> 		return -EFAULT;
>
>-	if (XE_IOCTL_ERR(xe, ext.name >=
>+	if (XE_IOCTL_ERR(xe, ext.pad) ||
>+	    XE_IOCTL_ERR(xe, ext.name >=
> 			 ARRAY_SIZE(engine_user_extension_funcs)))
> 		return -EINVAL;
>
>@@ -523,7 +525,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> 	int len;
> 	int err;
>
>-	if (XE_IOCTL_ERR(xe, args->flags))
>+	if (XE_IOCTL_ERR(xe, args->flags) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	len = args->width * args->num_placements;
>@@ -639,6 +642,10 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
> 	struct drm_xe_engine_get_property *args = data;
> 	struct xe_engine *e;
>
>+	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>+		return -EINVAL;
>+
> 	mutex_lock(&xef->engine.lock);
> 	e = xa_load(&xef->engine.xa, args->engine_id);
> 	mutex_unlock(&xef->engine.lock);
>@@ -718,7 +725,8 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
> 	struct drm_xe_engine_destroy *args = data;
> 	struct xe_engine *e;
>
>-	if (XE_IOCTL_ERR(xe, args->pad))
>+	if (XE_IOCTL_ERR(xe, args->pad) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	mutex_lock(&xef->engine.lock);
>@@ -748,6 +756,9 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
> 	int ret;
> 	u32 idx;
>
>+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>+		return -EINVAL;
>+
> 	e = xe_engine_lookup(xef, args->engine_id);
> 	if (XE_IOCTL_ERR(xe, !e))
> 		return -ENOENT;
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index 3db1b159586e..e44076ee2e11 100644
>--- a/drivers/gpu/drm/xe/xe_exec.c
>+++ b/drivers/gpu/drm/xe/xe_exec.c
>@@ -181,7 +181,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 	bool write_locked;
> 	int err = 0;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	engine = xe_engine_lookup(xef, args->engine_id);
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index c7fbb1cc1f64..9d583f11e290 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -407,7 +407,8 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	bool allowed;
> 	int ret = 0;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index dd64ff0d2a57..97742d003c8a 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -374,7 +374,8 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 	struct drm_xe_device_query *query = data;
> 	u32 idx;
>
>-	if (XE_IOCTL_ERR(xe, query->extensions != 0))
>+	if (XE_IOCTL_ERR(xe, query->extensions ||

missing the close parenthesis

Lucas De Marchi

>+	    XE_IOCTL_ERR(xe, query->reserved[0] || query->reserved[1])))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
>diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>index 1e4e4acb2c4a..5acb37a8b2ab 100644
>--- a/drivers/gpu/drm/xe/xe_sync.c
>+++ b/drivers/gpu/drm/xe/xe_sync.c
>@@ -111,7 +111,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> 		return -EFAULT;
>
> 	if (XE_IOCTL_ERR(xe, sync_in.flags &
>-			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
>+			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
>+	    XE_IOCTL_ERR(xe, sync_in.pad) ||
>+	    XE_IOCTL_ERR(xe, sync_in.reserved[0] || sync_in.reserved[1]))
> 		return -EINVAL;
>
> 	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index a0306526b269..ea354ffbede0 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1799,7 +1799,9 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
> 		return -EFAULT;
>
> 	if (XE_IOCTL_ERR(xe, ext.property >=
>-			 ARRAY_SIZE(vm_set_property_funcs)))
>+			 ARRAY_SIZE(vm_set_property_funcs)) ||
>+	    XE_IOCTL_ERR(xe, ext.pad) ||
>+	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
> 		return -EINVAL;
>
> 	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
>@@ -1827,7 +1829,8 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
> 	if (XE_IOCTL_ERR(xe, err))
> 		return -EFAULT;
>
>-	if (XE_IOCTL_ERR(xe, ext.name >=
>+	if (XE_IOCTL_ERR(xe, ext.pad) ||
>+	    XE_IOCTL_ERR(xe, ext.name >=
> 			 ARRAY_SIZE(vm_user_extension_funcs)))
> 		return -EINVAL;
>
>@@ -1858,6 +1861,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> 	int err;
> 	u32 flags = 0;
>
>+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>+		return -EINVAL;
>+
> 	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
> 		return -EINVAL;
>
>@@ -1941,7 +1947,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
> 	struct drm_xe_vm_destroy *args = data;
> 	struct xe_vm *vm;
>
>-	if (XE_IOCTL_ERR(xe, args->pad))
>+	if (XE_IOCTL_ERR(xe, args->pad) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	vm = xe_vm_lookup(xef, args->vm_id);
>@@ -2891,6 +2898,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> 	int i;
>
> 	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
> 	    XE_IOCTL_ERR(xe, !args->num_binds) ||
> 	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
> 		return -EINVAL;
>@@ -2923,6 +2932,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> 		u64 obj_offset = (*bind_ops)[i].obj_offset;
> 		u32 region = (*bind_ops)[i].region;
>
>+		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
>+		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
>+				     (*bind_ops)[i].reserved[1])) {
>+			err = -EINVAL;
>+			goto free_bind_ops;
>+		}
>+
> 		if (i == 0) {
> 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> 		} else if (XE_IOCTL_ERR(xe, !*async) ||
>diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>index 29815852985a..0f5eef337037 100644
>--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>@@ -301,7 +301,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> 	struct xe_vma **vmas = NULL;
> 	int num_vmas = 0, err = 0, idx;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) ||
>+	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
>diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>index 15c2e5aa08d2..6c8a60c60087 100644
>--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>@@ -100,7 +100,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
> 	unsigned long timeout = args->timeout;
>
>-	if (XE_IOCTL_ERR(xe, args->extensions))
>+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
>+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
> 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
>-- 
>2.40.1
>
