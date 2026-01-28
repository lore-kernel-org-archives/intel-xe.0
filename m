Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8626D46C16
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B7610E77E;
	Wed, 28 Jan 2026 23:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTkPHrUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0E010E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769642197; x=1801178197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6piSAGUydFEVLrWUa1H6WrRq9PKT544OvcATww2IUdc=;
 b=CTkPHrUGTPbXwnltioP2yu+TYlSziOrMGvE4Ht2evB2p2ZM1HEIak5A2
 faubgPBA2uWWNZ1pE57bZmVN6gd0F77Lg1ppJMH/MNPlFzLXNNOWm0/1u
 aWngs6f3pO2tuWNLbmiR3uPluGA22gJVMjr5ozooDibkZGwj9lRI8jvni
 csOTnbnWN3h07/g9OkX9KeFNcjXPz4pthL7rqf1lhhxirjrgB7mHRdO1V
 EqyCX3vwdB/H5yf/Q9KurEc872f1jQo5t2LzdTMAmLWFfmd07Car9iLTI
 SVXoFdfGY0afAi8ei5QO4NLQnmS5iZsy8zXzTOYs4I+GxDgZsGUFPyMsR Q==;
X-CSE-ConnectionGUID: LnOoWO4GRgSgEGCK25CKqQ==
X-CSE-MsgGUID: 5j64Ow+ERK+lrxQZOl0Gkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73462223"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73462223"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:16:36 -0800
X-CSE-ConnectionGUID: tHrcOhpdRe61V8+mKKCRFA==
X-CSE-MsgGUID: sdPp+btKTdmkNxNDh5N51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213266651"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 15:16:36 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 5/6] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Date: Wed, 28 Jan 2026 18:16:33 -0500
Message-Id: <20260128231634.982494-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128231634.982494-1-zhanjun.dong@intel.com>
References: <20260128231634.982494-1-zhanjun.dong@intel.com>
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
entering the DISABLED state. Update the driver teardown sequence to make
the proper state machine transitions.

Fixes: ee4b32220a6b ("drm/xe/guc: Add devm release action to safely tear down CT")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

