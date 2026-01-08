Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166F2D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48FD10E790;
	Thu,  8 Jan 2026 16:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZLA01T4D";
	dkim-atps=neutral
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F5B10E793
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:07:45 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47788165c97so20371145e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767888464; x=1768493264;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7DBTz/lbvXhEQEV6ZtSo3RgwmEle7n+kvmz64QebNMQ=;
 b=ZLA01T4DPMGQIyMFgYAfKSwJeFfWeUy4awiTp3RarTepWTWtne9+ruSo4YBYoM4VFG
 BGTAdp0pHd7QvAlSPRxBM4uZAic/8YOIE/kHmaWNv2gQYM9kl71ZzOs+lX+Icq8vdcXD
 B9Gq8bKL0m4A0gb5eEhNPATORK1CM4jnbJTWUY1qbWg+zfvXdD6yM4sCO2HdFa9Phn6q
 wP8XJBS3h/YIw+mwlkYOb9XD2thjnWMm4g45aMKUx4aYXZTnrX22ETsIHeCkNeAIAvoT
 rPjLsrO4JfZOkPY2BdAM2Lrww6m1qKbtwMpYi9L7fa9F7RjVTSrzH6iMP8b68gmYkXOH
 QKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767888464; x=1768493264;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DBTz/lbvXhEQEV6ZtSo3RgwmEle7n+kvmz64QebNMQ=;
 b=o++1tlh587CtQzUu0QK1hfPbfiUIJyvaRqPK96e1yOHVHrwuxDNk1bLkdYrQ49rFCq
 bWasENxqa9HGAG3bGU0gDeE3p525DgNGX+ODADad5ker5VSQHzkNwLwZCW2XISZADQhX
 h11BZa70rE8LeKTqqU+8/NNFX+S4M5ibcqTUPQ7FuWrWbMU389QyOsItiGhkdLhhdWXE
 gvaKpP6aWcOgedK0pN0xpDdiGzrYWQQnW3nYFUtm2sNqH4XZnylVtTjWAVlNsz3dZ2L6
 i3c7MuuAaLHP24n2U1JU/GCOvTKvmgr2NbvBlLHXxNRpxRa5eJ3PLD5k+w0t4NRmWOBL
 W+0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhQpSqgNo1plIXxut+HzI9jYU6zy8Dvim7s+PsTXKDZYq+IpjaHqoZcKpeG0zpOFgISBabsGbd3g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTqmTUTPAHACXiWvPytzbT+trHxtMaZNqiOAUkyhnf/M38vvEe
 5H055yrND0N+lTQlhOxczABo+vLAW05ZAsOYLuGOyjNISlnUPrzsF0Kd6DiW580VwniaQMJNNfW
 Iz4IJEPxixeUlVFc6HQ==
X-Google-Smtp-Source: AGHT+IEO61c6TkZz/86mc/fyFkwWFW5LTEzhYmLyOElq55K/6sHbmhaCJ0Qo8xpHZev+T6S1nwRZjKWIEJKKzW0=
X-Received: from wmlm26.prod.google.com ([2002:a7b:ca5a:0:b0:479:36b0:ff54])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3112:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-47d84b26d08mr75677725e9.1.1767888464327; 
 Thu, 08 Jan 2026 08:07:44 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:31 +0000
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Mime-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=hbq4/W/YT1F2KaupP7lFjIsAXhr1Ga/gdbdjOJfduHM=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZN+0wnx9w0LDMduz613MpMKku8f0voThE3Z
 VzJVjwhM/yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WTQAKCRAEWL7uWMY5
 RhMXEACFw5E17eKTmxVsYmy97LYcw5RX+DOlTERXnLWyfaTGCutXDAMFYjO7Cgyx+2/qtxqCb99
 hqDf4YYo3waLduiBL4An1/5xi73UuveVXb5QI2UU/IJH0WuTRV1HqeJkJ1IONrrkyW4noiadkVn
 Gw0eYLMfquuDYyOoUaErOw4VxStseS9p+FmlVRd/Ptf9SioxTfAJcd4phn5ghFDcv4n68RkedVX
 q4IOWzJeW6Z5Og/KeZ61MnjiheBZN+inCavhoLY1/50CajqYdCNp0IBKTria754kM1uj15kCHUu
 rbMNXd3o96bQovwfPVHwjT3gBTKyVajwwNIJbhMg1NckrQGcL91mFLkD7bwdx1bQhtx7Pw3ZiyC
 adN2XCGu97NVvZmRLGGovP1S6SY7VhMawU9B9m/E8REl/X4Nt33rR8AEJUrmcz9yMBtfdtCEHq6
 QVkQ95QrPSf47m6PiDvjCPHicsXk8NeU0Ov6x1ucR0Ctpke9AMvT2Uu1zvSiDrJGXEJ7dsQkBeM
 Hkus5GvVkeYMcl7ZKC9NDu83ngLhyrCerTytirGraddM5y1Df5LVmtDeXHwnZLxX7rVxO0kWE4y
 kLY8maZejGtiEnO+uENM35VvKbvwGzNNApaxvBCpT/qEKian2IAu9pRgHonllLlMU5kKWHkQL9r
 wXLj8nU1Xc+Xczg==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-1-dbd014005a0b@google.com>
