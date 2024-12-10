Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C8AE77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0610E8F6;
	Tue, 10 Dec 2024 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsNMRSKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96D110E8F6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733841480; x=1765377480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AXL032kzEOYux7KfCPNsLtPDChavD2C9rBrhLUcsOJs=;
 b=LsNMRSKYKGviHxsuW/Rn2NTqxqAIo6pGqaMDzoe9B511vB/gkVLMHneR
 Zh9XDKYuCx48IZyTzUtTODepWr4p1E95hvuY0fTj0y9CRX5+jBHMMqPJT
 1liAKOmTH5WSdeY/T8tLppeUN+rScnsAGmIpp9vUpQayJa7AMoLJNlREK
 ItnG+AY2PQlErr0HkH3gpJ8W0HwzKurEfWINRoMSWn6Aj7EevzRR9e+se
 YOOwd50RjEOTWF4L2h+7ctzJ++f5y/E6mc5TqyE94Uh3ezrBmI1Tj6GsO
 E8drlYdpiYQAoFd1qzd2/D3aL4MdSYWHlU3opvAtOGeVw9y25YVDlu7+B A==;
X-CSE-ConnectionGUID: cGQGGuRiTdq7zSSlshtd3A==
X-CSE-MsgGUID: bigBhaXARleBzmAto+wHmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38114258"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="38114258"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:38:00 -0800
X-CSE-ConnectionGUID: 6tG21mYASeWUE2xN5hLGjA==
X-CSE-MsgGUID: Dt1gUu+YR6ukSgU0UYPgZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96240140"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:37:57 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, lucas.demarchi@intel.com,
 raag.jadav@intel.com, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v2 0/2] drm/xe: adding wait helper for gt async reset
Date: Tue, 10 Dec 2024 15:37:46 +0100
Message-ID: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
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

GT reset is asynchronous. However, in few places there is an explicit
wait for reset to finish via flush_work.
Providing a synchronous gt reset version and additionally wait helper

The usage of asynchronous reset in sysfs gt0/tile0/ccs_mode creates
a situation in which a user after changing ccs_mode with immediate
query can receive only partial configuration due to ongoing reset.
For instance a single compute engine where 4 were requested.
This sometimes happens in the EU Debugger tests leading to skips or
even failures (sysfs not accessible).
This forces usage of sleep() in tests to wait for reset to complete.

The first patch provides xe_gt_reset and a helper xe_gt_reset_wait.
The second patch makes ccs_mode sysfs write wait for reset to
finish.



Maciej Patelczyk (2):
  drm/xe: introduce xe_gt_reset and xe_gt_reset_wait
  drm/xe: make change ccs_mode a synchronous action

 drivers/gpu/drm/xe/tests/xe_bo.c    |  7 +++----
 drivers/gpu/drm/xe/tests/xe_mocs.c  |  3 +--
 drivers/gpu/drm/xe/xe_gt.h          | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  2 +-
 5 files changed, 31 insertions(+), 8 deletions(-)

--
2.43.0
