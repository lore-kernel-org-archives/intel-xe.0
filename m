Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A963EE6432
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BCA10E5CE;
	Fri, 15 Sep 2023 07:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8FA10E5C6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764146; x=1726300146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f8PR2IGCWDdVuOjZuFBGXagtFnIzkkIIC+7qib21t8M=;
 b=RtmDOsgXkPLj4CQV/GgtU3hOzFf/2II38hWSoXO4R+0/ksJl/kg0aYgY
 iyzgZFFNAah/zabpIr2FrKFxfxOqQlWiveQjVEwX+3s7tXnx7ydXCX+/1
 Dvnlaqtz/eKTjwEn5Q+pfzn+ds6s/WFbJc5KJcIYNjODUo1LKa6nnmpgi
 VI3NOsufLfU3bg8JK0xGLVUcev6iRSXqqS8eWLmV9hQbJE8HHOvM+jtwX
 qrzeWs9fui9nUAtceaiYPw4GayIR0uUUXZ2iTe2X21bzAefuG3rYbB4fq
 +myybqLNTIpX35lWRTZZ2hDdx+xaiLdcEL5t7jMfEFucbtu/L8I7/7o6u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507582"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711615"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711615"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:14 +0300
Message-Id: <20230915074818.903353-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915074818.903353-1-jouni.hogander@intel.com>
References: <20230915074818.903353-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/i915/fbc: Clear frontbuffer busy bits on
 flip
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are planning to move flush performed from work queue. This
means it is possible to have invalidate -> flip -> flush sequence.
Handle this by clearing possible busy bits on flip.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230901093500.3463046-2-jouni.hogander@intel.com
(cherry picked from commit 4f89df198dc17070831af21b74e69ee17352619f)
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 7f70166f7035..85f6524833ca 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1309,11 +1309,9 @@ static void __intel_fbc_post_update(struct intel_fbc *fbc)
 	lockdep_assert_held(&fbc->lock);
 
 	fbc->flip_pending = false;
+	fbc->busy_bits = 0;
 
-	if (!fbc->busy_bits)
-		intel_fbc_activate(fbc);
-	else
-		intel_fbc_deactivate(fbc, "frontbuffer write");
+	intel_fbc_activate(fbc);
 }
 
 void intel_fbc_post_update(struct intel_atomic_state *state,
-- 
2.34.1

