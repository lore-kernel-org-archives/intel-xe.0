Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75224C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 14:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362810E70F;
	Wed, 13 Mar 2024 14:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgfgSHm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8710E70F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710341558; x=1741877558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rHh0oDZRa4DW6ZNwhueqxcflChs3Ikkt6I9fY3tGc5s=;
 b=VgfgSHm5wWjj2uqJ7u1ZnDeKVJEptbq2rI4i+42VWcjLF8G6ZEmM6t2M
 94xxj//iv+7TY3cf/YFLgzseED1rIkayD6Q5HBKkmSJbHXVK7xb8pFXmP
 hZpK5iPAsKWIiWCaxsjHESVtwXIz35/ZqaB9fU5V0Gg3OTQxABSYODoX7
 3SQVRCrCP3wK2Y6qNF3AAW/m2QLMByQI821dyk9L3fk2ZfwEp4e07S1at
 0gA6pipbhgqAtSjEmIm6GKTX77S0vgAyjBun9z0vj/TDr2U8bbOCOqIRZ
 HCFWwKjLsPzONqYxRC0MSXtJWEYds4SdrXF5CpjYelEjP4wE79LJXFUV4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22623994"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="22623994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16545939"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2024 07:52:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH v2 2/2] drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
Date: Wed, 13 Mar 2024 20:35:45 +0530
Message-Id: <20240313150545.2830408-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313150545.2830408-1-himal.prasad.ghimiray@intel.com>
References: <20240313150545.2830408-1-himal.prasad.ghimiray@intel.com>
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

At label err_unlock_list the condition write_label will never be true.
Remove the deadcode line for write_label true.

Reported by static analyzer.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260d..acc066e405d0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -380,10 +380,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 err_exec:
 	drm_exec_fini(exec);
 err_unlock_list:
-	if (write_locked)
-		up_write(&vm->lock);
-	else
-		up_read(&vm->lock);
+	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
 err_syncs:
-- 
2.25.1

