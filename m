Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB3C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 06:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5586410E599;
	Fri, 31 May 2024 06:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC6QPqPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136910F34B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717137180; x=1748673180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lFZB7u94FWyz5IuOjU9kEfZBZZ7AhYoq1qJ5p+ZmNWY=;
 b=DC6QPqPVv5N6zFg7tRnXEoxusztfKBzUYxmVHegPyn5FqTzaAaQGXO2k
 yU0aihJasoemYMXHjpsckLtmQDaVro9VOPXG+xEJ8XcUPOCb5OE6wp319
 SgHsjRP91TqLX1RX/z+RLn7wDnVfio14I3qm9Pe2rCv+DWVilxWIAmfhe
 eA4XCm2cralnImLzbPp6hZAxNN3IfNSljy7J2Ol/EVs0i4BKZwY5XUA9V
 /tkKoNLM5L+oWETSl/+7hBoxp6/pQexQeNsZ6BZnfogyALmDOs9EwBCLB
 JYI6nLncxZQa1jSzw1OK5sgIwZ/luX/RPRf2b+kX4oEfjXjL0Zq6fnJUp A==;
X-CSE-ConnectionGUID: B21VzWs5QX6n3p+TaHofEw==
X-CSE-MsgGUID: bU/CTObcSLOasGuAdtMKkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13427723"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13427723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:32:59 -0700
X-CSE-ConnectionGUID: uURnZ1bbSVySu5kxX/QPzw==
X-CSE-MsgGUID: AMc+QFWNT8q56F3oYwDFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="59251214"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 23:32:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 2/2] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Date: Fri, 31 May 2024 12:18:45 +0530
Message-Id: <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
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

Make sure that the assertion condition covers the wakefulness of all
supported domains for XE_FORCEWAKE_ALL.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..4c986d72cba7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,7 +32,12 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, fw->awake_domains & domain);
+	enum xe_force_wake_domains is_awake;
+
+	is_awake = (domain == XE_FORCEWAKE_ALL) ?
+		    fw->supported_domains : domain;
+
+	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
 }
 
 #endif
-- 
2.25.1

