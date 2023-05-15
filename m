Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAB9C7EE22
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 09:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7430E10E1A6;
	Mon, 15 May 2023 09:46:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0842110E1A3
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684144007; x=1715680007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KetpIZus7iQm8TAWfA1OrrdCQqMVCV6OAQg+kI1c96U=;
 b=krBLKXFN+6uUbtprnZyGyvQUGxdE0vRaCq2EAkCxZ8kgFzxiEeiCu9RW
 ndRQlUgudyaGqOOxSZYRcmnjEik0FhMvrYnXrepX4IqOb0BXXxOj3XYsX
 b7HL7aitelaXcxuHjfeU7ZUnWBYiqbJKQLkbFE5YWzX5Xs//y1f/gWzx1
 MoAPgzEs00/FJCYJEpK3xTWXBEDGriQJjK32mFahRQaP/h1Dru0HFHU+A
 ci7AD3VdWSLlLTA3u07C7GgKo8nj4qy95RqMq8DuPXydVESWhc3PS/Pg1
 WZa+VyTGrRWZB0Yan6v1PcAIN3lYO/MZyKSA0J2P4A7lBTnx6WOMIWz4W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="340510199"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="340510199"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694947292"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="694947292"
Received: from dbenelli-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.48.185])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:46:42 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 12:46:14 +0300
Message-Id: <20230515094614.1850878-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515094614.1850878-1-jouni.hogander@intel.com>
References: <20230515094614.1850878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now we have struct intel_frontbuffer pointer in intel_fb for Xe as
well. Handle setting frontbuffer bit same way as done in i915.

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

