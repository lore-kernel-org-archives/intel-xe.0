Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B03C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 04:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C510EEFA;
	Fri,  8 Mar 2024 04:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxKMU+8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FF410F2B0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709871830; x=1741407830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vWnJmNq8zNnvvv6L6oXrrUN1R9JLKnMr/gg/5ym6UU8=;
 b=FxKMU+8ugXT1h6cMDI5+iPKIhcUsWyjJys/mtZJnEWLk6+Jfyk3npKJ1
 jKRf8oJgHi66XWAFrsB8OxXhGQ9RVBObYM2fVkrhcR15QRbFn3AEREG1L
 /NQe4RR3pr7cBrasdpwHes298koInorgLpAuYfT6ehHHbnAw9gd7VUk8B
 Iujq4m5TI9voEnTJzA4DIYkQ5FYaBXYrtAx5Vg/PkuFSGV15jiU+ubEfK
 s78bcKfVwC7Q6g7zgbubaszmNqzbzPur/2cs/0htEeuQtCnDBXVXbIKdG
 aNLKfpaKL54nO0DgU7yd8Zg3j9ivCPfoKQTOIMZQMARjJV4aPy1dDL5oK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4431964"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4431964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 20:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10456309"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 20:23:49 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe/vf: Remove lmtt->ops null check in
 xe_lmtt_estimate_pt_size
Date: Fri,  8 Mar 2024 10:06:50 +0530
Message-Id: <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
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

In xe_lmtt_estimate_pt_size: Pointer is checked against null but then
dereferenced anyway. Since xe_lmtt_init ensures lmtt->ops is populated
remove the check.

Reported by static analyzer.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0d7c5514e092..d6d75414bb99 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -487,7 +487,6 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 
 	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
 	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
-	lmtt_assert(lmtt, lmtt->ops);
 
 	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
 			     lmtt->ops->lmtt_pte_num(level));
-- 
2.25.1

