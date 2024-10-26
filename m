Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6CED10C00
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 17:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6F910E424;
	Sat, 26 Oct 2024 17:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSSELJv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21310E045
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Oct 2024 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729962615; x=1761498615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuoIEako/BaOClz/Tl33jfqFXdSg5lrE2smGeabOIIs=;
 b=XSSELJv9JsF3RmoxSRvCYZz9Cte1bWbkPqUHXqATIB/zVOz6FXCZeRuA
 XmLWFYexGGeSrmNlrugZ7ZPBE1W9tnpppBwKCYTlM5e7UGF6nyPHhRTXe
 X8lofY6wpzEePhXB6fh1XkISLilJiFWCfyHQaw675sLa7ziG/x2R4Rmdj
 IrEib0DBOV465ZKdRfr5sSYgDurfeGSNppKBnHU5Lnj3Dztwhz1kY+ucU
 w7PMeIuOBqLRApcFZ3viRDcYu0DsIlNOsliIMZGiqPZ1durcnL1xsMOOM
 SHLhLGiozv6hisDGUYzB1E6yvycFbkz0KgQMRy8wvwt22r7g/dStS0Yhu Q==;
X-CSE-ConnectionGUID: 16HGCnrBTBmr9nPqd6szbw==
X-CSE-MsgGUID: 3m/5GJlQQa67UOBbLOhMPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29568957"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29568957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:15 -0700
X-CSE-ConnectionGUID: lKdSbWzmQaq5dPKYiLnfxg==
X-CSE-MsgGUID: dQF3tIQhSoq0eVIRUFFn2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85970121"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.191])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Date: Sat, 26 Oct 2024 12:08:47 -0500
Message-ID: <20241026170952.94670-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026170952.94670-2-lucas.demarchi@intel.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
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

When the exec queue is destroyed, there's a race between a query to the
fdinfo and the exec queue value being updated: after the destroy ioctl,
if the fdinfo is queried before a call to guc_exec_queue_free_job(),
the wrong utilization is reported: it's not accumulated on the query
since the queue was removed from the array, and the value wasn't updated
yet by the free_job().

Explicitly accumulate the engine utilization so the right value is
visible after the ioctl return.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d098d2dd1b2d..b15ca84b2422 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 
 	xe_exec_queue_kill(q);
 
+	/*
+	 * After killing and destroying the exec queue, make sure userspace has
+	 * an updated view of the run ticks, regardless if this was the last
+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
+	 * query to fdinfo after this returns could not account for this load.
+	 */
+	xe_exec_queue_update_run_ticks(q);
+
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
 
-- 
2.47.0

