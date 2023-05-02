Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB03C7EE26
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599C810E3F9;
	Tue,  2 May 2023 00:17:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DE210E34B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rBHan5HSE3gaag3Oz7SBRu8x4tsgYMeNqCefbepqfg0=;
 b=mAkSfA57PHKQxsdz7yN0BzbRFueIOurMt9ylRPe3lCeOJGGo3qJzsIdc
 9USa31tvyTHdI0SBBUjpW2BxEyDGm4L0Y6isBLrH2vyMNEqcRsg3axxS5
 ea6uCRABv502xo3PP2v5y7AQi7aV2keCHygSr8tt5GTOmYPcCM20F0++z
 65AZNltBxp0IjxDhaz8+HvwKCULPA132y5JLtGWJh01WLsZA3vAon3qjx
 wJbYd69Cfz00F1lAJWX1OBevAm4Ubc3CLxNJ8hplZPHzidtdziGzZU1AC
 /AWI6ZgVSfKHQdTA3LOQw0hqXtAH6WfFNMA88/3bZ5OmSdMrd42IQ9+Ip A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619567"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541681"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541681"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:03 -0700
Message-Id: <20230502001727.3211096-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external BOs
 in VM bind
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
Cc: Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Not needed and causes some issues with bulk LRU moves.

Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 272f0f7f24fe..6c427ff92c44 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 */
 		xe_bo_get(vbo);
 
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
+		if (!vbo->vm) {
+			tv_bo.bo = &vbo->ttm;
+			tv_bo.num_shared = 1;
+			list_add(&tv_bo.head, &objs);
+		}
 	}
 
 again:
-- 
2.34.1

