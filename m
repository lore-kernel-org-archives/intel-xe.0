Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FFC47074
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B7210E258;
	Wed, 27 Dec 2023 23:59:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C64310E1D6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721553; x=1735257553;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EgKxSwqKFs1CSLRD8KDc+rYSUjRvzjmXwT7+dOBODN0=;
 b=jppfY4rHPWMKDKGsNztqSwGqg3/1FRVC2+xizwSrKWS/n9MZ7qsadOX9
 K0qXi+5iGpFKkEwoP2r0A7Yo6vxf2TaRyqdnjMcFQ1lc3P7639h4d0Ugh
 f+jHpgdPYUPLlTn1/lN6h7Qj985FSpg4mwOSywSWDJG2V53vqQVqnTdtS
 d4fXwZoAOu5oyx7xBlSddgexBYretaVejjPaRWjM8nuggjfuplH/znwY9
 fmHOD5ie1l5umL7vrRiQ6gbvOsifVMex3SiaMEdHGlGos117Uvk8Ec8Hv
 NvL1HZltdx2uaQgfmNyMJvvYLEa3x2y2LKzRc1g/FKGEfTBE4QN69jQwJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329159"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329159"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589888"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589888"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/10] drm/xe/kunit: Allow to replace xe_guc_ct_send_recv()
 with stub
Date: Thu, 28 Dec 2023 00:58:36 +0100
Message-Id: <20231227235838.212-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4cde93c18a2d..8f208267ffc6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -9,6 +9,8 @@
 #include <linux/circ_buf.h>
 #include <linux/delay.h>
 
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -782,6 +784,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
 	return guc_ct_send_recv(ct, action, len, response_buffer, false);
 }
 
-- 
2.25.1

