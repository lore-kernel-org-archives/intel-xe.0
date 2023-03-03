Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BF3C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB9910E5C9;
	Fri,  3 Mar 2023 10:16:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594810E5C8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677838577; x=1709374577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N2cArrXkzVsaB+Zbm2h9e1Pg8GDYxF4a8nPDgkQNAlg=;
 b=VrRs0fAZwAWKFdmqWU/88TRaIy13RnesW3N8IKVbPRuyno9kT6YBoxRf
 nhTQMKCOj82nCQF5eIXSFw9/Vrfllg/UvhSFuUWpwjr4cdq0o2yRN2sGe
 cqyHo9zsdnCzvMjEtm66ra/x+C2Si7MIVlkex0ajcOxnwUeINXyxGkvi1
 rpdu5zVzKnjuPeEB1KLn2Ra53uSaq3MN4/J69hYmhjrTmLdwsQhL0cM/o
 kfWwX5FxeV5iHgKg7ubCwidMiIyqnufNvj9eFcaip4g1buZnYkuGotrEg
 j/QulN2BduikR/82tALA2KCOQTpCm6CbH/PYS6MC318NKz7kavhcc/KIc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="335034912"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="335034912"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004537321"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004537321"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 02:16:10 -0800
Message-Id: <20230303101610.21520-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
References: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/4] drm/xe/migrate: Fix chunk size calculation
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

In write_pgtable(), use correct size.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a922f90f0627..2943f46cb6da 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,7 +940,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-		chunk = min(update->qwords, 0x1ffU);
+		chunk = min(size, 0x1ffU);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
-- 
2.21.0.rc0.32.g243a4c7e27

