Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574C9C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 21:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C548710EF91;
	Mon, 27 May 2024 21:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHN51iWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2106810E56E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716844781; x=1748380781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOyIVpzIfhTG2HGiB1xuwgtqvOAheSnU6YN+v0nFiYE=;
 b=BHN51iWNRKTPACldk3bMMvn+Him5nkEZ6ja/qCk3T70dAxUpVK2RFqwr
 E7dPGwyPjCTwVt+8BcJqwKpB/IrgB/l0jWSCb1pY68PYIZu1ydBb/IHXT
 q2VSbpU0BkEWezwJLn4X8WYdV18LoiKBTpgvHRzLZmddpN59S4QzfoRJb
 0oS36l/DznGwazCAMzfFl84wm7vDwlAX6BHp4GVQjCX9v4iiB5UjGqyQs
 JwwyjMCGZ2d0SqUWq3LEoiXZfPuW4jq+0CrWnoeaDkuGRapHWBsZzkP5r
 /r+ZiHF06m4CohY1PVCAWUu2tOjeE/nyKjMLLXUXjMeBPjOCt5mAHfHlQ g==;
X-CSE-ConnectionGUID: UhUJB00VTtWvXLwByIa5GA==
X-CSE-MsgGUID: kFrsHHf0Rn+hczh0lnbjyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13296452"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="13296452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:19:41 -0700
X-CSE-ConnectionGUID: OydSuKSqQ8ep73HFFgmUyg==
X-CSE-MsgGUID: qqUEAYpYS4uau7lyhTd87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="65666806"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:19:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [CI 2/2] Reapply "drm/xe/gsc: define GSC FW for LNL"
Date: Mon, 27 May 2024 14:19:28 -0700
Message-ID: <20240527211928.1179357-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
References: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
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

This reverts commit 684685f297175fb825771a33adfbb6a293d7b614.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 12346645a8e5..6500765b5779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -128,6 +128,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

