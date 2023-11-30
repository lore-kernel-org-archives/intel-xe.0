Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC572C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832A410E75D;
	Thu, 30 Nov 2023 18:40:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCE010E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369612; x=1732905612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xoh3jl7m3uhBE1reY+AtChwH0k3/xaToOBjvLdQh2hY=;
 b=EfMNWMt+DowBj5nOdHjVgDO0b0pat0MdqIQ+fWVMhnHD/p1tNfBsK/Lm
 bEZXvisCWXdeJsDiaVhTqAAkxnHPjIz02aqpSoSEyDbG0/WJHN+6/T9Rr
 6U/4XUWBwLmgzuH0QKfxf98z2Ih+zgqiiK0Ss2km4epLuXQ9tYa+VgdNE
 Rh0m3yMCuF8Cnnm7NeMe+7dyu+Jb8WDm8Bc3D/DdyN4SCju+PkzxtskJa
 X2rmN/JTbRtTeLQnS8U5wPInHtlgYFC0unY0uqOU30G7HIPsm+bYFHM/y
 CGGg0Tec/+t3p4JNdTL/DalUOl5vxmCR7b6FR98VOuv02c+pokPmQ8fDU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111716"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111716"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294909"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294909"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:10 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:40 +0000
Message-Id: <20231130183955.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/16] drm/xe: Extend drm_xe_vm_bind_op
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

The bind api is extensible but for a single bind op, there
is not a mechanism to extend. Add extensions field to
struct drm_xe_vm_bind_op.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 58e655981992..916aaa686689 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -631,6 +631,9 @@ struct drm_xe_vm_destroy {
 };
 
 struct drm_xe_vm_bind_op {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
 	 */
-- 
2.34.1

