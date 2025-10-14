Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C2BCCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A78310E53C;
	Tue, 14 Oct 2025 03:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/xjOAjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F3E10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a7iVf3RVjdRyAczRtF8ovbzO3poS5XEvN5YEZEv3514=;
 b=W/xjOAjtcJCRYTgthlvdrCWNUBIjwOd7V1p5qrS2NRx9NossAopWIR3I
 Pa/AQblk8W/pZ6Mmf6EfGdTDpW2GNc/vM9C8oyOJN2vSvQjDTNZuX7vmS
 y1/68Sxs6l0/eQvtyBaBhWzboM2PlKO4LqtC7QfxrsCPT+C9wbtSfdAy1
 728yOFZpMl7FnPTDh1YzD2wxzztRcyaddYkaHFGTdkcRQxF9RbfoNC0je
 6L/Zxc+4GnhVLGn0SkSzXRue+LO63zsadoaXy1lGv05HTK6Ka119PdrwD
 3uL5KtYOnw2LS8a4GOPjO6vVmZWJ4sLxwhTFGIp4TPubzLMz4Hl8cDNRG Q==;
X-CSE-ConnectionGUID: EtLxwzeWQ5y1byGXyPkwhg==
X-CSE-MsgGUID: bcthQ35tT3u6dqNKwe85sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414874"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: vfNqDf7HT22M7y+WkcpoEw==
X-CSE-MsgGUID: ipzgi7ebT4mTL/tgYIURjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567294"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 10/23] drm/xe/xe3p: Skip TD flush
Date: Mon, 13 Oct 2025 20:24:42 -0700
Message-ID: <20251013-xe3p-v1-10-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

Xe3p has HW ability to do transient display flush so the xe driver can
enable this HW feature by default and skip the software TD flush.

Bspec: 60002
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6f8f72fd1b133..7efa8da9e1069 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1103,6 +1103,14 @@ void xe_device_td_flush(struct xe_device *xe)
 {
 	struct xe_gt *root_gt;
 
+	/*
+	 * From Xe3p onward the HW takes care of flush of TD entries also along
+	 * with flushing XA entries, which will be at the usual sync points,
+	 * like at the end of submission, so no manual flush is needed here.
+	 */
+	if (GRAPHICS_VER(xe) >= 35)
+		return;
+
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 

-- 
2.51.0

