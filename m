Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D84CA0EC0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9510E88E;
	Thu,  7 Aug 2025 16:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9ewr0oG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB410E88E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583434; x=1786119434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7r9gEQexUSkNnFM93yYxPeYXvNoHNtIxlWIWe8oDCi8=;
 b=X9ewr0oGcY9yp2/kIzHmScgiAgdnLi7xFcCjWtpJ4wW4iaC+XVVvpUGW
 z+XWWVrMhs4rjJ1czta6cb7xMqi4QktX3d4xUICkMC6Puf+DTCaWqmuUD
 KqZWODz/dZOyEcI5Rt5nCTQ6urGXGYH/3N2/CzeqjFYdF0LM7NEd38VGZ
 zSmdYjyAjdGn/ZaF+BSToXCi0O3clarxoaSwQappMQkNkuJhVx/IOdUTW
 6RlaHH2S+9B32kGXRzuIukHQKixp4OILwwJxe+Dfc1TH02mqJlCXUvzfL
 H0RziXC4osRRs9OsoqzkGqpOGHzfQ6E6eLff9F533TZ9HD1iAh76YdnfR A==;
X-CSE-ConnectionGUID: BKtS1ze3Q8it5G97f1sxmg==
X-CSE-MsgGUID: h4rUwnINSqSaEM5PY4yUeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845617"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:14 -0700
X-CSE-ConnectionGUID: yej/pXREQeCgm+CQiL6LlA==
X-CSE-MsgGUID: zQKNpMe1SvOWaZfunNUapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937908"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 20/26] drm/xe/bo: Add attributes field to xe_bo
Date: Thu,  7 Aug 2025 22:13:32 +0530
Message-Id: <20250807164338.1832254-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

A single BO can be linked to multiple VMAs, making VMA attributes
insufficient for determining the placement and PTE update attributes
of the BO. To address this, an attributes field has been added to the
BO.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..314652afdca7 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -61,6 +61,14 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @attr: User controlled attributes for bo */
+	struct {
+		/**
+		 * @atomic_access: type of atomic access bo needs
+		 * protected by bo dma-resv lock
+		 */
+		u32 atomic_access;
+	} attr;
 	/**
 	 * @pxp_key_instance: PXP key instance this BO was created against. A
 	 * 0 in this variable indicates that the BO does not use PXP encryption.
-- 
2.34.1

