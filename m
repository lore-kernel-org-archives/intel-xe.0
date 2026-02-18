Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F0E9A04E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9CC10E333;
	Wed, 18 Feb 2026 23:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUqWWYJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FD810E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456647; x=1802992647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9IXyIPXplOdc7lxEHkWciBHiZ/OfUgqKaDdX3Zq/6Ww=;
 b=GUqWWYJ8B25T3sStSijuNR0km+3H/IJfEzqbntpnozYso1Q6CieV5lAg
 ckOIXkXRztwdZMI65zo8tQVoA/RzEuoYyXn7ykCN+vt4ogZIXr0CiSapi
 Jh8Oj1U89zOtMfJmFVY5FCqTYlgE9TwcjfOva6G25LtYCUa0InlSpSRy6
 QcrbYGmsZ4u7Mb/858xYEPldnYr06PfqEgGGyHZOegDPNDMeA1bOWnJc4
 c6KtzAC0Y2W6hGC6mwEAO+GiskgxoLKBR07piqy0mv8Gt44tXPaKrF8mS
 0y31Lwy+PTjm4yExe4O4e+Hr2d8JiKsZXwjUHtZnY6dYXRtbJSIYW7lus w==;
X-CSE-ConnectionGUID: YHgcXtYBTMSdyiLcNkRVAA==
X-CSE-MsgGUID: zf2cowlvSjyX0xAI6yhcRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83260856"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83260856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:17:27 -0800
X-CSE-ConnectionGUID: W+P6Lv2nQDC3gZHi+V1a0A==
X-CSE-MsgGUID: oXUkCOc9RLGtAfYqlGmPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214200229"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 15:17:28 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/5] drm/xe/queue: Call fini on exec queue creation fail
Date: Thu, 19 Feb 2026 00:21:54 +0100
Message-Id: <20260218232159.1726873-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218232159.1726873-1-tomasz.lis@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
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

Every call to queue init should have a corresponding fini call.
Skipping this would mean skipping removal of the queue from GuC list
(which is part of guc_id allocation). A damaged queue stored in
exec_queue_lookup list would lead to invalid memory reference,
sooner or later.

Call fini to free guc_id. This must be done before any internal
LRCs are freed.

Fixes: 3c1fa4aa60b1 ("drm/xe: Move queue init before LRC creation")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4..42849be46166 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -324,6 +324,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return 0;
 
 err_lrc:
+	q->ops->fini(q);
+
 	for (i = i - 1; i >= 0; --i)
 		xe_lrc_put(q->lrc[i]);
 	return err;
-- 
2.25.1

