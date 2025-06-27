Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC39C7EE32
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295910EA12;
	Fri, 27 Jun 2025 12:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpQTfxKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FBE10EA10
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028568; x=1782564568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ovzUwwsty+qv2VLLqAvM3xG7gB0HVKfmp2qbbbUkpQ=;
 b=IpQTfxKfUnScwDgBcJ/vFx3R9J1Jwedw3bknF9MXKjLTm+i/r+IIS+QI
 buzGbcf4pPyAEQREnq4QYQ+jZiFPRnnOgwliMURedpnxs9R+PVrlSbT0a
 c60FvEvcyZIuNgPgCEUvDYRQ9kRr1bUSf9vnWx/8rZXyJjwfxnT5vz2Ht
 A/A1lTHqpww4xKmtJ2spvZq2b7+bmQhdDIU/Fn/trg38f1B1OJXmA0PV5
 9MLQEjt0h9MW6h5PxIQbbOYKl31usr2vR9RlDAnlNVjxygfv7sLqcin69
 hz94yXkeAZ7o5y61D4o5C41CunTCsM0/uYmMQa8kRDJkgVAqvEZt6V9IZ w==;
X-CSE-ConnectionGUID: MjIm/PWISJqeE4tCEcJ9nw==
X-CSE-MsgGUID: Q1YPUEvsTLyl2gk3v+35lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031904"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:28 -0700
X-CSE-ConnectionGUID: I2tJXdsuQWeMBuJ7NjdzYQ==
X-CSE-MsgGUID: Ux91/ZRGTgGqomEPwO1VxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969691"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/7] drm/xe: Combine PF and VF device data into union
Date: Fri, 27 Jun 2025 14:49:10 +0200
Message-Id: <20250627124916.1392-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250627124916.1392-1-michal.wajdeczko@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
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

There is no need to keep PF and VF data fields fully separate
since we can be only in one mode at the time. Move them into
a anonymous union to save few bytes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

