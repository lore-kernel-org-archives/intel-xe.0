Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A55C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72710E5B0;
	Wed, 24 May 2023 17:57:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562BB10E5B0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951059; x=1716487059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=viio3pSe6PW1BKyLP9AiRRwUXIFdGL9JEfJ1EmbPdT8=;
 b=iLE3UZYe1V+s04NHeZUoXCbE5GjauCGujkqZZTzcdm1CJDWquGHdZ09N
 sUBJDL3HBY1dNGZg6wet4sTsdQn434Gx2xgLJb4IKKXOXq5+I0f+Mr+mJ
 wYz/AHKlARq7JRcpeeZWmZc97e3h9CLed0QPLICTTKP0zF7ftPd058ALM
 T/YNip8ZJxEzHXIzsDa0KToW1hGchNTVZJ3WsY4qBm029+S/4izFKmE3u
 NqEZYwMpKAYeHUIgE6Uum4HyHSzw3PcDMpfgbqDPbWE3xkRqQTgf+cB0W
 8u9+Q0ttOML4EBR+xifoefMRlh8E7es5mfCMprIJQ9Pw5Hb6TEGyC6cL4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266940"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266940"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629052"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629052"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:59 +0100
Message-Id: <20230524175701.320653-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 7/9] drm/xe/vm: tidy up xe_runtime_pm usage
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The xe_device_mem_access_get() should be all that's needed here and
should now work as expected, without any strange races. In theory should
be no functional changes here.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..8d14ee7bf70f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1145,11 +1145,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->extobj.list);
 
-	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		/* We need to immeditatelly exit from any D3 state */
-		xe_pm_runtime_get(xe);
+	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
-	}
 
 	err = dma_resv_lock_interruptible(&vm->resv, NULL);
 	if (err)
@@ -1263,10 +1260,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 err_put:
 	dma_resv_fini(&vm->resv);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION)) {
+	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
-		xe_pm_runtime_put(xe);
-	}
 	return ERR_PTR(err);
 }
 
@@ -1419,7 +1414,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
-		xe_pm_runtime_put(xe);
 
 		if (xe->info.has_asid) {
 			mutex_lock(&xe->usm.lock);
-- 
2.40.1

