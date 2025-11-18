Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BFDCED63D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A610E1D3;
	Tue, 18 Nov 2025 19:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEN1FNqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6270D10E1D3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763492932; x=1795028932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cni6jgkDLCAjuZvwZrPhmhE31USxSqAefGCfJO3o7A0=;
 b=oEN1FNqDozFpNrFfDkWlq+JJbjOaR075UUzBh86HgvZOePW9yewhKkpn
 HfVvsSb51mN2tC4X3ah6JZtBcJ+VXMVedrpHm3ZMSBrR8tlsR5MNsphVp
 NwM4EQ28R2EqhQ78UmSADNq1mqYV+dimZ1A29PiL822Vm+TsQ3Gzquc6q
 yyCvMNmMYw/ncGO2RBXAD4Ca9txEalVpjg4L3s0z2KuvQM+zU2NUY2LPU
 mqkTzgVi0MdNjduSGVyX2pKaHQ3hLNSpnkb1+Ys4MdYma1XSYNDYYJhPN
 wHHFTS3RGzboqdM+ZJdQfFHTpBpdHrihp5F13eEz/Ir1XEEWoIQI2P3vi Q==;
X-CSE-ConnectionGUID: 75ZQE2RmR8mdJDQHe3bsPA==
X-CSE-MsgGUID: n4JiDW2PQCO9PDavfKYyPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68132370"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68132370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:52 -0800
X-CSE-ConnectionGUID: rikn4uDrQ0WtVO8rSqZ8mw==
X-CSE-MsgGUID: pbpdNM9ZTCSGvFhJDuXRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191627276"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, stable@vger.kernel.org
Subject: [PATCH 0/2] drm/xe: Fix and refactor CONFIG_DRM_XE_DEBUG_GUC
Date: Tue, 18 Nov 2025 11:08:10 -0800
Message-ID: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251117-fix-debug-guc-3d79bbe9dead
X-Mailer: b4 0.15-dev-50d74
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

There was a missing call to stack_depot_init() that is needed
if CONFIG_DRM_XE_DEBUG_GUC is defined. That is fixed in the simplest
possible way in the first patch. Second patch refactors it to try to
isolate the ifdefs in specific functions related to CONFIG_DRM_XE_DEBUG
and CONFIG_DRM_XE_DEBUG_GUC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe/guc: Fix stack_depot usage
      drm/xe/guc_ct: Cleanup ifdef'ry

 drivers/gpu/drm/xe/xe_guc_ct.c | 204 +++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 97 deletions(-)

base-commit: b603326a067916accf680fd623f4fc3c22bba487
change-id: 20251117-fix-debug-guc-3d79bbe9dead

Lucas De Marchi

