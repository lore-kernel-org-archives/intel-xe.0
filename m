Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6EAC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 22:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A7310E566;
	Wed,  7 Jun 2023 22:38:46 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410F10E566
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 22:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686177525; x=1717713525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ajkNHOO4JLi0/yh/wOboWtHtYN7tsfS8scCm7098jI=;
 b=hIhjtLL9B72Ac0OEyOuM6QFvwqzAf4M1GI+zRWBviI9VvwQtlWYGcCXG
 m8ei/OBpZlLUuT5rhqkAkWuZ7CS8MKrSCjTj5EGhvok1jUluNSF1EBdhn
 AHXvwi0IF+kTi6IaK6jHa1bZy4mYcVsZmukRTvIbURrhKTvprsJ7uTCz3
 Ss+ECVuko2cdPDkhS2N2vpqxOdzLcPpYu9iJDi6DwBwCgvIdHEQK1oFCy
 598AbTOcuIl+sRtmS6kXQRQB23mWAsolYttBagwZPbYXA86LdFbUZz3fn
 Ckf83b6eN0NWx5qhVjMucKXU79A1ZHJff6PTIX/tzeMRwFVx+K+JWOv/h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357140004"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="357140004"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703843148"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="703843148"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:38:43 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 15:38:40 -0700
Message-Id: <20230607223840.2835605-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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

Trivial kernel-doc fix, s/vm_id/engine_id/

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0ebc50beb5e59..edd29e7f39eb3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -656,7 +656,7 @@ struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @vm_id: VM ID to run batch buffer in */
+	/** @engine_id: Engine ID for the batch buffer */
 	__u32 engine_id;
 
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-- 
2.38.0

