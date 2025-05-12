Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76FCC3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C97A10E187;
	Mon, 12 May 2025 12:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Diva/wNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EEB10E187
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747051734; x=1778587734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ka9Q7bh7Wm5DwGmSg5oWB047yjQgQLqzov6vCSMUdhY=;
 b=Diva/wNwUwShdUkZq6J06K3sQsSxgloaWGO9Mn25I8+DT6BP4sow3Uwf
 5/KXqcBQQLxum6cWLIah790oIoSRrT0fOMnagu1zAQNlGr1w/Ljty9ogr
 ejAXrbd1k5vkUc49148aHbsDmoatqaqFICJ0YXzYIJPXBTiW7Bw+Rc1Pa
 9Qrd4kOM+4YxGR4XLcMYsiAjy5zQChVQrWBoPpjQ1Fn3pQeB9+4EZCJS6
 peiEB4Kq1EEt9pjEP5I0zBo5D7oDDG6jEwsghlzmHmEsQ4fhW4eJM+ZKw
 lQyAUK60l13i710kkIAx4IIz1nevfPb8Pn8s9eXn/ULb9SshStt+25fCm g==;
X-CSE-ConnectionGUID: MlzmrnIEQDGPe3WtPDcViQ==
X-CSE-MsgGUID: EFbyOlgeS3qadNqvjIvPkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49009790"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="49009790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:08:53 -0700
X-CSE-ConnectionGUID: YDd8ZVCeQnuO1nbQA0mcLA==
X-CSE-MsgGUID: 9GNR01GvTe2v5kGaGdZTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137759007"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 05:08:51 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.d.roper@intel.com
Cc: gustavo.sousa@intel.com, intel-xe@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, himal.prasad.ghimiray@intel.com,
 tejas.upadhyay@intel.com, nitin.r.gote@intel.com
Subject: [PATCH] drm/xe/xe3: Disable null query for anyhit shader
Date: Mon, 12 May 2025 18:02:54 +0530
Message-Id: <20250512123254.3332629-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Set DIS_NULL_QUERY bit of RT_CTRL register to disable
null query for anyhit shader for Xe3 IP.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Matt and Gustavo,

On PTL, Default value of DIS_NULL_QUERY bit of RT_CTRL is '0' only.
Last time, I have incorrectly read a value.
So, this change is required as per request.

Parallely, I will request to update bspec properly with default
value and also proper entry for tuning.
 
Changes in v2:
  - Use xe3 IP and not ptl in commit title 
    as this is  not platform specific.(Gustavo Sousa)
  - Update a commit details properly (Matt)

 drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 49ddbda7cdef..6f2f3428b12e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
+	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
-- 
2.25.1

