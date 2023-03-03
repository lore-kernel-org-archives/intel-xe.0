Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC973C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC83010E5CD;
	Fri,  3 Mar 2023 10:16:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAF410E5CA
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677838577; x=1709374577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oiPQkY/aYiLygTBpWhjJyA+xopbLUSFCz6HCZJBQvCE=;
 b=ELm/r3PElS8dbOjWtzBaN5c3FPP330EWlvt2MOezw03T14kvWMBgIXJP
 nTehHy9N8wtWCV/KwhK1YQllZN1FYrS4nEi9GnbaXMtrPLVlpQWRUfLIT
 UKR4l7JN4G47hzXlAFI7OB/tUxKCEh9OANI3FseeEEDJCBOKWWNO5gpP1
 0uF9ORabQ6wPGK2SZREwPDajcWZ5Ad3Y0I8QOy6E4eKc4tnBKqV4cLaEw
 GTGl8AH63SgYsZ62y6bPa2l9lgXZW8gWaRQcIxOxSf+7POidpotUT6/wC
 N9Us52d+1kGe7hiWumqCOaUVeOjP/jF4vIOCeOzuSgC8NLDlccKengyRR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="335034910"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="335034910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004537318"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004537318"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 02:16:09 -0800
Message-Id: <20230303101610.21520-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
References: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/4] drm/xe/migrate: Fix xe_migrate_clear()
 description
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Kernel-doc fix for function xe_migrate_clear()

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c2610e377eb1..a922f90f0627 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -783,7 +783,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 }
 
 /**
- * xe_migrate_clear() - Copy content of TTM resources.
+ * xe_migrate_clear() - Clear content of TTM resources.
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
-- 
2.21.0.rc0.32.g243a4c7e27

