Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC263CDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73410E285;
	Mon, 22 Jun 2026 06:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZuYtOOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D41510E4D5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111595; x=1813647595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=reSABeYGVBNsvdmDZbqATUvtTd9UiU9MwGmVrmhWY00=;
 b=GZuYtOOn/LzfQ7etHmTtGPB2PxSOdOAJavajARVVkasPsYts+kbRACUt
 kptEd0jlqeGMCa1qu7o429PK1eDVlLhr6rtV+BFC4lYteMQf7W/2cZzyo
 YjdQxuLvdU9U6soUMeqI60v18l+UUmFVQ2To+VWb2VnDyr8WiDxEGlrPv
 eyXT5xb7STCplhlENVILoCBuPD4AYlzX+ACI1ZIxLW568pHe3iv6D1Yxh
 Xy2SUPrhsB/+q6jFLgwwtXh0hxuFrqIpaVRQA5XbsxyTNM6CyjV3LUsE/
 jsUn9c35jlY2lg0zHKs6bWls+9LpGjs0hdwszhMNgBffURAnigyWdHqFV A==;
X-CSE-ConnectionGUID: SEIbi2NARXmnLUq3Gr1tnw==
X-CSE-MsgGUID: Ri7xfMw7QNOxlRWgi8s6Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928765"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928765"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:54 -0700
X-CSE-ConnectionGUID: AfmcVoaVTQiuErdc2ZJ/Eg==
X-CSE-MsgGUID: 9hnxbCuTSRWV9BX+hw52JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068219"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:44 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 8/9] drm/xe/pt: limit page-table walk depth for large-page
 mappings
Date: Mon, 22 Jun 2026 12:30:30 +0530
Message-ID: <20260622070031.2445502-9-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Adjust xe_pt_stage_bind() to honor large-page VMA mapping flags when
setting up the page-table walk.

When the VMA requests 2M mappings, cap the walk at the PDE level. When
it requests 1G mappings, cap the walk at the PDP level. This allows the
bind path to program page tables at the level matching the selected
large page size.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0959e0e88a14..a4a727cfc962 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -773,6 +773,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	}
 
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
+	if (vma->gpuva.flags & XE_VMA_PTE_2M)
+		xe_walk.base.max_level = 1;
+	else if (vma->gpuva.flags & XE_VMA_PTE_1G)
+		xe_walk.base.max_level = 0;
+
 	if (clear_pt)
 		goto walk_pt;
 
-- 
2.43.0

