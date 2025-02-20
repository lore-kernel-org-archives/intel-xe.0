Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0AC021AA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 00:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBEF10E098;
	Thu, 20 Feb 2025 00:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOouoMbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A69710E366
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 00:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740010355; x=1771546355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TDZqYfBgPw9rPgNUHuEhKrvt2B/XgS4fDmnpH+g5m6U=;
 b=NOouoMbUvQVGYtbbLc4Tk5yT8Wam2YMAOytsPlYC4ZGY1mNPo+wkgdhD
 qZQLb9WSKktp0tPDjE6gRSECZO81LZZBlvBz7miJGw4rPl6eLjJTtx9CK
 FQc5qsdsnqzgPTRfotd58LXzomf5Y+lMJlFn5taJ3UX0Anrsc/abuU3oT
 1m84OS31Rsq0Lcxkgy1hQoH+w8O8HXMt28ujTRx/iFb3C0xkMWCvWFN0Z
 R/EWHGqHgd7ilSF+xuhZlFImElxZqdso7si8+h11SdFHD+GOMnq7ooSCd
 5wRnlrLqVFDQJPq2nWSoRfENdmKYbK/6jrjFwIAllSlzkozHsBOy+a79H g==;
X-CSE-ConnectionGUID: wKMzZS45RcefIu0t7XVoaw==
X-CSE-MsgGUID: eBHEi28WRg6ReG/UqDf3Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51754161"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="51754161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 16:12:34 -0800
X-CSE-ConnectionGUID: E0jufuXeQ+KUGLOKzkQu3A==
X-CSE-MsgGUID: dkPK0+DsR/yRACYlfPV9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145760187"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2025 16:12:33 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] drm/xe/devcoredump: Fix print typo of offset
Date: Thu, 20 Feb 2025 00:08:35 +0000
Message-Id: <20250220000837.1803317-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219190739.1775077-1-shuicheng.lin@intel.com>
References: <20250219190739.1775077-1-shuicheng.lin@intel.com>
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

