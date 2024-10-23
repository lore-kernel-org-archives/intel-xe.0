Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0682CFA450
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 16:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9C710E0BA;
	Wed, 23 Oct 2024 16:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN6Sd/tN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACA010E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729701621; x=1761237621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nsFJtlkXHyYK0/7pa0SptIILmKuzM1721oO2XDBkQ4M=;
 b=EN6Sd/tN0aatmMvZclDYEOg3PsjmJObAw713mUOcsLAZ7TIJKaYBQLe6
 zz+5hek3cedia9JOT1hDpH/kyAKBd9X+Z5DEqvG6vnzN4hGTysOodGpu3
 Eadui05obT1QkWFBzWcPPrzN/7CcFX4zDDr7BFUkTab1ecSou80a9CMiq
 QW7yl4lfxg1wMwksGif2UKAUQRW11aXvzm563QxPDpcViKMQkdNxNPiEk
 tk9ws4ZAIvbIHYzl8rNAQBGO1a9hUv4yS+1ca/lfpqiLMbaNfI3UO1R4+
 AQY42mEuIQeHkBiDcQU/Zlo5ArDRUYTrRPIPfjMFP9n4U+D2ixmBEe0RC Q==;
X-CSE-ConnectionGUID: sn2tz7UQSvKjbZat7fktNw==
X-CSE-MsgGUID: Q1X4u55ATQyugUVaq+ijeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40693759"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="40693759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:40:20 -0700
X-CSE-ConnectionGUID: bdVJGYWgSpWtQ+uLTJXHnQ==
X-CSE-MsgGUID: YPPtNIs4SSqFu7doONPNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="84894630"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:40:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
Date: Wed, 23 Oct 2024 17:58:17 +0200
Message-ID: <20241023155817.3618388-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Flush xe ordered_wq in case of ufence timeout which is observed
on LNL and that points recent scheduling issue with E-cores.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f5deb81eba01..7f034871345b 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		}
 
 		if (!timeout) {
+			/*
+			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
+			 * in case of g2h response timeout")
+			 *
+			 * TODO: Drop this change once workqueue scheduling delay issue is
+			 * fixed on LNL Hybrid CPU.
+			 */
+			__flush_workqueue(xe->ordered_wq);
+			err = do_compare(addr, args->value, args->mask, args->op);
+			if (err <= 0)
+				break;
 			err = -ETIME;
 			break;
 		}
-- 
2.46.0

