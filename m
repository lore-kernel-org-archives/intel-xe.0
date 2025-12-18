Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F61D711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1776710EB76;
	Thu, 18 Dec 2025 21:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEJLorfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37D310EAD9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093389; x=1797629389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QEoRu40hvzhxmFvXEYAjdKvdnItgsq8VwDs7tssQOxk=;
 b=LEJLorflkIpXsPRcI/tkKrRcnvvZNGBslUd007eyksKUJqxLQ2qq7gMe
 xX36xMXSHRfrtU3e6Zo/TdoW36wsr9Jh3UuYLt6X2eZWOSpRJahUUt1QX
 by2EL0GYQB1a3G7JFzpSqbocyJkdS5X/c7zNOveukop4VdZ4Fyfmf9ZW1
 8d2L0TsnU2cnjg7yyrIvIRstXjkdMPFDsfx+/gMHqFOTccTKCD4Yq+Hgq
 du61i73lftxghXzrvINVjwfGu9UQ+PyHEyegeS/Cwg9xiXSZH4aOTfzJX
 27EnsbqzyCUproxFZm+5j3VSKAOwXpiFy8HJZHUlj/39UVH86+RCM/uCl Q==;
X-CSE-ConnectionGUID: lXnniFP2R2WMVjXZ3B03gg==
X-CSE-MsgGUID: 8iYyUoJTSqGpSBKHJJrMlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67808709"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67808709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:48 -0800
X-CSE-ConnectionGUID: Qo1p9lhsR7yuHqOjgkZV+g==
X-CSE-MsgGUID: p9iGOcP7R4K9ulmFiZZJ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198594087"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, dixit.ashutosh@intel.com
Subject: [PATCH v2 0/4] drm/xe/guc: Prevent compiler read/write optimization
 breaks
Date: Thu, 18 Dec 2025 21:29:47 +0000
Message-ID: <20251218212946.16577-6-jonathan.cavitt@intel.com>
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
g2h_fence->done values to prevent the compiler from ignoring these
necessary operations.

v2: (Matt Brost)
- Add Fixes tags
- Add comments

v3:
- Split into multiple patches (Rodrigo Vivi)

v4:
- s/xe_guc_ct/guc (Michal W)
- Add comments with READ_ONCE and WRITE_ONCE updates
  (Rodrigo, Stuart, Dixit)
- Squash patches with same Fixes target
  (Rodrigo, Stuart, Dixit)
- Add partial comment justifying WRITE_ONCE in guc_ct_change_state
  before READ_ONCE in xe_guc_ct_enabled is added (Rodrigo Vivi)
  - Update above comment when adding READ_ONCE to xe_guc_ct_enabled
    (jcavitt)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Dixit Ashutosh <dixit.ashutosh@intel.com>

Jonathan Cavitt (4):
  drm/xe/guc: WRITE_ONCE g2h_fence done in g2h_fence_cancel
  drm/xe/guc: WRITE_ONCE g2h_fence done in parse_g2h_response
  drm/xe/guc: READ/WRITE_ONCE ct state in ct_change_state and enabled
  drm/xe/guc: READ_ONCE ct state in xe_guc_ct_initialized

 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.43.0

