Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE962CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0510F084;
	Mon, 12 Oct 2026 12:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B492B10F072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807938; x=1823343938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3wHp77WRgxKIs2LXFJ2R+UhEkTp/OWqmfDdV6V3wOk=;
 b=E4CFEVIv7yfhNMv3RHs2apzd68hQdYTV/joglnDBfnHpMZ3S6y2VUzbr
 i58GpxZ5kxp1FZe86LjMcGvObtRyCbG7IIYrI7U6P2bkinXtVxOVHfQd9
 /gdCpv2R/kF+CdaKmxfyPWQnZDZcfUQMheXlzA59M2JssBKgHfVCZPyt1
 QENemCIof91eDQTXn7yCbIp+pDm8GNb8fAVaNRhK+DMVq5p0DI4C8fL83
 BbInEogyRJ4sBnqHigndfAoKaAkdhilfJ/s8NthN/VLxwiwddx6z2bHkA
 /5F7difRkLyjnEPshKYaBhLYF9G+bYocyArsBABiPOfp3UxQ4nhnr4hRj w==;
X-CSE-ConnectionGUID: hKdAJyfCQl2pg8FKn1i9pA==
X-CSE-MsgGUID: cXLh1xoTQ3yJ1G61m8glhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522908"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:35 -0700
X-CSE-ConnectionGUID: LdkdWztPRiK5A8z4VMkcEQ==
X-CSE-MsgGUID: A5qUtP5TQZOboasnvTw2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962802"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:34 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 08/12] drm/xe/pat: Report missing PAT table using
 structured xe_log API
Date: Mon, 12 Oct 2026 17:55:17 +0530
Message-ID: <20261012122522.2307625-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the PAT component tag
when a platform has no matching PAT table entry.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - correction in the error code.(shashiko)
---
 drivers/gpu/drm/xe/xe_pat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 0ac64a6a3098..3dfcd364ac67 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -692,8 +693,9 @@ int xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_log_err(xe, PAT, -ENODATA,
+			   "Missing PAT table for platform with graphics version %d.%02d!\n",
+			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 		return -ENODATA;
 	}
 
-- 
2.54.0

