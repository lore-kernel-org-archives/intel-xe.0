Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7708C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 08:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEC210E811;
	Tue, 14 Feb 2023 08:34:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BE710E811
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676363659; x=1707899659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YnOu1jaPa9KYlgfKBje9maHj8coNFPbozlo7N5dnYgU=;
 b=G1bu9nM6J9XuRXVbKBvt7vtXfE1PoYd1qlR3jY5/SsoeID92wUP9tmKK
 +yK/F6OQPIzqbnIYBSIS47XIJd4B6izi4PxZnoWvSa9PxAT66pjVPB93S
 04AGf3h8uPcl7+g8PDNjZCxxprAYt2eQIvrMwdDbh3MXuOIs5SH1aZElA
 NFMeNvYdV49+sbhkmldvcMzN9/dWD8m5/ArwMHSAywODFDuQ2kOwYELuS
 clV3gzVbNLIzROplOsru2yRsxfTSvjfX8Q24O0myl+M9AOTmNWZLYiaok
 97mHGVsxCJuqSWmYyJKedLoLqdsLHUHt6um3QOfzz3n3ppt6sM3uPpXcZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395727083"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="395727083"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:34:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757899387"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="757899387"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:34:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 00:33:18 -0800
Message-Id: <20230214083320.2199178-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Start register cleanup
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

Start cleaning up the register definitions used in xe. The engine regs
are chosen as they are small enough and we can use them to agree on file
names, location and approach. GT and "global" registers will follow.

Lucas De Marchi (2):
  drm/xe/guc: Remove i915_regs.h include
  drm/xe: Remove dependency on intel_engine_regs.h

 drivers/gpu/drm/xe/xe_execlist.c            |  5 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |  6 +-
 drivers/gpu/drm/xe/xe_guc_reg.h             |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |  3 +-
 drivers/gpu/drm/xe/xe_mmio.c                |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c              |  2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c       |  3 +-
 drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h | 81 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                  |  2 +-
 10 files changed, 97 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h

-- 
2.39.0

