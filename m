Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC07CC52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 23:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498110E3D6;
	Tue, 13 Aug 2024 23:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XE87vRiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78F10E3D6
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723590718; x=1755126718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5D9rU1XF/62nSwkMh//51ELex8uJ0dfb/sa7ygp/YYg=;
 b=XE87vRiXawEws2sRnIYl6S9wBrkWOR6VgBqrBVOSjzZ4pTcKGdBrbHBj
 DIM2h2/pCWreY4c5s3lVWmhFfB6y8qoz/QkkppOcmKVFBW0RtmC38T6CG
 nT6pzIn4RO7n5B63MOnzbCubORZSopHsCOoyCRlM+CTfDJKQ+GfylrdUU
 bx+8BBqcXUN2yOwv5/92dFu1hY7gUbc3A27parw+8OVsp/rdUZIeJvneA
 uTapG9CiwzctCe00O4olqurcOSlyL1Jjeu09dCZDEJB9QPppJsKudEGnw
 I+GH3EWqVxY1OehjDb8SuMs3tWZMN3mGt3613ts0FLqeXvmtREVxwLu9b Q==;
X-CSE-ConnectionGUID: 90tcXhhyTIOE6r4gLaIdhw==
X-CSE-MsgGUID: JnhCQbj5S4qhNJdhV9dN2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21599831"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="21599831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:11:58 -0700
X-CSE-ConnectionGUID: hnPteUsXQC+kZOLL8JHK6g==
X-CSE-MsgGUID: umHt1XO/Q5CUSspoLragXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="58515521"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:11:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 0/4] drm/xe: fixes and debug improvements for GSC load
Date: Tue, 13 Aug 2024 16:11:43 -0700
Message-ID: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

A collection of fixes and minor improvements to the GSC loading code.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/gsc: Do not attempt to load the GSC multiple times
  drm/xe/gsc: Fix FW status if the firmware is already loaded
  drm/xe/gsc: Track the platform in the compatibility version
  drm/xe/gsc: Add debugfs to print GSC info

 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gsc.c           | 57 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gsc.h           |  3 ++
 drivers/gpu/drm/xe/xe_gsc_debugfs.c   | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_debugfs.h   | 14 ++++++
 drivers/gpu/drm/xe/xe_uc_debugfs.c    |  2 +
 drivers/gpu/drm/xe/xe_uc_fw.c         | 13 +++--
 drivers/gpu/drm/xe/xe_uc_fw.h         |  9 +++-
 9 files changed, 164 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.h

-- 
2.43.0

