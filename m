Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8D6CA0EF5
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 23:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C3E10E090;
	Mon, 18 Aug 2025 23:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/d43qw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393C310E090
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755560823; x=1787096823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgQYi94Ept40TdJNulmOfTcEDP+vGo0k3DNcwEXKtjY=;
 b=Q/d43qw5OQsD6OalB0uFn98u4FC73Yc2zUPBwJBEg4J8cEYMP/K/3rWE
 uw9st9zfbUHSDgVobCRtdGnjeiJY4Ec1wMSIi67npa8p2Yp2aeVtBNNoP
 /RGby70SfHsKLGQ4VMgOEM8kbKH4X3xqyWhrciUdfF9BRdKubkD/5QSIm
 QpfaBBsijItX9gAL+zDPiY6FubK/WCa/rJGH4sWRbssM+aAx1c0hyutO6
 vpoXotef8QSVR1/Jsm35W95U81mmvX2A76RLIFdqTF3jZyfxI81oNwCt9
 rYUXe3L6LPQleQGyD3yyWjAdYHY5Hd/e9Rw5MQkWvGCuxEPjyD9rw5iAU A==;
X-CSE-ConnectionGUID: Uo2QHqo4Qtifxv9gJcwsYQ==
X-CSE-MsgGUID: ZEkOFZ8wTR+SbbAKgss6fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57708600"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57708600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 16:47:02 -0700
X-CSE-ConnectionGUID: V7ApmJUPRZqfSrIbNDo+fA==
X-CSE-MsgGUID: k31NvAjTSUiUYRuzTKdjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168510811"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 16:47:02 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/2] drm/xe: Allow error injection for xe_pxp_exec_queue_add
Date: Mon, 18 Aug 2025 16:46:41 -0700
Message-ID: <20250818234639.2965656-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
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

This will allow us to simulate this function returning an error like
we do for other functions called in the exec_queue_create path.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 3d62008c99f1..bdbdbbf6a678 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -688,6 +688,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 
 	return ret;
 }
+ALLOW_ERROR_INJECTION(xe_pxp_exec_queue_add, ERRNO);
 
 static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
 {
-- 
2.43.0

