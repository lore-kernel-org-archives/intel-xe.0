Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE3C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE351131E9;
	Fri,  3 May 2024 19:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4A7nNY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFDD1131E9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763820; x=1746299820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4G8n1WgkrHM2doNlZtj50mFCRyRTnaouQJxsV4eSuFM=;
 b=M4A7nNY9/BfngHw71lXIsQfyQ4mpCQOtAvruEhImj634iQypDMYxVSUW
 vXc3YTTiKWmODH+nC8TbX2S3atm8zMBAXP4FaqbAN3wY6TzSRIftrjjHY
 75Iwc67dY2c5mwO/hmyXLPmKdApFvwj3OwxGB3yUI1/YuCIacPs4B2ksk
 BX1+powNHD18g600VZKr5XUbDvtOubSHhCe+/cAJjsC6EvGesT5+HygI4
 ut52KetGCeDWZ4uUPJocoWyNRJS8DofuFtY7qvAf09SZNlXWLKNSZLGmc
 XjMgF7l/GO+g2k1xFaNbF11KNNpR925+17QDclvDuMDAUVgzO5l7vvZVL w==;
X-CSE-ConnectionGUID: 13IwIWbtTqmfPkJr0cKG5A==
X-CSE-MsgGUID: AgoD9uYwRv2QK7IMNozRMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21137508"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21137508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:17:00 -0700
X-CSE-ConnectionGUID: mECtzzvXQeyXh1PKlA1aDA==
X-CSE-MsgGUID: vU9DhOwsRJOamCWlAdCmqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28042284"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:16:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: [PATCH] drm/xe/vm: Wait for availability if fault mode is mismatched
Date: Fri,  3 May 2024 12:01:38 -0700
Message-Id: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
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

Just because xe_device_in_non_fault_mode (or, equivalently,
xe_device_in_fault_mode) do not match the requested VM type does not
mean that running the VM in that mode is invalid.  It only means that
there presently exists a VM active on the system that does not match the
requested type.  The VM could be left over from an old test that wasn't
cleaned up properly, but the more likely cause is that multiple tests
running concurrently is resulting in the system falsely report that the
VM fault mode is not supported.

Instead of saying the VM cannot be created, ask the user to try again later.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
Suggested-by: Brian Welty: <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c0cf531a115d2..8541cfd50730e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2057,11 +2057,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
 			 xe_device_in_non_fault_mode(xe)))
-		return -EINVAL;
+		return -EBUSY;
 
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
 			 xe_device_in_fault_mode(xe)))
-		return -EINVAL;
+		return -EBUSY;
 
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
-- 
2.25.1

