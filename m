Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53738CD98EE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE5B10EDAD;
	Wed, 17 Jun 2026 01:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka5oFuav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7F710ED62
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781661268; x=1813197268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r+7ubbCoPdhHwG8UU4UNS9XnhsDRa5P7WD8mGs+lFko=;
 b=Ka5oFuavqUHGncvu0Jw58Hcta+13rJVqVkBbvqyOerFgl0D1fimZOf55
 xcyjO6MTNc6lgI3oKB1RK6lHamvIMWBi7Z1XROH6yaK17ievNB9hOr9VC
 M+L/kNFstBe0Npun1vnkZRqVYPSwkz7HGijRA9+0R7twRwD/kl5FUSOW6
 rZ0e1ESEHmGJltdjG4XK/Adlv2uHsVIV5RR5xDDaAf/o7sJdwj0O5sR+2
 v7HAWcfbw8JOmB+9AQt3U1mC6KMiGq1/9cuV0FCKS9H0SA/eSn3EL/Twf
 Z9Ob+PEPcwy1EwV1GB+QZ1vElLCvhbC7PhSTNp2/6UXyUtCvkY8xCtZ1Z A==;
X-CSE-ConnectionGUID: 5yub/sT8Qe+A6Ttt6CQPWA==
X-CSE-MsgGUID: hsrVsywIQG+G6Jw1ScGAkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82456695"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82456695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
X-CSE-ConnectionGUID: xP8CBpBsQWSClcsgoUL+MA==
X-CSE-MsgGUID: qAmUcKAkSZ6jlDHpfrGQYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246801627"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 18:54:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 0/4] drm/xe/oa: A MERTOA bug-fix
Date: Tue, 16 Jun 2026 18:54:18 -0700
Message-ID: <20260617015422.226177-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

v2: Added patches 3 and 4 in v2

Ashutosh Dixit (4):
  drm/xe/oa: Rename last argument of WHITELIST_OA_MMIO_TRG
  drm/xe/oa: Fix offset alignment for MERT WHITELIST_OA_MERT_MMIO_TRG
  drm/xe/oa: Provide OA status through status ioctl for mmap interface
  drm/xe/oa: Stop whitelisting OA status register

 drivers/gpu/drm/xe/xe_oa.c            |  7 +++++++
 drivers/gpu/drm/xe/xe_oa_types.h      |  3 +++
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++--------
 3 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.54.0

