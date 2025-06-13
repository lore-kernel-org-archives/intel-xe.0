Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EC1C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5B10EA45;
	Fri, 13 Jun 2025 19:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChhfQhek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970D10EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843119; x=1781379119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVuu5y+3gkG05xuksxWU0y7c4dGehJEpVJpMgmyU9Fg=;
 b=ChhfQhekawX1T+NVtUoQEMjId1+UY990Aqkw3wanSp+ZcMPXYQPGZyP6
 ivWOTtKOFowvHfA/nT/Bz8sKUJdHRObzdQEgkp01MqMy6PabvtKHSTewZ
 NygV/ERWWTIu0mVs3TklFEyo+rnOpfA2vsirSwc9hFyNZw9rEiiSbLuE1
 uu6OcssVNpLen9anPDID2pZz2qRYvEBaPTXHdwLIl1n51NfrnuKP+4bJO
 2SPdMLNSeQgB/zX9qlLdUpE6dXcK8oJTL0pKd7DiTmzZPoETNvfjjdSNL
 ragiDQImpGgWRf2zpO0/gaSO+mBRgq8elIc4nAI7Lkv/tXAwZRcNNGirG A==;
X-CSE-ConnectionGUID: g0hH1dJvSM6k77AQ7cgr4g==
X-CSE-MsgGUID: Q4Gmt1UJSn6yZOaO0dsnNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510517"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:58 -0700
X-CSE-ConnectionGUID: x1XuCKqrS9OSO21BI1ItUQ==
X-CSE-MsgGUID: mkFw77MqQOSpXHZKQUlDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722664"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:57 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v6 6/9] drm/xe: Add Wildcat Lake device IDs to PTL list
Date: Sat, 14 Jun 2025 01:01:43 +0530
Message-Id: <20250613193146.3549862-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Introduce wildcat lake device Id.
Wildcat Lake uses slightly different graphics and media IP versions
than Panther Lake, but can still be treated as PTL for general driver
flows.

Bspec: 73951
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm/intel/pciids.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 129c3172aa5f..a0180d10e260 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -871,6 +871,8 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0B0, ## __VA_ARGS__)
+	MACRO__(0xB0B0, ## __VA_ARGS__), \
+	MACRO__(0xFD80, ## __VA_ARGS__), \
+	MACRO__(0xFD81, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.34.1

