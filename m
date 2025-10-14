Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77494CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 14:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A14610E14B;
	Tue, 14 Oct 2025 14:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/dnGt5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC6910E14B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760452364; x=1791988364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KbkFTTabimY5bP+VPvtvHuXx95hWZCE0wW1tTJZY2Ng=;
 b=n/dnGt5oja6tR4hx355YJxLRxZqD8aTDwfZC/FuXGwTuM7HUnqkhqidx
 brCJahB6pWWlTonDucQCZzy+xx6JaCQKhQ6FCJr0367sQcAxcl30rrj2r
 LNJX5J9Kik2ScxEEzuyhRJ+teQB3jaqTiPfJmUZ3LlEQnmiPukVzGjqqG
 JIl0S/rOIscqLpn5AAIe0vT2BAjA5WMIr91bMWDojA28sv2WApttvK33d
 jkWVQQxCjtlckBpUMk17HpFriJ2AAo/Wj6kIgw4HMfSLMRfxbMHJgOfrm
 vCkmewCS6+XjXGm9kyRr+eRPZFnDMe8VZPdCfBG89qJo0HTJs7QYULCM4 g==;
X-CSE-ConnectionGUID: k/QAino8RHKTCiJC30wqiA==
X-CSE-MsgGUID: gUcciZUzSgqGRZ/Y+E8vCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62318562"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62318562"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:32:44 -0700
X-CSE-ConnectionGUID: eYgcU6BIS1aoahSsszLndg==
X-CSE-MsgGUID: pBXFJgtkR46vAp5Ko71jSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181053083"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:32:43 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_SCANOUT
Date: Tue, 14 Oct 2025 19:58:24 +0530
Message-ID: <20251014142823.3701228-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add documentation for drm_xe_gem_create structure flag
DRM_XE_GEM_CREATE_FLAG_SCANOUT.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 40ff19f52a8d..2d7945cda739 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -771,7 +771,11 @@ struct drm_xe_device_query {
  *    until the object is either bound to a virtual memory region via
  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
  *    reserved at the time of GEM object creation.
- *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
+ *    intended for scanout via the display engine. When set, kernel ensures
+ *    that the allocation is placed in a memory region compatible with the
+ *    display engine requirements. This may impose restrictions on tiling,
+ *    alignment, and memory placement to guarantee proper display functionality.
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
  *    will always use the CPU accessible part of VRAM. This is important
-- 
2.43.0

