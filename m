Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F4C678DB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Mar 2023 00:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CF210E78B;
	Sat,  4 Mar 2023 00:14:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306BF10E790
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Mar 2023 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888850; x=1709424850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vx98Bt5SRt+amR62plMfxKlRbT3vsU9TVasP8AEH6AY=;
 b=cyw77/pknDN8sEU1U9u11pzLErihGSFPWBVkm9D1BHL7vsP4W9XFvrk6
 U2YvPJcYGr8ByUUmHdXIdIbKMArcBVta6cFi2oIBIlIgJPgbr+HaALXcM
 j46+/je9hVwiCsPYb2lp0GSuQBMeRW3QARkzh6kktPOFhfJGYtn2UekV6
 5wcveXm/hj/mD2qqud//5PO6uJbHgHgctWnshaG8sK/sxoW/0Uq5E/acl
 k/TxCRVi8uBGMQ1NDJiWyPLq7X2zSLgGB678RyVDRzMmqtQfV3ATyrqxo
 EDSgLNUNxFkPUnfZyIa2rgP0ogpK61wFY1y0MgmWPxXRa1rrd6X+r6+6y w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336710237"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="336710237"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799389750"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799389750"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 16:14:02 -0800
Message-Id: <20230304001403.11761-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
References: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/4] drm/xe/migrate: Fix xe_migrate_clear()
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
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

