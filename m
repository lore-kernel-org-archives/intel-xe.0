Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BA606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWsBXMVD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB8410EA97;
	Mon, 19 Oct 2026 18:51:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF53610F024
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792435895; x=1823971895;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E6AHZ9KNWIYupo5JoqZYPoD6etZMxYmRJ4FmpctQF9c=;
 b=BWsBXMVDJL0K/A+CSl3nkxSPGA5et88+a1smL5UBfPnHz6pYxbUIxl3g
 3i9gOOgGae+0MOBF2ornxfO6dyrxNf2lBGGkOOH2LBx9bZhMvn/wJ4LwQ
 B7osFoLZPHFCE6PluDVLvtHqRSzJSomw++IyhEiwAinYw0DO6S1/yGa+Z
 MAF2sIsBG+lGyDtLhrdWRi+NU1iL1EI2vswLIkFWiDv7hrupGtU9VGpO4
 Z1Lp8z3lU5DgTsVbhQ0cTC2e7LAHFHeDlZVj4On2VrT76xEQZLZpA6Kkd
 /HL8som4DqY2PdiayrEvb06E3Zj6y1AIHJLXros6qFu145GJV4ziO22rw g==;
X-CSE-ConnectionGUID: GOf81uPxTLqcT0U7ppwMPw==
X-CSE-MsgGUID: 9BiLUCclTWCxU3Za+T+ApA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1013099"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1013099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 11:51:34 -0700
X-CSE-ConnectionGUID: Jnmh8qfISMyrKXTK/Hy9zQ==
X-CSE-MsgGUID: Vr0L0PPbSHOhZD1qTLAmuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2497595"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa007.jf.intel.com with ESMTP; 19 Oct 2026 11:51:33 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, shuicheng.lin@intel.com
Subject: [PATCH] drm/xe: Extend Wa_16030224309 to graphics version 35.11
Date: Tue, 20 Oct 2026 00:19:11 +0530
Message-ID: <20261019184911.891262-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Opt in to the GuC workaround that ignores context completion status
with preemption or preemption-to-idle in the CSB when the multi-queue
feature is enabled, on Graphics Version 35.11 as well.
This WA is supported starting from GuC 70.73.

Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f35181fc4e49..63d695f40214 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -75,4 +75,4 @@
 14027054324	GRAPHICS_VERSION(3511)
 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
-16030224309	GRAPHICS_VERSION(3510)
+16030224309	GRAPHICS_VERSION_RANGE(3510, 3511)
-- 
2.46.0

