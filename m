Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB0C41513
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18410E6AF;
	Fri, 11 Aug 2023 16:08:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADCA10E6AD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770126; x=1723306126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=whEyqhI/Q3D5b/RxJdKULwxDbsTlInmMjb/g5Xn97nw=;
 b=ZuxYqHn1LAwOJwLPglrumBkpfoXt0jhhR7BlI3Nzxl9NSrFI9z7vSU9K
 lsMS4h5YZPaItyC7NS7Q4R8X+ErlSQwcYsE8fcd78g+p+upsG/KR+Cc0k
 5lFT9FTE6D56dMT3hsCw2SITBl1j2633KX1fssZ92Fz57L9zkFzS/zcG4
 84dRsbDnqvXc9l7z+SzCSiG4nZPyyKN1JZzQCSB4ASMzWmbR4pDGoq5RQ
 Jyw2NUW4VdDtJLAu2ea1LDxDAdT7aMPxJDFdlCcpfU+qvzAOS1rngmhDo
 9gnUU66ps2x4tIpcXWwfdTQK7szoFIrUMrHKgE7B/+tOsDILgUMENMepv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044317"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044317"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300442"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300442"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:04 -0700
Message-Id: <20230811160618.477297-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/15] drm/xe/xe2: Update render/compute context
 image sizes
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

The render and compute context are significantly smaller on Xe2 than on
previous platforms.

Registers:
 - Render:  3008 dwords -> 12032 bytes -> round to 3 pages
 - Compute: 1424 dwords ->  5696 bytes -> round to 2 pages

We also allocate one additional page for the HWSP, so the total
allocation sizes for render and compute are 4 and 3 pages respectively.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 09db8da261a39..a6479deb62376 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -37,9 +37,16 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
 {
 	switch (class) {
 	case XE_ENGINE_CLASS_RENDER:
+		if (GRAPHICS_VER(xe) >= 20)
+			return 4 * SZ_4K;
+		else
+			return 14 * SZ_4K;
 	case XE_ENGINE_CLASS_COMPUTE:
 		/* 14 pages since graphics_ver == 11 */
-		return 14 * SZ_4K;
+		if (GRAPHICS_VER(xe) >= 20)
+			return 3 * SZ_4K;
+		else
+			return 14 * SZ_4K;
 	default:
 		WARN(1, "Unknown engine class: %d", class);
 		fallthrough;
-- 
2.40.1

