Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28F4C369A2
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752C810EA58;
	Thu,  3 Apr 2025 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRZKq6SV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4410EA4E
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Apr 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706581; x=1775242581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q8+cm5hHy0fhkDnYR/0JHA00c5ifU4afWW1iBl6Tgo0=;
 b=iRZKq6SV9s+grW6+fih7Tqb7kkyiQu8mvIan+7tVTRwWlHXRXK/9a+Cm
 VhCRt3Pxd8Vw6Msa7TYtmo0d7WLcPzb2+wwSQTysclojGlzjDjAkEU/Qn
 6nwSXd2d0dFU4ejLp3p6lp5UzHlZxHMRmGQW6o6GEmLL0dchKU+VJcPiG
 0u1b17lxjbn+8AaB2AY8rpyicPAZQNySJqXgkXI94jYR0074ZKebYpm3g
 Sq6EJf2cgZalmJCy8Kyu2voT/JAjD2ksxStISDShsm9fPL4iFcULK9Rgo
 MScr/2ECS9M7ZkQ6ecHJBWihXkkMB1LzdsfJ/rDCVY1bcoQg1ZfLdUonf w==;
X-CSE-ConnectionGUID: eWhFb9DIRbeTEqbHRzcawA==
X-CSE-MsgGUID: 6+Bkkm6oSxWheE9nuzIpCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32737758"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="32737758"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 11:56:19 -0700
X-CSE-ConnectionGUID: agF+7zTSSCKPPhZdTYxT6g==
X-CSE-MsgGUID: AVkmfFJhT/WN2LhlX/Dm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="126895843"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2025 11:56:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/8] Revert "drm/xe/ptl: Define HuC FW version for PTL"
Date: Thu,  3 Apr 2025 11:56:12 -0700
Message-ID: <20250403185619.1555853-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

This reverts commit 0a1388d7b15a70959418fce1ed1efae1f6a47302.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 70d7b542f665..9ce82116498e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,7 +128,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.49.0

