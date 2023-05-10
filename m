Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D642EC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8B10E484;
	Wed, 10 May 2023 12:13:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875D310E48C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720779; x=1715256779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5NlBTIpZNSDWbjYCSHgECuhC/q6rBVPY3iPrvf7pic=;
 b=ldLl8uSP4PEbouLQJ7WwBQtfhud7WfWio8HsFubIp0MY/PU2JmnYjTa5
 2L8xa4SQKm0mgmhBo2Nuh0pT5RnN3h9IboUWR2THmjxRMMMqxKpiuenvB
 SuCMfPq9VELmMK5wOaJBVnaEsIYrWCKOYZumfdI166PgzkImvW3eoTRBz
 D+0vgcbtyTEtUwmmxrs2ZbdQvHpAxCwbOlHa94pOSyhmp579E0sjyhidf
 wzJW3liQOu4IsFCxU9lRFXk8/Uu6xBsLLR3xNfj3R1HSatF4IUY0E0u7q
 /zWJu9cEfaVWmjXXREw3PQ6vPB/AY6Q/lIZkdY2BsV1BqzZMmFlvUEBMQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268230"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906351"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906351"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:46 +0300
Message-Id: <20230510121152.736148-18-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 17/23] drm/xe: Add empty define for
 i915_ggtt_clear_scanout
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

Add empty define for i915_ggtt_clear_scanout to avoid build failure.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c40bb27ac72a..6911e0d1b9db 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -11,4 +11,6 @@ struct i915_vma {
 	struct drm_mm_node node;
 };
 
+#define i915_ggtt_clear_scanout(bo) do { } while (0)
+
 #endif
-- 
2.34.1

