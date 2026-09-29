Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5ACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A9510EDF0;
	Tue, 29 Sep 2026 09:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ib01jiwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB810EDDB;
 Tue, 29 Sep 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675105; x=1822211105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ngeYADQS9M0DlSX3iKDzm5mOpsgiqCr1Q8Q/INxeOk=;
 b=Ib01jiwW9B/pGDlDcZ+nYwiszLcHAVYCWkVV87wf+uwooBLYDdmkpxUp
 TPuKY4n3NIf9z1FvWSmsJ3A8bHUTqNmohuN1I0XmNhO5TPqq3smqsdXDR
 i+frD0S53Q06dZnEr7lt+Chp+9XhE3YUwoigK/uAI5dw0AwB8spezB0P1
 7rJAnwEkzl3fn7g+SBYELHJqQr0XzVnoBk+GYi1MM+ENfATtoaEfYz5nW
 wkaEeQbIW+uiQ4ccwz38/J2jfudmXL/aTxvix/GeKYsGYhQtrz0YJnSlu
 dyRNzOnwWQmlfQVh+7t3Vum9IjO4vHHUGTvFJt5Hv8WjOCLqw69ubTmIt A==;
X-CSE-ConnectionGUID: 4ewv24FARmiR38OdUPsK1g==
X-CSE-MsgGUID: vScnHKqfTnCf/gBNqlz1Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250078"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:45:01 -0700
X-CSE-ConnectionGUID: hDsgELpYSi+sXOYHxnDo0g==
X-CSE-MsgGUID: tKI+rhH6TtqwuqPKLVA0uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283415019"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:44:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 6/8] drm/i915/psr: Don't write 0 size area into plane sel
 fetch area registers
Date: Tue, 29 Sep 2026 12:44:32 +0300
Message-ID: <20260929094434.77129-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929094434.77129-1-jouni.hogander@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are writing invalid configuration into plane selective fetch
area registers. Check height of plane selective fetch area and return
early if it's 0 or less.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 8bdf1b8a02299..def4798f85022 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1522,7 +1522,8 @@ static void icl_plane_update_sel_fetch_noarm(struct intel_dsb *dsb,
 	u32 val;
 	int x, y;
 
-	if (!crtc_state->enable_psr2_sel_fetch)
+	if (!crtc_state->enable_psr2_sel_fetch ||
+	    drm_rect_height(&plane_state->psr2_sel_fetch_area) <= 0)
 		return;
 
 	clip = &plane_state->psr2_sel_fetch_area;
-- 
2.43.0

