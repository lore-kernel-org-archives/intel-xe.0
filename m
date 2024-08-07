Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFFC52D73
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FEF10E588;
	Wed,  7 Aug 2024 16:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EE3m9h+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5845F10E581
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047892; x=1754583892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9EPgmcOoww9zrLQzfm0C4sNRIlStiPEColufS96cx8=;
 b=EE3m9h+ZpXNzxiyNKUNyiESqi05+qrj/kkmP8KXCJrR/IpaNDa1wNp44
 D9EtxePZRf6DAMbw0YQ7BxWNo1117j7KcQqBv4U999D7ZlW3ec3mUsrrH
 5rWH+AvHVfM2UsvThelgjXZXpu+7sTOhHyQs0FEzH3u3iSNS2yWeal8Ls
 bg66ngXEq61XvxzvRg2VPsi7ptlso+YP0q0FLyEN5uQ+b5XIAUcbnvbFh
 GnIQTJl++CLQloCC6Rz57rwk4+WPlYEv5YbeUWSRQHGayG3F2Aw5eD/iY
 OUKGDkY3VP1WuQtvKCSBta4cs2cpHYViVYfK2p4x3TNyuhLEARZBHrEA9 w==;
X-CSE-ConnectionGUID: so3273lCSECSpuIAgmEzqg==
X-CSE-MsgGUID: zN8YAxt6QZOE9CpMfPW3FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040457"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:52 -0700
X-CSE-ConnectionGUID: BYB8SCF+TiOhZYZ86aO32Q==
X-CSE-MsgGUID: vWLSpGRHRF+Ok5jTpVXhuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61791045"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:51 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Date: Wed,  7 Aug 2024 18:23:39 +0200
Message-ID: <20240807162416.1307061-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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

Make it safe to have multiple calls to guc_exec_queue_resume() for the
same exec queue. This allows the use of this function from a context where
knowledge about prior calls is missing. In this case the function does
nothing but at least it does not fail on assert.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 50013e1e7455..782561b21d24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !q->guc->suspend_pending);
+	if (q->guc->suspend_pending)
+		return;
 
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
-- 
2.43.0

