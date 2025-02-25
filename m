Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C690C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371FD10E67C;
	Tue, 25 Feb 2025 13:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zm0U+2P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103810E67E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740489832; x=1772025832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qoLCBhsngyZVv0syvb/Yd1idmufLDU9mIUTTLowaeQ0=;
 b=Zm0U+2P7M8E+/eKBkp7XkZw2LXlmtUflbUe5qLgGeBxchHIzAk6ljPDZ
 HtdT9ob4sXqzusAdkPu+BjMibPtI5Lgd4TwGTk6ZzKLqz01qv0r2bK6Y1
 7C5kxQbTlpy0Lfdp1gnElaJn/NPRNK29JTrHvr4jcsfcWKOdYWnNG3cmD
 V021/JH+hN8KkofrCbNKPzVkC/Omfa+o1q3RGDApp0f4Bzt4514r24lpF
 7G3RG3fWZ7FqTkoYZfTgEF5mwVHAwT55Ex7QbRwVoCebQkioUfdqX3dDy
 8hEyA0BvwSwtnJkpJDXmwhdZHycYHVd74Boay6+cHRTg/SEB5TxLuBCnZ Q==;
X-CSE-ConnectionGUID: 9aGqVVpBTfm5nIkcrGKkMg==
X-CSE-MsgGUID: b+ASuqh8SFON4+QvJh85mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40530478"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40530478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:52 -0800
X-CSE-ConnectionGUID: 5JHhgBRbRZ2m24NmMkOG3Q==
X-CSE-MsgGUID: aCaWSAlyS0WhTpSu1pIT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="120998267"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:23:50 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 0/3] VF: Set submission version in xe_uc_fw struct
Date: Tue, 25 Feb 2025 14:23:34 +0100
Message-Id: <20250225132337.6508-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Lukasz Laguna (3):
  drm/xe/uc: Add helpers to set firmware version
  drm/xe/vf: Add helper to get negotiated GuC ABI version
  drm/xe/vf: Set submission version in xe_uc_fw struct

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c         |  9 ++++++++-
 drivers/gpu/drm/xe/xe_uc_fw.h       | 28 ++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.40.0

