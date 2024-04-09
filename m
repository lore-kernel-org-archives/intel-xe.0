Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C81CD129F
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D31112F1E;
	Tue,  9 Apr 2024 20:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbhZtaaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB280112F1E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PCWwFfMLNFJ3+NmJX+gDJ0sFNhlWJTf5ncWuif0Lxd0=;
 b=NbhZtaaKN/+WL45XNYPCOtgtSFwtIe+oK0q8B8UVCIPpLIn47th2Gv+X
 BSn2ABsRoZnPEZSlVhNlUYUoGwutPNra+pyheRk3WU510VUMkh5rSu5L6
 mWkLT7pgK0KnwKhjNQRKbzvlv24bAYit49qcqSZJKRg1CS0udx8aRRtJA
 NyEZWz7vCbxb3ywd8EI0v+Oe7pzpQ9GZyN9ssQWevv1xdS2WecxUEt5Eg
 jdKBM1hF6MRzN3RIpCMQtIYcDWS0c8V/3YMhWAWhK0enPe+gP356j7jHl
 WMLT953vCPPcmcTnQpDRg3r4WVXGGaYoV3nV4BWekTehaWbidT82ABFlU g==;
X-CSE-ConnectionGUID: 79+5ZSOcTTKND5um6tL0mw==
X-CSE-MsgGUID: s0TFtT0ARECi1wQpzPX0yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803756"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: t5byWqGySNiXUernbmULeA==
X-CSE-MsgGUID: lDDV4zhIRH2sCRpVwo8IrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773762"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 17/31] drm/xe: Get xe_vma from xe_userptr
Date: Tue,  9 Apr 2024 16:17:28 -0400
Message-Id: <20240409201742.3042626-18-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Introduce a helper to get xe_vma from xe_userptr.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0b2790f697db..4860747592ad 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -178,6 +178,20 @@ static inline struct xe_userptr_vma *to_userptr_vma(struct xe_vma *vma)
 	return container_of(vma, struct xe_userptr_vma, vma);
 }
 
+/**
+ * xe_userptr_to_vma() - Return xe_vma from a xe_userptr pointer
+ *
+ * @userptr: The userptr struct pointer
+ */
+
+static inline struct xe_vma *xe_userptr_to_vma(struct xe_userptr *userptr)
+{
+	struct xe_userptr_vma *uvma;
+
+	uvma = container_of(userptr, struct xe_userptr_vma, userptr);
+	return &uvma->vma;
+}
+
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
-- 
2.26.3

