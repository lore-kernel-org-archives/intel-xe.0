Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C293C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 20:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267B310E317;
	Wed, 22 Nov 2023 20:43:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A010E317
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685824; x=1732221824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aTN/DesM+sKLuHCoaLQryBZ34jXHP+LKNqZgzbl3g38=;
 b=FVupf2krCFKDYE9ibGFoz5P2a2zgqthZujrTp4F9IjqWQC75BUCLpjl6
 JG+fIVMVUwGfnKSEIND3ROf2zor6ZvppCfsGZv7Yf40ztNWfHkAf9/ITH
 sJe1rS/N7a6F61A0tnqzGjei6QtArg2XYxtjTje/sPHrEES78cQB2pkqx
 qszrLKqEjRozgtBBJHki2v3LZZlkXSkh0Bm0jQlnTcO7Z/NQaFzU360aI
 qaxyHD/aTXzBKxklzTczb9+8NcERjrQ1ZpS62pvb1y7hu5VyFTd+Cn48b
 hiPdWmgVdpCCICEJkrGBx+qReOVo87U/xYtsfuwkeC5wChmWjo8b8rLNa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="394972175"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="394972175"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801872562"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="801872562"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:43:43 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:45:00 -0800
Message-Id: <20231122204501.1353325-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] drm/xe: explicitly set GGTT access for GuC
 DMA
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Confirmed with hardware that setting GGTT memory access for GuC
firmware loading is correct for all platforms and required for
new platforms going forward.

Fei Yang (1):
  drm/xe: explicitly set GGTT access for GuC DMA

 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 1 +
 drivers/gpu/drm/xe/xe_uc_fw.c         | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1

