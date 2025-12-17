Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8479DD65C5B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 15:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC4310E8B9;
	Wed, 17 Dec 2025 15:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXDX2mnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A115210E7FB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765984034; x=1797520034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jg4gLpvz90Yd4uLwZMjZlXq0IwIS/ycFgifYlkgofT8=;
 b=nXDX2mntanWi9Q/Zs7UqhiaAgH2JtXtXW13jrB+ZjlW6R49kUja1X5zA
 WZGgBNymeRPUHd8m28GP6hi7dQsPlEL9JC4X2jTBIIGjtLdUv7zGCwkXc
 5vGFrvIQ6akx/7ZP+WJJ6P2H5aTo+iFEc9uZk5dHtYJRafw66eXuGkihu
 NA15TLJQ55jUZGvT4FV6SRaLK9l7AOP7q9p+e1QdqeRdqCSIR/QZUdaSs
 buJk3gky5drF8cznh+sg5D+nNpDyjCTRU1C4CTFmV4sW9LdmI5x4pgUdX
 tudV7HNT65GTE36aoHfUIJG3wlqZQFRZZ7czA7GPHSZGoQ3aHdkT/OVx4 w==;
X-CSE-ConnectionGUID: 0og3B2FhSZqKKoRlz0sh5w==
X-CSE-MsgGUID: elFWFap2Q6aRG5koH6cQHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68080369"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="68080369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:07:13 -0800
X-CSE-ConnectionGUID: 4OEsFDlCRP6oM/2lneZurg==
X-CSE-MsgGUID: +cvqahfJRHSHoB3mQsRQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="202518467"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:07:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix typo in function kernel-doc
Date: Wed, 17 Dec 2025 16:07:02 +0100
Message-ID: <20251217150702.2669-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The function name is missing an underscore, which results in:

  Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:1261
  This comment starts with '/**', but isn't a kernel-doc comment.
  Refer to Documentation/doc-guide/kernel-doc.rst
  * xe_gt_sriov_pf_control_trigger restore_vf() - Start ...

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index bf48b05797de..5cb705c7ee7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -1259,7 +1259,7 @@ int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int v
 }
 
 /**
- * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * xe_gt_sriov_pf_control_trigger_restore_vf() - Start an SR-IOV VF migration data restore sequence.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
-- 
2.47.1

