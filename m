Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3089AC52D70
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA76E10E638;
	Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvN0vdXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F0E10E62F
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435859; x=1753971859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9EPgmcOoww9zrLQzfm0C4sNRIlStiPEColufS96cx8=;
 b=dvN0vdXHF7F6QWU3/RUVK8CFRboIqadXfJ4jkY9oZ0xZlmQoGYBLSu1i
 Qe1/wYls3hbjRXkNz4Ej+Jq63vklF5WSbXV55IzuLliFNZw7gFasns6No
 Kf3clK9SYq5a/C5K0S3bU/Pa5alHlEwKtIMNJHSxSx+KieOSKdhTYtJq+
 5t31atnMPwY5lX1FUmTd26xhEObEMkuCTItCF4+xJ1+CNLFfqrHEqtScY
 CBZ+41VPho+dd1eMCOjgWLr938BGwAT4WmSRtSGZRAq3k3AU5WNCbzvE/
 CFia/Qz/LpyNPsSU1qj7snP1AmsLHrM0SJDjXmWcVtY/EXXukwCgbgs6i A==;
X-CSE-ConnectionGUID: 9RYWXBIEQnaNP27Z/pBl+g==
X-CSE-MsgGUID: /HJcwKCDS9y8Fvn7iPaJHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469200"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469200"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:19 -0700
X-CSE-ConnectionGUID: pANpZ3ObSfyThCOtmIwGLA==
X-CSE-MsgGUID: SpkkPg/MSd+0d2LhkD8Gpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59501041"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Date: Wed, 31 Jul 2024 16:21:44 +0200
Message-ID: <20240731142349.4101307-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Make it safe to have multiple calls to guc_exec_queue_resume() for the
same exec queue. This allows the use of this function from a context where
knowledge about prior calls is missing. In this case the function does
nothing but at least it does not fail on assert.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 50013e1e7455..782561b21d24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !q->guc->suspend_pending);
+	if (q->guc->suspend_pending)
+		return;
 
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
-- 
2.43.0

