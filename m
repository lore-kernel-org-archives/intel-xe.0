Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB0EC1EBF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377DC10E8C5;
	Thu,  5 Feb 2026 14:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xf05bOSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C610E8C4;
 Thu,  5 Feb 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770300174; x=1801836174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1l/E9FubN3dTz3YX7DRQeRrf1ot5qWRJosYfpGX7rYE=;
 b=Xf05bOSux53HEuZL2L4C/LmG6c09+Mv+oZJEPDL/KscGffRHQFRWMEY2
 bMmnFiIfJs5XbgBy3zFtmhv2vdL9zl5huqSRriILHXC976eCz5NLdrEpz
 Goc+AXGIHvaxRfyAhL/wVXPTTowbmb7CSTSjscx3g8qDVfzWsrq6Mq3fD
 IS13k7otlhsrUD9hIEj7BXGLUWyrpkDG0EunT9Jq/97nT5ELdrW/EItWi
 r9C0+YG5SjgAaK2N4tJEzaEZ810Zv+J223Rh2ei3EG1ZjRf1FTqyqg391
 qHyASgpcPZhPlVRW+zw5Ea2+mYxg5GSB2TYU2mOqaCubJ6rviKsAF21D1 w==;
X-CSE-ConnectionGUID: MgxxVIZsT6qet1DRjAq5jA==
X-CSE-MsgGUID: TqAe+XE3RCChbLoSZJS0ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75350969"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75350969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:02:53 -0800
X-CSE-ConnectionGUID: yGyiBFk5RTysOcaGWlS9RA==
X-CSE-MsgGUID: 7obgm708SyWFRtxdtH9AVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215508846"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.157])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:02:52 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH 1/6] drm/xe/fbdev: Fix BIOS FB vs.s stolen size check
Date: Thu,  5 Feb 2026 16:02:30 +0200
Message-ID: <20260205140235.338410-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205140235.338410-1-vinod.govindapillai@intel.com>
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Looks like stolen->size is in bytes, not pages. Remove the
bogus PAGE_SHIFT stuff.

Also for some rnadom reason xe rejects the FB if it takes up
exactly half of stolen, whereas i915 allows it to be used
in that case. Adjust xe to follow the i915 rule for consistency.

v2: rebase related updates

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 4cfeafcc158d..38ecc201ac4e 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -99,7 +99,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * features.
 		 */
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-		    plane_config->size * 2 >> PAGE_SHIFT >= stolen->size)
+		    plane_config->size * 2 > stolen->size)
 			return NULL;
 	}
 
-- 
2.43.0

