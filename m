Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF9C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1910EB19;
	Tue, 21 May 2024 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fF9Gbhsw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DD510EB19
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716288668; x=1747824668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rknpYNIRwa9QyWUCfm5+MUCYkIhtNbRhLEaMsZ8O0vs=;
 b=fF9GbhswyVZ2qgFIMAqMhQ5jqYaLffNTAaCpUrsUrdvFiMwicdGXARJ0
 qLAs4fj2YdfGcoxOpDvANs6QWwmnfx1EPSBWuySdGuj1vxZAAimj/+ozH
 kYH60bl3nkZNEpg6pzGNo3MxfIBFPtUeu+eRyNKOuvXNTNyWr+lLhtwNw
 Vbu4Xa6pzHWH/5f09rEQzAm0ybRlDmDjTR43Jvhp41HTo+QNmDFSZUTv7
 FR/ysa6EVvQ1hdgNf1q8Vq0jgIznEoJDiL7Z89eWH1VMIxG93HG5HyIzt
 zH8oQ8W+hZoul9OszwbFekwEQbGhUdvJazzKoMtT4fv4kFgVleImpm+3Z w==;
X-CSE-ConnectionGUID: Gov17teXSv2zFyk6breTpg==
X-CSE-MsgGUID: EHGRJ8nkQxu7PhRXbVv7Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12311703"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12311703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:51:08 -0700
X-CSE-ConnectionGUID: mhAQMfZ+Th+GEFDkAGBJZw==
X-CSE-MsgGUID: zWBDHaCRTPepiOmH0DswNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="56104284"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:51:06 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add warn when level can not be zero.
Date: Tue, 21 May 2024 12:36:23 +0200
Message-ID: <20240521103623.11645-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
be 0. Therefore, add an independent check for the level. Since the level
cannot be zero at this point, there is no need to check for `is_compact`,
so remove that instead.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 11dd0988ffda..cd60c009b679 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -763,7 +763,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	pgoff_t end_offset;
 
 	XE_WARN_ON(!*child);
-	XE_WARN_ON(!level && xe_child->is_compact);
+	XE_WARN_ON(!level);
 
 	/*
 	 * Note that we're called from an entry callback, and we're dealing
@@ -1445,7 +1445,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_WARN_ON(!*child);
-	XE_WARN_ON(!level && xe_child->is_compact);
+	XE_WARN_ON(!level);
 
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
 
-- 
2.42.0