Subject: [PATCH v2 1/3] drm/gpuvm: take GEM lock inside
 drm_gpuvm_bo_obtain_prealloc()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

When calling drm_gpuvm_bo_obtain_prealloc() and using immediate mode,
this may result in a call to ops->vm_bo_free(vm_bo) while holding the
GEMs gpuva mutex. This is a problem if ops->vm_bo_free(vm_bo) performs
any operations that are not safe in the fence signalling critical path,
and it turns out that Panthor (the only current user of the method)
calls drm_gem_shmem_unpin() which takes a resv lock internally.

This constitutes both a violation of signalling safety and lock
inversion. To fix this, we modify the method to internally take the GEMs
gpuva mutex so that the mutex can be unlocked before freeing the
preallocated vm_bo.

Note that this modification introduces a requirement that the driver
uses immediate mode to call drm_gpuvm_bo_obtain_prealloc() as it would
otherwise take the wrong lock.

Fixes: 63e919a31625 ("panthor: use drm_gpuva_unlink_defer()")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c           | 69 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 -----
 2 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 8a06d296561d1a4b61a7137f8017a78d4ada3a7c..0de47e83d84df11a53e40fe82d069882e46149b6 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1602,14 +1602,48 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
 
+/*
+ * drm_gpuvm_bo_destroy_not_in_lists() - final part of drm_gpuvm_bo cleanup
+ * @vm_bo: the &drm_gpuvm_bo to destroy
+ *
+ * It is illegal to call this method if the @vm_bo is present in the GEMs gpuva
+ * list, the extobj list, or the evicted list.
+ *
+ * Note that this puts a refcount on the GEM object, which may destroy the GEM
+ * object if the refcount reaches zero. It's illegal for this to happen if the
+ * caller holds the GEMs gpuva mutex because it would free the mutex.
+ */
+static void
+drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gem_object *obj = vm_bo->obj;
+
+	if (ops && ops->vm_bo_free)
+		ops->vm_bo_free(vm_bo);
+	else
+		kfree(vm_bo);
+
+	drm_gpuvm_put(gpuvm);
+	drm_gem_object_put(obj);
+}
+
+static void
+drm_gpuvm_bo_destroy_not_in_lists_kref(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
+}
+
 static void
 drm_gpuvm_bo_destroy(struct kref *kref)
 {
 	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
 						  kref);
 	struct drm_gpuvm *gpuvm = vm_bo->vm;
-	const struct drm_gpuvm_ops *ops = gpuvm->ops;
-	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
 	if (!lock)
@@ -1618,16 +1652,10 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
+	drm_gem_gpuva_assert_lock_held(gpuvm, vm_bo->obj);
 	list_del(&vm_bo->list.entry.gem);
 
-	if (ops && ops->vm_bo_free)
-		ops->vm_bo_free(vm_bo);
-	else
-		kfree(vm_bo);
-
-	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
 }
 
 /**
@@ -1745,9 +1773,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put_deferred);
 void
 drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
 {
-	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gpuvm_bo *vm_bo;
-	struct drm_gem_object *obj;
 	struct llist_node *bo_defer;
 
 	bo_defer = llist_del_all(&gpuvm->bo_defer);
@@ -1766,14 +1792,7 @@ drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
 	while (bo_defer) {
 		vm_bo = llist_entry(bo_defer, struct drm_gpuvm_bo, list.entry.bo_defer);
 		bo_defer = bo_defer->next;
-		obj = vm_bo->obj;
-		if (ops && ops->vm_bo_free)
-			ops->vm_bo_free(vm_bo);
-		else
-			kfree(vm_bo);
-
-		drm_gpuvm_put(gpuvm);
-		drm_gem_object_put(obj);
+		drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_deferred_cleanup);
@@ -1861,6 +1880,9 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
  * count is decreased. If not found @__vm_bo is returned without further
  * increase of the reference count.
  *
+ * The provided @__vm_bo must not already be in the gpuva, evict, or extobj
+ * lists prior to calling this method.
+ *
  * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
  *
  * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
@@ -1873,14 +1895,19 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
 	struct drm_gem_object *obj = __vm_bo->obj;
 	struct drm_gpuvm_bo *vm_bo;
 
+	drm_WARN_ON(gpuvm->drm, !drm_gpuvm_immediate_mode(gpuvm));
+
+	mutex_lock(&obj->gpuva.lock);
 	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
 	if (vm_bo) {
-		drm_gpuvm_bo_put(__vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
+		kref_put(&__vm_bo->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);
 		return vm_bo;
 	}
 
 	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
 	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
+	mutex_unlock(&obj->gpuva.lock);
 
 	return __vm_bo;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b888fff05efe2ba035d0b4f639e8134d258b54be..198d59f42578fb75da7e244734053c02d09dc129 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1244,17 +1244,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		goto err_cleanup;
 	}
 
-	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
-	 * pre-allocated BO if the <BO,VM> association exists. Given we
-	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
-	 * be called immediately, and we have to hold the VM resv lock when
-	 * calling this function.
-	 */
-	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	mutex_lock(&bo->base.base.gpuva.lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
-	mutex_unlock(&bo->base.base.gpuva.lock);
-	dma_resv_unlock(panthor_vm_resv(vm));
 
 	op_ctx->map.bo_offset = offset;
 

-- 
2.52.0.351.gbe84eed79e-goog

