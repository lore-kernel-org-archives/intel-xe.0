Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE855C7EE32
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 07:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F7F10E5DA;
	Fri, 19 May 2023 07:42:15 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4B310E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684482133; x=1716018133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7jH3ygmDRtnZ4iVDHucQzhz4hQVyz5fhLu/txnHH7jk=;
 b=fmGy/hABej8PeM/4vwx2fqa4QIpMzolv7kh+JgH+ZdV5VEyIghHk82t5
 6r0japbKDha5eleBEf0HNpSb6bo6OmICOuAyv3QmWD7S5MAakkE0tx6MB
 R1rvmlSUELVPIqAVAsDqSUnhzPpBPnMNDc/3STx0fxasiZm3oecKaE1fj
 Oxj6WbxGQz3+vuRCU6GTcjDbhj04HMpCt5iTvwYEw7GbQ4sELBWk/g+vA
 arZCr9pCv3DxTNlzapzFUWjpRqMYToFWL8ORlV7t6bTW30Z2pRiH+p3ac
 uovV9QuVvKhsJ/yGJQWnjzb5qtWQ/iUdY3faQwqnvPYkUTvDwF3yyyzDA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="415772249"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="415772249"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 00:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705494625"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705494625"
Received: from sischoen-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.43.104])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 00:42:11 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 10:41:11 +0300
Message-Id: <20230519074111.3364590-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519074111.3364590-1-jouni.hogander@intel.com>
References: <20230519074111.3364590-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now we have struct intel_frontbuffer pointer in intel_fb for Xe as
well. Handle setting frontbuffer bit same way as done in i915.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index d0f91f37b6d8..34ae461865a7 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -228,7 +228,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	plane_state->uapi.crtc = &crtc->base;
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
 
-	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
+	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
 
 	plane_config->vma = vma;
 
-- 
2.34.1

