Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A07C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738510E3C4;
	Tue, 21 Jul 2026 19:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPxs9AXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F71910E3AA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784661045; x=1816197045;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=n/T/XE05souDQ2sljIQ2poJgFtV+qL1HUB6UGhfc5u8=;
 b=bPxs9AXd6LKITn6fb0pQKqvTURCaY6qPSXZMIAE3S58y3dmtJP01HiuK
 J5Mixf04GQKO1hNYiW1P7XOZzAdrDRtNSWDq8PlQcTb85jyA8+I+tyi54
 Hww4wtRV3OT+8DN4IisuHfbDnQxq6aOh1IupqvidWY+1K/P2oiKlWFs76
 Uy047a4HiCd0MQ4Fmmu+rA5Zg11y7AccYp2ORMHnqEu+GvT6F64xs6eOs
 oK3+cobnSMpN3xsXS2zy8AtwoH67STjYWh7lS45oqZ6lT+PfONVS1CJfB
 crITEBB2OFGIUpMEkbF5k4AY0OWwlIr/6Qjwd/Ti8OvkvmNThTpNhePiq g==;
X-CSE-ConnectionGUID: q1symCEzTUKvkJu7ucwp8A==
X-CSE-MsgGUID: sa9nWTKVTteK7X4I46V7rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85295082"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85295082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:45 -0700
X-CSE-ConnectionGUID: 0CoR3N42TOubTQmZ3ztDgg==
X-CSE-MsgGUID: pCe7kcBMSGGl2zC9TpyHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282374150"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/3] drm/xe: Update Wa_14026539277
Date: Tue, 21 Jul 2026 16:10:18 -0300
Message-Id: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fLEeEMTIMfU2NLI3FzXMsXYMjHVwDIxydxUCaipoCg1LbMCbGB
 0bG0tAMrN5bFgAAAA
X-Change-ID: 20260701-wa_14026539277-9d39ae09ab75
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  Let's revert the
existing one and then add the up-to-date implementation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (3):
      drm/xe: Extract override_has_cached_pt()
      Revert "drm/xe/nvlp: Implement Wa_14026539277"
      drm/xe: Add up-to-date implementation for Wa_14026539277

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ---
 drivers/gpu/drm/xe/xe_pat.h          | 10 +++++++
 drivers/gpu/drm/xe/xe_device.c       | 27 ++++++++++++------
 drivers/gpu/drm/xe/xe_gt.c           | 39 -------------------------
 drivers/gpu/drm/xe/xe_pat.c          | 55 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c           |  5 ++++
 6 files changed, 83 insertions(+), 57 deletions(-)
---
base-commit: 3df5500bae7f8b1be2877ab60b924be7cb88d722
change-id: 20260701-wa_14026539277-9d39ae09ab75

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

