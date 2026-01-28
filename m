Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7790D35668
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 02:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DA310E60A;
	Wed, 28 Jan 2026 02:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2e6sWpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703AB10E60A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 02:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769567202; x=1801103202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hFw5in1idxclMRAmFjns6pi0Sqk6GMtIj6XeQyskkKE=;
 b=U2e6sWpWXE1k2yqBYTPIVdWXKIEasdkQmzTa5WqpzSKqMB/RJbbrLI8H
 Qnq0drMdKSuTUd93DucNoIFYq5zB+usB8OEnnjDf0xZTGi5xw1PQuJhTg
 JydhgzTr67hmT0Qmn/c0E+Kg9+cos9gFxZ00W/InFszOG7iit84+XoRUC
 31XTy1luBaUcVaphA0vcWPXfXQB3WA+5Pw2YCoNkrs4jc17ShW3L3CDrZ
 xFxfbrzv+qnmNv2hXJVp0iKndU8nnM8r506KJ+51TodTG5wqTegCDuaHF
 YZTmJZ/Bs/K9uCIGKQsgyvcLYUYu0gqgfiUi0SiUIEl+DBoi1V7Vi5GA0 A==;
X-CSE-ConnectionGUID: 0AEFNF9ZSmaTkXr9vY3zzA==
X-CSE-MsgGUID: InzF4BsuQNqVihBTNPm6kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70829478"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70829478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 18:26:42 -0800
X-CSE-ConnectionGUID: j61D0LWvShWe1Ce/HVlyYA==
X-CSE-MsgGUID: hCeblSiiT++FVJN+hk6kmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212997450"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 18:26:42 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 0/2] drm/xe: Separate out GuC RC code
Date: Tue, 27 Jan 2026 18:23:18 -0800
Message-Id: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
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

This allows us to independently toggle GuC RC feature. The previous
review for this series was at-
https://patchwork.freedesktop.org/series/159128/

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)
v5: Review comments (Riana)
v6: Some more review comments (Riana)
v6: Some nits and other comments (Michal W)
---

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for SLPC set/unset params

 Documentation/gpu/xe/xe_firmware.rst |   3 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_gt.c           |   1 -
 drivers/gpu/drm/xe/xe_guc.c          |   6 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 118 +++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c       | 159 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h       |  18 +++
 drivers/gpu/drm/xe/xe_oa.c           |   9 +-
 drivers/gpu/drm/xe/xe_uc.c           |  10 +-
 drivers/gpu/drm/xe/xe_uc.h           |   1 -
 11 files changed, 238 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

