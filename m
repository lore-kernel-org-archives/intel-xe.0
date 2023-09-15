Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21148EDE988
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427810E644;
	Fri, 15 Sep 2023 13:23:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96DE10E62E;
 Fri, 15 Sep 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784218; x=1726320218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ay4dsMDDLLFfhAI45d/UujVWO8VvMD/wdnUx8NUuIMM=;
 b=Ohnuou1YmEZ76uloACmuinHEXlHyzJlR+m+B345QMF78uemyEM3bON7D
 3wQVyREeZv0R8hooGoktI9EDO73sp9qRQmqwPuOus+E/2NBGxECF4/g7Y
 DS/7j11sJuy/TFdj2UHnC/9fGwegRm1m9itVdC+8oZM/XNzcZKq82Tj3B
 XXaYU94/zDYQ3SstRMpfZ7z4MpTqD+eWmYYe5rfdHBnf1mWnVVSAJ0Pes
 8j2zPqlGJVgIR/j2oz/c7PbuVjbvav3evupcwyOKOHkP1o+f+sGhkVFGb
 GnWl5EwY+qp07174gY3h3dA+xxJ4a8rj06IHpH0h+6IGAW7qf/rXHeHfH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292137"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292137"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515427"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515427"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:37 -0700
Message-Id: <20230915132346.1845909-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 05/14] lib/gpu_cmds: Reduce scope of
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

gpu_cmds.h is the interface to other igt components: don't use it
to declare functions not supposed to be used from outside.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

