Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF6AC83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 09:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA3C10E15E;
	Fri, 25 Jul 2025 09:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1G4KuoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058EA10E9C8
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753434324; x=1784970324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=09TC1j/FSz4j8P+Mm7FAtzrO5t0Q+yEnFwVwwbbN1ac=;
 b=D1G4KuoBu6W5bofl3SpBm2Dw3lFAnFeml/oIwyjQategEkBkDYFYXwOP
 PhL9rUrZipcp0M29+uskQw5WYC0qO6235Up8zDkI8YiHTVYC1NPDNShuC
 9FPQy/nuhiuk9H6FJs9DShyuMo0NPqxXsOpqixrBmj4cZJGrmouUH3j6y
 UJ+nE+RJ+A6et4Xp2VpylJGe5qgq32mQzhyJV0Kf3plEiwjn0nsNTibOj
 hjt96OKsHmNK81tqKvZeNnlR5YRoaYaRJqCJFmMf5H6wYSKrtcgFd8vuc
 urBIt1m2hcxbI+V2ehcH2qGWRwhI93soPSxVCfvEFNefKUtxnGhTC9E+F A==;
X-CSE-ConnectionGUID: VnaX0PjATSu+I1astBHSAA==
X-CSE-MsgGUID: gHEjDTyMTCChJjOSjZO1IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67118102"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67118102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:05:19 -0700
X-CSE-ConnectionGUID: BzNy7Lo7TLmQIFRfLVs7Sw==
X-CSE-MsgGUID: vkxDDqtHRNqOOdxLt5Eegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160787221"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:05:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/hw_engine_group: Don't use drm_warn to catch missed
 case
Date: Fri, 25 Jul 2025 11:05:08 +0200
Message-ID: <20250725090508.571-1-michal.wajdeczko@intel.com>
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

Since hwe->class is an enumeration we can rely on the compiler
to catch any unhandled engine class case at compile time thanks
to [-Werror=switch]. Any unexpected use of a special CLASS_MAX
enum case can be guarded by our xe_gt_assert() instead, which
will be compiled-out on the production builds.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index c926f840c87b..58bee3ffe881 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -103,8 +103,8 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 			break;
 		case XE_ENGINE_CLASS_OTHER:
 			break;
-		default:
-			drm_warn(&xe->drm, "NOT POSSIBLE");
+		case XE_ENGINE_CLASS_MAX:
+			xe_gt_assert(gt, false);
 		}
 	}
 
-- 
2.47.1

