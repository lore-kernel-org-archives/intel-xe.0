Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E08C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC5510EEE9;
	Tue,  7 Jul 2026 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCYAK6kc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B7910EEF4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783452367; x=1814988367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7TZt2rUUko7UxorUvn1e3qEOgWkyL9v0OHIu8AETGZc=;
 b=JCYAK6kc9HURy81YgALJrcBu1NSCr94YYrxLpsMOdAJhm7IVZdY+J6ci
 zRoqwQMAogukscEPYkkwC0XUHtIZm74JmGEuSgvPO1FBTHg5o3wGhnxbD
 jSOJMDvRLYlMsFQ4s03fKd/foWRhZ35WKlxuWRNv9ANr1TrDnF0+8rkhI
 FkAZOVV47PLWsujvJiU12CPBdcdtRj6nXcj+pyMJU08M/7eZo3DjxFZp8
 3g1sTZtvULwNa2YDlgPaysk0KZrW2jzXVAa5TBLfgRv5eY7Lu7irnzVjy
 Hwg6rSF4P5IPfs+n3tNm0SQ6tTZ1cy1vjWF/5UepC2cX+cYtfZPqhtYD6 w==;
X-CSE-ConnectionGUID: QJ/w2tkuRaWCQEHlprQx1A==
X-CSE-MsgGUID: SssBqEqlQCC03DnDTQeNmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101657859"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101657859"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:07 -0700
X-CSE-ConnectionGUID: iSrrfeqPTZGkYRKcD3Jhtw==
X-CSE-MsgGUID: ZitSES90SGKQI24rqyPKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257960830"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:07 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 5/6] topic/for-xe-CI: drm/xe/cri: Define GuC firmware for
 CRI
Date: Tue,  7 Jul 2026 12:24:41 -0700
Message-ID: <20260707192547.50535-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707192547.50535-8-julia.filipchuk@intel.com>
References: <20260707192547.50535-8-julia.filipchuk@intel.com>
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Define GuC firmware, still using the mpp version that is intended to be
merged only to help with the platform enabling in topic/for-xe-CI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20260108181956.1254908-10-julia.filipchuk@intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260529193558.185436-13-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260618222536.3351750-13-julia.filipchuk@intel.com
Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 65f0136859d7..f7d3af6b57bb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

