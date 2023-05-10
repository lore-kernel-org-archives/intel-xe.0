Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7DFC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF9410E49B;
	Wed, 10 May 2023 12:12:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA0910E490
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720733; x=1715256733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PLRp5f+7jp9ODZbLoSOHxNBT5wt26cH8d0r37918vNQ=;
 b=oK/jBBXX+xCmtJpSFucehgyoGasxpoTRgcIm9dQsRLyyUrC5fHfHEzeR
 zMMBDiYoexCkI/orymX1P/eMVwhwQcKO4gFr1ij00iJ3vzDORkX/CTIkb
 sbFmb0a0acufjeicTPd0pWtT4Mv/09UgAZmrUgDE7TPPRFkjLBBUs7Sz9
 DG9ZDkSyhja4rLUXi/gy51LgpMzhWB3AVbHUM/mlbD8Xrvl4VuEfxgxjq
 0bQXO/V+4bAnyd/veKrp7kx93Q3MhL1SDQ4R6z5eoS4nG+EZ403LnUiwR
 cgBXQhe8SWs10dow7tB0D/pDI+6jR0azIokCSyiELSvBCQejGEPgSrkNL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268058"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906009"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906009"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:10 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:30 +0300
Message-Id: <20230510121152.736148-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 01/23] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove unnecessary change causing conflict when reverting frontbuffer
tracking removal patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 015aacbad1b1..24637199c274 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1893,7 +1893,9 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_clip_rect *clips,
 					unsigned int num_clips)
 {
-	i915_gem_object_flush_if_display(intel_fb_obj(fb));
+	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
+
+	i915_gem_object_flush_if_display(obj);
 	intel_frontbuffer_flush(to_intel_framebuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
-- 
2.34.1

