Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1FAC02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5E510E237;
	Wed, 22 Jan 2025 21:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8HCx2Xy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8E10E1B7
 for <Intel-Xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582363; x=1769118363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ibyAXhHYJQ6thuRV0DXQzJC2RH1aiWOePoxh7fnfcg=;
 b=R8HCx2XyU0gpaBapUmC2qcpFmLfYZ+prZWN7Aib97rehBwBXyUvqCs3h
 t4zmvNo+MiPDNEtWct9LxWrEbmzPC46MJ4h39Oo0c1PEiceLsLM3iUHo2
 f2CbRTP5JFiTsL4sKmaxadhihKJNT3izzK2jIUKH3ElcuzZJ5SnKpftjF
 HXS49Ouud5oGSIgqGWnINFErKSTxuAnB9jmxDrmDAICdDwGLgbHaH/Vem
 LGbNtmF40vcb0eq/99dBomXsBVuMSg4FRubJNVfLc8hWUDIw6P/2U0UuZ
 MX8ROhwPMJf/DkztY6fI7wFfzkYjkuKkkZ4TMEMSnMRb+7Da/Rq7N3MfQ A==;
X-CSE-ConnectionGUID: AhDCKPOlTDi76A//VAFzCQ==
X-CSE-MsgGUID: cYah7fn+R+2xlFJB+ShoMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37947607"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37947607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:46:03 -0800
X-CSE-ConnectionGUID: ywD2u4DhThmjvSO/AAcYrg==
X-CSE-MsgGUID: JwxO6cL7StmyJ3tmP92TFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112239268"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 13:46:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Explicitly name each chunk of GuC log data in
 a dump
Date: Wed, 22 Jan 2025 13:45:59 -0800
Message-ID: <20250122214601.3560156-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
References: <20250122214601.3560156-1-John.C.Harrison@Intel.com>
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

A mesa devcoredump decoding tool does not cope with line wrapped
ASCII85 data. The GuC log is saved and printed in chunks. Only the
first chunk was named, thus subsequent chunks were effectively line
wrapped data. So add names to all the chunks instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 80151ff6a71f..e3e3958b243a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -207,8 +207,10 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+		char name[20];
 
-		xe_print_blob_ascii85(p, i ? NULL : "Log data", snapshot->copy[i], 0, size);
+		snprintf(name, sizeof(name), "Log data %d", i);
+		xe_print_blob_ascii85(p, name, snapshot->copy[i], 0, size);
 		remain -= size;
 	}
 }
-- 
2.47.0

