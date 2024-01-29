Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59398C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A169112A93;
	Mon, 29 Jan 2024 18:17:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4C0112A93
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706552278; x=1738088278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F6lurE/Ab1DJsFI3pT9Dj23E9Gdg1weLDe4mpiCIDhI=;
 b=eLYQpE7/8PAsn2fyBmidMM6NLTZkDhmfYkaffm9q74z1eTt26+GImxkI
 v1/nOrS37RKA1QyeR0IYkQliI5vLxdVta/3TiiO0vEhHbPMRbAqHckOb4
 qFx2z8bK6YhY5lw4jQTA9KayqILBUA3ksXe5Z+nhIS1bH6lyiq06r6FY6
 XQjkpa/zljDcpaCunFUXJGYdfYhwT1Le5A6ogQT3+xdRRIlHo0xV9ZJlN
 0/DvCnhFIBYa4mQ5RnBmnSf7nUjYa1dAVByLJUuKwgKu5kh6ZVlIUtDHc
 YR+QfoTLHjseU/0Y0FQ4wfAkhdlhAZpaPLrNBaQYT7DHi8T0wCR2PpAqz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2903320"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2903320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3439250"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:56 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/xe: Move XE_MAX_EU_FUSE_BITS to xe_gt_types.h
Date: Mon, 29 Jan 2024 10:17:41 -0800
Message-ID: <20240129181742.183694-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
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

In the previous patch XE_MAX_DSS_FUSE_BITS was required to move
to xe_gt_types.h because it is used in macros defined in the same file.
So here moving XE_MAX_EU_FUSE_BITS to the same file to follow the
patern and allow re-usage.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 2 --
 drivers/gpu/drm/xe/xe_gt_types.h    | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index c4942f2b37751..e973eeaac7f1a 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,8 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index bb6dc1fcaa7dd..50077a0f73645 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -27,6 +27,7 @@ enum xe_gt_type {
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
-- 
2.43.0

