Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994C9C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237B10EDA9;
	Wed, 26 Aug 2026 17:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezm3sq2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8610EDA3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764328; x=1819300328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5oVN2xfwAbpkR89oUO2uUDafY5X/GHLdqSNvMgVUW1M=;
 b=ezm3sq2S6qsd/xDotjbs7K54tFQPpA7uESLeFfIDdNRxdAaECAJTQqU3
 JjL8lZ/I8J0lHK06e8I5Y2CqqiFVq4/InpVp5p4a+k5mJXNyvAY9UAdKg
 Sz6u28hQ3i95S/kX5EZQPHPOxZdFJNyoK245pUrsd8uR6RTiIDyVGU3Qn
 ZjvOsbP2vyrLq6xn+G+xb0ZrDPcQRBAlUSaQ2cqjm0WI5HLLTsmZMeWqX
 5IKc5YyE9gxSboRWyA0XabmGSMYOWqnyT0fuV/83fzJ9bq8J3pmkkbh+A
 RrcFLkVTPLwd75pIEK0z0IOCsJ0Zi2X+h3M7d+vmbOCeXOvgfOdCSjPDp A==;
X-CSE-ConnectionGUID: IbWQs/kCQ8y8W1hqHdHHLQ==
X-CSE-MsgGUID: WtcGt0OISkGE7KxGigEoWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379133"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:08 -0700
X-CSE-ConnectionGUID: a4sncR+2RqmZewVX3p600g==
X-CSE-MsgGUID: Y2nU2o7lSmO3fdKxhLbHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493157"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 6/6] DO NOT MERGE: drm/xe/guc: add a mock newer GuC file
 for LNL
Date: Wed, 26 Aug 2026 17:11:49 +0000
Message-ID: <20260826171149.708378-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

This is for testing only, to have CI do a full run when FW fall-back
happens.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index dc4e268f1379..989c298b51c2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -123,6 +123,7 @@ struct fw_blobs_by_type {
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	99, 99, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
-- 
2.53.0

