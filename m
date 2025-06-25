Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4043CC7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 16:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F078C10E7A2;
	Wed, 25 Jun 2025 16:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNgLB8Ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EABD10E7A2;
 Wed, 25 Jun 2025 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750870627; x=1782406627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
 b=mNgLB8Ds2bQQs4PRPvP/CvxKXLcsQqxIgP92RizEQYzIRMyYkTifpe5y
 gnUgf9FiZql14xEsgCaTePt4Xx1XYaJvzpZ9ULDA1fZdryp/QpnK7DacX
 o5o3vJzbY1Vy568WIoI63oQwhRyad/k3F818UJusDWtIV64fBuH0ovZz1
 UbjT8Yv+Ftv5EgKIGxjvBOWmHn27aZCPeVlRZ+XDlxCD9USZQvVN0G08a
 /jFUZHSsHNfyzkXfg1lJoqCWKaeQpJiH13OPsq9M7/LtBWoEwIWD9FNUJ
 Mh4w9ebF9CMKjHyI+LLG8vYcOlNjjbNth6h9vrLlQZLT1GB81CrqWJcfn g==;
X-CSE-ConnectionGUID: SE0njLpvRBKj+zZT/8tBzQ==
X-CSE-MsgGUID: nxRgjd4FTvCYUDLgI2g+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214469"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53214469"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:57:07 -0700
X-CSE-ConnectionGUID: 3X4X4U68Ttq5Zj9Z5nIKSw==
X-CSE-MsgGUID: TapVp8apSniM0HuyJr/5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151696740"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:57:04 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v4 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND
 for CI
Date: Wed, 25 Jun 2025 22:30:15 +0530
Message-Id: <20250625170015.33912-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 30ed74ad29ab..b161e1156c73 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

