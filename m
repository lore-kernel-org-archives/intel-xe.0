Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3171FCFA77A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 13:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0242710E9F5;
	Fri,  4 Oct 2024 13:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="My4sbeP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EC410E9F5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728048061; x=1759584061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTxABbGcd8RR42zXqOQUALxz6m68OtWtHHdSKEX2qH8=;
 b=My4sbeP/ButdARVr/jCtAwAHgwiLluz7g436+/7Oekw9o3fm0rBbnM/W
 7fvgMxuexRZX9wXv+vl+brpZJ2xcXwxsco6dAGwoXwWUmXzylURCZ0q0d
 tPPAcJ1QieWpABlSZhZ+SDOu2OD4cOWpOx0CcGbRVJN+glPMgxIZQ5eRA
 7juytI1yIgSdLCyNfb7/BeuUCNqJRXQKWq+M26V8kDSMofMhmrPkXljU3
 r0RtbuPXZFtIFhInodMLUfleQoRirB8/DEaUnv+YvwJe+wAWtjzs/E6QZ
 aBzBpegpJE9VBSt7j2WBnKULsUEdh1/qPt/IwbDafF2zi8dCW+eKUdAPZ A==;
X-CSE-ConnectionGUID: SaYpfw2HRHW6H6fyMQNE4g==
X-CSE-MsgGUID: hStJclCXRIes3ICgNYybKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38403002"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="38403002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:21:01 -0700
X-CSE-ConnectionGUID: kijv3OKqRhi03nGoMWu9sg==
X-CSE-MsgGUID: lYTf2lnsRVOlZfKC4auMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="75029397"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.128])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:21:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/tests: include linux/prandom.h as well as
 linux/random.h
Date: Fri,  4 Oct 2024 15:20:37 +0200
Message-ID: <20241004132037.57528-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

The linux/prandom.h file was previously included from linux/random.h
but starting with commit

38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/random.h>")

That's no longer the case. Since we also use functions from
<linux/random.h>, include both.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7d3fd720478b..39cadce0881c 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -7,6 +7,7 @@
 #include <kunit/visibility.h>
 
 #include <linux/iosys-map.h>
+#include <linux/prandom.h>
 #include <linux/random.h>
 #include <linux/swap.h>
 
-- 
2.46.0

