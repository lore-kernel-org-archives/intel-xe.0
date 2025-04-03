Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74AFC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636B410E142;
	Thu,  3 Apr 2025 11:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpUmq/OJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADABB10E142
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743681043; x=1775217043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1zlOwdH76zH5BYX5MHaXk4pqCw63TZV3eo8oJIwmJ40=;
 b=JpUmq/OJaPUjcjlCDYOzREXqxAGJrcD8+IHJXyn7jp8ILY3a35Uf6yuM
 gHz1gvLqMxiKUrxNii/4mCeaSM9iy5s4FzJwj3srL11jPsi14d8Iau1Q1
 ObsF+KjImvO2WNH885iGbHvGU1ILtp3by0EQCOUbJb+2GCUn5N5o95oBt
 uA8vcia8O4wTKZhEetMZjVJEOuO9dF1fHuipaH87Nto1Nil4uVSI27kln
 4hpd5lv2tRkRuW1JF2fFgXVlrs7+s0JGQzo34opRwBVEFZubHuVfpePnq
 YFgdW/XqRReO4m0/OcLviHYQTmRyt1EMryhhGePj9O4RHxtbK6dBzlyXU Q==;
X-CSE-ConnectionGUID: SIEqgyQoRLG/vUlVQgVzEA==
X-CSE-MsgGUID: ukRhtzj9RM+k+P8S8VceNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55754788"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55754788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:50:42 -0700
X-CSE-ConnectionGUID: 48SwB9tCTmu4tV3+P47QqA==
X-CSE-MsgGUID: rKXY6Fr/T++ORNOEZS5f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126973778"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 04:50:41 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv.
Date: Thu,  3 Apr 2025 17:36:39 +0530
Message-Id: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
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

Test-with: 20250328111532.16620-2-satyanarayana.k.v.p@intel.com
Test-with: 20250328111532.16620-3-satyanarayana.k.v.p@intel.com
Test-with: 20250328111532.16620-4-satyanarayana.k.v.p@intel.com

Satyanarayana K V P (2):
  drm/xe: Introduce fault injection for guc mmio send/recv.
  drm/xe: Introduce fault injection for guc CTB send/recv

 drivers/gpu/drm/xe/xe_guc.c    | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.35.3

