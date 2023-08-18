Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF6EC71150
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 13:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710CF10E02E;
	Fri, 18 Aug 2023 13:51:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B310E02E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692366658; x=1723902658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yB4zL2fSzE6/et7abn70q24pT9FjUtLp+bsAIlxF7Bk=;
 b=dumuqMlWdPFP46Jj0lvifS7suG1AzVnT3QTgptuek/3pYQBEHgSH9x32
 K/m4lCPjvkN3Pl/pepy3v0Kc7eId8hA3Ys4ZawAneiYcGB6eGY9fufw71
 a/1lroeU20xCOE8lKciLkouVXo1kNrVQOdYOit+q3pyKzOu5iOAxPLCGc
 uhrWb4ekT49o1RSk3IyQc7e36diHQQtc6f0XvyIZnnPMT0owvijn0MGio
 RlNkv0dlV2SdXLQ7BwzGGzEGU2t3LWWfSL9yRpy0wcWo7OIWrj07q/+UE
 oq0usggTGHrW7WxaEfKIPmzszFbrvnWP/Sua3IZC5kH8NWPZK5TAiJizz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="352691919"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="352691919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 06:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="764570583"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="764570583"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga008.jf.intel.com with ESMTP; 18 Aug 2023 06:50:56 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 19:28:10 +0530
Message-Id: <20230818135810.2093337-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: madvise_funcs should use value not
 property
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

Fixes: c160a11ccbef ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b4e661576d08..c9bc59be5094 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -294,7 +294,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	}
 
 	idx = array_index_nospec(args->property, ARRAY_SIZE(madvise_funcs));
-	err = madvise_funcs[idx](xe, vm, vmas, num_vmas, args->property);
+	err = madvise_funcs[idx](xe, vm, vmas, num_vmas, args->value);
 
 unlock_vm:
 	up_read(&vm->lock);
-- 
2.25.1

