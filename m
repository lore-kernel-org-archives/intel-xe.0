Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3987DE9A05A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43BF10E736;
	Thu, 19 Feb 2026 18:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLauXnai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179CF10E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524424; x=1803060424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EN0Z2JzMQKs29e5k8AbiYy/12T0JEcNADkIG5aEOFeo=;
 b=SLauXnaitPYtA7AFyi0b5cLJ0LAKjeqQmDqcC4YtXLwhU5ix1Ds8IEau
 BhtsDQCHdyrJmLMIE4GFOO6EWccIs/QI0+sfrDWDDsUNzEiQhVkcYTVM7
 Lu8kLt024e+hC9ULYeJpYvL2FqNERhPH2wFeWg/WunTld0uLh6GxtcjrO
 zzCZoCFQrylSk0gcmOydLz9CpzUd0JF3h8rKt1dpSBeio7YBCF2R6cxIU
 CM6DljsI9fP/uvURV1oPy3sTOApOarXXCWkg+UnLK4kQt1Znp91LoCi4p
 dU8udYlcaxXZ6c4ty6pP1kM/6YDF32B5JOPlAXC+f4PPv/6cPBfppAK2/ Q==;
X-CSE-ConnectionGUID: 52QxyuGwQaaZHIepw3Powg==
X-CSE-MsgGUID: mrIxvVDsQQ+G0ybyX8KNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482820"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:04 -0800
X-CSE-ConnectionGUID: UDSm5MM/Sz6dWSMsQ8c2Pw==
X-CSE-MsgGUID: P69v2hGPRYCazrsumSWRnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189036"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:04 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 6/7] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Thu, 19 Feb 2026 13:07:00 -0500
Message-Id: <20260219180701.2418453-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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

