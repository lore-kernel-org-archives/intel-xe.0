Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83199C5ACD3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4163E10E81F;
	Fri, 20 Feb 2026 17:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHkVvjpt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7310E81F;
 Fri, 20 Feb 2026 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771607367; x=1803143367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1l/E9FubN3dTz3YX7DRQeRrf1ot5qWRJosYfpGX7rYE=;
 b=CHkVvjpt40Cw4NMu1BfBVGSfGyHck8Ax4jWHsL5AU0psgfsumspd2PBJ
 lSs5UtjnFNhIBHSZIJQq0mzYFlg5D7Q2elbXk0SRv9QdIhlz1jtlJfTFi
 p6o9JcA5glYDE378eCFC3nBI5gaWQXce96BQHAyNU/PqMNUIgEQl/+YpD
 pKZeiSh73Dhhg4oFHugwQltXaTip50qRhMv59dwkmW96fa44pANH6p+Ve
 QDpvq7BwWkGKg9jM4FPCXVb9ssd1a/Rt5W4i74FzlL6j1N11/+aC+UQvT
 rZVyPLzuV1AimqCPP3yF7GKN8x7zPxyvy9AuqAs1hkAu18DkbaafJg1AM A==;
X-CSE-ConnectionGUID: oh9E7w3KQDK+nZnBh3bJrg==
X-CSE-MsgGUID: +ZdphzDPT9yh3KdLTZsZrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98164374"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98164374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:09:27 -0800
X-CSE-ConnectionGUID: IiCw15CTSJih4uN2hGpIBQ==
X-CSE-MsgGUID: ZTzhoSUTSp2W/fPp4BA5yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237863908"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.18])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:09:25 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH v2 1/6] drm/xe/fbdev: Fix BIOS FB vs.s stolen size check
Date: Fri, 20 Feb 2026 19:09:03 +0200
Message-ID: <20260220170908.201422-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220170908.201422-1-vinod.govindapillai@intel.com>
References: <20260220170908.201422-1-vinod.govindapillai@intel.com>
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

