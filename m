Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDABD73EA0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BA210E8CF;
	Thu, 29 Jan 2026 23:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKeanDWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6B610E243
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727614; x=1801263614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUU2tW8Y7HxM8FxeBdA4TYokzvr4ZXE8P6rcWBzwsWA=;
 b=lKeanDWmAVZwgTNya2Unb9GFf8s82CparCTWR89hjbZy93Vhe2Pe0DSy
 C8cBU4Qijd85hJUHF6hpPA4sylnIzE/vL76ksC8dENQyc/ZiDd9JXDk6T
 zlLqxAxzyUoqz9uxUue9+tAp4Gc03S8kOijFMYyqM8O7+p2SvHxN7VJrQ
 EImJ3fZCvHChZcrisS5fwfYsiOGh32qp7gI4EI5s+UTSSepYY+5lMvVc9
 7sFt+bhcdV2QV5B46EsnJQSpCEIIrN3Tiy0033uV2yVO37V3rHahSflHu
 XNW+40R45O0kx5t1zlDgneDGvNwYrGT9YlIkm7tUAEDqOP2eR/7d5zwoD g==;
X-CSE-ConnectionGUID: F6V88HDmRoyLkwljNjZj1Q==
X-CSE-MsgGUID: /I9pWPyNRHaaqX1ZVpRB3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82089490"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82089490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:00:14 -0800
X-CSE-ConnectionGUID: 03oJNB14TAWZlt6vHDRCGA==
X-CSE-MsgGUID: n2NOXSH5QcW2cDaZKq0Bdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208715225"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 29 Jan 2026 15:00:13 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix kerneldoc for xe_migrate_exec_queue
Date: Thu, 29 Jan 2026 22:56:08 +0000
Message-ID: <20260129225606.412902-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129225606.412902-5-shuicheng.lin@intel.com>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
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

Correct the function name in the kerneldoc.
It is for below warning:
"Warning: drivers/gpu/drm/xe/xe_migrate.c:1262 expecting prototype for
xe_get_migrate_exec_queue(). Prototype was for xe_migrate_exec_queue() instead"

Fixes: 916ee4704a865 ("drm/xe/vf: Register CCS read/write contexts with Guc")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6e202428aac2..078a9bc2821d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1254,7 +1254,7 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 }
 
 /**
- * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
+ * xe_migrate_exec_queue() - Get the execution queue from migrate context.
  * @migrate: Migrate context.
  *
  * Return: Pointer to execution queue on success, error on failure
-- 
2.50.1

