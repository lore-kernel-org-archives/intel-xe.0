Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56F606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9ZVRaGT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824B910E4C7;
	Wed,  4 Nov 2026 00:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D9A10E66C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753556; x=1825289556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6lL6MehezVO93CPm5ngiVK6xvWJ0OwCm7cnN9yUGBtE=;
 b=b9ZVRaGTGkaot8UkJqqUidPBu+xLBtD/gZ95JJHgV3J/Vklhkwh90yJ9
 dV35RDSHmRzduYODZFYtX5SJOGi3U+q2ViKsz4aQqW0lZTdPuJhunkdSq
 YMeUo8G9eTx6psjAv4LP4wCEthIFhAtI/aNs1Py3QqdOxp0R9LhQ+dLFE
 fEkBBzI6XYWV7Zmpx8KZg1DNjNq/Lmv5RFHrhEC4OeyZ88NZHcwmfBrCT
 A+PM/s6tbsYSREdUTo+0Klk5woh6XWb6yLav3QR3WMYY681IFMRRk4F9f
 36nqFa10NbqIQrXLI6nm8FbMZVpNjLntKjnAV75F+n51yPtNAeA/6aJYF A==;
X-CSE-ConnectionGUID: ExhjUECeRnO3IC5V7nsL9g==
X-CSE-MsgGUID: 2agIOpevTyKbuxukwmA64g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2529524"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2529524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:31 -0800
X-CSE-ConnectionGUID: Y9a90oxERAaSTsw3xTilZQ==
X-CSE-MsgGUID: kOzj+6l+TWWNFyQvE+9t3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6649325"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v3 1/5] drm/xe/oa: Use the drm device address_space for the OA
 stream fd
Date: Tue,  3 Nov 2026 16:52:23 -0800
Message-ID: <20261104005221.3230003-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
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
Userspace mmaps of the OA buffer are therefore tracked in an
address_space the driver doesn't own, so they can't be zapped without
affecting unrelated mappings, and drm_dev_unplug() doesn't zap them
along with the other mmaps of the device.

Allocating a private inode with anon_inode_create_getfile() is not an
option, since that goes through security_inode_init_security_anon() and
is denied by SELinux policies that don't know about "[xe_oa]", breaking
OA on enforcing systems.

Instead, keep the anon inode singleton and only point the file's
f_mapping at the drm device's address_space (drm.anon_inode->i_mapping),
same as drm_file does for drm fds. drm_dev_unplug() then zaps the OA
buffer mmaps too, and refaults get the dummy page from the BO fault
handler, same as for GEM mmaps. f_mapping must be set before the fd is
visible to userspace, so reserve the fd with get_unused_fd_flags(),
create the file with anon_inode_getfile() and install it with
fd_install() after setting f_mapping.

GEM mmaps live in that address_space at fake offsets starting at
DRM_FILE_PAGE_OFFSET_START, while userspace maps the OA buffer at offset
0, so the two don't share ranges there. The uAPI is unchanged.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 838802482ada..09043bc90de9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1869,6 +1869,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 {
 	struct xe_oa_stream *stream;
 	struct drm_syncobj *ufence_syncobj;
+	struct file *file;
 	int stream_fd;
 	int ret;
 
@@ -1910,12 +1911,27 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
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
+	 * unrelated anon files. Use the drm device's address_space instead, same as drm fds,
+	 * so that drm_dev_unplug() also zaps the OA buffer mmaps.
+	 */
+	file->f_mapping = oa->xe->drm.anon_inode->i_mapping;
+	fd_install(stream_fd, file);
+
 	if (stream->sample)
 		xe_reg_whitelist_oa_regs(stream->gt);
 
-- 
2.55.0

