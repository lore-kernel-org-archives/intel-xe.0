Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C8BD73EB8
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 04:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45510E8F0;
	Fri, 30 Jan 2026 04:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFOgaegq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABE710E8F0
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 04:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769748157; x=1801284157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pgaGmQruWWZmnQ7uFdwVvezvt5RYX8Hc7a+IiCD9zQU=;
 b=TFOgaegqQj6Yfh2XIHv/WpEocKWqMOmQvW9+BVWXIl5iKEWtA8bgY+cR
 jSkKOaHka07J6bU059EUTtJUmTtRMF5wyVayVFLmFRsApzRxvu+eNT6vj
 4vpmhPEuhyf9oQWF9M1FDxkf/VhnUL1ex27/x7yVTSQT+g3+4F6smT+8U
 iysNLDzXebqiIVKIz/7DTuFkh6glVr50FMmQAPbnrZbdiXw/zxGNPDrEv
 vfCJoHUdqkhBcjkLAg3stZkM1yBGQ8WfU7wWglBnWWROGsjvl9hNHgyWB
 gFp8xWtYeV/o6goOdFzk4Na6Xzm+b8oyLcnkXE7NVwZM0UEqVEzW/GspH Q==;
X-CSE-ConnectionGUID: 0pKmIl0MSdSKpICRJynVRQ==
X-CSE-MsgGUID: SsqCv9Z9T3yJ501nYR42Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71051134"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71051134"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 20:42:36 -0800
X-CSE-ConnectionGUID: GRvKydsVQHeJ1M26j/Zacg==
X-CSE-MsgGUID: rpAD4QfDSNSaI18UFCApaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="212837919"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 29 Jan 2026 20:42:35 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/query: Fix topology query pointer advance
Date: Fri, 30 Jan 2026 04:39:08 +0000
Message-ID: <20260130043907.465128-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

The topology query helper advanced the user pointer by the size
of the pointer, not the size of the structure. This can misalign
the output blob and corrupt the following mask. Fix the increment
to use sizeof(*topo).
There is no issue currently, as sizeof(*topo) happens to be equal
to sizeof(topo) on 64-bit systems (both evaluate to 8 bytes).

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index b7b4261968e0..34db266b723f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -487,7 +487,7 @@ static int copy_mask(void __user **ptr,
 
 	if (copy_to_user(*ptr, topo, sizeof(*topo)))
 		return -EFAULT;
-	*ptr += sizeof(topo);
+	*ptr += sizeof(*topo);
 
 	if (copy_to_user(*ptr, mask, mask_size))
 		return -EFAULT;
-- 
2.50.1

