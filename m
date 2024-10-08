Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404FCCED270
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1295810E470;
	Tue,  8 Oct 2024 06:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYvSA/ZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278C10E470
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370367; x=1759906367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5tQJ/kgldbE4Mboe1ImDplY5rBgexWrrR9j5F2Cftc=;
 b=YYvSA/ZHcJvJMDjhXl10R4HyIFQpW9st/6rr3PnoqFoLoCzztZV0YTGP
 hF/SS8mk9uww27NQMgRifZqR87UTbwOFU+d2JupLsMFbDAS/6xjpW4/TY
 4dfmWEaAbPASehFq07tfgN5gGkM6jKgfc7/1+yi45USkMjlT57xhYxGMf
 cgWG0ZzrUQ5JNddBaHWcn73gm/Ut97n8jzO3KiXy8uTar0P0KXb1bRIiG
 2F7tzAQf3XRnL10Qy7v5cS7isQnYXm0sDjxkuG7PQ8gKxlBYrzmScRw3B
 a5oeRUmoptKoW+03JSZ9i9/px8bIaA1TKvFg/DOV53nGJ65yvoTCz4Ti9 A==;
X-CSE-ConnectionGUID: obRC1iKoQgmBL3XIAC4hHQ==
X-CSE-MsgGUID: uuH4NfYTTJO5HB7aN64Ovg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430361"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:52:47 -0700
X-CSE-ConnectionGUID: jn9TNYyYQSykj61t503lzg==
X-CSE-MsgGUID: JyAYqNYhS+eCA+hKtaqc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577639"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:52:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 02/26] drm/xe/forcewake: Change awake_domain datatype
Date: Tue,  8 Oct 2024 12:40:51 +0530
Message-Id: <20241008071115.1862704-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

Change the datatype of awake_domains to unsigned int to accommodate
values that differ from the enum xe_force_wake_domains.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index 494240777d03..fde17dc3d01e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -78,7 +78,7 @@ struct xe_force_wake {
 	/** @lock: protects everything force wake struct */
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
-	enum xe_force_wake_domains awake_domains;
+	unsigned int awake_domains;
 	/** @initialized_domains: mask of all initialized domains */
 	unsigned int initialized_domains;
 	/** @domains: force wake domains */
-- 
2.34.1

