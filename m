Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5561C2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 05:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5852D10EBB4;
	Fri, 28 Jun 2024 05:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgDOQIfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FDE10EBB4
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719552091; x=1751088091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRxrVKM5xLYu2pyOBcVD+T57uJTtNJ+N/6w07AIhr/Y=;
 b=kgDOQIfevd0k5eZpXN37cr8wU0GFuvQpEQyi+gOe+QvrSE6MgfdWpl+r
 W7PS5Nz7pGzdft3n67H7zZgmpRygvj4WE7/pQFByNpbTBrsJoO9HMg6T3
 kFPDFxghzpX4KjrfeMO4aHh0jIiYQUbkS/RuhLUmN5ZOh8MaS+DRDexpp
 ClwBNyoo3tcPY1l2EgPnRUscicu7ddkeY8OwyQoPa+kQNvAN85ebI9uHi
 N74WNRKXBZ+oHnrJGCala01ribUmwEspcvQQvl0Rid8MMMw3Hqir/LksX
 CmhipgQ+mQ11bmAL/Yc49L/Bi8tY2/BbB2v2sGUrMVWre+st9dpRarPKx w==;
X-CSE-ConnectionGUID: HJFQcqYcQxGN4yl0dr4sLg==
X-CSE-MsgGUID: KUz1mtNiS/W8dhr2lSoVEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19619997"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="19619997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 22:21:30 -0700
X-CSE-ConnectionGUID: KZ4G1dMuR+ujoqHQiOnywA==
X-CSE-MsgGUID: R8vmnXfJRvqNZgylnUoTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49800615"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 22:21:31 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Destroy the stream_lock mutex
Date: Thu, 27 Jun 2024 22:21:25 -0700
Message-ID: <20240628052125.1847989-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

The mutex allocated in xe_oa_stream_init() was never previously
destroyed. Do so now.

Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6cc3f0217341..4188516a7816 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -824,6 +824,8 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	WRITE_ONCE(u->exclusive_stream, NULL);
 
+	mutex_destroy(&stream->stream_lock);
+
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 
-- 
2.41.0

