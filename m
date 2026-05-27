Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B7CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60AB10E782;
	Wed, 27 May 2026 11:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYuaou2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A276810E782
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779881729; x=1811417729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1wo8fERZaSTxJAbuEK7EJQ3wBFFopGg3jMd9t2sW260=;
 b=kYuaou2GBgf++0fpyVgY0dmWGL5yaztcux1iYemVSiAaisLhKgzh9qfa
 heeoUkK0BFw8Zn/kz1IntbMCQIRO+5OEPmsnh/N9GN8lzH5BQtPYH1PX1
 WPTOks3T1qsV9/BrdTtuKapHTaWK+1fbEWLdoYxjxsWO0YdsTnf6gf0xg
 d22NUzn92WMXrTr30XPllXq+d+R+eOZyJyJvxV8aZv4EIq4nyJH9h0xZS
 o4rc8HIxk/G2iYLd+1crEKyWq+/DMLpriEnhda60/lXWavT75Jo6FUaZC
 Ex+EfClrSlu60VCcctUx71wO19FzqszxItyHrm5qtHoX3FypDmMOLOIBc g==;
X-CSE-ConnectionGUID: 7EMeoEDFSd6pfK6lyjS0ig==
X-CSE-MsgGUID: acjrysTfTjSMk303eSqFWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98285496"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="98285496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:35:28 -0700
X-CSE-ConnectionGUID: vwYzLJt6RIGrRiy3J9VXqw==
X-CSE-MsgGUID: WlK9xV2+RUGtu+mG+YA7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247164446"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:35:26 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: sk.anirban@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 0/1] drm/xe: Add fault-injection support for CRI throttle
 reasons
Date: Wed, 27 May 2026 17:05:12 +0530
Message-Id: <20260527113513.1650375-1-ravi.kishore.koppuravuri@intel.com>
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

Introduce fault injection capability for
xe_gt_throttle_get_limit_reasons() to enable robust testing of throttle
reason reporting under failure scenarios. This patch incorporates error
injection hooks that allow checking the behavior of the frequency
throttling. It ensures that the error handling is properly implemented
and handled.

Required kernel configuration:
CONFIG_KUNIT=m
CONFIG_KUNIT_DEBUGFS=y
CONFIG_FAIL_FUNCTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FUNCTION_ERROR_INJECTION=y

Usage example:
Setup fault injection for throttle function

FAILTYPE=fail_function
FAILFUNC=xe_gt_throttle_inject_errno

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -1 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

Sample result of verifying throttle reasons on Battlemage platform
```
root@DUT2117BMGFRD:/home/gta/igt-gpu-tools# ./build/tests/xe_fault_injection --r throttle-reason-fail                                   
IGT-Version: 2.3-gc4a3de72e (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
Using IGT_SRANDOM=1779875098 for randomisation
Opened device: /dev/dri/card2
Starting subtest: throttle-reason-fail
Running throttle-reason-fail with non-CRI mapping
Injecting error (0) into BIT(0) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : prochot
Injecting error (-1) into BIT(1) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : thermal
Injecting error (-5) into BIT(5) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : ratl
Injecting error (-6) into BIT(6) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_thermalert
Injecting error (-7) into BIT(7) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_tdc
Injecting error (-8) into BIT(8) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl4
Injecting error (-10) into BIT(10) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl1
Injecting error (-11) into BIT(11) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl2
Subtest throttle-reason-fail: SUCCESS (0.249s)
root@DUT2117BMGFRD:/home/gta/igt-gpu-tools#
```
This enables comprehensive testing of error paths in fetching the
frequency throttle reason.

Ravi Kishore Koppuravuri (1):
  drm/xe: Add fault-injection support for CRI throttle reasons

 drivers/gpu/drm/xe/xe_gt_throttle.c | 34 ++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

-- 
2.34.1

