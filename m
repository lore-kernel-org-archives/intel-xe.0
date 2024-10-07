Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01768CFB443
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62BD10E308;
	Mon,  7 Oct 2024 06:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0PfeN1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADE510E309
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283312; x=1759819312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5tQJ/kgldbE4Mboe1ImDplY5rBgexWrrR9j5F2Cftc=;
 b=P0PfeN1erjc4zRlhapb43zlFwET5oEwUvONvk28keDfFK9pg7eE8r3iY
 k47rZHBsGyp+eJdQjH9k7ia12OefmfPyCNYX9zB6ScyQEplS8OaEqSSLC
 H3NlUffcGVtgFOH62hhuPDnkEEXd7fLK8NGzQUT61+0cR8yQM6VgWblmo
 XdvCNMKI92lBxuoM9aQlKg6kfb+MO1klFNOL89DxNYMRalAERG9zSDYix
 tCajayv7Roion/iExRRXDl50xbD9+/2n8ZyPMFytkOdYvr5DtX3IRnEgi
 GDpbXBfJNxaGKmkq47VJvuBO4F7n1Dw02hq9E3unGVH0ManjN4AGrJeAO A==;
X-CSE-ConnectionGUID: ZCtyFuT/RHe6+sGHZh7bng==
X-CSE-MsgGUID: IukSF6kwTIW+Hb/jgUyPpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548431"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:41:52 -0700
X-CSE-ConnectionGUID: DkDftoQ2Tpa2guDS5mJYsg==
X-CSE-MsgGUID: qFkLW5ctTsG9LZGYy26tMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842310"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:41:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 02/26] drm/xe/forcewake: Change awake_domain datatype
Date: Mon,  7 Oct 2024 12:29:53 +0530
Message-Id: <20241007070017.1732886-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

