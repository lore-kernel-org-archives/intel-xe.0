Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E3C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C96C10E343;
	Tue, 23 Jul 2024 04:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEeBdoT2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0158610E260
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 04:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721708623; x=1753244623;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xeCh0DZ+Zb4ZjMyONpsz58fPBvstjnj5lKc604Dyn7g=;
 b=fEeBdoT27WafpdtXXrZ0wOf9bv9E3KENAZgmm8zwt/PaKbAUVaThYnTo
 Yn9s0TnyqLi+YoYe+1lS0aXJu/pgCMHYBLnfU1l5ZaTBSkZSF5t+YTzmb
 7/EIaBTHVEtvMlJIMMhRuAZV/Bk762Kz/Qiz3Jemh+0Chlay8KT7cdf0s
 7Pdq4vMJsbe/0fJzzQ/D6v+Z+WGaYnLK5ADp33nDeUaO288Hr2V5QSJ/x
 bZjFM00LzLriavJqF/CBQAY1KAZGI/Bq/o+Q1X3WpkkG2WWQ7OvZP1in/
 78JW0+Pokmwh/mq1w/lwLxKZOFK/DivanqnTbz01BbvL00JUjY/IPZWN0 Q==;
X-CSE-ConnectionGUID: vUKPscTsSHCfZwZUxIvUYA==
X-CSE-MsgGUID: xOupaHesQ4qmjqPLAFXZZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19493682"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19493682"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:23:42 -0700
X-CSE-ConnectionGUID: 5gqCd/vJTmeOhjLqKeIUQA==
X-CSE-MsgGUID: sZU+aXeLQ/SuQRL6bDO0KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="52159373"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:23:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Store process name and pid in xe file
Date: Mon, 22 Jul 2024 21:24:27 -0700
Message-Id: <20240723042428.1701998-1-matthew.brost@intel.com>
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

I've seen this CI failure [1] several times recently, I think this
should fix it.

Fix is tricky as it fixes a couple of patches and relies on xe file
being ref counted too, so unsure how to tag the patch. Will need the
maintainers help for proper tags.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136292v3/shard-dg2-435/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html

Matthew Brost (1):
  drm/xe: Store process name and pid in xe file

 drivers/gpu/drm/xe/xe_devcoredump.c  | 10 ++--------
 drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 10 ++--------
 4 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.34.1

