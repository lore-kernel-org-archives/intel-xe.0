Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA90FC02196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 09:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D0A10EA88;
	Fri,  7 Feb 2025 09:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKT0Pd96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F1A10EA81
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738920228; x=1770456228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqKPHYnTCXfbVl0t3iJK2Amy88FtR2BTrEaErRCAA7g=;
 b=HKT0Pd96zH9ZWJaMXrJX+EYT3TO8iouK4dfTmKu2ApH4eYY+q41bC+FN
 oXCh3it9/6Im0khJdKFgda+9xeFB05PGUb8Icocn+LwVDXxdVdHtuOZzI
 7+8RjBT9d4EuA+Fho/mTJaBLexfdtCd4OIZogOhwrAnrlhnG1xrGVc5aW
 NZ9ph6uD/Vs9XQ07ltL+CGeHTlCsDFw921qCkE/mMaOu5Q4mjP5TNBBCD
 5ypNVsPOe1zX412r34/HjIlzEYGd+9kRm5yxnLPkSTlye6I00LiXHLWx9
 zFs/lnEUh0L40oaZRza13e2KhopSltBpRh7tg+sgYpvHinWKmqKqQTs0u w==;
X-CSE-ConnectionGUID: xvrXPe7kT3elHnSczvwpyQ==
X-CSE-MsgGUID: tzT/VrsNTguo2wziIoUD7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39686319"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39686319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:23:47 -0800
X-CSE-ConnectionGUID: cCVLYMczRjCd9a3IaJO8SA==
X-CSE-MsgGUID: YTgO2Er3SIS/jCIj8H/OLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111995210"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 01:23:46 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv.
Date: Fri,  7 Feb 2025 15:09:14 +0530
Message-Id: <20250207093916.20509-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
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

Introduce fault injection for guc CTB & mmio send/recv

Enable below Kconfig options.
CONFIG_KUNIT=m
CONFIG_KUNIT_DEBUGFS=y
CONFIG_FAIL_FUNCTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FUNCTION_ERROR_INJECTION=y

Fault can be injected with below steps.
FAILTYPE=fail_function
FAILFUNC=xe_guc_ct_send_recv

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose


ALso, can be tested using IGT with 
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv

Test-with: 20250207072902.12582-2-satyanarayana.k.v.p@intel.com
Test-with: 20250207072902.12582-3-satyanarayana.k.v.p@intel.com
Test-with: 20250207072902.12582-4-satyanarayana.k.v.p@intel.com
Test-with: 20250207072902.12582-5-satyanarayana.k.v.p@intel.com


Satyanarayana K V P (2):
  drm/xe: Introduce fault injection for guc mmio send/recv.
  drm/xe: Introduce fault injection for guc CTB send/recv

 drivers/gpu/drm/xe/xe_guc.c    | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.35.3

