Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B958C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1410E0B0;
	Fri,  1 Dec 2023 15:12:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA99910E0B0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701443539; x=1732979539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tnkpkkn+zDdy14OeIdH1xSgiyImywGwHDTro5Ivr7VQ=;
 b=Xc7JDvtCA8iVtSi4AjfsAuzegOXVyBs4PPRVxNkITrtTZubQK9Z39oWV
 FZCjcDdUI0qnM34VgXyY486u0cfSu1BDOZ/GGJnZmuq5Q2p0QZNEzpYzA
 QIfsUx6L9PXRZM6Czn78NrU1LnaIcO3iT5ovMSq4taq69+F6ko5unVKWC
 LVWutXtVg2pOx3fb68iLmserEAnfbIxf//lOsfhpMsMvhXNvJipszw7Py
 na3HMIfK1i1cMtXBqZ/ECr4XLcAMrMvlCGZXjgXtgBU3WSPhm2N6Iy/BS
 1UQd+zfS+Ba/0W4s/o2enMOhGOe/27nEBD66lIF78OpKdSnMHOCC723L6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="12222670"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="12222670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="804099936"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="804099936"
Received: from kevinosu-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.26.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:12:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 15:11:48 +0000
Message-ID: <20231201151147.538291-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/uapi: support pat_index selection
 with vm_bind
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

Add a note in the docs for NULL bindings and corresponding pat_index:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26430

Testcase: igt@xe_pat@pat-index-all
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 58e655981992..1a844fa7af8a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -673,6 +673,12 @@ struct drm_xe_vm_bind_op {
 	 *
 	 * Note: For userptr and externally imported dma-buf the kernel expects
 	 * either 1WAY or 2WAY for the @pat_index.
+	 *
+	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
+	 * on the @pat_index. For such mappings there is no actual memory being
+	 * mapped (the address in the PTE is invalid), so the various PAT memory
+	 * attributes likely do not apply.  Simply leaving as zero is one
+	 * option (still a valid pat_index).
 	 */
 	__u16 pat_index;
 
-- 
2.43.0

