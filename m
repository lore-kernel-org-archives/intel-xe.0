Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8E606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 23:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZMk2ugq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8AA10E8E2;
	Fri, 30 Oct 2026 23:39:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0DC10E5D2
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 23:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793403536; x=1824939536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=duxBFzrNUbbI0FUmtbeKi/xlAPvKEBYq8wxXRFryglY=;
 b=QZMk2ugq+VpmJ74QYsa68y8tDiDtYz2TAnp/dBRhnE7sACh4+CkUx4US
 iMzf81R9Z7his8VSKd9FHa/tDCmCBmp0lx0elb+fk/jS8UMB4n9WoL1fq
 5WpNyJsmTQ9K4RvLjDz07Zk6SFN8Cz+4eW8QKuCpa6RSelCRdI6Vwby+b
 Ih0D9WCLXAy+fKYcBCWYh3ygYMgPhlP1CTrD/cjbiLFBORqHI4aPC5W9Q
 Bht0Bc32OO5A2aqdxzyAf9wNQbNRX/Edq2ViHF3juPOx9UuhQjgrqV9YO
 A9i7BGbmAGGAlrHB0OZbSJ1jJc5o1ztSDIQxbs6o/HV1vz0G0KY9ipnCp g==;
X-CSE-ConnectionGUID: SluJ+izPSOeKnjIP+ZTXQw==
X-CSE-MsgGUID: c+EV4oxFSYqzXt4n3NhACQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2168349"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2168349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:46 -0700
X-CSE-ConnectionGUID: 8KkbK8xITGO5fy1JFMp50w==
X-CSE-MsgGUID: NWnoK+6oSf+gQGu4SImiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5970924"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: riana.tauro@intel.com,
	harish.chegondi@intel.com
Subject: [PATCH v3 1/3] drm/xe/oa: Use the drm device address_space for the OA
 stream fd
Date: Fri, 30 Oct 2026 16:38:41 -0700
Message-ID: <20261030233839.2284694-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
References: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

anon_inode_getfd() hands back a file whose f_mapping points at the
address_space of the kernel-wide singleton anon_inode_inode, shared by
every other anon_inode_getfd()/anon_inode_getfile() user in the system.
Any code that needs to invalidate userspace mappings of the OA buffer
via that mapping (e.g. unmap_mapping_range()) would end up operating on
an address_space it doesn't own, with the potential to affect unrelated
mappings.

Allocating a private inode with anon_inode_create_getfile() is not an
option, since that goes through security_inode_init_security_anon() and
is denied by SELinux policies that don't know about "[xe_oa]", breaking
OA on enforcing systems.

Instead, keep the anon inode singleton and only point the file's
f_mapping at the drm device's address_space (drm.anon_inode->i_mapping),
same as drm_file does for drm fds. f_mapping must be set before the fd
is visible to userspace, so reserve the fd with get_unused_fd_flags(),
create the file with anon_inode_getfile() and install it with
fd_install() after setting f_mapping.

To keep the OA buffer mmaps of different streams apart from each other
and from GEM mmaps in that shared address_space, reserve a GEM fake
offset for the OA buffer with drm_gem_create_mmap_offset(), and move
the vma to that offset in xe_oa_mmap() by setting vm_pgoff, the same
way drm_gem_prime_mmap() does. f_op->mmap runs before the vma is linked
into the address_space, so the vma is tracked at the OA buffer's own
range, and drm_vma_node_unmap() on the OA buffer only zaps mappings of
that buffer. The TTM fault handler already subtracts the fake offset
from vm_pgoff, so faults resolve to the right pages unchanged.

The uAPI is unchanged: userspace keeps mapping the OA buffer at offset
0 of the stream fd, which is now enforced. The fake offset is never
granted to a drm_file, so the OA buffer can't be mmap'ed via drm fds.
drm_dev_unplug() now also zaps OA buffer mmaps along with all other
mmaps of the drm device.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 41 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 42a95ec733d3..50562d53e7b2 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -907,6 +907,7 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 		XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(stream->oa->xe)) :
 		XE_BO_FLAG_SYSTEM;
 	struct xe_bo *bo;
+	int ret;
 
 	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
 				       size, ttm_bo_type_kernel,
@@ -914,6 +915,17 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	/*
+	 * Reserve a range for the OA buffer in the drm device's address_space, so that its
+	 * userspace mmaps don't overlap with those of GEM BOs or other OA buffers and can be
+	 * unmapped on their own. Not granted to any drm_file, so not mmap'able via drm fds.
+	 */
+	ret = drm_gem_create_mmap_offset(&bo->ttm.base);
+	if (ret) {
+		xe_bo_unpin_map_no_vm(bo);
+		return ret;
+	}
+
 	/*
 	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
 	 * hold stale data from previously freed pages. Since the OA buffer is
@@ -1721,6 +1733,15 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 		return ret;
 	}
 
+	/*
+	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
+	 * buffer's own range in the drm device's address_space below
+	 */
+	if (vma->vm_pgoff) {
+		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
+		return -EINVAL;
+	}
+
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
 	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
 		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
@@ -1738,6 +1759,8 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
+	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
+
 	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
 }
 
@@ -1868,6 +1891,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 {
 	struct xe_oa_stream *stream;
 	struct drm_syncobj *ufence_syncobj;
+	struct file *file;
 	int stream_fd;
 	int ret;
 
@@ -1909,12 +1933,27 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 			goto err_destroy;
 	}
 
-	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
+	stream_fd = get_unused_fd_flags(0);
 	if (stream_fd < 0) {
 		ret = stream_fd;
 		goto err_disable;
 	}
 
+	file = anon_inode_getfile("[xe_oa]", &xe_oa_fops, stream, 0);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		put_unused_fd(stream_fd);
+		goto err_disable;
+	}
+
+	/*
+	 * Don't use the address_space of the anon inode singleton, which is shared with
+	 * unrelated anon files. Use the drm device's address_space instead, same as drm fds.
+	 * OA buffer mmaps live at the OA buffer's own fake offset range there.
+	 */
+	file->f_mapping = oa->xe->drm.anon_inode->i_mapping;
+	fd_install(stream_fd, file);
+
 	if (stream->sample)
 		xe_reg_whitelist_oa_regs(stream->gt);
 
-- 
2.55.0

