Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D2DC624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95110E12D;
	Fri,  4 Sep 2026 18:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOoiTc7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E310E12D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545398; x=1820081398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7JSf7gobpmd0a9gjey8epEqmcLj9Jb07ml/ETGoIqJk=;
 b=fOoiTc7hI6cq7ePg0VlKo9lDAcfXUKPOPMZ1gtOx0bgaXBp8V79GndAI
 pjeyv+pbwymZzyCopNzPjh63IV8x6gbk0P8McoNl4phOa93u2DZl9Q939
 GnZgb1fBaLCAdWB1IAYNK9RAgh1eV8YGJXIMuwyzi5cexAJyr29ImOxuK
 VXk+Jub2zTkHmlKuYrDzjD+SWSEnSi+ive9i0EWdUvyyizkX0jDCZf8Ms
 F0iiiVcnjO90RUXUyYykUXE4RV8TlpNb/7BQZgaZZmhI3eAaxhbr0+iNv
 Br72I+I9coU0bKvNXYTaf+ECGxqBlQAjZAnjcYpJw7QOeUqUmwKIvh0r1 w==;
X-CSE-ConnectionGUID: uepBgqGdQJiBik1VsZMoBg==
X-CSE-MsgGUID: iI24uJElQ7iH1F33fm/+tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89176033"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89176033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:09:58 -0700
X-CSE-ConnectionGUID: KRMIg+f5RAGpM8Orej7v2g==
X-CSE-MsgGUID: n2PS1wtbQceyA96YudeKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="293609688"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.35])
 by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2026 11:09:57 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jia Yao <jia.yao@intel.com>
Subject: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is 0 or
 1
Date: Fri,  4 Sep 2026 18:09:43 +0000
Message-ID: <20260904180943.3455267-1-jia.yao@intel.com>
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

A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
- 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
  after a full context restore, before the spinner has run.
- 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
  last updated while the context was being restored.

In both cases the timestamp is not yet valid, so reset the sampling
baseline and wait for the next check_timeout() call.

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0a6e2b81b5a5..caf02d265533 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1429,6 +1429,20 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 		return xe_sched_invalidate_job(job, 0);
 	}
 
+	/*
+	 * A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
+	 * - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
+	 *   after a full context restore, before the spinner has run.
+	 * - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
+	 *   last updated while the context was being restored.
+	 * In both cases the timestamp is not yet valid, so reset the sampling
+	 * baseline and wait for the next check_timeout() call.
+	 */
+	if (ctx_timestamp <= 1) {
+		job->sample_timestamp = U64_MAX;
+		return false;
+	}
+
 	job->sample_timestamp = ctx_timestamp;
 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
 
-- 
2.43.0

