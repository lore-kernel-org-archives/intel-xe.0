Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DEFC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 01:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39910E3FB;
	Thu,  2 Jul 2026 01:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQA3Eyey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90F010E3FB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782954062; x=1814490062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PRThhJOY20wlLmwkUVgRwpslJZEgNRhnAk3LZeGk4OE=;
 b=UQA3EyeyEGx5GMx0C9hM5bheN+ABJpD5XBliKk0vdhozVk7+hS/UckE/
 bmH9SnrClaaeYbeyP7BwD33k1i49wOf0O98erxv4UimOUedvFLwIbx5JR
 vBxBn1ZpZDvTAEPm/uYZ1Lfd5GmqdAq1+E274BJdgFPMNCgXwiX4/bz4U
 y1BzOQ8poc6+RZzuS+1ALIwP4tC0E2vD49hz0KJUYofUobYtKRd+WtsmP
 2Lowhw00BkOebAQnWxHItVwW3t9CDRxRVszrC2KwUoaHg7k3Is6RevK4w
 2C4YDRAZPedSRuPTpetHJ3IF+7BFyJvz1ccC54rsj6LdxMx+fElLLwlRE g==;
X-CSE-ConnectionGUID: L3IWXoCGS+uBv92cKAZPSQ==
X-CSE-MsgGUID: 1DxZgk0BTbGQDJvMByL+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94350375"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94350375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 18:01:02 -0700
X-CSE-ConnectionGUID: AsK5DB2KRcSvmjhMAL44tg==
X-CSE-MsgGUID: g8XacHG2Qmu026zi4IQThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="252850648"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 18:01:02 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v1 0/2] drm/xe: Use IBC v3 on PTL
Date: Wed,  1 Jul 2026 17:56:12 -0700
Message-Id: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Also add a sysfs entry to monitor the bias values.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add sysfs for GT/IA bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
 drivers/gpu/drm/xe/xe_gt_freq.c               | 51 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                |  9 ++++
 4 files changed, 63 insertions(+)

-- 
2.38.1

