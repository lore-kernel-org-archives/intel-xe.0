Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A23C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD0110E652;
	Thu, 10 Sep 2026 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEe+Yqmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594A10E1FA
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789064941; x=1820600941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vxqt7V2XtQAOcr77aWMKiJMucVbdzg4wnEbxHXj0imY=;
 b=UEe+YqmmJ10NnR8WRts1vzEIE0Mp4VDlMhmjkJfC/QUsyLbIlhuKlcKl
 DhSVYbCNvyxro13cOSGkolMsGzX/hP2vwvwv8Wn19QMz+XeP7jLVrazmR
 Dj1ydDiCmQtOjX9EER1YnvEgYrN5pAffapAAN0rSC+mZD1ppagq5S9213
 XcEhAUDVl0LtqJJb+pTySFyxc/6cdWXpVQw2kmgaN0PoDhh7BqP/NnTGH
 3DPeiLdpp+PhiGIKEZE9rB9i7SNwPdn+mHyp1YEjWfmpydNfqLsBm2MXo
 8vsCK1RWjBvzrW2b2HRah44iZ9AtFhC0/6Wh5NgVROGWdjyVdt9fTjstN Q==;
X-CSE-ConnectionGUID: 7for8STOSjWXtf00mF+rdg==
X-CSE-MsgGUID: jjRT/puFSW2nxb3rJY3XeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89397584"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89397584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:29:01 -0700
X-CSE-ConnectionGUID: 3voCpWKsTkinohdtnxS80w==
X-CSE-MsgGUID: AB+bjBC0Ts2WdZhAzzwaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="296701101"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:28:58 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
Date: Thu, 10 Sep 2026 23:57:56 +0530
Message-Id: <20260910182756.638830-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910182756.638830-1-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Temporarily disable memory controller and PCIe temperature reporting on
CRI platforms.
 
The definitions and interpretation of these temperature sources are not
yet sufficiently clear, which may result in inaccurate reporting.
Disable them until the hardware interface and corresponding definitions
are fully validated.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e4a210916df2..669bbfe18cea 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1094,8 +1094,14 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 
 		return true;
 	case CHANNEL_MCTRL:
+		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+			return false;
+
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
 	case CHANNEL_PCIE:
+		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+			return false;
+
 		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
 	default:
 		return false;
-- 
2.25.1

