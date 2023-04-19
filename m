Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331CC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038E810E96B;
	Wed, 19 Apr 2023 12:40:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7110E972
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908039; x=1713444039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cp+5ysnOXT5zYD2UZdWQHTTTqxgQZp83w4Zi1dFd9cU=;
 b=Dxg3AYPnorTbcI5KG6nPZk70th+wxjmUBGbmDBFDQ4lj8iwdTWgIT+qb
 F+qZtsLTKri0p/QRQHw7pXkC2TH+kdZmL5qEj00cbKoBdKg6QYVREcErM
 0dLrkLQ0qoW3G8xmJEc0h6nmkDGAyw38o4FBSRZCsk6rgBgdIbJBGpJkB
 9u1cIGGr1o+9MQBaq4OuLHNl6TnqgeomUz3lJ9YSkXfNT1E6VdxhlHWdR
 34rzK6raTsNJZVyqmAuviaVJVvXs21CT9GKjcLq3gLkavx234io2YdKD8
 dhwiKKzTuj3x3IMy1tex7Y+uIlAquK/Tyz7XqGBdHQDoxci4sgXE5y0pt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189571"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780844054"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="780844054"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:46 +0300
Message-Id: <20230419123947.543175-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/9] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add dummy mmio_offset member to reduce ifdefs in i915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a16909c79c8a..1cb404e48aaa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -157,6 +157,9 @@ struct xe_device {
 			u8 num_sprites[I915_MAX_PIPES];
 			u8 num_scalers[I915_MAX_PIPES];
 			u32 rawclk_freq;
+
+			/* Unused by xe, but for compat */
+			u32 mmio_offset;
 		} display;
 #endif
 	} info;
-- 
2.39.2

