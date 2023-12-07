Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E99C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3436F10E1D9;
	Thu,  7 Dec 2023 13:50:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238410E1D6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957023; x=1733493023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mqGYrRACZrbDvJhwlWZky9dvTEa48aVuJEieAN3RFxQ=;
 b=acsFiSa/a/icFv7bmeqSj0vgQfACDc/81y6L2gxp87wjZkQrXoYk4Iix
 wsIGtqkP6ZBlpQpwo/SvtoHP1lxHl5Yxa4r3xh24JBYo1gNMhUqUzVy85
 LtGVTtUs3EHOU62kN8EJx1CZ1fF+1e6kV3uO/p3/pWMNXS7d2+kWlxeqq
 NJwT4Qq8BIRqx+o+czx/anWGn1Ymw/ht3RZWZTjxNl/mEZS7LmmmzGZzr
 xSrsJwCLNGtegsw6+5GSDwOoTRKgXB2sUYCr3hiF+uEx4h8z2TjNNUrbZ
 LctjdZgZUKmqQ5aMuURrzZJ4iDbSb/0vznLtrP9DNnyHvR9np7NoiT+c9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722239"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115437"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115437"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:22 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 02/14] drm/xe/uapi: Add missing documentation for struct
 members
Date: Thu,  7 Dec 2023 13:49:57 +0000
Message-Id: <20231207135009.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This removes the documentation build warnings below:

	include/uapi/drm/xe_drm.h:828: warning: Function parameter or \
	member 'pad2' not described in 'drm_xe_vm_bind_op'
	include/uapi/drm/xe_drm.h:875: warning: Function parameter or \
	member 'pad2' not described in 'drm_xe_vm_bind'
	include/uapi/drm/xe_drm.h:1006: warning: Function parameter or \
	member 'handle' not described in 'drm_xe_sync'
	include/uapi/drm/xe_drm.h:1006: warning: Function parameter or \
	member 'timeline_value' not described in 'drm_xe_sync'

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index be58cd641324..d6cd76385e2c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -820,7 +820,7 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
-	/** @pad: MBZ */
+	/** @pad2: MBZ */
 	__u32 pad2;
 
 	/** @reserved: Reserved */
@@ -861,7 +861,7 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @pad: MBZ */
+	/** @pad2: MBZ */
 	__u32 pad2;
 
 	/** @num_syncs: amount of syncs to wait on */
@@ -986,6 +986,7 @@ struct drm_xe_sync {
 	__u32 flags;
 
 	union {
+		/** @handle: Handle for the object */
 		__u32 handle;
 
 		/**
@@ -999,6 +1000,7 @@ struct drm_xe_sync {
 		__u64 addr;
 	};
 
+	/** @timeline_value: Timeline point of the sync object */
 	__u64 timeline_value;
 
 	/** @reserved: Reserved */
-- 
2.34.1

