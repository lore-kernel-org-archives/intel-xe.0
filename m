Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DDDC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 14:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A710910E09D;
	Thu,  2 Nov 2023 14:31:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1A10E09D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698935496; x=1730471496;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cVDcSZBuJtf/9H0OcjMzwc9IC6wSXqj3HGL1hgzyCRg=;
 b=Z6i1sMa+Mme0/ZnTWIYvxNA34k8tHn+ELDr6tmM0T/GQNR1/IQxl49fP
 EzYgsUF95u74BO0mDd/30Uem/YQFTwsre3A+QgO6uZmu8h4d/FJNE6vQn
 oaff4nZ2fepgh5tjurrcyNdKH50OaSrXsWx8Z0PN22ARbsXFGIUxXFC1Z
 9WlU8aAj0aE4Rfcp09RT3rXg7pKnWiZ/CfTwNsokdPNEa6OJT7dJFK/Tj
 hd9awB+n2lJv/lds87D4vbf4HioaSWVxmtcPxk6Unz3FrMAmjyhO9pMth
 MrCMhKA3sqM+EisRW2pmx2GsC9+t9FWhWmPwheT1SUdyWoaPrqDwPSu8R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388541214"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="388541214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 07:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761313780"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="761313780"
Received: from binsumax-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.171])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 07:31:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Nov 2023 15:31:27 +0100
Message-ID: <20231102143127.2692-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI HAX v2] drm/xe: Disable panic_on_warn for testing
 purposes
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

Turn off panic_on_warn and also force a checkpatch.pl error.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 kernel/panic.c                 | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..bc69d83d5498 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -278,7 +278,8 @@ int xe_device_probe(struct xe_device *xe)
 	u8 id;
 
 	xe_pat_init_early(xe);
-
+	if(true)
+		panic_on_warn = 0;
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/kernel/panic.c b/kernel/panic.c
index bc59531848e4..1c8057027f20 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -59,6 +59,7 @@ static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
 int panic_on_warn __read_mostly;
+EXPORT_SYMBOL_GPL(panic_on_warn);
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
 static unsigned int warn_limit __read_mostly;
-- 
2.41.0

