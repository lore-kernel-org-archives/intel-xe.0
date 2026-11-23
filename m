Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB8606A327
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CODejvaW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263DA10E76D;
	Mon, 23 Nov 2026 12:30:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D0610E76D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795437003; x=1826973003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gyc2ssFbl41D2LEs0yhU3fpwSoJISNgyTq0YFKHb16Q=;
 b=CODejvaWLkHL4SEBFxszQCa8Sy2t2YZiGkmduw2kNwjanqDQ2nUm0aph
 9/rw1K8R4S6QbBG2C2dqpR+fsAbf5zfNz+cDXrC5nQTDJ+3NPVu2pd0U5
 TNRl18ROI6Q2mDA799UdflcakNc/SsWDxaKZJ41K/qFETZl3BATkIRl+o
 ifiOjLrNgjMiPLeCY/PKGPCFPAx80ZUkZ2gHG9+2A3rBaXecQu2+c7JLb
 ZkEGjsQsPvL7AvpZQ1qftuMmyJSAlkZGfmrPoksUPJQI6rTYDG4PAfBOD
 o5TMwSXNRGbCqPu9kpzVknwd8q3xo1rKpiZgw/1YdjjWgENFFglbySgYW w==;
X-CSE-ConnectionGUID: D0gnbFrMSoKSxht1UWXS5A==
X-CSE-MsgGUID: fRvZAElWQRWBw/mAd5YKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4134979"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4134979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:30:02 -0800
X-CSE-ConnectionGUID: ZIucIWWcRSuVyyiQUvDvFA==
X-CSE-MsgGUID: LTwHSRkKRcWKhEGbf2nY0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11184719"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 23 Nov 2026 04:30:00 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH 2/2] drm/xe/cri: Increase default CCS preempt timeout to 7.5s
Date: Mon, 23 Nov 2026 18:04:38 +0530
Message-ID: <20261123123436.2114961-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
References: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
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

CRI uses thread-group preemption for compute, as mid-thread preemption
cannot be used there. A context can then only be preempted at a
work-group boundary, so the default 640ms preempt timeout is too short
under concurrency and leads to engine resets. Default the CCS preempt
timeout to 7.5s on CRI; it remains tunable via sysfs.

Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 7f304b9fe0e1..959661ecb1a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -581,6 +581,13 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			}
 		}
 
+		/* CRI compute uses thread-group preemption, which needs a longer timeout */
+		if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND &&
+		    hwe->class == XE_ENGINE_CLASS_COMPUTE)
+			hwe->eclass->sched_props.preempt_timeout_us =
+				min_t(u32, 7500 * 1000,
+				      hwe->eclass->sched_props.preempt_timeout_max);
+
 		/* Record default props */
 		hwe->eclass->defaults = hwe->eclass->sched_props;
 	}
-- 
2.43.0

