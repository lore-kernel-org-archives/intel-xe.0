Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDF5FAD3F5
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 02:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B274F10EAE9;
	Thu, 23 Apr 2026 02:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpXtrY+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726F810EAE0
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776912604; x=1808448604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQtHCtCfc/eXWsURypxtqrr8nMZe5dbBH3unT0YsjJk=;
 b=fpXtrY+yHQTCPG2G+3M0Upmz1cZQ4VxVZvpiCgTiradAj5fmnRIgypMS
 miTK58Rc1ia1Z/PfO8PLoljpoDyCfFNvGiLH8Hkl3nABjPjQ2HqK6WxEK
 4NKZktfM7Op2Te9dqAMdSGhYVquqovSFWvK/cOrpxkbtcp+bYkNOgVXGe
 Q2u65KG+tzzl4q0fGWpQecgAhKp4z1ORGUlLBH93ovBWwUpa+hv/vok1R
 vpqUS9zL6pv7W547cxsuKsftWM6uaQIknBa49+faYG7R1l9Kspb0yOWrl
 qH3Wo0bjASie8fkYLGzOR2xMcTn41NCJ3Gki9O9IlFJwXnbAwHqsy2gVr Q==;
X-CSE-ConnectionGUID: RJ5tlUgVT6+RboQRqd0GHQ==
X-CSE-MsgGUID: bIipf6wXSzSwdXBiBB5p2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88181150"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="88181150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:03 -0700
X-CSE-ConnectionGUID: +eDR2Jn7T0Khk6D+KR0Krg==
X-CSE-MsgGUID: tVX3nyjNSQCMwy4N8uVEqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="262917969"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RFC 1/4] drm/xe/multi_queue: Remove redundant assignment in
 guc_exec_queue_run_job
Date: Wed, 22 Apr 2026 19:49:53 -0700
Message-ID: <20260423024954.1665095-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
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

The 'killed_or_banned_or_wedged = true' assignment is redundant
since the variable is never read after that point.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b1222b42174c..104e65913dff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1216,10 +1216,8 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 		if (xe_exec_queue_is_multi_queue_secondary(q)) {
 			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
 
-			if (exec_queue_killed_or_banned_or_wedged(primary)) {
-				killed_or_banned_or_wedged = true;
+			if (exec_queue_killed_or_banned_or_wedged(primary))
 				goto run_job_out;
-			}
 
 			if (!exec_queue_registered(primary))
 				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
-- 
2.43.0

