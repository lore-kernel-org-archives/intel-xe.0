Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C3EC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BA710E9FE;
	Wed,  5 Apr 2023 15:40:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776D10E9FF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709218; x=1712245218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZYr6yJBMkubRRjclHdHYI7sVYLmEGp4+ajFIGwlzuPg=;
 b=Pv8quwiP4HEaxG7p0ptIXOfO8cPp3JjACicTG8KwZf7l6VDHEstitVDU
 qobhHqCVKAAYJew+Z2VkEQhnPzz2L+2ezBip5AZQn2bjC1kOeItoDDeu0
 pjxtzBX9yG14kPMCrP1U65+222MJt+ohAhclE7yJeAeN6ZPVwJT+u1oHs
 hUXjG07YzRDFzirXo+iBP31lRxxojFU23XNXoHSR8aKWJRcjDmpkqfMIT
 nUTmK2lFu3M30swa2qqYdzu4EsGAgdnH5mDagcY/Tp+lzkDrrgXfsiHEG
 EzUDHVen1N8TS1oNtokH1OXbamALMftqbZV2s52plbUFR/q90RG3fJ4iX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210958"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210958"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295936"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295936"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:09 +0300
Message-Id: <20230405153920.926583-11-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/21] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_lpe_audio.h ifdef cleanup

To be replaced with better conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.h b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
index 6171032b4115..0beecac267ae 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.h
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
@@ -12,19 +12,11 @@ enum port;
 enum transcoder;
 struct drm_i915_private;
 
-#ifdef I915
 int  intel_lpe_audio_init(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_notify(struct drm_i915_private *dev_priv,
 			    enum transcoder cpu_transcoder, enum port port,
 			    const void *eld, int ls_clock, bool dp_output);
-#else
-#define intel_lpe_audio_init(xe) (-ENODEV)
-#define intel_lpe_audio_teardown(xe) BUG_ON(1)
-#define intel_lpe_audio_irq_handler(xe) do { } while (0)
-#define intel_lpe_audio_notify(xe, a, b, c, d, e) do { } while (0)
-
-#endif
 
 #endif /* __INTEL_LPE_AUDIO_H__ */
-- 
2.39.2

