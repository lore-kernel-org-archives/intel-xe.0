Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D386CCAC583
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 04:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A89410E29F;
	Thu, 11 Sep 2025 04:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFeudpqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8094810E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 04:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757566777; x=1789102777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YJvvDjIuK0f5Hw3kElezsE7q701XlcQgdPi0i3ZMymk=;
 b=AFeudpqdV1NCkANs8AF0bGpyvdfis/PA4fUgm8/B6J/BD8H/R5paY/v3
 UH2y/epZlO9511yoecab/n2fsrFCiCCmxJ83iOsz89kSe/dKYuaynBWzS
 cnMVJb79oWRi87UirNov9TONAj40OLXiWPiGdLj2PJ18iLE9fzCEk+w2E
 pmhITtCSp2kxRLi2/kpoIeWaFdMDda7BBGad4ncqqj8gPING61oxL4xTB
 7cEsEN4EFtgSk0M7iOJjJ+JzEU5xRA9PtWn5wnNmvfcoVm5hFz36Es4zq
 Kr/OPGn9napHNre9DUtA2a2FHlDL5NgiR8HR3grZwqByAyqDvwPiAXuna g==;
X-CSE-ConnectionGUID: T+ojzoAfRDe8cySnwjFcnw==
X-CSE-MsgGUID: c3MEMLVmSwK/SDrfuqNc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71269092"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="71269092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:59:36 -0700
X-CSE-ConnectionGUID: UVvPxct6RcacFvFwlvDogA==
X-CSE-MsgGUID: elZbumUtS5yIzhrrhNgVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173656374"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 21:59:34 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Date: Thu, 11 Sep 2025 10:58:23 +0530
Message-Id: <20250911052823.226696-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
auxiliary_device_delete/uninit. The auxiliary_device embeds the
device/kobject (and its name); freeing it too early can race
with asynchronous device_del/udev processing and cause a use-after-free.

Set aux_dev->dev.release = xe_nvm_release_dev and free the nvm
container in that release callback. xe_nvm_fini() should only
unregister the auxiliary device and clear xe->nvm.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 9ca4a5ae1693..cc8d7c6cf69a 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -35,6 +35,11 @@ static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 
 static void xe_nvm_release_dev(struct device *dev)
 {
+	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
+	struct intel_dg_nvm_dev *nvm = container_of(aux, struct intel_dg_nvm_dev, aux_dev);
+
+	/* safe to free the whole container here; aux is embedded */
+	kfree(nvm);
 }
 
 static bool xe_nvm_non_posted_erase(struct xe_device *xe)
@@ -162,6 +167,5 @@ void xe_nvm_fini(struct xe_device *xe)
 
 	auxiliary_device_delete(&nvm->aux_dev);
 	auxiliary_device_uninit(&nvm->aux_dev);
-	kfree(nvm);
 	xe->nvm = NULL;
 }
-- 
2.25.1

