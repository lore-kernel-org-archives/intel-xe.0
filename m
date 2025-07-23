Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4222C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 17:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9E10E845;
	Wed, 23 Jul 2025 17:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7IM1ztj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FEF10E848
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753293421; x=1784829421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2cma9e1bufXUXEuuANSovPXgpnRVVoGyo9q2jZs/fxs=;
 b=K7IM1ztjV9BIhIXeGOyT3FvArhbRBBj/jv1n7yFHW9wpeZqbPkn4333E
 ad7ZCFggaPFUScvzkViiIwaofC8w+XF/h085i/zw2efkRthYAT3oWlG1A
 T5TM7ziTnU1WCjTuNuFccLAmOvDn3Jq1zgeE2fGhNUXng5C8nxqQNCrG4
 2S9MKqfu8EbrWWKWVoVLIkjDQiQi921NrcN1wxHFm0SxkOQlva4JNYDhF
 uk5rAbMjQs0GLKsEjX2VV7TFT6oOUODTHsAGAJw08id4rRAulXrW62EhY
 aYo/02C7ugpXTYfVoIhngk5o3shMMFJkTgI6EyJndSRVGlZXGkNjTEFB3 Q==;
X-CSE-ConnectionGUID: Ey37wdckRA6FTcFOMdjQCQ==
X-CSE-MsgGUID: 9+7dUV3/SL698C4uExV1Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65849881"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="65849881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:57:01 -0700
X-CSE-ConnectionGUID: JvuMwEw9Rn6lAdMBBv3CDw==
X-CSE-MsgGUID: JPVRGjBoT6qK+A/b+AX0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="159299636"
Received: from msienkie-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.96.116])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:56:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2] drm/xe/guc: Clear whole g2h_fence during initialization
Date: Wed, 23 Jul 2025 19:56:39 +0200
Message-ID: <20250723175639.206875-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723165717.206730-1-michal.wajdeczko@intel.com>
References: <20250723165717.206730-1-michal.wajdeczko@intel.com>
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

The struct g2h_fence must be explicitly initializated using the
g2h_fence_init() function to avoid trash values in its members,
but we missed to update this helper function with the new member.

To fix that and avoid any future mistakes, memset the whole struct
first, then update remaining non-zero members.

Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: use memset right away (Matt)
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b6acccfcd351..3f4e6a46ff16 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -95,12 +95,8 @@ struct g2h_fence {
 
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
+	memset(g2h_fence, 0, sizeof(*g2h_fence));
 	g2h_fence->response_buffer = response_buffer;
-	g2h_fence->response_data = 0;
-	g2h_fence->response_len = 0;
-	g2h_fence->fail = false;
-	g2h_fence->retry = false;
-	g2h_fence->done = false;
 	g2h_fence->seqno = ~0x0;
 }
 
-- 
2.47.1

