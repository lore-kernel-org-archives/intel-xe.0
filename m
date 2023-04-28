Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0612CC77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 21:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B8810E02F;
	Fri, 28 Apr 2023 21:00:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADAF10E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682715637; x=1714251637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2aE5s6nptwkk3g4KkPwEGFzCjVlZw/jB5rovGajTUz8=;
 b=jlJl2b3nC53Ibz1LxANTSncelOtf96FL0oHbaBQqE1TPgodLQIC2xUXu
 I9z6Nc3O0MlKfvhmNHnj7EAdG99pHThqYb9N0tQBpu7g6LxQAz1hyIUsU
 V/mpQMZyITmQLaEvdtAWC1ti8Jz3dYG5gqgl+0aYYTqT/aIVXejUcgTcn
 sljws0743eG8NMg4NWBLja84Vxr5wTJXkjQgr3/eQ9Ytbr5OgkI7VXCA9
 P3slUw7SHgRf2VGHe5reK/Zcq82KdhHhUtHNCRipqYuePwM2SCXI1WbOZ
 sVsnC68Hw14GTSO58aTsw/gGXOTlzjIWx5Hg3M50Q45gbzSGc3VyFbGoo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346625013"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="346625013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819147166"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="819147166"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:34 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 17:00:24 -0400
Message-Id: <20230428210028.4084872-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] drm/xe: Rework multi tile device memory
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
Cc: michael.j.ruhl@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

v2: Address review comments
    - separate tile sizing to the initial patch

Michael J. Ruhl (4):
  drm/xe: Rework size helper to be a little more correct
  drm/xe: Simplify rebar sizing
  drm/xe: Size GT device memory correctly
  drm/xe: Rename GPU offset helper to reflect true usage

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   3 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  18 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 272 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
 9 files changed, 201 insertions(+), 156 deletions(-)

-- 
2.39.2

