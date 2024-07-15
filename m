Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C276FC3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 10:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358E10E341;
	Mon, 15 Jul 2024 10:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ci8DjloI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A410E32C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721039937; x=1752575937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RY+5c4zfWeh7WZjSUZ+Xhotz/Gv1SaCiyDw2H8s7RaA=;
 b=Ci8DjloIaz8dw5EXh1WYQ35Q7JQVIwakdn2buAb+zI2/wVDlZAv0N7DO
 bUeRufbgjIHnDL7q+Yb1oMaCPjbko2dW6iObzTqbQUvZnbazrkOg3YUGo
 xL4W0ZKfa+CFa1YteV5gcKAUeBvekpZQUK7COd06/b9SvTY658e5J9vNE
 f8FU4RSlfQMU6QVKj1aFeMjWEqAKzOvI0U7FjMVjn3fL0aIXJF9rScFjw
 CXvRdkCylPcwOcfldz6Ln3C87K6rpppWRzN/WyYnIWvVdPrBpjKqx0idK
 Fv7muR6bzDfIi7fFlgub1Zdgxo92wfvhubngUc/2TFUj2Adv9yyyxfvbL w==;
X-CSE-ConnectionGUID: 0KL+HVnpQlatkjQ7KtjNqQ==
X-CSE-MsgGUID: zGs0XG53T6+YIRE0QnT83Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18025537"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18025537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:38:57 -0700
X-CSE-ConnectionGUID: azY+s9aMQ4WS7sNDaXs9wA==
X-CSE-MsgGUID: cCb/FXyATc+PAeiZnXr3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="53954488"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2024 03:38:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe: Delete unused register from xe_regs.h
Date: Mon, 15 Jul 2024 16:25:54 +0530
Message-Id: <20240715105555.2220444-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
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

Register SOFTWARE_FLAGS_SPR33 is unused; therefore, delete it.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 55bf47c99016..dfa869f0dddd 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -15,8 +15,6 @@
 #define GU_MISC_IRQ_OFFSET			0x444f0
 #define   GU_MISC_GSE				REG_BIT(27)
 
-#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
-
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
-- 
2.34.1

