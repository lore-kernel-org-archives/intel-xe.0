Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5F1F513ED
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 03:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0AE10E2F5;
	Fri,  6 Mar 2026 03:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACRip35A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AEC10E2F5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 03:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772766028; x=1804302028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WmrwkKBmSjGuRbsBTm45LQSRPfbDfnCqAtyfZjsZ1o4=;
 b=ACRip35Aia8jEDX7N56vXSVMws5+g+FRKjLeAMy3NGO/eAtaZWHVK+CI
 WO81Go0usmz/DqvqVgFRoHfVTgn5a0h89Xe1S2CTR8hkyCA8h8+6ZLY/l
 J46vljJwa6TcVI/f0LQTvrTbsiNwTqEmHZN9dQjEEQgYGQMP8PntucHC+
 kWFvjlEi//clYneNcctWOi+N6RXcEiYb/KlaJ8EsCnJ27pMIwwMfjkNhK
 a4Tz2gVV55uu/lq2cmvi3U6M0uH/cgwHqwE1waVdNtZ7OATvjbjJPte94
 WmKVytKgtVBkzhooiodWW4an0Uxufm+y99Xte6vPTTQal+Qxd2RwpTTek A==;
X-CSE-ConnectionGUID: LiVJ2yQ7Sm+oJavii6tR0w==
X-CSE-MsgGUID: Q5/BZ7wpSVijO1LN54cpzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73773774"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73773774"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 19:00:27 -0800
X-CSE-ConnectionGUID: SjenDhWZRn6vydBzBiXTTg==
X-CSE-MsgGUID: kn4wSYZCTTKv2J0QG0urMw==
X-ExtLoop1: 1
Received: from dut6079bmgfrd.fm.intel.com ([10.80.55.56])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 19:00:27 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix missing xe_hw_engine_group_del_exec_queue()
 in error path
Date: Fri,  6 Mar 2026 03:00:09 +0000
Message-Id: <20260306030010.11041-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306030010.11041-1-shuicheng.lin@intel.com>
References: <20260306030010.11041-1-shuicheng.lin@intel.com>
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

When xa_alloc() fails after xe_hw_engine_group_add_exec_queue() has
already succeeded, xe_hw_engine_group_del_exec_queue() is missed to
undo the add.

Add xe_hw_engine_group_del_exec_queue() at the kill_exec_queue label
to fix it.

Fixes: 7970cb36966c ("drm/xe/hw_engine_group: Register hw engine group's exec queues")
Cc: stable@vger.kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 5c67185d5357..af915ccb4925 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1408,6 +1408,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 kill_exec_queue:
+	if (q->vm && q->hwe->hw_engine_group)
+		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 	xe_exec_queue_kill(q);
 delete_queue_group:
 	if (xe_exec_queue_is_multi_queue_secondary(q))
-- 
2.34.1

