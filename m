Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C9C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2E10E558;
	Thu, 18 May 2023 21:25:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A6510E562
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684445117; x=1715981117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F0Ziuhoe4Ld3AiQg+cfvd4VGg90hjFSTJXJ27slYQI4=;
 b=RLo4AZEC8QuFDq/5UEC3bJK0CzCOyelZZBoDie7GzTlLKtbK9xZiCl/w
 cyve1ywpBbf9afgE+48RHrqdJN9Aqt+8glTAAn9sYrYHvmEt+4JimXGyx
 Q3ikg8ya+D9Xgd/Q6412huaABKf4fOagTg0vIc7tFk8yc/FcK4sgviUYc
 N60i67X3qtxaRD2OjkJBxCbWvV7NwOt65V2c/MPvXJySR6A1x64iKIoTU
 07WSZT6TNMqLLk3bXl5XHLIX6GU44xgxPvK6oe4HaAIGgRzzVKevx5EdM
 XIhBuFvjCdn0BjsLvvfJQONr6T5jRByM4sIdap94G6DKkFmtROCVkTbUd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354543574"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354543574"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948846702"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="948846702"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 14:24:44 -0700
Message-Id: <20230518212446.3570168-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518212446.3570168-1-lucas.demarchi@intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] fixup! drm/xe: Update GuC/HuC firmware
 autoselect logic
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 6c595aaa2399..837f49a2347e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -79,7 +79,7 @@ struct xe_uc_fw {
 	/** @user_overridden: user provided path to uC firmware via modparam */
 	bool user_overridden;
 	/**
-	 * @full_version_required: driver still under development and not ready
+	 * @full_ver_required: driver still under development and not ready
 	 * for backward-compatible firmware. To be used only for **new**
 	 * platforms, i.e. still under require_force_probe protection and not
 	 * supported by i915.
-- 
2.40.1

