Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0DFFA0C23
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 03:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED7810E672;
	Wed, 15 Apr 2026 03:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5CrAyvO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2184010E66F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776224137; x=1807760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UiyL5jj0TXBQfj3MlZaPazA3dcXBWt5yG0+CXuSw0jk=;
 b=d5CrAyvOjhilKo+gf3hhOynPSp9UsmdCciMGeNZX1TPvsmyKadIrH4m4
 5SGdF32Ljb1DDCJwGMFFe4S5pqBLk44DMLv6IhF8IXiUQ8J9K3/SQrGh5
 JvWdsSWsKa5bF1ccEeSnTjT77Eha8KctOhRnSUQL7zEQVYXO1ESKD8QF9
 9fIhj4hHqhh1HdSvCY23uZJO1GiS7B5I4pTQNbmbWnXnT/ZAsEacea7kU
 GK6lMoSA+ekSO+v/cIGmP9Ar4holjbwQ1/zhyAmx5xzTJykPOfh8UbJhT
 S+8sm091yPtolUFMlJSQYhJDPcMsyj4LiaPi2q1HkPkXuAMWqbIs3Kd9j A==;
X-CSE-ConnectionGUID: BXx8AjbxR+y+AYfONtO9vQ==
X-CSE-MsgGUID: mkJa/0E8Swey8uEcknn1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76225345"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76225345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
X-CSE-ConnectionGUID: rN3ED3T4QqGEXjB85m7XGQ==
X-CSE-MsgGUID: Jgq0Gs7OQAy9nAEcqmHodQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232033293"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Date: Tue, 14 Apr 2026 20:35:32 -0700
Message-ID: <20260415033532.789954-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260415033532.789954-1-ashutosh.dixit@intel.com>
References: <20260415033532.789954-1-ashutosh.dixit@intel.com>
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

'tail_buf' argument for WHITELIST_OA_MERT_MMIO_TRG was previously
wrong (not multiple of 16). Fix this.

Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 09dcb6a422797..796b3a2b717c0 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -106,7 +106,7 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
 
 #define WHITELIST_OA_MERT_MMIO_TRG \
-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_HEAD_POINTER)
+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_TAIL_POINTER)
 
 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
-- 
2.48.1

