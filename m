Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB56C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68810E3B9;
	Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B79910E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116394; x=1713652394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFoF65GOYo+1gBrwa2B/LtC82q9EEVTd5bdQUo4xEi8=;
 b=i4qJaVIbXUsN97RoDaGwkD2EFVNXjqWgkDsoNH0n9+DcyFd8YqkuOD5B
 Il/Nrrg3g9nsP8Y797jJV84kTa3or9MPvIpTT02Hc4hQYXVqqVF0USYuy
 dmQ7ay5wInuQ5sZza/mopYZfYvJTspltvA72RhpiQ1qz4T+hRt31RGuOg
 C+JX3FoycRmKJnL3SyHJIDfAXDKB2r6VhG3DLmvlLhCMva+8cmCViOIf3
 7Es11qRsdQXEvmUjW9tfHxvneI4HcgbeSCsFErmS3Q8JFyMsVE4/ywxJJ
 uLtNIv0QiNxhJg5AVz13QMrO6DyGHrfJnwruhMfwcRJjxkrqfCpHDaIte Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693737"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693737"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913734"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:44 -0700
Message-Id: <20230421223258.128781-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/17] fixup! drm/i915/display: Allow fbdev to
 allocate stolen memory
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 46447dd58f3f..2d2388cbc626 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -349,7 +349,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.39.0

