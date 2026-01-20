Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6ED26296
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A258110E220;
	Tue, 20 Jan 2026 20:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv03E+XA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF710E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ecnmn6ob2VtObbxFQGYpPGIPKk8Gw1SB/R+FR9hKq6o=;
 b=Kv03E+XAJ7KBujOaqlPf02oPY9tVTtxNdi8k+M9huKmn2FEFG9Gpe7y7
 Z+uAkGAv+prUVsSvYTDB0G4JkyBJ6hZTV2y84kZEN1gWQ37LF8YUj5AMW
 qV9M/KM9/hTc9sO6n/yi1f+I4w3eWWDpPHv84fZN6XLXD9KsBAy6rkhoJ
 Yn2QNAtiTPEzgCGDwh+yBr5n0TtIjI5wqThxzLdKMVx0+5ZkfezjlPGXy
 ynWlIY2Aw8GlLDXeGR8AiJFLY8NuXPL6kZCEbMpPYBW+ZGPQ+k3D8qbIy
 Zgle7mkuoso3itnu1x+tiQYFmKRKUHvC7o4dOzhM7FORc83bCPLuCx3Ha A==;
X-CSE-ConnectionGUID: waV937xkS5iPcwbvSMihsw==
X-CSE-MsgGUID: k79BkWoIT9i5nkklyAb6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574658"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574658"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:24 -0800
X-CSE-ConnectionGUID: bp+lN0hAQwaNZ+75K59Sdw==
X-CSE-MsgGUID: aZk/O/KXSPq4/SMOZijFkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373501"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 4/6] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Date: Tue, 20 Jan 2026 15:16:19 -0500
Message-Id: <20260120201621.2442803-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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

The GuC CT state transition requires moving to the STOP state before
entering the DISABLED state. Updated the state machine logic to enforce
this sequence.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..6a658f085e0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -345,6 +345,7 @@ static void guc_action_disable_ct(void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	xe_guc_ct_stop(ct);
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
 }
 
-- 
2.34.1

