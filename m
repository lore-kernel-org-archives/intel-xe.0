Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E76C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 00:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0934B10E8BB;
	Thu, 20 Feb 2025 00:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fI2GbfDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2310E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740010860; x=1771546860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TDZqYfBgPw9rPgNUHuEhKrvt2B/XgS4fDmnpH+g5m6U=;
 b=fI2GbfDvzxgaQngZdtBNSV1zTvF3XU1QytNaE0B51Y794vIpXILuGLDn
 zK1/2QcD98f7YUFlhEwC1mvdwRqE9L3fPTvuqRXL7Y/xFqirD1k3up++S
 BAENCD3s8jdNWBKgMXrG/iclxwJ/P3H3ZrtUdOpNO8gzsqI68w93qluBX
 yaEthaOeuQeVRES5YCCJsxn4cyC3ePe43pJbcyEMdugMaxgra2r8o5mcF
 53N+BAzfR33G8ZBIGEfHHPokYgmHuOGFvpbZh1DVvdHTDpSr2piwES1PN
 7nkIhXycQ5FuJRIdmaEr6T1udU9h+FlbWdON+cz2qZQAHHYDDmslBlL+Y w==;
X-CSE-ConnectionGUID: b+60qWwwTWa40YyoRR/d7Q==
X-CSE-MsgGUID: pBbMHHi5Sgyfr7jENQs3Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39961848"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="39961848"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 16:21:00 -0800
X-CSE-ConnectionGUID: J5IHbw4STw+2USWPAnt7VA==
X-CSE-MsgGUID: JKNqOkfURFqoh2JkHx6t8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114859663"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 16:20:59 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 0/2] drm/xe/devcoredump: Fix print typo of offset
Date: Thu, 20 Feb 2025 00:17:08 +0000
Message-Id: <20250220001710.1803749-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219212631.1788586-1-shuicheng.lin@intel.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
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

*** BLURB HERE ***

Shuicheng Lin (2):
  drm/xe/devcoredump: Fix print typo of offset
  drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for kzalloc

 drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

