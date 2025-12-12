Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BD4D43369
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 06:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A906410E422;
	Fri, 12 Dec 2025 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNoPW65M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E0110E16F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 06:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765520336; x=1797056336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FlYaXhC1tq2JzNMJgFuVGEsMKG3Ty0rtxkuDmygQKww=;
 b=nNoPW65Mjx3IC/xUrKLROaroHVJWpHx3Hph4hLqAJ4A6CSntceBAMYvG
 q2T5FdOvQmrP7Ts9vDAirE26rwwi8HGqOlbLRKDK+VjiMZ5ux0BFdW+vc
 TzMpwF5YaXcYuIFZVyoPipo5LErQnid6vAXal6eg0726Noof7zv7Z+gId
 Z1KV8rU78U8BZtipyXaa2WiDewVb3uriw6I6LHLy8xarEFYBaHXjLo6Wo
 p4GjGweDyMP2rXWUyYQl98gwPB2nz3jUomWjcOWTZOX+BUKHTYhiepjY/
 WZGv0x8+MeiWokI+/vdPsX0UI91kJK6nxvMsxwXOtdag64CNurRnrrKcx Q==;
X-CSE-ConnectionGUID: uUEsDhQEQFKekA/s+pP4CQ==
X-CSE-MsgGUID: BLpDN2JMShqTzUpbYbYLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67557152"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67557152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
X-CSE-ConnectionGUID: /68ZsbxmSvSdINjWtap7+g==
X-CSE-MsgGUID: maLwIOytTEGHhtr0Mz3EnQ==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>, peter.senna@intel.com
Subject: [PATCH 0/3] OA/EUSTALL: Syzkaller NPD bug fixes
Date: Thu, 11 Dec 2025 22:18:47 -0800
Message-ID: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Ashutosh Dixit (3):
  drm/xe/oa: Move default oa unit assignment earlier during stream open
  drm/xe/oa: Disallow 0 OA property values
  drm/xe/eustall: Disallow 0 EU stall property values

 drivers/gpu/drm/xe/xe_eu_stall.c |  2 +-
 drivers/gpu/drm/xe/xe_oa.c       | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

