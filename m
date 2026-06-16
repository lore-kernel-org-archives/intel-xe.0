Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71900CD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 18:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6110E82D;
	Tue, 16 Jun 2026 18:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESVXpZgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F5F10E174;
 Tue, 16 Jun 2026 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781635305; x=1813171305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z+YsEVwThl11k1+N/LUAJ6X3Pzi4ePmn/2wtKGpY8S4=;
 b=ESVXpZgK62cN4T7OlZyAmwoTAHQxNxedw7Z7EQ+yJZNcxkMIFIxMjxha
 dqOGu7NX3CQbFkv56TLTkQXLgdM0sDpw/cAKGbxiI2A3lWDnbB3qhFi7z
 bFlzfo9FyzmcYU+iTr5aoEfsa2/I4NGQcnU5INrQmssrp0LfiVoFgjav/
 nWp+27uzTnP477WHoaxnnVn9wDNRDEJ4gOfKrFRiTaezKgM/ViFH1Xi0j
 OO6z3oZi8+Mej83/vobIkNHRilhd+Nh99jRDNXj3oOxUroTUD7iyalg+k
 WP+2a5Hqf0ASyZxdHfhTeF2vQaFuMhsgZGrXaUKEhjhMXEmioHrv8+mOt g==;
X-CSE-ConnectionGUID: x0SMaHYTTeuD4zrJDflGHg==
X-CSE-MsgGUID: LiWD7JweTEuJznXTmQRN3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82454998"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82454998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:41:45 -0700
X-CSE-ConnectionGUID: 7HfNmbn7ThqqXa/BZHrMbg==
X-CSE-MsgGUID: pf6EJlDWT2my4IeWRTcSVg==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.193])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:41:42 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com, shawn.c.lee@intel.com
Subject: [PATCH v2] drm/i915/display: update to the BW buddy configuration
Date: Tue, 16 Jun 2026 21:41:31 +0300
Message-ID: <20260616184131.295013-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Bspec has been updated for xe2_lpd+ platforms on how to handle
the bw buddy prgramming in case no matching memory configuration
is found w.r.t the current page mask table. The recommendation
is to keep the default settings for the related registers as it
is without explicitly disabling the bw buddy.

v2: removed extra explanation

Bspec: 68871
Suggested-by: Ville Syrjala <ville.syrjala@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2e51dfcd5dce..3d348c5decee 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1634,9 +1634,12 @@ static void tgl_bw_buddy_init(struct intel_display *display)
 	if (table[config].page_mask == 0) {
 		drm_dbg_kms(display->drm,
 			    "Unknown memory configuration; disabling address buddy logic.\n");
-		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
-			intel_de_write(display, BW_BUDDY_CTL(i),
-				       BW_BUDDY_DISABLE);
+
+		if (DISPLAY_VER(display) < 20) {
+			for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask))
+				intel_de_write(display, BW_BUDDY_CTL(i),
+					       BW_BUDDY_DISABLE);
+		}
 	} else {
 		for_each_set_bit(i, &abox_mask, BITS_PER_TYPE(abox_mask)) {
 			intel_de_write(display, BW_BUDDY_PAGE_MASK(i),
-- 
2.43.0

