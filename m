Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7090EE66895
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3F510F0C3;
	Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwhmlA/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55C10F0C3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766178727; x=1797714727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6VrO8KjJq4wte1RK+J7Kpdo2NXFO/4ogY2zTOTtWuXE=;
 b=XwhmlA/Ag5+2ijLSakM5jHI4cLNSXLHB66Qp8gvpsICbbIm27T3P+di8
 3JkftB8pqyvTruGV0J1oQZTKSSxfHoVM1Je2WL3LpCnjclNQ1FKDxEHhw
 zkwd/Z/Wt+o7ebIcd3BWdaJD1qzq9LS/5xSifqpK2CnIE8X4dsQ1deqtF
 8jw0gUp6w2avJ0jvrVQ3sp0cG+GSpuYMmOiIWUKnPVw+eA51lAEF+bD5C
 71fP/0+M94/e6UoB18BwWgX1oNW781kt8AJXl/fhJCdv5NfMSTtEqo4wO
 0zNxe1ak+8khVJOmo7HVBsH4c9x4e0BN+1Bj+NJ9sOM64wt8CIO58++M+ Q==;
X-CSE-ConnectionGUID: hM/8lYrARQ+tbv8x7nZGcQ==
X-CSE-MsgGUID: Njv3ytdlQQWBlSUhbmv2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78460622"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78460622"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:06 -0800
X-CSE-ConnectionGUID: wJ3MdDJvS0WhcFlTy8Zm/Q==
X-CSE-MsgGUID: X5JxRE3ZT9SOCXd9LwL0pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="204030372"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Assert actual size of VRAM mapped in migrate VM
 is aligned
Date: Fri, 19 Dec 2025 13:12:01 -0800
Message-Id: <20251219211201.4107410-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219211201.4107410-1-matthew.brost@intel.com>
References: <20251219211201.4107410-1-matthew.brost@intel.com>
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

We have been asserting that the usable size of VRAM is 2M aligned while
mapping the actual size of VRAM in the migrate VM. Update the assertion
to reflect what we are actually mapping.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f8d688533dd3..ed2beaecc3df 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -155,7 +155,7 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
+	xe_assert(xe, IS_ALIGNED(vram_limit, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
-- 
2.34.1

