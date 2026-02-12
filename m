Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF7EEE3698
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8C10E778;
	Thu, 12 Feb 2026 17:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0nU1x7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC1410E778
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770917188; x=1802453188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=in6ys2KjNw0aWUqeYofYuk7H278dNcigIL+pe2O3AYE=;
 b=R0nU1x7DEksn+TmMXj1eQGKNicO22ZQWVJ3I3qz57lqR5r9S0zAra47u
 fxm0Q87dUDMU4ReJfW1J56A4Ka2EZAw0OSt170vuhwbhC6d9usRs0ebGN
 97guLUSUWJTbm4hCrTTS9tiZ9wxzPPrEG+1ArG1Kx+VVhLAIHBZHKThdh
 X5Mc4RvqvdC9PHrg7daSX2TKqR83hnRh9GkUWuch7CwfOSj1kPblNoZPq
 QFtwVpQpwm0HAi1SYzrh3YAQwvnvhkGJY3rTLgwchY1nWRauCcsRU2OpC
 LMJ5y54EnC3IHWmm3OMDy5EkueG7ytWDHNJMlWuiFhZf4X8ymPYVB/pvF g==;
X-CSE-ConnectionGUID: nOrDvv8GSsWA4b97XO7jGA==
X-CSE-MsgGUID: noPbG4rpQYasqV/t2W+x7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71999985"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="71999985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:27 -0800
X-CSE-ConnectionGUID: F1un8mAvQXSMcQb0h3vJpg==
X-CSE-MsgGUID: 84nr2wN0TAeTCeFHc7Rndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217627275"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:25 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: =?UTF-8?q?=5BPATCH=20i-g-t=200/2=5D=20test/intel/xe=5Fvm=3A=20Add=20overcommit=20and=20no=E2=80=91overcommit=20handling=20tests?=
Date: Thu, 12 Feb 2026 17:25:40 +0000
Message-ID: <20260212172546.794257-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series adds coverage to xe_vm test by adding over commit test in fault mode and
non fault mode.
Also added support to test the no overcommit flag (DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT)


Sobin Thomas (2):
  tests/intel/xe_vm: overcommit tests for fault-mode and non-fault-mode
    VMs
  test/intel/xe_vm: Test to check no overcommit flag in fault mode

 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_vm.c       | 634 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 630 insertions(+), 5 deletions(-)

-- 
2.52.0

