Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B6C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAA310E638;
	Wed, 10 Jan 2024 17:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935D610E638
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908796; x=1736444796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BMqebEs9vOX7vJfMPNHZIa8U7I/q8iD/MimhaLG9LrU=;
 b=Ng3PNAjJ60aBx5ygwXrKrJLjF/GxH1c+95hB9/hfbyrlE01us1lbim5D
 40OAEenPIa5zFnN+Gndkaz/UdilGYPPTFb6+4yPdCahv9kGEQ82Ds5LgQ
 bGZ2rLKpJfkZk4JA6mBYpM3Hn/rWk75vbRMWi+MUfiGiE0YdFaSZA3BC+
 h4Ite+tzb3Cm9MkQWrwU56eVVux3ozlOLRPJTbhSQrLtcf8HHl4kxOmwV
 Jrg/NZ9dmdQlK877o0ZACR1r0gfeUL2WAtdA4mXGbhMoBO7XjIkjzHJnF
 bbbBTHLVivh93Fpi8EonVGojrsXlEszTJHgr0sYVhm7bWxhoJklarAdyH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389031979"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389031979"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24029855"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.210])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:46:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] Introduce GuC context ID Manager
Date: Wed, 10 Jan 2024 18:46:18 +0100
Message-Id: <20240110174622.409-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI header
  drm/xe/guc: Introduce GuC context ID Manager
  drm/xe/kunit: Add basic tests for GuC context ID Manager
  drm/xe/guc: Use GuC ID Manager in submission code

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 136 ++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 292 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  22 ++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  37 +--
 drivers/gpu/drm/xe/xe_guc_types.h             |  21 +-
 drivers/gpu/drm/xe/xe_uc.c                    |   5 +
 8 files changed, 479 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h


base-commit: d6ef9c52d8d2ae4c85bc598b74a259db081fff26
-- 
2.25.1

