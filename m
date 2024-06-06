Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D64C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187B110E8B7;
	Thu,  6 Jun 2024 09:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEANlyGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7646A10E8B9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667525; x=1749203525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQwkxp3neRgKVr1sDKS4/+nAahK/z2u+y4IitC0o4Eo=;
 b=dEANlyGWr57NPGYdXFaFMg2IJ8UFN//9sCQH8U+rSKdYaR69+33onSPz
 2F/EVxs5coEDkCrXHmU6DhObmQ7AM5bCj8RlrB1C2yCzv7OIeWRbhri//
 GZSzCSQmieiURohynfDJwiO9cymdw/1wGzMA3WGTAis/LjkV6y/s2NUQb
 FAIGeJtUHKaJSVqtuboSeNy0nvIUUhbB2syDF6qPW49keOtr9EdTcZ9rm
 lYuGGJEmIf1T5Aw7uaX6D6r6PdDp/7mqer6G5UOOi5CdOsIbFXSYhHGKl
 QyJLir7uzsnYpY1qnUc/dFKNdf2mNsFUoIbXG0SeIurq6xZxvPL2kEdxB w==;
X-CSE-ConnectionGUID: YQTkcAziSjKymmJhlueiTw==
X-CSE-MsgGUID: bon1dfX7Sn2OrGUCyLFvLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39728388"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="39728388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:52:05 -0700
X-CSE-ConnectionGUID: A5jlUpOVSGuzMkxd345r8A==
X-CSE-MsgGUID: pXhEEkJ9TdWIaJGrMDaebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="43003556"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 02:52:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 2/3] drm/xe: Check valid domain is passed in xe_force_wake_ref
Date: Thu,  6 Jun 2024 15:38:03 +0530
Message-Id: <20240606100804.1346992-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606100804.1346992-1-himal.prasad.ghimiray@intel.com>
References: <20240606100804.1346992-1-himal.prasad.ghimiray@intel.com>
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

Assert in case of multiple or invalid domains are passed.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index cee8ff039f83..067afcdde429 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -24,7 +24,9 @@ static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, domain);
+	xe_gt_assert(fw->gt, domain && (domain < XE_FORCEWAKE_ALL));
+	xe_gt_assert(fw->gt, !(domain & (domain - 1)));
+
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
-- 
2.25.1

