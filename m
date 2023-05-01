Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A017C87FDC
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1775810E3F2;
	Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A910E356
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYyn8a9RHUH2LLlZADRpRdIqhR30R1KoNqLi4dHrEwM=;
 b=cC4AFkC6L1cfGpgFfjjC1R59R8CKWg7FNagW9bO06Rm6laI8t5a+gnTU
 DV2HsUR5xT+hRjmPBvg8Kxvy/exwp7cxsrQ0OiK/+Mf77gwc9bOkSw0g8
 OZz9Pq9RFGeLQ3uLyLGpvYoDHRTSYsIr4IbJAJEkSK/rb7C9B8nA3hwet
 EQ1FfmQmxjtisKEqM/FVRrq4ViW7QAtMlLIFv0RZmU/Enc+s+wtwk8YhA
 iDddHubRQ1SKnN0AmK17RtUxTEKAvbLGbDpyn1SQxKBTdEIcqnCc9/1HE
 +s21dsPnspXxlO9ryie5/ieJzTA5IspEo4QDFPzPRW916Yjhbhaqi5vJo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910735"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095266"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095266"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:13 -0700
Message-Id: <20230501075114.3108352-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 29/30] drm/xe: Allow compute VMs to output
 dma-fences on binds
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

Binds are not long running jobs thus we can export dma-fences even if a
VM is in compute mode.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 52726541692a..2bf773e1a49e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3043,7 +3043,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs], false,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_in_fault_mode(vm));
 		if (err)
 			goto free_syncs;
 	}
-- 
2.34.1

