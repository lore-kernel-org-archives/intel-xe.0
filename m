Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66622C8303A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF3D10E2B6;
	Tue,  1 Jul 2025 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S233YlnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044E810E2B6
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751374617; x=1782910617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sU8BiYBAXC6FCQs3TywblUSSUmboLcxqJIGfObH2w0g=;
 b=S233YlnXr2oG3DC+SpnZUhPhBgTVnc4OLACYDqkzmpo84rmAqbfB3nhA
 Lm0NWgbXBVniXM4aZbVpMN/4mqjr8igHxSm5ty1BMuobe5pSyo6kCX5Zh
 ne+C6jEfryWjrDnVuv+kMXwkeMU2rcaZ7CjoPBdBkGreDPKTDGLSnYdGo
 h6MWDW5EU/17Xs360UMEgtleE6+4unxQPv7AGc5SXWLNQzbJ7OI/MkMjv
 kyJBTwboIVUHNBkhWwLfzEXVdwXJbZt9TZddZt1SqiSC9Rw/WoVawPHC7
 y3f/OoiCSsrJsWcMHFzsJMrJ17tkZrZhAn2JJqFCt7r6ElwY/kIB2mji+ g==;
X-CSE-ConnectionGUID: sFt3hgs6R9yuOBQlWweoMw==
X-CSE-MsgGUID: 77nJKVDAT6i+By0W9P1viQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53745196"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53745196"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:56:57 -0700
X-CSE-ConnectionGUID: qO7XvJBmSjqYW2rpzE0Vmg==
X-CSE-MsgGUID: lEfWUKhfTae37ybkrwJTUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153236550"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:56:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 1/7] drm/xe: Combine PF and VF device data into union
Date: Tue,  1 Jul 2025 14:56:40 +0200
Message-Id: <20250701125646.1568-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
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
index 7e4f6d846af6..5f0b993b598c 100644
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

