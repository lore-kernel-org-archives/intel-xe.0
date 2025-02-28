Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E2BC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6F10EC12;
	Fri, 28 Feb 2025 07:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k57ixrGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D853310E217
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740727874; x=1772263874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEkfLAZp/UoSi/lc1J+/rutqDaJvRm0Fzr05Jy05b/E=;
 b=k57ixrGdIKVgeVX66ipcbz8Oghz+upNsMtYh6Y4A37+la3DOvK3k5ykK
 wpZvAHsyMCIMW/dmkFoV3R4TyLcOOlNR8b6BBFTg4aGUAaVNdFIY/MpNA
 RXzHIGGBTBDzRMdABpSVDSIm9hC01lB7NJ04PSutFnbT0kS4MHeI3S6Ei
 neehk+MQnsI/Mh7RmiRUwEEEKbMPdHEfLDhTpNK7N5Lg5NWzx3qQfrFq1
 JL2lVTexP7zsuxkb11K+Wk5HANx6rXjJl3GsK+FYRK6I2SmccntPxweZe
 NnhzkTKcF6eA1VFRPa+nSAAYgDRhUiyuAOc5dZa41qW9ln0AAKb53YyIu w==;
X-CSE-ConnectionGUID: WeXnF00qTPOWrjn84JDWJQ==
X-CSE-MsgGUID: KgWByJ/tTViNTWA3cVSekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45297763"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45297763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:14 -0800
X-CSE-ConnectionGUID: YBEkS2DcTAWhDShtRRsoRg==
X-CSE-MsgGUID: 49WHmvn0SwGv6g/GbSa9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121386223"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:12 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/4] drm/xe/vm: Validate userptr during gpu vma prefetching
Date: Fri, 28 Feb 2025 08:30:55 +0100
Message-ID: <20250228073058.59510-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
References: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

If a userptr vma subject to prefetching was already invalidated
or invalidated during the prefetch operation, the operation would
repeatedly return -EAGAIN which would typically cause an infinite
loop.

Validate the userptr to ensure this doesn't happen.

v2:
- Don't fallthrough from UNMAP to PREFETCH (Matthew Brost)

Fixes: 5bd24e78829a ("drm/xe/vm: Subclass userptr vmas")
Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.9+
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..6fdc17be619e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2306,8 +2306,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			break;
 		case DRM_GPUVA_OP_PREFETCH:
-			/* FIXME: Need to skip some prefetch ops */
+			vma = gpuva_to_vma(op->base.prefetch.va);
+
+			if (xe_vma_is_userptr(vma)) {
+				err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
+				if (err)
+					return err;
+			}
+
 			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		default:
-- 
2.48.1

