Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE7EC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E31810E103;
	Tue, 24 Jun 2025 20:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7mzQMON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0892610E035
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750795776; x=1782331776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MnxDcfHBXrh0fSz9VVYEOtwOEQand3qPWMftB1TfvAI=;
 b=J7mzQMON65kZ2UdDEuHczqjm2OMp56IIp8SI1yzdeQ0894Itz97fsZsu
 dfo9jrr2Aq6ulUayx6PoY+T4nSZSga3sK4yxBrw2SK3cRmS4FDMVOEqaF
 0xTzwycKnHqRSpztxZ6HAAyd1Fo5u12G3/6lIIjglF+AuLfru3Vb9OW+b
 bgTDgc60TwgcxdEgNXEUfhCsoKwK7RmuZofkWiKAqzRciVE+5vAagu5/I
 85fUmvErGfKiOGIpJr8gJ3CTvyndwuzOSkoZIqlaYBhljJcZ7iEGzIKXo
 6AHdAz+tkImwKJZwMDnwwSwGCbsgUZ91JK/deLuA50aXyaQYrDqerZTmK A==;
X-CSE-ConnectionGUID: b72Ct1TqQma4VQcYKJQ4WA==
X-CSE-MsgGUID: VnAhK6XmTyuAzv3nm4UnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52920633"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52920633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:36 -0700
X-CSE-ConnectionGUID: O5FazoSMQ3mNqu9+gZvOtg==
X-CSE-MsgGUID: K7twsBgCTsK/wajKpftCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="189195545"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe: Combine PF and VF device data into union
Date: Tue, 24 Jun 2025 22:09:19 +0200
Message-Id: <20250624200923.1348-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250624200923.1348-1-michal.wajdeczko@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
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

There is no need to keep PF and VF data fields fully separate
since we can be only in one mode at the time. Move them into
a anonymous union to save few bytes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..962acd451734 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -406,10 +406,12 @@ struct xe_device {
 		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
 		enum xe_sriov_mode __mode;
 
-		/** @sriov.pf: PF specific data */
-		struct xe_device_pf pf;
-		/** @sriov.vf: VF specific data */
-		struct xe_device_vf vf;
+		union {
+			/** @sriov.pf: PF specific data */
+			struct xe_device_pf pf;
+			/** @sriov.vf: VF specific data */
+			struct xe_device_vf vf;
+		};
 
 		/** @sriov.wq: workqueue used by the virtualization workers */
 		struct workqueue_struct *wq;
-- 
2.47.1

