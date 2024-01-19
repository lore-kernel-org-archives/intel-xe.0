Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122D4C47DD8
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A710E949;
	Fri, 19 Jan 2024 00:16:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583BE10E915
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1iTgL6M5NaSFPso26doI1hg/9QFzfR6yQfQQ7oZKbo=;
 b=j/vUc7OQHR2MTwL63cgFPbA3e0Yv3KAg47Ruvo1ii3jOVmegMOZLjrwS
 2LmI/qEP+jEcCAhH0+qN0yfpigQztvDx2oSUh1a9T4ZpgFdpBDgSyeg+r
 qX0qsTqR6RRWuBwvkd+hUiF43SXfutWBXqcES6AyRfP3F24qDl3VgSTKj
 s8Em6yxd5Iwp3Nh9PqkyXzmyWBOsO/Rs8g01LfPFRNbeFUDixzth+pJYa
 3pQQu1NxicSe18xR986V+RszOyrzYknFqVCL4Ye9kLEA1coSBW6TbUjJt
 cT6Uob9ZWUTw4ugeBp+KGJzyqtgdmqweNl0eIbHUOh9iAY/1BxYwsdd1D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373185"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818923997"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818923997"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/xe: Fix cast on trace variable
Date: Thu, 18 Jan 2024 16:16:11 -0800
Message-Id: <20240119001612.2991381-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cast the pointer to unsigned long and let it be implicitly extended to
u64. This fixes the build on 32bits arch.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 95163c303f3e..e4e7262191ad 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -31,7 +31,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			     ),
 
 		    TP_fast_assign(
-			   __entry->fence = (u64)fence;
+			   __entry->fence = (unsigned long)fence;
 			   __entry->seqno = fence->seqno;
 			   ),
 
-- 
2.40.1

