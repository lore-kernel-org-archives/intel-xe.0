Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C14C07CA9
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A310E769;
	Thu, 30 Nov 2023 18:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C22B10E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369632; x=1732905632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BT/Ph2Pna9ijw0KPBqCLpHQ35ohBILGFI2ttSAX0jCs=;
 b=TgtH+bbKSarzQ+qO3uJAyC7lNFfc177kEzUcXV9RoZ98uOUk1w6F8UtZ
 7ueUT1JDyhGf5EdCwAjsyhGC4w7WEOfEjnWJ27W2qtUaecMBFUXif3HKS
 s5huS5oNSV8f37q1xCqEJDmVhpW7VHs86Sc7mDHbzBw4V3N4ARM0nzgk9
 n9RhYVFOT/MOS1itsVzPxlKg1eggc6bDxTu6EID6FqeRSvUmY7QJvbJRO
 MPCiF/ITlSItw6xM7EPyZG528IIGPQrDnU/XEZG2i+X6jEWaKNs/7foDZ
 PTbPiFrqZ1IgsoL+XOyyKueqd241NtevA5Gty4MKK75AVFhwBbwwxM5rv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111754"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294973"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294973"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:30 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:54 +0000
Message-Id: <20231130183955.7-16-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 15/16] drm/xe: Remove unused extension
 definition
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

The vm_create ioctl function doesn't accept any extension.
Remove this left over.
A backward compatible change.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 84a477009e85..ffd9fc1172e8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -642,7 +642,6 @@ struct drm_xe_ext_set_property {
 };
 
 struct drm_xe_vm_create {
-#define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

