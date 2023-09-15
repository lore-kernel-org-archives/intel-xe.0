Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60211CD37AE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97510E6AC;
	Fri, 15 Sep 2023 22:35:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F382310E6AB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694817316; x=1726353316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/5uQQm0e17ReGe7DYzW7guM5y2r8XJf+MjXhafyHq4=;
 b=a/j6sxc22LbdR+nZ3bBCUtYxFT73Wm5lA0A+Z2i4QaemT5SUm6CUIu6H
 rWdR9bOUNJjTLYP9QJb/vx4zZYCcTX8vaw3JMvIMcPoovbQDYUrsylNqj
 eYnWUKZKrMg6pDktacdKyhlX2PblnyVm+m9MqaJkz4LQnNd2syvQ6Jz2H
 ub6pSz4QD2ZP8HMJ/kRvbqO/onVfW9wGVVqqGVkB+g90oDL7ZI2SYToqK
 29Q0Jho7ZnMOGyGCC009UPj6vtYewbhvIcaBRIq0TmHA6/2IuSO0YtzNO
 /kB3CWqX5ZG2rlabnx9wda2vG19oqQXqGWZtO6Mzf717sflj9cc0XriNd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359603204"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="359603204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745156206"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="745156206"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:35:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 15:34:57 -0700
Message-ID: <20230915223459.2964036-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/huc: Don't re-auth HuC if it's
 already authenticated
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

On newer platforms the HuC survives reset and stays authenticated, so no
need to re-authenticate it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 700c43fe287b..d753d2eb8954 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -214,6 +214,12 @@ int xe_huc_auth(struct xe_huc *huc)
 
 	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
 
+	/* On newer platforms the HuC survives reset, so no need to re-auth */
+	if (xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO) & HUC_LOAD_SUCCESSFUL) {
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
+		return 0;
+	}
+
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
-- 
2.41.0

