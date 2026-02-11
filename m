Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39545ECD6F6
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 22:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF03889701;
	Wed, 11 Feb 2026 22:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb8hrrPd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A7610E150
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770848425; x=1802384425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EN0Z2JzMQKs29e5k8AbiYy/12T0JEcNADkIG5aEOFeo=;
 b=Yb8hrrPdVkvzM41gL6o5UueyN1C4tXqi8aP07LhO2oCB62w9oY3gctRw
 dAP6DCN4loRbjTn2HErsSDkVIgDFABMbMWMT4xzOQtRtkggC5UuS6KYAH
 PKQsTGlmH8QS67S/YLYSxx2YFN42KUvtwuurl963AdQ8/HXZSc/pvY6Xn
 pcivJGdYvLVuBI8pt8sA5WlQdkzAJq+1k0ptuW6BUb5mZVOv+BDY5NECW
 D+V3XTm8uDoX14+IryLFoNVDuy+faoSmM3ByRKs8dHYO9edbxW3ioNE7c
 amCcRDX1wbAO2azmaFzOJWqGxVOf0uc9StdGwwCnpcqCdI3deP1qjx+XB g==;
X-CSE-ConnectionGUID: laV6qWGRR1mkIyNpWGA9GA==
X-CSE-MsgGUID: dKr6PdoOSHig5/gn0RdlXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89415216"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="89415216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 14:20:24 -0800
X-CSE-ConnectionGUID: Hh4XPFw3THyo6XHeUlLHNw==
X-CSE-MsgGUID: 6E0FETjeTtajjACmFYA0BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212479593"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 14:20:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 6/6] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Wed, 11 Feb 2026 17:20:20 -0500
Message-Id: <20260211222020.848341-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211222020.848341-1-zhanjun.dong@intel.com>
References: <20260211222020.848341-1-zhanjun.dong@intel.com>
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

If the firmware fails to load in GT resets the device is wedged also
initiating a GuC state cleanup.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d9aa845a308d..9db656b95bff 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -172,7 +172,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return err;
 }
 
@@ -234,7 +233,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
 
-- 
2.34.1

