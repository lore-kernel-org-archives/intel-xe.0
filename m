Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE3E8FDCA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A634E10E347;
	Wed,  4 Oct 2023 03:10:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB0210E08A;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qiIVNaxQ02LEs5E5X5awjf+m2XSO5trez/ZX4153gW4=;
 b=XS5w88uWS4r8gcgZVVoGZ8okEVddyMJcirIPMAELFEeqpekmxtuBDgYl
 jjZUQbRqMwNiBJ/chEhS3xXZDa82YVUvXZa+p74KviiKL8kf1GL3mq7WN
 dSJa2r54sUXAGoSIx7A8ja9Ng0E5BL8Z8bUjofx9xUDUP8HPJLj9S3Qal
 pz6nhHKtBKnVLa9/4NZ/U2+9+oFPbR+LZ/soivdyrTURmW68F+WBwLXvP
 udxP+pJuWQ2fY/As+Tpay8pqwHGAH8EqvBH2TN1WYyC3o372wttG8Kdro
 IETtZBOGMTXv+udjNxwwnzJnHsKN+E35q3/+pS5NRhrq5j/5DospMATv5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308400"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308400"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760374"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760374"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:15 -0700
Message-Id: <20231004031023.3444455-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 05/13] lib/gpu_cmds: Reduce scope of
 xehp_fill_surface_state()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

gpu_cmds.h is the interface to other igt components: don't use it
to declare functions not supposed to be used from outside.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/gpu_cmds.c | 8 +++++++-
 lib/gpu_cmds.h | 6 ------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 83d2302f9..e53580e65 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -25,6 +25,12 @@
 #include "gpu_cmds.h"
 #include "intel_mocs.h"
 
+static uint32_t
+xehp_fill_surface_state(struct intel_bb *ibb,
+			struct intel_buf *buf,
+			uint32_t format,
+			int is_dst);
+
 uint32_t
 gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color)
 {
@@ -873,7 +879,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 	idd->desc5.num_threads_in_tg = 1;
 }
 
-uint32_t
+static uint32_t
 xehp_fill_surface_state(struct intel_bb *ibb,
 			struct intel_buf *buf,
 			uint32_t format,
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index b7ed64f84..5ac007cc4 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -116,12 +116,6 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 			       size_t size,
 			       struct xehp_interface_descriptor_data *idd);
 
-uint32_t
-xehp_fill_surface_state(struct intel_bb *ibb,
-			struct intel_buf *buf,
-			uint32_t format,
-			int is_dst);
-
 void
 xehp_emit_state_compute_mode(struct intel_bb *ibb);
 
-- 
2.40.1

