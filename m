Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7F6C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 08:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950F10E100;
	Thu, 18 Jul 2024 08:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSaTp2Bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763510E100
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721292275; x=1752828275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GSdF8cIjNRuMEpGENxZy83NKdbtvsfbkChMdvdrg8Ug=;
 b=SSaTp2BfdF8pBFaRSdrrFG6d52rataYfALn2XraiDL98o0P788qKEt1Y
 N0fXKdsCEwNNHYVL3LIWMZ3eluNHKSdA8ISeZBCVzOxLG0IC82UjiFgBy
 8YrzYZrGn4syDUYlZa8OuP4qW/zi/JGUN6jXJTt+Fw/hLIsJsXSQZJVws
 o2l7d8AYiTosN4xDtX8cMvg+fit24fa4EvWgHWg6VoO4NXBXDdiiJqAYa
 ad4+yHTd5CwJz9lrZC2SCXMdfTnrfwqAaEb1qUhU65mC+1JF4NtQK9NQi
 pcKVJ6UZxOLxQ8urU9prv0ODyfB0EXjdcUnDxS3098K4jZaaAmSVNvJ5M w==;
X-CSE-ConnectionGUID: dUKRjoIeQ8a1PXAK6xBCWg==
X-CSE-MsgGUID: Q9XmLz7zStKtM49a8NbcHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22608428"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22608428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:44:35 -0700
X-CSE-ConnectionGUID: 84QvJQGzS3axID3Ut/P45Q==
X-CSE-MsgGUID: voSHRBwuT2ysRSCZjChfUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50449623"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:44:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 0/1] Build PM into GuC CT layer
Date: Thu, 18 Jul 2024 01:45:18 -0700
Message-Id: <20240718084519.1478010-1-matthew.brost@intel.com>
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

Alternative solution to [1] to fix GT TLB invalidation issue raised in
[2].

Matt

[1] https://patchwork.freedesktop.org/series/136219/
[2] https://patchwork.freedesktop.org/series/136145/

Matthew Brost (1):
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_guc_ct.c     | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
 2 files changed, 9 insertions(+)

-- 
2.34.1

