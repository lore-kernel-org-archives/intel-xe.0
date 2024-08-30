Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4C0CA0EDF
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615C10E7CD;
	Fri, 30 Aug 2024 05:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nf0ahxHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089310E7CA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994353; x=1756530353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3eyyolshH1TGYeXVdgUPMx7fJLqOPA23bSUCMaOS+O8=;
 b=nf0ahxHfQ2Ik2lvrhzWfK52N8Ne9volAwRfcSbCUgDW+Ks49jHQNnlHd
 ucATfxWrEOrvWm+jyXXHDK7K5hLkGbFhEgR3GDdMCbBkZVxf3bUna737Y
 viQbAMQhLwD4hyk3Nl4z2MnP1O7XhLkG6PEWOGaMMkqGC5OcuOEs//guH
 YA0yO8eg0tWKGM/66rMLAsYgtFRtCXnZ2HjVRdatY5GunZEXQBvwYIMQV
 z3XdQ4hdzJ2Y2c2rp7Q67FJBrvsTg/2atjHdnrg4aemVSZjuD8eGn98c1
 LJewlhbDmKJ8V+QZQTUGIQvTgJR/XuIx6IEvJyyKHKjDeSO8V6N2/d+vV A==;
X-CSE-ConnectionGUID: hp5NHlElQqOAn2iJH+UzIQ==
X-CSE-MsgGUID: IOiCDNRpTGa5tzq9f8mHlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006496"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:53 -0700
X-CSE-ConnectionGUID: mnjq8Gu7RGij+GL5kOUchA==
X-CSE-MsgGUID: 5CxKQAFoQX62ARj9O9M5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101302001"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 6/9] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
Date: Fri, 30 Aug 2024 10:53:23 +0530
Message-Id: <20240830052326.3707019-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get failure doesn't increment the refcount of domain
anymore. So xe_force_wake_put shouldn't be called in case of failure.
If xe_force_wake_get() fails in xe_oa_stream_init() do the error handling
without calling xe_force_wake_put().

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4d4541e0b24c..78ff4ab9ef57 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1407,11 +1407,13 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto err_fw_get;
 
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
-		goto err_fw_put;
+		goto err_alloc_oa_buf;
 
 	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
 						BIT(stream->hwe->logical_instance), 1,
@@ -1448,8 +1450,9 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	xe_exec_queue_put(stream->k_exec_q);
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
-err_fw_put:
+err_alloc_oa_buf:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+err_fw_get:
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
-- 
2.34.1

