Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AA7C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 06:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5148310E3E6;
	Mon, 13 May 2024 06:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NthdbvaG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF8510E3E1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715583243; x=1747119243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fzNLZFSomH+rFinfKPjx4N7st2ynUfFTA6GgjD4zk2A=;
 b=NthdbvaGvfsCnZmqZQf2xHwcR548kOEuwDoFlDN2Fe8ggjtRMLpolRdh
 0oommk1n9Ms+o3+C1sNznhM3XCymHiv0gMW7gl0gO0xuoqJs8CyxMFGEG
 g2es3ngd9z8IU0doR3iW0z/3SkxOLLMKmf7cLAE3JAtVgYVygduAmhwW8
 VCmzt1xiPze3VeQznpQ+K/aEG6xlj7ljogV7rnu0Vnh9PhT1K/xhlK7R7
 ulwnqp8cPcRLIvqkbjYMM+eihA0Qrf+s3DDTtuqurQ/pWgZieatdFGsJU
 +/FDaO67ILIcZBhS4QflPZcwCd02ZXCasUuXgqyA9JcMxlWLmP+dzXIkB Q==;
X-CSE-ConnectionGUID: nx7cX21TTHeB+o0FBUVJSA==
X-CSE-MsgGUID: YIY1eLbSSq2lv2xJkHdJ5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11657838"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11657838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:03 -0700
X-CSE-ConnectionGUID: 0auLQOv0QDKgfNTgHso8+A==
X-CSE-MsgGUID: 0AXOWlfjRQOOk64LVfSgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30321384"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 0/2] xe_gt_idle fixes 
Date: Mon, 13 May 2024 12:35:44 +0530
Message-Id: <20240513070546.3754640-1-riana.tauro@intel.com>
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

Use GT forcewake domain while disabling c6
Move disable c6 call from GuC Pc to gt_idle

Riana Tauro (2):
  drm/xe/xe_gt_idle: use GT forcewake domain assertion
  drm/xe: move disable_c6 call

 drivers/gpu/drm/xe/xe_gt_idle.c | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_guc_pc.c  |  5 -----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.40.0

