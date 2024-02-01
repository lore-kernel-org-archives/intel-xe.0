Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47553C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7FC10F2D8;
	Thu,  1 Feb 2024 17:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVsscVuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7403010F2D8
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706810090; x=1738346090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ach/J/wQExjYk9Gz8To8XZk+t1+BXw9e6et+fs3F79g=;
 b=PVsscVuLVfAlgNOJj4E74xFXhpM4ddmZMn5TxXZLYQGB737vKni6aOKv
 gr3nhPzeNh92Zkhro9GJjvUNgY8p2NJ78PK39ljqFIaoPkR/f+KFPi6gP
 ZzbKrZrYWUUeX8mLG2sBoMKISvy3VTFb6zKUcj0MGaD/9ub6oqmRbFkNA
 y6tISFDbN238kdrRDs27pWPFQYqsUzi1G4rzjbznfqZPnGIfceKQxUC0u
 iKTZryMzMu3sdV2gxi1wDTAkD+7uLSco5rDzSJP3VyEZB3STUMv+77qfk
 UxZ++aj9NlBE0cwQcs70KwxuXROUS/NsTRlDBcpTaY23g+Zyay22e5ujf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="157137"
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; 
   d="scan'208";a="157137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; 
   d="scan'208";a="129910"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:54:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
Date: Thu,  1 Feb 2024 09:55:32 -0800
Message-Id: <20240201175532.2303168-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The logic for the unwind loop is incorrect resulting in an infinite
loop. Fix to unwind to go from the last operations list to he first.

Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2ab863fe7d0a..3b145a9c70d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2657,7 +2657,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 {
 	int i;
 
-	for (i = num_ops_list - 1; i; ++i) {
+	for (i = num_ops_list - 1; i >= 0; --i) {
 		struct drm_gpuva_ops *__ops = ops[i];
 		struct drm_gpuva_op *__op;
 
-- 
2.34.1

