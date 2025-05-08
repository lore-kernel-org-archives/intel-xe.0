Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D544C3ABC3
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 01:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889D510E2C2;
	Thu,  8 May 2025 01:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu/zT/cI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83110E2B8
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746668079; x=1778204079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RAsQEjmt3VvwEHW0rTsf2ZhiFY7I0us86h4Y2lr6JFc=;
 b=Gu/zT/cIusdxUjwqS9MqI9eWWwxkdikAm5Rw27vmbOIfwUP7CswaBGvJ
 nIfRb1X2/aO+h/kD+QYVIVZTSUwiRsVCYYzKM7Es3Y2sF1A1s3jE+60y5
 7OVywsb4EqXJXDlbdBvMNNMna9TGTbb/808Tzkjgj17hLB4uMaK6oTAYX
 ciuVnfbicKCEMI75oTIHl15X+W/FiCyA8ITZCgpM2wLsKXJWYiM+yWG0S
 NrXz3VJxZWa0Qg+xYvVCurF0r8YIGzwNTdJH19C5aUY+tA17GAllNep7Y
 xGBnLdAyG8zM8vvcwKFxxoUOjRO0bV80wwgZx2EtP6JcMDk7Y2aqQR35m g==;
X-CSE-ConnectionGUID: rjyUOuArTm61HTGe2L0tIA==
X-CSE-MsgGUID: cvLmcF7lRMKMsKIgQbNEkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48538277"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48538277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 18:34:37 -0700
X-CSE-ConnectionGUID: MBn0SlwpRnKUnDQI8s36Tw==
X-CSE-MsgGUID: 0a27az6AQSukHSAKnYsLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136094244"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:34:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 1/4] drm/xe/guc: Remove double blank line
Date: Wed,  7 May 2025 18:34:34 -0700
Message-ID: <20250508013437.652982-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508013437.652982-1-John.C.Harrison@Intel.com>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

An earlier patch moved a drm_print a few lines lower but accidentally
left a double blank line behind. So fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2447de0ebedf..9213fdc25950 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1830,7 +1830,6 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 		return;
 	}
 
-
 	/* Can't generate a genuine core dump at this point, so just do the good bits */
 	drm_puts(&lp, "**** Xe Device Coredump ****\n");
 	drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);
-- 
2.49.0

