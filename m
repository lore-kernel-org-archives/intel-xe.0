Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B16FCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B965F112611;
	Fri, 16 Oct 2026 07:18:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31C111260A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135124; x=1823671124;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/Xo07vcGTiTaVz2AD1nVMxLO94KAoUh560uKn+0l56M=;
 b=B5DnEiiWJ0bt8HObHHgkMD8haEQgxhX4vKteSZ/XtlCOvDs927/hqzBA
 DX2m2KTsvnpRFPOnzOiW6dVtHLuUb8NB5m7k5CTuYWyu+hWd5MAs2ai8c
 6rraTtF/BLydUDiID4kVyWFQdTrnP7scx7x9TNTMzbCW2xI11HI6ssMxw
 vOzF+uK/DT9ShErH1h2zZgq3vAs0g6NXENMVUG3ERFsV9OrEw5D00lg/x
 E522FaCtWyzh3g1M+xlsv3Lv5tFutsyCBJgs4rWs6IbLgdMJfEVaho+Mg
 PwFSl+iW1u9mP+I4VlgprWWHWaKTAfkb8JH8orJPl+OOhOH00RG9T+1J4 w==;
X-CSE-ConnectionGUID: L7CHxBdERZur7uXge80ckA==
X-CSE-MsgGUID: BTTO9VQ4Sa2HCFN+inyodw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813629"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:42 -0700
X-CSE-ConnectionGUID: NQwIAHeKRtauoLswdtN2tA==
X-CSE-MsgGUID: Vbdsn9ezSoiA0tAhK26+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787238"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:41 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only 01/18] drm/xe/irq: Always free requested IRQs on uninstall
Date: Fri, 16 Oct 2026 12:48:11 +0530
Message-ID: <20261016071832.222574-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

xe_irq_suspend() clears irq.enabled after disabling and synchronizing the
interrupts. irq_uninstall() currently returns when that flag is clear, so
a suspended device can skip free_irq() during teardown.

The managed uninstall action is registered only after the IRQ request
succeeds. Reset the interrupt registers only when interrupts are still
enabled, but always free the requested IRQs.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..d314993b14a1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -786,10 +786,8 @@ static void irq_uninstall(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!atomic_xchg(&xe->irq.enabled, 0))
-		return;
-
-	xe_irq_reset(xe);
+	if (atomic_xchg(&xe->irq.enabled, 0))
+		xe_irq_reset(xe);
 
 	if (xe_device_has_msix(xe))
 		xe_irq_msix_free(xe);
-- 
2.43.0

