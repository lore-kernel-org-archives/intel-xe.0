Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68030C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EE710EED2;
	Wed, 13 Mar 2024 22:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8kVC685";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167F210EED2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367886; x=1741903886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Din/+FZlOi2okNuiq5BnNf91M0yWMN9/XuliyGim+4=;
 b=l8kVC685FHek1U8XvhzXODtwvvp5IPHENk2X401EKV3D5P8CxhuCIP+3
 z4h+e9kYyliSBohKwsOpeiCTjnxaKVFuI07oKOXQxmwhr/P18UzWF2vBR
 nQNO0gfe2kN5NrrcVvDVU7UoClhfiWqG0+9xTMT8cOKUxaRh8G24g1iKL
 617PqQBoq7BxMbKjTy/VWeLfE7uaHherrVcIWLqOlxPdIMNJNJnkgU24u
 h9KHs96URHygVi2+LtEjMJ9yl5LcoW530V1/ch526Qwx1WCiMvb7vHGkP
 scE3VQXNue1nGOHGqvK9ATFtZhGvrLxJLjfizxQDRzGLy2lJG7sOyounp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5027621"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5027621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11964295"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/4] Introduce GuC context ID Manager
Date: Wed, 13 Mar 2024 23:11:08 +0100
Message-Id: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

While we are already managing GuC IDs directly in GuC submission
code, using bitmap() for MLRC and ida() for SLRC, this code can't
be easily extended to meet additional requirements for SR-IOV use
cases, like limited number of IDs available on VFs, or ID range
reservation for provisioning VFs by the PF.

v2: review comments from Matt

Michal Wajdeczko (4):
  drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI header
  drm/xe/guc: Introduce GuC context ID Manager
  drm/xe/kunit: Add basic tests for GuC context ID Manager
  drm/xe/guc: Use GuC ID Manager in submission code

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 136 +++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 279 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  22 ++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  43 +--
 drivers/gpu/drm/xe/xe_guc_types.h             |  21 +-
 7 files changed, 467 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h

-- 
2.43.0

