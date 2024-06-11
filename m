Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B552AC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 17:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE710E212;
	Tue, 11 Jun 2024 17:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH+wOdf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CE310E6F4
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718128049; x=1749664049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XdZHubJ6eMhZ1fMCUnTP4sNv9CCswIT96ACgXjCY40=;
 b=PH+wOdf/WtYuJoCGpCRcnfxw02Q5ep5pQRUbi6Tn3UN4R44c4XHJaeEw
 F2mXnjTC9C8XFzkMAlrszvqkDs3E7TzrQJ3L0uoTvxJVMFZ+jr83YF97S
 VG4byNTV7xGjNMNNfwj7SJVuZAvxALM60dz5G45bZmTsGnkWagpRr8g1L
 WPmDrb7TxkyUragDMNXPeE2a07oiKOVLBV++a9DyJWsdJgJtggEUeuvid
 mEUWd+aIJEkVJPQ1OqrYqCM4Vr8NFjze7E7pt6e0jBA/gTuy3ayTe0OWE
 eBHfn8xYb1E/BjUvB89jSWfL+r1ESFi+vkyftqaKqh0GoQag7iRUNCU5Q g==;
X-CSE-ConnectionGUID: zzt4AHhHTnGrqVm7Ppd32g==
X-CSE-MsgGUID: jykyUT3nRSu5qBKIdlf1ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18635932"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="18635932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 10:47:28 -0700
X-CSE-ConnectionGUID: vH1GHzfDR7mOoi0oxXIJDg==
X-CSE-MsgGUID: XsipVPqERVCrj4cZFTfp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39614180"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 10:47:26 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v6 2/2] drm/xe: Increase devcoredump timeout
Date: Tue, 11 Jun 2024 10:47:16 -0700
Message-ID: <20240611174716.72660-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611174716.72660-1-jose.souza@intel.com>
References: <20240611174716.72660-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

5 minutes is too short for a regular user to search and understand
what he needs to do to report capture devcoredump and report a bug to
us, so here increasing this timeout to 1 hour.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d7f2d19a77c10..62c2b10fbf1d2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -53,6 +53,9 @@
 
 #ifdef CONFIG_DEV_COREDUMP
 
+/* 1 hour timeout */
+#define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -247,8 +250,9 @@ void xe_devcoredump(struct xe_sched_job *job)
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
 
-	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
-		      xe_devcoredump_read, xe_devcoredump_free);
+	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+			      xe_devcoredump_read, xe_devcoredump_free,
+			      XE_COREDUMP_TIMEOUT_JIFFIES);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
-- 
2.45.2

