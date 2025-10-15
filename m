Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8960FCCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7510E902;
	Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA8yCMCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E903810E8FF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiay/dZkv5b7JNFdLm4yfgHYHynhmGQFGIsoON/qWRQ=;
 b=OA8yCMCLNUcgY2wS37mn6n3D1T0XD7amlTW/N3F9NzKvjyylx19PswNV
 zwvqMJoXn19ACJC6VU0yM9fgObJfuphHCCeGrdhWVBSCfBtgRtL4HwJYk
 7UvnWFRsZzHcrzuGQWf2NhTFFXz/ztsc4KTcetHyoC8OvDWVSb88v7A7c
 1uz7OEFupJvNA9VmIK3s5szXTDDEt9lJneI1KG+I8ahQ5Ok7brA2ekBcD
 dAbUd7r1N7+6VlcX6oB2dsrseX+hF7V/pzQUIDGvDGO5V+xJntdZlnifl
 XDMpUuN2L8qGGrM2RJaGuNAJ66RMGtG0crMWCTEhqE8jbwzANMxdGCrdN w==;
X-CSE-ConnectionGUID: hzMD1dUtSMKImVqEOZVhSw==
X-CSE-MsgGUID: iFFVh3OhSmavam54i+k84A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794050"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: dpMOIRpqRNeopDlHpJZxUg==
X-CSE-MsgGUID: lbfWRlPvTha9FSdCPFSyDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298273"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 05/22] drm/xe/xe3p_lpm: Skip disabling NOA on unsupported
 IPs
Date: Wed, 15 Oct 2025 15:06:20 -0700
Message-ID: <20251015-xe3p-v2-5-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

IP version 35 has removed "NOA Enable Signal" bit from RPM_CONFIG1
register. Skip clearing that bit on unsupported IPs.

Bspec: 62391
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3f..f901ba52b4032 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -837,7 +837,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
-	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
+	if (GT_VER(stream->gt) < 35)
+		xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);

-- 
2.51.0

