Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568FC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8310E76F;
	Tue, 18 Jun 2024 17:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTGnuAbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D07A10E769;
 Tue, 18 Jun 2024 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718732812; x=1750268812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XFkSf917M5jaLADDBly7MJCVGGUSz1H1UBZVZhkOG5E=;
 b=WTGnuAbT59tM7y/5KuwNItgRFpHeBHS6fRgwhTItT+ZdzajeCeHknlqk
 vlUd0DQhjIvCdZOtFd24tQJNBqC3NHRDWYaDmRmcfnLYM5lpLS3fQKkHf
 tzMG8cWnohSwDPunkQ39WlTZaxSz5kQTCD0tRxWs4ZFvLl7XGSEi2jfdI
 AGEQdv+AseKI84Y/zkPh32VF3eQDnOX4WiYfK+5EnwmEI36VyYncpfCnJ
 HDnWfR1ghGteaMeckkO0xgzYt3C+YqwwuZOTpNKTtc+tpQIOIs4g8OBnB
 3o0P6VmMkXPLhHLsQ1Lm7nxZm2F6fonr4agBNMF6xHo4yVsRfq7nBWTnD A==;
X-CSE-ConnectionGUID: UhnF7ORGQhuVnI7yQJHc/A==
X-CSE-MsgGUID: sBIKWX+KTbuGZZj7wjQdCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15603466"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15603466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:46:52 -0700
X-CSE-ConnectionGUID: IZLdSM6kShe39YZOKgzvjQ==
X-CSE-MsgGUID: O7Oy+FYxTK2mz7SZezQCkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46004929"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:46:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/2] Job cancel tests
Date: Tue, 18 Jun 2024 10:47:26 -0700
Message-Id: <20240618174728.3336865-1-matthew.brost@intel.com>
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

Tests following, merged, series:
[1] https://patchwork.freedesktop.org/series/134724/

Matthew Brost (2):
  xe_exec_reset: Add job cancel tests
  xe_exec_reset: Add timeslice preempt test

 tests/intel/xe_exec_reset.c | 44 ++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

-- 
2.34.1

