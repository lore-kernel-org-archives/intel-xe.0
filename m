Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE2CE77188
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 11:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F62210E10A;
	Mon, 30 Dec 2024 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhcCNQD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5E410E10A
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Dec 2024 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735558111; x=1767094111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6ogR5Mvm2wLDBvlFdf8sdOpSejSa1ihPr1U6h05jwY=;
 b=dhcCNQD1w1vGobKvAYl6I/GdKTWype/VxbBjuJTU5+zLvOjZX3jDNxvF
 AWiO+R9eB/iRCbHJK1CNkrIg+nnkXml02otjn8xbtign1z/pPectBfLm9
 3B6oiM0VwNZWoqcuPZ3km9wvNUpgaNvKdEHJ8Y3BS11e0I5R2lLd9llRw
 l4nHl7635wo0WIKW7dqAfyOD57aIGmi0EdEom1zxHn9igNyo30BWS5ZYf
 pNny2Awmcwyi00PX7pPPfpaS5esUp6YPSXad2HbxqAmQvUc89XiJLzqfJ
 c3PoJjujle63kv1q3DYiaais+U5cg2xBCEV+cU9QekZhkAYCt0fa1/tn1 A==;
X-CSE-ConnectionGUID: 1KTo3+fLT1qjADcr2zW6jw==
X-CSE-MsgGUID: o77xofj3Roavuql9v3UtZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="61215166"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="61215166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 03:28:31 -0800
X-CSE-ConnectionGUID: CbXkA0gSTXeu4Ky1wWUPDQ==
X-CSE-MsgGUID: UFcdUtKcQeeKsKhE+P5aNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100614424"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 30 Dec 2024 03:28:29 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv.
Date: Mon, 30 Dec 2024 17:13:45 +0530
Message-Id: <20241230114347.2534-1-satyanarayana.k.v.p@intel.com>
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
igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv
igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv

Test-with: 20241230104008.25403-2-satyanarayana.k.v.p@intel.com
Test-with: 20241230104008.25403-3-satyanarayana.k.v.p@intel.com

Satyanarayana K V P (2):
  drm/xe: Introduce fault injection for guc mmio send/recv.
  drm/xe: Introduce fault injection for guc CTB send/recv

 drivers/gpu/drm/xe/xe_guc.c    | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.35.3

