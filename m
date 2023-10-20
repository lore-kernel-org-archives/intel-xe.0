Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D06BC001E0
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 01:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF7310E56D;
	Fri, 20 Oct 2023 01:45:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B7910E56D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 01:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697766315; x=1729302315;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+HjOMM4om7xskYC4TE3sIkwFtm5bbjimTtiNYuPTKro=;
 b=JZnB2SoXAAB3wIiYOP9tCnES/9k/nzpjHFkK+UaLnNAMboHdHzZ8eaYY
 HRXQKg9WC2lTSUZ2AskIRDJh47K4uPFYJb+pBAzed8vP1mYuhlB1PysCH
 FpTPhZtuFhCy1a/gI91ezQ79+1wynVHdjlkFLNEcTjPqhFaOFCCeCncLx
 zZVqSdagAY7LUWkzQgvVKT2/nhaSfCgxWl4pIfNej3STqCDtBzzRq0aGT
 9QhYVDaMHyJv4vLLUFVAsI5uSEZ2pAmatbxOiR3/v7HQeMF8MpWDz7oEa
 2Q1Z6/bvYySu/SBEiIphknvD1e8SKaMaxL0/KLd4TSSEp0lXj4TKmOjIR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="5018808"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5018808"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 18:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827568682"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="827568682"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 18:45:12 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, oak.zeng@intel.com,
 intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com
Date: Fri, 20 Oct 2023 07:11:26 +0530
Message-Id: <20231020014126.2033504-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe_exec_queue: Add check for access
 counter granularity
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add conditional check for access counter granularity.
This check will return -EINVAL if granularity is beyond 64M
which is a hardware limitation.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dd61c4267e24..03dedcc39732 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -23,6 +23,8 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+#define GRANULARITY_SZ_64M 3
+
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
 	XE_EXEC_QUEUE_TIMESLICE = 1,
@@ -393,6 +395,9 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
 	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
 		return -EINVAL;
 
+	if (value > GRANULARITY_SZ_64M)
+		return -EINVAL;
+
 	q->usm.acc_granularity = value;
 
 	return 0;
-- 
2.25.1

