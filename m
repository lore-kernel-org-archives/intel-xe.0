Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DFC28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56E10E129;
	Tue, 11 Mar 2025 06:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQcQy/pJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF4A10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741676206; x=1773212206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+WJyXRwQ/9lfe3uSi2AgrLwQoMK+Qp8p0N87UW0SutE=;
 b=mQcQy/pJ4VQiE4NmmlfObLlfET5Uzs9LmNrQ6iaYnU1yX9+mDX7sUyt5
 dqsywKM5rCGQWr4e/oJIuX/BqpRaCHmZuHPghNo/o5iKQwc0Sm9i7G074
 PcSbRCj+sHkRqoToZJ+T4/gLFdeq0q6vR1DVBKedlva7+dWAC7w0EOX2d
 kDw+Ihs+DvGaSgqxxY4LNu4YgJfhXfgP2n9quYk3xcDTfPIoQLqaYyfYO
 ma2c1vNbgQksUMsG9mjB0VpoP3NEVUeYmKodPs1S8mvXDwkLRm+kdk2wY
 Q9eXmo0MxQqqg7G6/faQeZHcJLE0JEfyq8w4DW+ESMzhORN36/WcOhTgx Q==;
X-CSE-ConnectionGUID: gtoR+fFgRPaDl5rzOZlwlw==
X-CSE-MsgGUID: /ACQ3ywYTxibaAo5mXcbhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42415275"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42415275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:46 -0700
X-CSE-ConnectionGUID: VEGYexhvRNKeBF1zAjs/bA==
X-CSE-MsgGUID: VdVmkg8qQgWm+NMPDmuqNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120158242"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v2 0/3] PMU support for function engine activity
Date: Tue, 11 Mar 2025 12:47:56 +0530
Message-ID: <20250311071759.2117211-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Extend PMU support for engine activity for PF and VF's.
PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. To get function engine activity from PF,
the user must provide the function values using the format

function - config:44-59

If 2 VF's are enabled, then the applicable function values are

0 - PF engine activity
1 - VF1 engine activity
2 - VF2 engine activity

This can be read from perf tool as shown below

./perf stat -e xe_<bdf>/engine-active-ticks,gt=<id>,engine_class=<class>,
			engine_instance=<instance>,function=<n>/,
	       xe_<bdf>/engine-total-ticks,gt=<id>,engine_class=<class>,
			engine_instance=<instance>,function=<n>/ -I 1000

Riana Tauro (3):
  drm/xe: Add support for per-function engine activity
  drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
  drm/xe/pf: Enable per-function engine activity stats

 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  12 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  20 ++
 drivers/gpu/drm/xe/xe_pmu.c                   |  38 +++-
 6 files changed, 240 insertions(+), 38 deletions(-)

-- 
2.47.1

