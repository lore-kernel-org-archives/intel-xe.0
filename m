Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65961C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 18:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBBB10E5FB;
	Tue, 22 Sep 2026 18:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/aWr6OB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D9E10E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790100757; x=1821636757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0SDBsRzBqp93Mpt+6bieX/Ru+0QipVwI2wpdvKYhEyY=;
 b=d/aWr6OBrhMaI0qUhnXU5ZJ3qmmCYmRvXroqgyYo8DLvecwLvycBhC2C
 wAPx7ncJYjgwTyqUOEfFC4mNnocCMMpSRug7veCeNVz8PhQoeWEEGADd2
 BkvMBcx7o218+97ARG5llcEcaOC90E2GNvf9IEL5KJAA1MuouxU6vmstf
 tMXqf2XuYf+rjZnamdHEiJXGKM/UrogCh7FFBOJQxz+8Ln9C3lfKU03/T
 aZ2eSBLqO0hM9Gq1nBpJ0BBazKAgPCGNpWMoKB4r2fAJI74GvpVpqCkHo
 aFvGNIgcvYcM8VjVKHhL73AcoAZ/srCHcf9U0n3DeeXIG4AfXsfE1vrJZ Q==;
X-CSE-ConnectionGUID: pLQMRrvERnemoq2Ln/yqkQ==
X-CSE-MsgGUID: JBPeVhpQSWy+rhCWB9n6qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1236107"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1236107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 11:12:36 -0700
X-CSE-ConnectionGUID: 5KDty0aNTpaCjururjZ60Q==
X-CSE-MsgGUID: WAB6MXeWRNmu5X6lKdDrsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272721698"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2026 11:12:36 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe/nvl-p: Enable PXP for NVL-P
Date: Tue, 22 Sep 2026 11:12:33 -0700
Message-ID: <20260922181232.1111750-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
References: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
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

Now that the GSC FW is defined, we can enable PXP for NVL-P. The feature
will only be turned on if the binary is found on disk.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d64e873d9e71..fa4d86392cd0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -499,6 +499,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
 	.has_sriov = true,
+	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.43.0

