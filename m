Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C1CCD18D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A8710E404;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtqVL33J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250210E307
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747494; x=1791283494;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kZfylbH+8Vi1imXtlcl1jgMjo1dDUcI5FoSmQghk6wg=;
 b=ZtqVL33J/Se3mkrDmfd4ZBJYoZhoOOAvJxnp2eikhm9dPi7qEaOaXcoZ
 JLvjaC8+WxECNp+64TvRHNP8bBKW91L+KYYDTQ0Uai8ofnS70llT3kBMD
 smFkxKMWy5GWEb1/f7hSGiVWV7ky9nVVopv18eUmbEIKpORrfK67L3oU/
 6S+wwbkswIjhThTmn7Rc1fL2esDRsp1qD6fNtjQVG/EYi+HjD2a8UvMcZ
 86INT0GEr4AIxR69xYDQreirg4Cgo6K5ne4LK7bn7vRUvP98DAbV5W+zn
 au1EcnS3HpIWqU6+DJ/3WI/GK0TxfwQgpNdWBi1iFwKcSw9XdmJud6JX+ g==;
X-CSE-ConnectionGUID: b2roqOe7SYKICtyb2QjVnQ==
X-CSE-MsgGUID: XDosM5OaSk+zudraXyG1gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546339"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546339"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:54 -0700
X-CSE-ConnectionGUID: yl4nbOUlS1maePUcfhwOXg==
X-CSE-MsgGUID: SofHFEqqQEuW3d6bfUZa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589339"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 25/30] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Date: Mon,  6 Oct 2025 03:44:40 -0700
Message-Id: <20251006104445.2210624-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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

A race condition exists where a paused VF's H2G request can be processed
and subsequently rejected. This rejection results in a FAST_REQ failure
being delivered to the KMD, which then terminates the CT via a dead
worker and triggers a GT reset—an undesirable outcome.

This workaround mitigates the issue by checking if a VF post-migration
recovery is in progress and aborting these adverse actions accordingly.
The GuC firmware will address this bug in an upcoming release. Once that
version is available and VF migration depends on it, this workaround can
be safely removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c0d261abf735..dd593e9b0fe5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1395,6 +1395,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		fast_req_report(ct, fence);
 
+		/* FIXME: W/A race in the GuC, will get in firmware soon */
+		if (xe_gt_recovery_pending(gt))
+			return 0;
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
-- 
2.34.1

