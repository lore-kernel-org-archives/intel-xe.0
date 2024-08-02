Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7799DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458EF10E0F2;
	Fri,  2 Aug 2024 22:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0sEG10f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B29210E030
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722637293; x=1754173293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfYD2yJvDbNZHVg1fWc6vJiSfJMy6BkEvtfKnhkX7cI=;
 b=N0sEG10fGfH3u1pq2wRtLC2xvdngm5OivbPoO/4G2IuoG5V+5t2yQr4n
 vyjeP0ndrCd4+tsQClLpcK1damxCE9ZLrWbRXHqST/eqfbPGPP8dSoirW
 LGxhLICvZsSc4ff9L28NBBuDOI9NQI/UDKHLHSEJuUa/USUwV8SYsjCM1
 iks9+6eUE0O3SBGz/yBUWWCiNLo7XThJ+Oxfk7TfBgci8rva8MFQD7TvM
 sXs9+jZD/uNm34V+It6Lp+4318zeNig46Ube5xQmqSO/jFKV80wUXkDax
 WV0mkJ85BBwCxgWnZM7AGHgitEFnVW/zFzAeNHyQOvDEKHqUgFt/LJnYs Q==;
X-CSE-ConnectionGUID: sEDyekMMQWSkvjYZx9zizA==
X-CSE-MsgGUID: 4BlElVKaQfeyHWDJ1QWjJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20808505"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20808505"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:21:32 -0700
X-CSE-ConnectionGUID: 0wklB8URQBKyv6HIDvs94w==
X-CSE-MsgGUID: UrllU74oS8C4sy0uHgYD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60385242"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 15:21:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 4/4] drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC
Date: Fri,  2 Aug 2024 15:21:29 -0700
Message-ID: <20240802222129.3976212-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

Add pre-release support for PVC.

UAPI version 1.13.4.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 4bb2a4a80ddc..41c4ac6ba42a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,6 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.45.2

