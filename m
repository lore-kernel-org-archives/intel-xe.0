Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46974CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE50C10E6BA;
	Fri,  5 Apr 2024 08:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHY5W4Qe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D010E6BA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305699; x=1743841699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hb6I08K2cGDdu2Tw0UwNOf0KbnlCA8KqORxLPl8xMCQ=;
 b=XHY5W4QeMFEtBbKIx2AmHs5cVJIMYPRBlQxqdiAG0U8ITcxJVAUY9Zor
 1QNKsTLYYjVn3aQao8QYJ2H5mtQ/5K+Pu91fK31kHDM4fdgcOu14i0InS
 CbeJ5dp1LtH1APVmY6h4IWOqc6psulaQoi8O2UVqYnXES08tDlyR1Cbdk
 Ju0HHeYazdNwafgaQ7vbnE4hy3Z34kqXrZAvHVWlOgi/pQLgR+6V1nj75
 eMwYfh6BmEv9hhP4i6+xkUZR04Aj6uWY0sNvs48/biNfwY4G3ofDILxNq
 kro+sQYWSLAQzAoBSUFsl6I/0j+hLSUhSklTD9qF5PcitrYrCUygtTccg g==;
X-CSE-ConnectionGUID: 4bk0tRAlRGeJxQqqwcMCrg==
X-CSE-MsgGUID: 5gKziBo8RJ+7aot1YoRtZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7811399"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7811399"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:18 -0700
X-CSE-ConnectionGUID: W2AuDrvXSYGNIA63bb0ZSQ==
X-CSE-MsgGUID: 6jsgBmrmQ12xD0eFaJ353g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="50033318"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:28:16 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 0/2] Add support for Wa KLVs
Date: Fri,  5 Apr 2024 14:12:29 +0530
Message-Id: <20240405084231.3620848-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add infra to opt-in GuC Wa via KLV interface. 
Enable Wa_14019882105 for LNL A step

Badal Nilawar (2):
  drm/xe/guc: Add support for workaround KLVs
  drm/xe/lnl: Enable GuC Wa_14019882105

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 86 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 5 files changed, 98 insertions(+), 3 deletions(-)

-- 
2.25.1

