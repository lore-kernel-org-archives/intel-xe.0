Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA0C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 19:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338E910E1B5;
	Wed, 26 Mar 2025 19:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRlptDM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5A210E1B5
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Mar 2025 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743017564; x=1774553564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2Q5BHQRtEYXMgo8IjqfgT+RH1rqNl9DYgsbcX8+HKk=;
 b=WRlptDM5kbQNr0y96lJN2SoZxsvrZkq+lJ4hoElzzfIPrBtYkW4zlQpW
 h0LRcesJ5Aux8+4phVSu7fShASmYf8WoenT0D7N1maJfb8/wqE9WFkON2
 cWvPGVRb8VKJcYJ2N3kme2Wv6v8UTLZOSgq1kt68xSKjqW3RoEwwXu4BN
 nSe7l6dksqMSb2X1+6Y8V5b/DHaR5Y+i/IwOKDvaDSM8DbMxJMrC0uhuh
 I2qtYcB659q/cruaNkS2pOA2mSP0yZYPakIKquDXkOoSwDtG7c69VKASf
 xpoAP8RU87D2pvzdMbmMwxoh9gf6HBlb5G8DMfg7LEScO0d+L0gozMmOz A==;
X-CSE-ConnectionGUID: 7xLYiyiATOKxGWstQ7WiCw==
X-CSE-MsgGUID: u2FF0ajDRCqoQfkQq+U6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44448450"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44448450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 12:32:40 -0700
X-CSE-ConnectionGUID: SR+i4w9QQJCHou8GlmPBag==
X-CSE-MsgGUID: mbaNmVr/SuKgK/CuNpuVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="129939407"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 26 Mar 2025 12:32:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Add a missing H2G error code definition
Date: Wed, 26 Mar 2025 12:32:38 -0700
Message-ID: <20250326193240.4165833-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
References: <20250326193240.4165833-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

These error codes are not actually used in the driver but it is
extremely useful to have them available to understand error messages.
The most recent spate of FAST_REQ errors being reported have been
about error 0x30C, so add in the missing define for that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index 2c627a21648f..c25ea52a6e61 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -40,6 +40,7 @@ enum xe_guc_response_status {
 	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
 	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
 	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
+	XE_GUC_RESPONSE_STATUS_HW_TIMEOUT                   = 0x30C,
 	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
 	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
 	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
-- 
2.49.0

