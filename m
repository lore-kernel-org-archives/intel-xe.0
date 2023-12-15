Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1618C41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CDD10EA4D;
	Fri, 15 Dec 2023 15:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6E10EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655178; x=1734191178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVPGgmGSsQ+LU05SN6XguQsStqOjLxrThUAZrp3juvg=;
 b=eZAMaWRiw+1P+zpsBTrvck8iPymaLyHKy7dx3qG4iGvTL6FJtvUxSZ0O
 lhwSNS4GTQ/Of3xNRpatQwZXIR5vBILNmR12T+QOF6ov8gh+brGfNNC3+
 EbO46F9n7NrjOtAtya2K342OeJR9TEXeDv2sCaW4V9tYuwDXCeJ7iPJdr
 cexQI8VW1u7u9sF7JHi1syZOoJ/sBx9J1tpsrlpWrL3Oiwu5Bkrvu/lYi
 /LNxw93+ivX/xhObCuHbhpul5I2gNb7R/nPUq4Ar7khF5mNyA5A7+lQhe
 CG9b9XHvS/Ye8OKCyt2mM86UmT35SuQaJcb7QiueFR3sY01FcMlT3mWAI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141860"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141860"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324484"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 09/21] drm/xe/uapi: Add missing documentation for struct
 members
Date: Fri, 15 Dec 2023 15:45:41 +0000
Message-Id: <20231215154553.7-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 43cacb168091..d7893ccbbf8c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -816,7 +816,7 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
-	/** @pad: MBZ */
+	/** @pad2: MBZ */
 	__u32 pad2;
 
 	/** @reserved: Reserved */
@@ -857,7 +857,7 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @pad: MBZ */
+	/** @pad2: MBZ */
 	__u32 pad2;
 
 	/** @num_syncs: amount of syncs to wait on */
@@ -982,6 +982,7 @@ struct drm_xe_sync {
 	__u32 flags;
 
 	union {
+		/** @handle: Handle for the object */
 		__u32 handle;
 
 		/**
@@ -995,6 +996,7 @@ struct drm_xe_sync {
 		__u64 addr;
 	};
 
+	/** @timeline_value: Timeline point of the sync object */
 	__u64 timeline_value;
 
 	/** @reserved: Reserved */
-- 
2.34.1

