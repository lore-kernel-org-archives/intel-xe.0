Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D436CFC518
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5A10E16B;
	Sat, 22 Nov 2025 01:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrzWmgFa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D7710E16B
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763774707; x=1795310707;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O93Zcwbk+1WS5/8YAP0TccP/1CAbL6z1YvTiPpannrs=;
 b=BrzWmgFaPZ0IgS1f6bmercqBckB2Zjft5x8UaO7B4Rrx0jFkANJwxcGb
 jpY6ILc8PTbjPEK9Tn17cxBNXREBSVKlTatGWG8KA9KvePgfdT27A3EW6
 5gFimtxTXCt3CtRuYdJ1+iMf+6Fw1bqT7ABCOzw7VlNBmJkNiyHQA9H/A
 Y66wYb8oNYDmMSJAh1w4CMuo4phDj706tLjZx7IQyAtKUq8ulqfV34y+h
 d2beylGm1SzwuC+JRgWOtKYZWNLLnD2XsOB1SaaxRMeFcC/8pyMpB+z8t
 /Hm07uHsPJOJBLBcDyPJ5LsrekG8nJDko1weAXTeChirM5ORB4pZrSCTX A==;
X-CSE-ConnectionGUID: vFzBxlWmRbidVSitxmF2Lw==
X-CSE-MsgGUID: Z3JPt1e/Sje7ox5y4wilNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65955432"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65955432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:25:07 -0800
X-CSE-ConnectionGUID: vAYVRKgFRN+jlUpVVMIIyA==
X-CSE-MsgGUID: wT2Xl8MvTx6znmo8Sx1R6g==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:25:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gpusvm: Limit the number of retries in
 drm_gpusvm_get_pages
Date: Fri, 21 Nov 2025 17:25:01 -0800
Message-Id: <20251122012502.382587-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

drm_gpusvm_get_pages should not be allowed to retry forever, cap the
time spent in the function to HMM_RANGE_DEFAULT_TIMEOUT has this is
essentially a wrapper around hmm_range_fault.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 73e550c8ff8c..39c8c50401dd 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1288,6 +1288,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 							   DMA_BIDIRECTIONAL;
 
 retry:
+	if (time_after(jiffies, timeout))
+		return -EBUSY;
+
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
-- 
2.34.1

