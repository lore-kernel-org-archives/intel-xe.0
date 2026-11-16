Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A23606A336
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gTtw9/Jn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3848C10EAB5;
	Mon, 16 Nov 2026 22:51:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6234710E498
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794869466; x=1826405466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WmM4kkvZVE6WYVB6jHErvsqXQW2sokr15hZbMsXppfA=;
 b=gTtw9/JnE5GNP3NPFd8y0VbSnHlj6sRonM2q6pQFs+3+SoMP0CWsFd54
 0wgQZLtuw6aNA63OA+S0bB4uUgkGcMQEh1kWiXG9yjxVjK7lWMdm/GLyd
 gU3Lb8hC9CKrTOknSQ2aQ18p6cz1C14JYSU2faaLwSDAbegUQZD7SmxSa
 FgOvjd3EHyuJHnFJMKrjTSP3gNXfJOJo8DJuhFAxWqwL5n4Or6N5BGHeo
 uYqsyS6IrAIrdrs2ybPSbSgTIMysMh+/lkss8JdgnfBsOLOO7xnL8sPT0
 y3QRIJ41hYd8nahpCrkJgImnSGYvv39/K9EwHxDheTaRXSq59b5wLINYN w==;
X-CSE-ConnectionGUID: nNJKpsZzTe6t1GdiuEZf1g==
X-CSE-MsgGUID: eQ+z+kO/TJGMMtDR4MS3aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3656400"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3656400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:51:05 -0800
X-CSE-ConnectionGUID: 2yFQkfcKSDS+eM2XUbfvIg==
X-CSE-MsgGUID: 0VLh+SysSb6G17vkOge9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9492519"
Received: from mdroper-desk1.fm.intel.com ([10.121.64.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:51:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/lrc: Fix math in LRC offset comments
Date: Mon, 16 Nov 2026 14:50:53 -0800
Message-ID: <20261116225052.1167601-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PREEMPTION_STATUS in the Xe2 RCS LRC starts at offset 0x39 and requires
two dwords of space (offset + value), so the next item in the LRC starts
at 0x3b, not 0x41 (it appears the number was treated as decimal rather
than hex when the comment was first written).  Adjust the remaining
offset comments to show the proper values.

No functional impact; these comments are just for convenience and don't
relate to any in-driver logic.

Bspec: 65182
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8e4f767d7f59..54d50b1b28eb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -563,9 +563,9 @@ static const u8 xe2_rcs_offsets[] = {
 	REG16(0x5a8),           /* [0x37] CONTEXT_SCHEDULING_ATTRIBUTES */
 	REG16(0x5ac),           /* [0x39] PREEMPTION_STATUS */
 
-	NOP(6),                 /* [0x41] */
-	LRI(1, 0),              /* [0x47] */
-	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
+	NOP(6),                 /* [0x3b] */
+	LRI(1, 0),              /* [0x41] */
+	REG(0x0c8),             /* [0x42] R_PWR_CLK_STATE */
 
 	0
 };
-- 
2.43.0

