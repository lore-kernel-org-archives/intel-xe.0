Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7DF9EDC4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708DA88784;
	Wed, 22 Apr 2026 12:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBai9Kr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABBB10E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776860059; x=1808396059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBVCmnRKFCLuuXhJLKcYFKzoJTCRVG6GxSALcJW1H10=;
 b=SBai9Kr1eAMWrTpM+WIAoschNTK3H70ASr+mlyMEUfTXt0WJil9LFG3h
 YNKGP1Ig9YzAcvXkvYuqDDmsJ08HeVDT8q21bfQTdY2jHv9r9ocsTFXao
 XrBFu9WrerkQKHPKWyLqK7puo78WZ00l2ZqQp4e+cyRsJAZyHfKfrLAbQ
 rQJi/sflIiyZXg8jQ6pUKOtzLi34u2BmLHLWrV/t2eyzUf+Z+vfviCrf2
 Fln76Pzp92UYoZSHrjyh/Aldny0I+nm7+ajfihQageHbDIIkkH2I2DzE/
 DnzPq27RyJ4XcCg5hC7j/aVabkw1+cxXuqffdhIZuJFCDjjyhqMZ4BdLi g==;
X-CSE-ConnectionGUID: B5SvuoH4R9OVRPuAk6yVkA==
X-CSE-MsgGUID: L6tf6ATFRdOFmaj6kUG0Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89197440"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89197440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:14:19 -0700
X-CSE-ConnectionGUID: +0zV9GmoTkC9/JWwOAT21w==
X-CSE-MsgGUID: YaO+EZDpTMe8PkXgw02qhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="231305895"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 05:14:17 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/2] Minor GuC PC cleanups
Date: Wed, 22 Apr 2026 17:40:55 +0530
Message-ID: <20260422121128.1002031-1-raag.jadav@intel.com>
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

Detailed description in commit message.

Raag Jadav (2):
  drm/xe/guc: Make xe_guc_pc_stop() void
  drm/xe/gt: Drop redundant forcewake

 drivers/gpu/drm/xe/xe_gt.c     |  1 -
 drivers/gpu/drm/xe/xe_guc.c    |  9 ++-------
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 ++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 +-
 4 files changed, 7 insertions(+), 15 deletions(-)

-- 
2.43.0

