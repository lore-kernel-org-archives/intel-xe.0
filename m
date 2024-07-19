Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3453FC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0783E10ECA6;
	Fri, 19 Jul 2024 19:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLCz5VYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA4310ECA6
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721416550; x=1752952550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZoAkviRdb5hD1BQ1ru5i0khGvj8C5zkPV8qBHkL5q6Q=;
 b=eLCz5VYgzc2Xbx4AC+R4PtOW47jJE4fwSzC32nE5qwBzRQ3391CWlHeN
 SkZ9+1ccAMSdG/UbxcNQtrjftWgV64oMfN/Z55H30k1IMKJJ+QXIfezq0
 ZhXTYYocFrHuKtrIFpAFCCRfdBz07DSDeh4AhHJ7DgyBGQP3qvRjMwV7E
 IcqQwR1Ez7OcgmqYerKbsqr/UE8AR63Q1Ij6+yuwh2BeFZS8iCXfyuw0d
 5uIwRn00F9p5duVNyXUAhw7KCSlInqnk6KNVeUd25h1Zwz5IwCBiXA/tO
 1WzNKE/fkbu8eMvAN+xxAuwNERXOqSRu+Fyx1nj08nRUVWY/SYWO5wK8x w==;
X-CSE-ConnectionGUID: uWZpuPVpRbOM7IffWUGBAg==
X-CSE-MsgGUID: GR28MA7XSSWfQk1GQeNwqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="41576157"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="41576157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:15:46 -0700
X-CSE-ConnectionGUID: k5X9iL57QG2s9CHqNg0zuA==
X-CSE-MsgGUID: lNSiGaJuR4ap1CwDqX4o6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56058036"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:15:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Fix warning on unreachable statement
Date: Fri, 19 Jul 2024 12:15:34 -0700
Message-ID: <20240719191534.3845469-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
it handles all enum values. However it's perfectly legal to pass an int
to that function so in the end that function may happen to return
nothing. A smart compiler could notice eu_type is never assigned to
anything other than those values.

Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
triggered for me, but this was reported in a different system with
gcc-10:

	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()

Since that is not really possible, just take the simple approach and
return NULL.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 5a1559edf3e9..0662f71c6ede 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
 		return "simd8";
 	}
 
-	unreachable();
+	return NULL;
 }
 
 void
-- 
2.43.0

