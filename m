Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E52D29DC4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 03:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4DF10E44F;
	Tue, 13 Jan 2026 03:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K172ZiFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA14610E44F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 03:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768273202; x=1799809202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JWY9CpSGHe0wMVXX6gvHniJOAKSD+pyNvXYz1AN0JIQ=;
 b=K172ZiFnyke0F4DKEofJgLBPxaXOroXdkE1ZjAiuT60VpTio6CcIzKHp
 OLAk0C6JwmAffGeT62QJ47HwZ53VYbBGtEwcClxLuOB5sTC+7QDzmP3/u
 32WvrPXpdQ/rkHDMIKZPqlfQeOgBDM6UKW0d48mVSkK6+jPidG16OW5m/
 EWllkOIaqAS7PVU8ygvzPr0H/hp6bXDbEaK01fHMAcSNxj5H834XfSISA
 O8+TG5N3rWvXIdM3GsMFsRi/PeOQ7PsUHLkWXtfPgmWj3foIgA/6KUXu4
 vFBn5ct1hlU1HEuckm/I8gyNXANoAgM9xbfYDh5V8sHhk/zAcr501iCmj g==;
X-CSE-ConnectionGUID: ZoLk7tDZR9ils+biRfQ0Zg==
X-CSE-MsgGUID: 4a1O0q9ORWWVH/l+1KuaWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80273978"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80273978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:00:02 -0800
X-CSE-ConnectionGUID: y1deFCZDR7a3sZqXE+gQYw==
X-CSE-MsgGUID: 1yetVh29Qii2jkZKDkUpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203422459"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:00:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH 0/2] Enable multi_queue
Date: Mon, 12 Jan 2026 18:59:54 -0800
Message-Id: <20260113025956.3505110-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fixup job timeout support multi_queue and enable this feature.

Matt

Matthew Brost (1):
  drm/xe: Ban entire multi-queue group on any job timeout

Niranjana Vishwanathapura (1):
  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc

 drivers/gpu/drm/xe/xe_guc_submit.c | 84 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pci.c        |  2 +
 2 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.34.1

