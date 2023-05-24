Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4121DC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220410E55B;
	Wed, 24 May 2023 17:57:37 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51D10E292
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951053; x=1716487053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ej/RnSOgqY+aTgZRzpKVS3xGCxPZVt3me5g2W91gwks=;
 b=awV4/gesJ8yIhPTYrmCIVHVMXBws30rgFXNMK7dP7Pja2pGdpvdkZKWz
 AgOLVLU4vH9YRgUQH8w/f/uNHa+UToW4S94m01Y1DABPAWqpbwDpZt9mU
 yRmrqqRAVNnl+uvYPNjvPyD5qnD49v/hghAfzaFsmQFoMx05IK2uWchv+
 NXgMZX9Nb6yhjPuHL+1g3I+f7S08FINyFN3H0KFB87hzGnCFTHLW4D8wn
 FV5htxszgW3DvkmkXv9yBPCzoivhFYdvCN0ecypq0fVlTVgFCp8NsJSdR
 qrRiFNgoavmYok64ScUprLL7ORhYrYcj9+nsvpKPJD5Germl0mKbnOyif Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266925"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629016"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629016"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:55 +0100
Message-Id: <20230524175701.320653-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 3/9] drm/xe: drop xe_device_mem_access_get()
 from guc_ct_send
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The callers should already be holding the mem_access reference, before
calling into this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9dc906f2651a..874323c382b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -605,14 +605,10 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	XE_BUG_ON(g2h_len && g2h_fence);
 
-	xe_device_mem_access_get(ct_to_xe(ct));
-
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
 	mutex_unlock(&ct->lock);
 
-	xe_device_mem_access_put(ct_to_xe(ct));
-
 	return ret;
 }
 
-- 
2.40.1

