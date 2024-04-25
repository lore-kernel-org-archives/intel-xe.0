Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE34BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 18:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED4E11A767;
	Thu, 25 Apr 2024 18:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdUJ5I1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47478112117
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714069429; x=1745605429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wfRg6as02NvY6Lxte1cUomMzQFuXs8nXSzFJRl1QTY0=;
 b=IdUJ5I1UY08sUlxbJD/yScq2oB3xdCEu3CnfY4BAF34YTuGgb5ax3w34
 MGfbvs3DIY9EAyUU8znK0SS9w6eIAOkggaBxsKKynikp3mIAUlLIs8bwB
 lfS9po1QTIip6IPVy6P9k1UCfTSHXwaDWO13jvmS9mO2ZEo35oY1byZkb
 pQny6y59kmViKffywFNbwc39/cDQvuwybRMOCFlMZGt4AZ+wtSPykAQ+h
 Eu3Gy/AsgoxzBEWAYVZ9cUlFjcQGBQ/o7McXkSSWnA5hAx9nIr0N0PnOl
 3wJoQpZcqvnYsPNzy4nPjfiFRYfcHpWdky0v7UmcsRS+4cVJ2Rq0lIsFv g==;
X-CSE-ConnectionGUID: ji99ESqzRAm9nN6MFslUrA==
X-CSE-MsgGUID: RJM+2yPFSD66hIFfueg20A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9605753"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9605753"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:49 -0700
X-CSE-ConnectionGUID: QQmXh8eZRxKUywtWNzuFIA==
X-CSE-MsgGUID: QvM5nwe2Sfi2AqHYQUQ5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25157815"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 11:23:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: vinay.belgaumkar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 michal.winiarski@intel.com, matthew.brost@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] drm/xe: Fix early probe order
Date: Thu, 25 Apr 2024 11:24:05 -0700
Message-ID: <20240425182410.2705061-1-lucas.demarchi@intel.com>
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

( It looks like our initialization functions are in a less than optimal
  order, with additional functions being added in random places. We
  probably need to rename some to follow a pattern so this doesn't happen
  again )

What this series does is to fix the mostly blatant mistakes in the gt
initialization part: since the addition of hwconfig, the WA processing
is not done as early as it should. Future workarounds will require
XE_WA() matching much earlier. Move initialization around and drop dead
code to cover that.

Lucas De Marchi (5):
  drm/xe: Drop __engine_mask
  drm/xe: Drop useless forcewake get/put
  drm/xe: Move xe_gt_init_early() where it belongs
  drm/xe: Move xe_force_wake_init_gt() inside gt initialization
  drm/xe: Move sw-only pcode initialization

 drivers/gpu/drm/xe/xe_device.c   | 16 +++++-----------
 drivers/gpu/drm/xe/xe_gt.c       | 15 ++++-----------
 drivers/gpu/drm/xe/xe_gt_types.h |  6 ------
 drivers/gpu/drm/xe/xe_migrate.c  |  3 +--
 drivers/gpu/drm/xe/xe_pci.c      |  6 +++---
 5 files changed, 13 insertions(+), 33 deletions(-)

-- 
2.43.0

