Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9538C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581310E52F;
	Mon, 13 May 2024 08:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7a9fL4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97210E532
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589750; x=1747125750;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gEw0DeFTd0cqKWh3/b1azcCII2VdWIWkVKgp/yNt6ic=;
 b=G7a9fL4sq5fGcuvri0oL9PsiiB5m5WD258+rrhe0PDuzqiI3r3PmmrCU
 IQSRbcCeQuypPd4uzOjNJBtawgrqZDVQxPljlKtYeL6dbt6muDQkBh3Hv
 /WjuUkNvQIxqvou98HhjdGJfVBgUPVoxToTyKYHPSmTKuecOPylh6dqRD
 2IW3D2Yz/notalz25OC+/An8EyWqHMRTl+Oky/XBJe09ASx5Ozh5d1FNK
 w8YIMXeyYwUnlRqixAanbF6/rFJRqcVGM+WptYt/saaqcFbKCZIFbsWyH
 CzrMVvkzO9BjLzwIOe3Flg8Idmk3hEhk5Fp2ULbyUOZWGHyfOTpVl8dEx Q==;
X-CSE-ConnectionGUID: odJZ1tAaS0Kk62wRoSmuhA==
X-CSE-MsgGUID: OaKiJyhPTMS6EFzhaSxqTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11452637"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11452637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:30 -0700
X-CSE-ConnectionGUID: SujDCVWkSWCo1+ehIQqtow==
X-CSE-MsgGUID: sYz2vgvLRJK3MQXq0uk3Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30306520"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Fix xe_lrc.h
Date: Mon, 13 May 2024 10:42:17 +0200
Message-Id: <20240513084218.2084-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240513084218.2084-1-michal.wajdeczko@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
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

Prefer forward declarations over #include xe_lrc_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 06a95a598736..e0e841963c23 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -5,14 +5,17 @@
 #ifndef _XE_LRC_H_
 #define _XE_LRC_H_
 
-#include "xe_lrc_types.h"
+#include <linux/types.h>
 
 struct drm_printer;
 struct xe_bb;
 struct xe_device;
 struct xe_exec_queue;
 enum xe_engine_class;
+struct xe_gt;
 struct xe_hw_engine;
+struct xe_lrc;
+struct xe_lrc_snapshot;
 struct xe_vm;
 
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
-- 
2.43.0

