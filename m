Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAEEC27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 12:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5910E922;
	Thu,  6 Jun 2024 12:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiOwwxRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFD710E925
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717676732; x=1749212732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C4RNYokEa7I9skR65M9v7pW7Coja3rO61zqaXC6oJRI=;
 b=JiOwwxRyeWnImkM2d0KDERhsJ/VTyqJ7NfuyqP+24/RDOqxTYrtx28xT
 2DTyLa8+qQtJhj2YMY0vX45ojgu50x8wZp0CGYfoLBu5UZIyK5aq2H9aH
 pLLVlwdgftsF4LwD4sicmcTXeIRBaMZNE7RHdYs0d0CaTa55ATZjysBbx
 LjwfraHyT3RKl/4livGeD3Mznk0nqAtUC52RU2gV2jjSqKSIggxRhasNN
 RShjsVVDR4srsUzLDLbRWyZY78UQq1Fc9AVh83vuMI2oBBq+bAHCiHKfC
 MfW2B7oH60+lsKNxmVBOWxStdaYCnFmV1RlOLIh43B7KdmM9/HWdGvQlk w==;
X-CSE-ConnectionGUID: aR0aQrebRouWnlYx5A59aA==
X-CSE-MsgGUID: j07+4g+sS6iKndpP7McfPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17273902"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17273902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:25:32 -0700
X-CSE-ConnectionGUID: JJvre4K+Soefw2X0vrl8Pg==
X-CSE-MsgGUID: f7gYDuuMSEyN+J9owDzbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38033820"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 05:25:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 1/3] drm/xe: Ensure caller uses sole domain for
 xe_force_wake_assert_held
Date: Thu,  6 Jun 2024 18:11:31 +0530
Message-Id: <20240606124133.1353738-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
References: <20240606124133.1353738-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_assert_held() is designed to confirm a particular
forcewake domain's wakefulness; it doesn't verify the wakefulness of
multiple domains. Make sure the caller doesn't input multiple domains as
a parameter, this will ensure caller doesn't use xe_force_wake_assert_held
with XE_FORCEWAKE_ALL parameter.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..cee8ff039f83 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,6 +32,9 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
+	/* Ensure caller is not passing multiple domains */
+	xe_gt_assert(fw->gt, !(domain & (domain - 1)));
+
 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
 }
 
-- 
2.25.1

