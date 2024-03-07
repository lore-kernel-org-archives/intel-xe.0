Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B22C54E49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 13:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9697510F165;
	Thu,  7 Mar 2024 13:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWnh1Idl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3810F148
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709819560; x=1741355560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M0hvZGNn0I/LlBMBTMgSrswnnnaJr5NaLxRfUH0LG+s=;
 b=QWnh1IdlQepgWwIT6vsm3EBde0zA0bs/ad8DLj5tr36+kDkrVbqJ12eF
 CbZuOS5UfROcWEGi2QZh8yeM5RWUfxm99d0oQbtr9mvUzP6FiHWWbBeQZ
 UWr5vncS4gHkSO+ggnElF1Q5/rOM9lDgO0Cjk/C8VYhpoER6XpkUXq9ha
 P3bhzbhU2ntLKYllwI9A846hZ7ErrgnrErD1Tf8lIUTdPS9GnhCl66JJG
 0nFqMAWAcSMTtcQRdFrZNZkhR05/7te3kuojG5Hs9aH56ehHcY5oLbUFJ
 XRrXHOP+GSQzZDFLxLBBgorK/tVMVJH0gwAWSQPebBkDtluL5jynLt77y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4343250"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4343250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10557084"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:39 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
Date: Thu,  7 Mar 2024 05:52:29 -0800
Message-ID: <20240307135229.41973-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307135229.41973-1-jose.souza@intel.com>
References: <20240307135229.41973-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 62b3d9d1d7cdd..9cc689f50db00 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -76,14 +76,12 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
 /* kernel engine only destroyed at driver unload */
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
-/* queue keeps running pending jobs after destroy ioctl */
-#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(4)
+#define EXEC_QUEUE_FLAG_VM			BIT(3)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.44.0

