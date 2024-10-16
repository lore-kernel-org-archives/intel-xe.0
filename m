Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9DD1AD2E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482010E6C5;
	Wed, 16 Oct 2024 09:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGIkXQ0u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FDE10E6C5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729069518; x=1760605518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=exy92Z7q4+sPGExBDeuywYLgCG/9FqRJwvg1Kq6FL0Q=;
 b=iGIkXQ0u/wQKvFNUbIvR1AZd/42zjiBs9JzivE3wZy9jH2jsrwlCX32R
 EOpiL56BEVRWfbhNDirVjkuaao4+0+0Pagm5RLt2OLznnDMEGKu3URAJ5
 o2KiM6gXkqJfBw/QKxwZ+l1J443nqKIz8bsNbLXuGlmdzOQIdos4NxfpO
 rSRjtYync//jdEvSqAXrCFeZd6mxjYASyeywGzy87yt2T+oDCJF1kFYLd
 eAUeOYiEcXQgcVvgpDlllXSis9M6JNfYvyseboqDzChw9FmKweBezKUav
 VXPReR0CQH0Su6cLvL9aaFrIMJouMX64NHtxNYidCRWUVO4eUe2YtII/u Q==;
X-CSE-ConnectionGUID: /2vjTQJbTOK4Zz0WWDQUSg==
X-CSE-MsgGUID: O/mduJzaRICs8wTK+qn1HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27978406"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27978406"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:17 -0700
X-CSE-ConnectionGUID: x06m+4eOSdOEoYKMWUsVyg==
X-CSE-MsgGUID: qyU80Gy5R1qgrzHhIG/1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78998373"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Date: Wed, 16 Oct 2024 10:23:04 +0200
Message-ID: <20241016082304.66009-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016082304.66009-1-nirmoy.das@intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
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

This shouldn't happen but seen this while debugging ufence timeout
issue time to time so log it to isolate this particular case.

v2: s/XE_WARN_ON/drm_dbg(Maarten)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 2e72c06fd40d..a90480c6aecf 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
 			XE_WARN_ON("Copy to user failed");
 		kthread_unuse_mm(ufence->mm);
 		mmput(ufence->mm);
+	} else {
+		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
-- 
2.46.0

