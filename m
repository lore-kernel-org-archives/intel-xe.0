Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FE4C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 20:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEE310E1C4;
	Thu,  4 May 2023 20:53:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4873B10E1C4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683233587; x=1714769587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EP9RuSL0J6cF2Z5XdpXYMYSZbpnzIupTL3+W5FSGBIc=;
 b=U0gUZW4AbzSqk9cuxyaHKBo36LkRD9hKM2Dm0Rm6uYxljOh3bfSuGYhQ
 qmiHjZevr/nhwhhlhs4/In6115b6nMorCaeLtpoB5M2P1yx5I/MEbCx9s
 nNeVs1owU1Iwrw4iPPtcj4bZKFifXdMfJ8xHDZugCl3X+iPE61ZDWHxlm
 eIjZs8z4oSAEMgVQRPH5Rr/bZxVZiFaZEEA/0MD00UvyVLmp/AK9vy84H
 Cxgnh9m9IBE76ktVwSRL9LZcECB8sbo1aKXvb8v97ka9hezpAeaNTPoSO
 fPFWaSe+5RrvC44qteMUxQnBaZopn4G2Nn5WG6W3FyHnjeIvGnh+HkARE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347873926"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="347873926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727733288"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="727733288"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:52:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 16:52:46 -0400
Message-Id: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/4] drm/xe: Rework multi tile device memory
 initialization
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
Cc: tejas.upadhyay@intel.com, michael.j.ruhl@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

v2: Address review comments
    - separate tile sizing to the initial patch
v3: Re-add deleted warning for small bar systems
v4: Address review comments
    - stolen size check should be against pci resource
    - limit size (patch 2) to keep bisection correct

Michael J. Ruhl (4):
  drm/xe: Rework size helper to be a little more correct
  drm/xe: Simplify rebar sizing
  drm/xe: Size GT device memory correctly
  drm/xe: Rename GPU offset helper to reflect true usage

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  18 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 274 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  34 +--
 9 files changed, 205 insertions(+), 159 deletions(-)

-- 
2.39.2

