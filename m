Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F8CF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4767810E0DB;
	Mon, 30 Sep 2024 05:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2Di892l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8D910E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673209; x=1759209209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XIRKeqiiOkWAgZYaXJrFDI0i0+/hglmjUFceUDT5awo=;
 b=Q2Di892lhDqGDA8+wgVE4edPv3qR2hzgHIXxXpQMwlZVnyvdnwY+BBN2
 G0Zbgd7LAaXTOEfLuVLw2EicigEtsBw0zh73ph/5eqpzBnsi080325eCP
 uFsjo5C8b67LOc01jx4k5eezX/M4v3KzYnVDxPJHxj7xlSIQQ0tNfhPgC
 PCMbjN42oKUvBX2yVW5Q235ITZqa+oH8oPKATpbS8H4EKU2cbzwSOlu0m
 iDwEKBdzoYkChGiPSVJjOm3z981x2s8KUq85XCALltYh9lmu0pnf7ECdx
 SZchbjU1lQkhGDMX2VK7f7tyK62D1bfVSGeAz8/W4KCwTZfhmQAJ7iIXd w==;
X-CSE-ConnectionGUID: wdjW3HdKQxu1MdZ22kN/3g==
X-CSE-MsgGUID: Q7rPxyAjQa6SFTijsWbLAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367952"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:29 -0700
X-CSE-ConnectionGUID: 1Z4UFgPzR6ST8wSm5pj92Q==
X-CSE-MsgGUID: g3GCwfZrSrqzo7x6XbCMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752101"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 02/25] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
Date: Mon, 30 Sep 2024 11:01:26 +0530
Message-Id: <20240930053149.1246339-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

The helper xe_force_wake_ref_has_domain() checks if the input domain
has been successfully reference-counted and awakened in the reference
returned by the xe_force_wake_get() call.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..de720881a300 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -46,4 +46,23 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
+/**
+ * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
+ * @fw_ref : Return of xe_force_wake_get()
+ * @domain : forcewake domains to verify
+ *
+ * xe_force_wake_ref_has_domain() confirms whether xe_force_wake_get()
+ * is success or not for @domain.
+ * In the event of a failure, if the caller chooses to abort or return,
+ * they must call xe_force_wake_put(fw, @fw_ref) if the @domain
+ * parameter is XE_FORCE_WAKE_ALL
+ *
+ * Return: true on domain is refcounted.
+ */
+static inline bool
+xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
+{
+	return (fw_ref & domain);
+}
+
 #endif
-- 
2.34.1

