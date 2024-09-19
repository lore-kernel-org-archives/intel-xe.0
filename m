Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629D7CF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2780510E012;
	Thu, 19 Sep 2024 17:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/kK9EwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845B10E012
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726766144; x=1758302144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ybJXkmmDxBmxbPY94YMQzvPlfDAFqSUhCx47wZyzWBM=;
 b=V/kK9EwQfwSom4qyePJYMk9aGqoyczyfsiLO0Nbpl4wW8RGJoXWJwKCA
 MivFQ8Tl91S6fihi2rCATSzpXgtKKyK7hlvD0VVVsPccGB45DyrIwLlRd
 exsbuphSsjCguNgs9J9kOtUWAotqI8tAThs/pBSRhS4PN6Di6gdlf3dc9
 wl8M6hH03XvpegNrqFyef3FYc4cfIoyz12gOs8u7Ehp6mJ5y5kqGwyvUr
 h6DGzxc9u0p/3omb+efmncooRn+MuWs8PV+cJxgjvvuI7RGk8AJinIeAN
 ADhxYF3stnYHxT8Jm737c/KSM20oZ+TnJ8yn+4B9b8SzVMZPAZUJfm7lP Q==;
X-CSE-ConnectionGUID: o9vjMGGXS8SMlswYkieDuQ==
X-CSE-MsgGUID: FGgqJTtuR86SnjlWklMnQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534492"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29534492"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:43 -0700
X-CSE-ConnectionGUID: w9oEMzPJR0WT9Glv2U1r7g==
X-CSE-MsgGUID: u4DCC6jDQdu4H1W0G4hg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107481115"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] PF: Add functions to save and restore VF configuration
 blob
Date: Thu, 19 Sep 2024 19:15:23 +0200
Message-Id: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

We already have support to save and restore GuC VF state, but that
will only work when the target VF configuration (provisioning) will
be exactly the same as the source VF configuration. To help with
assuring that both configurations match, allow to encode whole VF
configuration that can be saved as blob and restored later.

In the future we may want to use such captured configuration blobs
as templates to make sure we provision VFs with exactly the same
configuration that was previously tested or recommended, or when
debugfs knobs are not be available.

Michal Wajdeczko (5):
  drm/xe/guc: Add yet another helper macro for threshold
  drm/xe/pf: Update success code of pf_validate_vf_config()
  drm/xe/pf: Allow to encode subset of VF configuration KLVs
  drm/xe/pf: Add functions to save and restore VF configuration blob
  drm/xe/pf: Allow to save and restore VF config blob from debugfs

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 204 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
 .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    |   7 +
 4 files changed, 279 insertions(+), 14 deletions(-)

-- 
2.43.0

