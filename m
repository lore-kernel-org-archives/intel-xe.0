Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35721C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9C10E839;
	Wed, 12 Apr 2023 14:24:52 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB2C10E839
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309489; x=1712845489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9IF5w8GMPLCiF4a0Jl7vE9COD5qKA9mcaZ+nZMyWpKA=;
 b=UgOu54IOIxM0/W6WpWzNEGJ54WhZ2Q42nVYC7MhQw/K+sEVxUZkADVie
 4qNYpn+OZ13HNHbssmB/1W7URLSaKNxHOfSJXp9bk5JAji1QCHzR5YIcL
 V5cKjhC9IHLq2tHywCYJGHfXDiiAw5kB+IsePZFs9m8FWsV9Ec/BDi5AI
 4mwmxndoyPhBQ+Fo2ae+TbmSnP7DKbpZhdXZWLTgk24jD7kmwY/0VZy4H
 fzTvgTWp+Fz0Q3B1sN9ZaiPQKPElDpK+H8smXh3PsFf3Ax3skZBRtDu6q
 OJGnJSKFBZHlIJ2tXfCClsW5FFyQ5yxyAIO7RzvVeu0ajJHfE6tzhlo93 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409049341"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="409049341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721585673"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721585673"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:24:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:46 +0300
Message-Id: <20230412142006.877109-22-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 21/41] fixup! drm/xe/display: Implement display
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

It's okay to include uapi/drm/i915_drm.h. It provides us with structs to
make stuff compile, even if we don't use them in xe.

The placement is perhaps a bit random, though.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 133c60cb3a09..c40bb27ac72a 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -1,6 +1,7 @@
 #ifndef I915_VMA_H
 #define I915_VMA_H
 
+#include <uapi/drm/i915_drm.h>
 #include <drm/drm_mm.h>
 
 struct xe_bo;
-- 
2.39.2

