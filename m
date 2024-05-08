Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD979C25B4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 15:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DC310FC76;
	Wed,  8 May 2024 15:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqtfJ6Du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7BD10FC76
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715180884; x=1746716884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWfc+F6DZG/I3bolFupeFzhuLO8yyKqLmoF38Dy5Dy4=;
 b=YqtfJ6Duxr0y/XzIRXBAhKGpLqlE16lwVb6XJK11i8Nx4GHKQjxJ8zOm
 LfFZI386TRkOYEEpI6uslU/UHnEDrhhZwKPSaIT/xPHrGX7HQD1sjHNLv
 wCt5zvgR1D42FD/PRUO0I0rS9pNjBS1RJm7vCXN4FGzVS5HxShM2HrGkQ
 ivJUbnp3hINYsu1sPJgh64d7rxcpvrtrFuP4RGwNpVq/loW2cI8ACif8p
 f7dVY76pjqGXsV5ytJ4WGhIlnerYUo5Sym8WpDsG25B0AOQrvkzI2JbU4
 kzkoKfxK4tbnvUFEPsclFw/BMfh00VH0cwG4znXeEYPvo6hS8RdyLmf1Z w==;
X-CSE-ConnectionGUID: CfWmlHa3RxqxkvGifyet0A==
X-CSE-MsgGUID: dGzS+jgDQ4ulOJ88upS2+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22442160"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22442160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:08:04 -0700
X-CSE-ConnectionGUID: RaPAIX/ORT+1wFFNE5aJlg==
X-CSE-MsgGUID: 9sEpvum4QjiUNx2ptA01Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33474810"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 08 May 2024 08:08:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Change pcode timeout to 50msec while polling again
Date: Wed,  8 May 2024 20:52:15 +0530
Message-Id: <20240508152216.3263109-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
References: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
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

Polling is initially attempted with timeout_base_ms enabled for
preemption, and if it exceeds this timeframe, another attempt is made
without preemption, allowing an additional 50 ms before timing out.

v2
- Rebase

v3
- Move warnings to separate patch (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index c010ef16fbf5..a5e7da8cf944 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -191,7 +191,7 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
 	preempt_disable();
 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				true, timeout_base_ms * 1000, true);
+				true, 50 * 1000, true);
 	preempt_enable();
 
 out:
-- 
2.25.1

