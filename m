Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAFEE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 21:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7A10E051;
	Tue, 14 Jan 2025 21:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDyheWME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3174D10E051
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736889238; x=1768425238;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uMmQyjcvh2RbvjEQQ12Y+eJwXylf3TjH+/6fp8PkdmA=;
 b=EDyheWMExe6NYfeQ1fco4barsMKnI5XycCIXsyNyDyW1zxOqb8aG7qip
 d7F0TIUJOTUlKlAO2myN5/T+4czKgBCfLcaNQQSkBsBSQ/5WxV2bdtnoB
 umtR6ET4eX/5LVbYryhIjzKf9cLSEore0rMUhqkLEX2u1Vv6E8pzl6/LJ
 DS68bLF4woLX8wWHu1qDsuoN5sx65xZzeFlrgtsB2A2I5OU1Y5/WkKkU0
 yCPch/BDAh4iI4XmqKGx0EXCT6c4DXoveJpTkghMQ4l7/hpJRGLSIrQum
 kZLd9rE4p1gpyqhIaHBtoZJgowevFo9lK6PGjqL+bfvXKw0bxzul/WZdJ w==;
X-CSE-ConnectionGUID: ey7qGi/zQwOnjjhtDR+vrw==
X-CSE-MsgGUID: i7TwJIJNQe+DIG8kDhU2/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37092993"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="37092993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:13:57 -0800
X-CSE-ConnectionGUID: f3WRA6yaSwSpnsdFsDilrA==
X-CSE-MsgGUID: FV3R1US9Q2SQa7Hc5gvBaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108988121"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:13:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe/vf: Perform early GT MMIO initialization to
 read GMDID
Date: Tue, 14 Jan 2025 22:13:47 +0100
Message-Id: <20250114211347.1083-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241114175955.2299-3-michal.wajdeczko@intel.com>
References: <20241114175955.2299-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

VFs need to communicate with the GuC to obtain the GMDID value
and existing GuC functions used for that assume that the GT has
it's MMIO members already setup. However, due to recent refactoring
the gt->mmio is initialized later, and any attempt by the VF to use
xe_mmio_read|write() from GuC functions will lead to NPD crash due
to unset MMIO register address:

[] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
[] xe 0000:00:02.1: [drm] GT0: sending H2G MMIO 0x5507
[] BUG: unable to handle page fault for address: 0000000000190240

Since we are already tweaking the id and type of the primary GT to
mimic it's a Media GT before initializing the GuC communication,
we can also call xe_gt_mmio_init() to perform early setup of the
gt->mmio which will make those GuC functions work again.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: drop Fixes tags (Michal/Lucas)
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5d588b1dfe21..e6ad189294c1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -506,6 +506,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 			gt->info.type = XE_GT_TYPE_MAIN;
 		}
 
+		xe_gt_mmio_init(gt);
 		xe_guc_comm_init_early(&gt->uc.guc);
 
 		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
-- 
2.47.1

