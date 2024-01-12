Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9D4C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012F10EB2E;
	Fri, 12 Jan 2024 15:26:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B8B10EB2E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073220; x=1736609220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sq7djiLmVKtSDtHoy54gQT3RHfdNxVFrS2wm7Cx93qI=;
 b=j0T0mmjJRNAnKVK8r+YinWvsraPfmVhx9hSjP5iYyRbRInczh89wYvRJ
 aRBwo2VgrYi9WoLuyUXyeKsjSFUaOlWcQHKazMgCnCV+VIjvv7bruqhGY
 Z+EtpZvyni3kxSIlclbf1x5JmSjQuwFyvaHCdkkTkjlDU9AAlqo0VKuuA
 UFwuxP0Y2V2b9j/r6kC3UgxzyPS0E0M4ckst8tfdUfpSBOPgqY3iyJ0mT
 8ptp8jZJCUP76b2r2NWHcWc0DNwYmPWOrxj9NpD0cInsqY/KgiHV3YErL
 B5Np/Za7G0AOwMYp3PJlgR2p9HZZj+CelSxX7Mwwgc+qJs4lZBN5wxuoL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566356"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566356"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003116"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003116"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:26:57 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/8] VF Tweaks
Date: Fri, 12 Jan 2024 16:26:41 +0100
Message-Id: <20240112152649.849-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Virtual Function (VF) has limited access to the registers.
Start avoiding using them if we run as VF driver.

Michal Wajdeczko (8):
  drm/xe/vf: Assume fixed GSM size if VF
  drm/xe/vf: Don't try to capture engine data unavailable to VF
  drm/xe/vf: Don't program MOCS if VF
  drm/xe/vf: Don't initialize stolen memory manager if VF
  drm/xe/vf: Don't check if LMEM is initialized if VF
  drm/xe/vf: Don't enable hwmon if VF
  drm/xe/vf: Don't program PAT if VF
  drm/xe/vf: Don't support MCR registers if VF

 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.c         | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c      |  5 +++++
 drivers/gpu/drm/xe/xe_hwmon.c          |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c           |  9 ++++++++-
 drivers/gpu/drm/xe/xe_mocs.c           |  4 ++++
 drivers/gpu/drm/xe/xe_pat.c            |  5 +++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  5 ++++-
 8 files changed, 54 insertions(+), 3 deletions(-)


base-commit: 7a20187068bed91b523795a18219e570f1e84eb1
-- 
2.25.1

