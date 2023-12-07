Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891A3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723810E8B3;
	Thu,  7 Dec 2023 14:12:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD9710E1D6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958332; x=1733494332;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tnjW6s252cvavHGcW/HravZ7TGpfiNpWvdWj6LQS58E=;
 b=bx/8FQv0316w2PfmZcnqeuADLhMVI3igT/Jw7vKYTffGJp815La5A6W+
 VV6vnpIszA4LYaYgRl6gG+arVztH0OlFwb73aXBXDuyjmCqehYJ6b1Z70
 Xoy8A+5n95Recj6rz99SrVkpSv+Vbi3NfTRquK9T8zK2q95oGgQcpx0AY
 B4Bn1sFo7j/AJIc9Y/jD3Y0hXZGU7pvRxhyjCng/DeMx5xx15Ppdkt5Bw
 y5TOxLzyLOSeUfdBtju/cMj+3wQfd05bHOvT2vWfAoTSO7yYFzrgzl953
 60Be1i6FouLCsfJgn64Vq8rUWbTa4BcLbBb5CRt+myFYoF+J8XgT87fI2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947512"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947512"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479751"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479751"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/16] drm/nouveau: make use of drm_gpuvm_range_valid()
Date: Thu,  7 Dec 2023 15:11:44 +0100
Message-ID: <20231207141157.26014-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

From: Danilo Krummrich <dakr@redhat.com>

Use drm_gpuvm_range_valid() in order to validate userspace requests.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-5-dakr@redhat.com
(cherry picked from commit b41e297abd2347075ec640daf0e5da576e3d7418)
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 17 +----------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  3 ---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..641a911528db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -929,25 +929,13 @@ nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 static int
 nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
 {
-	u64 end = addr + range;
-	u64 kernel_managed_end = uvmm->kernel_managed_addr +
-				 uvmm->kernel_managed_size;
-
 	if (addr & ~PAGE_MASK)
 		return -EINVAL;
 
 	if (range & ~PAGE_MASK)
 		return -EINVAL;
 
-	if (end <= addr)
-		return -EINVAL;
-
-	if (addr < NOUVEAU_VA_SPACE_START ||
-	    end > NOUVEAU_VA_SPACE_END)
-		return -EINVAL;
-
-	if (addr < kernel_managed_end &&
-	    end > uvmm->kernel_managed_addr)
+	if (!drm_gpuvm_range_valid(&uvmm->base, addr, range))
 		return -EINVAL;
 
 	return 0;
@@ -1834,9 +1822,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	uvmm->kernel_managed_addr = kernel_managed_addr;
-	uvmm->kernel_managed_size = kernel_managed_size;
-
 	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..06a0c36de392 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -14,9 +14,6 @@ struct nouveau_uvmm {
 	struct mutex mutex;
 	struct dma_resv resv;
 
-	u64 kernel_managed_addr;
-	u64 kernel_managed_size;
-
 	bool disabled;
 };
 
-- 
2.42.0

