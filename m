Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B46CED24D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5EF10E07D;
	Tue,  8 Oct 2024 01:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXP74oEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84B10E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351316; x=1759887316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKpDAuZ0/y4NnJb6PkJpHFPY4b+MIi+Apr8F01xYvjM=;
 b=iXP74oENUf627UxOQSuwN5PDBk3wUTUCsAenm4G3XXztm510+611hCb9
 FuJ9nXkuKJDm6IcqLSyu4q4uIexFtafoQaAZHzRMEWTl6GqQRHma042XN
 bSdjco+0WVmvlaS/R+Cjw59lDV42j55mScTU75fCxXHYtSbIWc1/S8E/Q
 CHevSe5LFCn9uUHNjzmRXpMBHV+j3mejFflO3BWghB46FUli3A3iUgc5d
 7IkxXzz2gIwQWqRTlro5FWj0yh+nHdCLuUQJvUjxGaOMGlm/AOg9DRFRQ
 FHSoNZAHFTwtY7zJJ55aOq2SaJ4s81pMxAeoHmhZuhk06y40Pkonfh8mS Q==;
X-CSE-ConnectionGUID: BXv4hU6aQN2Qh5ieEfq+aA==
X-CSE-MsgGUID: 3u2XJO8WSRuDMvP8n/35TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652973"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:16 -0700
X-CSE-ConnectionGUID: wIh++TKPTl20J91opAGamA==
X-CSE-MsgGUID: fME6PGQDQcaMBeMF32JZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454297"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:15 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/6] drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
Date: Mon,  7 Oct 2024 18:35:04 -0700
Message-ID: <20241008013509.61233-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3 platforms use the same PAT tables as Xe2.

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6bd6adfdfc74..b16473818173 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -387,7 +387,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
 
 void xe_pat_init_early(struct xe_device *xe)
 {
-	if (GRAPHICS_VER(xe) == 20) {
+	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
 
-- 
2.45.0

