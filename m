Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0875E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 06:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7BA10E0E5;
	Thu, 19 Dec 2024 06:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5xAeNyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9410E0E5
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 06:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734590074; x=1766126074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R8mhH2U03jKlR1lSihsSE50bLt87sEB3qHctng9yAl4=;
 b=S5xAeNykIkaBF1QMDmb8RJeS/ag78hdGY6s8USnKmYFl10sr6DslrHCm
 tjVMZz+IyQ9Wyn75zKExPDx0xhSaL2dns3b5X9xzCBAPeoBtn7RuwBRXN
 HoZFA4cRCIdD6hAAB6SWDgs6vMarntnJSQAMt/YSA8UUDVU5uttYREj7v
 b7jHpdpBZ6v7MvPRli/pTTMkUimwZAVErvqIPTZaWwAec7cv+5NSBFta6
 G4FsfupKoEAyDhN+vXInQ/glNeX0X+6i7g36kMbi0iLJgzSJzy7mzcx1W
 nmuKhozwC8IKGDpWw78HpV53E5DQYjdH8P8dKMcG2zEv/hUTFYF0+ZXlk A==;
X-CSE-ConnectionGUID: OdeUTTaAR3SZqDpUQUyBOw==
X-CSE-MsgGUID: aBX1VgCgQByOvcsCC77j8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34412606"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="34412606"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 22:34:33 -0800
X-CSE-ConnectionGUID: s8YDfPMfTdmMS5GAJg5a2Q==
X-CSE-MsgGUID: uyvOIGG4SS6OAPd2XbeXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97935501"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 18 Dec 2024 22:34:10 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv.
Date: Thu, 19 Dec 2024 12:19:30 +0530
Message-Id: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
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


Satyanarayana K V P (2):
  drm/xe: Introduce fault injection for guc mmio send/recv.
  drm/xe: Introduce fault injection for guc CTB send/recv

 drivers/gpu/drm/xe/xe_guc.c    | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.35.3

