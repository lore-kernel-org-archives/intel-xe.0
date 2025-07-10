Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E21C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72E10E977;
	Thu, 10 Jul 2025 21:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1ZHzegr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A9110E977
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752183298; x=1783719298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N18t4t56piZfsRQdQCMp9VJAzVJa3LwKs8m3jYKnueA=;
 b=g1ZHzegrudj0af/yWlNVjdIXHXM3xhPi4i64u3sKRK/oUbwgYmm+5IcS
 xhn8rZk0Xgy4xWWCekfyy2epFONJJiBf3n14/xvPQ2LwKRgac8CXjRt3C
 n1zZmqQmxgQcgryrEjqu+YwG/PzaXJdEOy8VKwATAdZlI3B75iPVRRUqD
 8tIjKaLsHgjvVDV4US2GQRem6K7KVJMHmtChxOO/O0HEulymI8Jo9gRQ+
 +qNcT5nEa5gkBusP+c8OZBFBBAmwW5YkkxqfVyTpeJ0ILw/ltrNUJJLIS
 LH9C1vhpvV8WnGv3B/tNMR0a2BHhgH3OvDwT6oMZtA06cdVDlGObT2CKF Q==;
X-CSE-ConnectionGUID: LzlghQF7S8WNog7qRZ6WlA==
X-CSE-MsgGUID: jpncU1lETau+Mi3Mk8tMSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54328405"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54328405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:34:57 -0700
X-CSE-ConnectionGUID: 1xDu5tPnQ4emMQ2JAbZRGQ==
X-CSE-MsgGUID: ePBc1isGSQylXF/uvSBuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160500814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:34:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: Fix alignment check
Date: Thu, 10 Jul 2025 14:34:41 -0700
Message-ID: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250710-migrate-aligned-4036014aeb55
X-Mailer: b4 0.15-dev-858c0
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

The check would fail if the address is unaligned, but not when
accounting the offset. Instead of `buf | offset` it should have
been `buf + offset`. To make it more readable and also drop the
uintptr_t, just use the IS_ALIGNED() macro.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4e2bdf70eb70b..18b53a4e267d3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1817,8 +1817,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	xe_bo_assert_held(bo);
 
 	/* Use bounce buffer for small access and unaligned access */
-	if (len & XE_CACHELINE_MASK ||
-	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
+        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
+            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
 		int buf_offset = 0;
 
 		/*



