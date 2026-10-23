Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D1606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLvDfPI0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA97C10E5DA;
	Fri, 23 Oct 2026 09:25:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5110E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792747517; x=1824283517;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jg4CpQ/kS/KutoA/xSDIsryTbZLaSuDVo2HkUG276Y0=;
 b=YLvDfPI0n4BnNU7D0UtwhIVAsfFAxYlYV0rETqU8/GPGwaRhW+pjQwU6
 68wNvPIlS2BLZMWDdZpT847cLV5yqOvinhU5oZWqsMJ19EKVQWdJZ+3wS
 Qu4ttWt2Z1ao62wZDhhXNW/EG5lxAREa1UL4pg0LEiGkJZXX8FURCU7vI
 ybuy42ej+urPIn3X1ft8hoCkvKG3fy3jLuNDC7fFdIPNnxXs25hwwYrFi
 BM5a1CdEw++KbV6a9xiRVoVppkSiqKQydIjYS0POswfh9FWOdqvAaYCzN
 ZSlwlb0G0+oQlcO2Vkq2I74r2DzPDkQMJ3/sThqyFgsSMH56CT/NeaPqH Q==;
X-CSE-ConnectionGUID: GjAcp1VBQo6q0lLLSP1bfw==
X-CSE-MsgGUID: MvdeyyyPQnu2LnG86A5lPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1612626"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1612626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:25:17 -0700
X-CSE-ConnectionGUID: 8wWL4H9rRiG1ic/ooPyMQA==
X-CSE-MsgGUID: iIf4SrLpT+m3Xv0jJO6j/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4080475"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2026 02:25:16 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org,
 shuicheng.lin@intel.com
Subject: [PATCH] drm/xe: Extend Wa_16030224309 to graphics version 35.11
Date: Fri, 23 Oct 2026 14:52:54 +0530
Message-ID: <20261023092254.1429011-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

