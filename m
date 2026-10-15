Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF20FCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EA910EA0A;
	Thu, 15 Oct 2026 10:34:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13610EA0A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792060467; x=1823596467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BXLim70TmAIzI+Zjdkh1utpbAgX3G7gKyZS++NQO00A=;
 b=Uus41uOcThLeLXwAjXZKllivFwEGC4kXYN/pi0jWha/YpcohOUd9w/3Q
 /AVhc0gSNjNibxBo42GwA5Y3u/+u2BuIrXTQy8ZN4t87Vsa1HvJF4Mhws
 xrzMjrWPCNNEUVHz0YWPQsDlpPYCi3LXzJON8C0YupnM4ZY4tAR8Mkxcr
 ZoFG9amDBSL18cbFpHYsKN6x3i/bjJHM12V1Cg1uGdpH+INbyqPJN6Gs4
 ETWwBd9hBpQJlAd9SuSqnzyVMA6XLYNl7zpy2J+MmKG+4ivp1XzVU1pUG
 +HzVhVpBZuMZG1ZL6tBvzJRr8NHB3NPwBxuwwgZ623u7pWLzBQ6qFGrI7 Q==;
X-CSE-ConnectionGUID: z3zv0vNCRbmyRt1mU+53eQ==
X-CSE-MsgGUID: ekXtNcW6RnmpS4m7PoPowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="813742"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="813742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:34:26 -0700
X-CSE-ConnectionGUID: HT4cwkMGQhWEFdpc6EzavA==
X-CSE-MsgGUID: LUfZ2vGnTZGnWDVGxXJRHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2127622"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:34:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Sashiko <sashiko-bot@kernel.org>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/madvise: use already clamped pat_index
Date: Thu, 15 Oct 2026 11:34:16 +0100
Message-ID: <20261015103415.442931-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
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

Pass the nospec-clamped pat_index to check_pat_args_are_sane() instead
of the raw args->pat_index.val, and fold into the preceding
DRM_XE_MEM_RANGE_ATTR_PAT block.

Assisted-by: LLM
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/sashiko-outbox-172627%40kernel.org
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 5c7aefc641ee..a835cc55658f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -659,11 +659,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 			err = -EINVAL;
 			goto free_vmas;
 		}
-	}
 
-	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
-		if (!check_pat_args_are_sane(xe, &madvise_range,
-					     args->pat_index.val)) {
+		if (!check_pat_args_are_sane(xe, &madvise_range, pat_index)) {
 			err = -EINVAL;
 			goto free_vmas;
 		}
-- 
2.56.0

