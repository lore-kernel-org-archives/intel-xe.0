Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48722C25B6E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBEE10E6C0;
	Wed, 25 Oct 2023 17:57:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6EB10E6BF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256675; x=1729792675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WHYsKhId5i9aB16MLaqNLfr3pmi/Qk9I0iTItN56bU0=;
 b=USGHkJxcKT8NY0ULZPrzm5+cZ3jMh6gmQca5pc21HQl6QuNIKl9KOe/m
 a4tL7gE5KQnv/Fqap4LFeoxSeb0vHADGrHJX1KOKIPeYL3kmF1EjATl7F
 hr0vvIMp6DfFYa8zN/v3ISf61qs0kBhUilZkrbA9fGZf+hx7JxOTbBygF
 3agBC2wpAksbZaq6THaJVhQ8BUc2QVDGeMqkTLP1DqFaMCvZQMDcTLPfE
 XcA5SaXFgHq70YEzDfyoFy5ssvRhvrIYi4L3S1SR5/AkKlz8cxGMtVq2F
 UoJLaPHeTNmaj5KKR72QcIoQBphRucU0dJeYspTndMppn94rwC/69CvMo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386249955"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="386249955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6642406"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:56:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 10:57:40 -0700
Message-ID: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] drm/xe: Clear-media HuC support for MTL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MTL supports HuC on the media GT with a 2-step authentication flow:

1 - authentication via the GuC for clear-media
2 - authentication via the GSC for protected content

This series introduces support for the first step. The actual flow to
authenticate via the GuC is the same as in older platforms, but the
HuC binary now has a new manifest which we need to parse. From the
manifest we can extract the offset within the binary that we need to
provide to the GuC for loading.

The second step of the authentication will come as part of GSC support.

v2: stop using the filename to check which headers are available, split
up old code move to separate patch, add new code and docs to uc_fw files
instead of huc ones.

v3: update to parsing code to use separate loops, rework marker check.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Daniele Ceraolo Spurio (5):
  drm/xe/uc: Prepare for parsing of different header types
  drm/xe/huc: Extract version and binary offset from new HuC headers
  drm/xe/huc: HuC is not supported on GTs that don't have video engines
  drm/xe/huc: Don't re-auth HuC if it's already authenticated
  drm/xe/huc: Define HuC for MTL

 Documentation/gpu/xe/xe_firmware.rst |   5 +-
 drivers/gpu/drm/xe/xe_huc.c          |  17 +-
 drivers/gpu/drm/xe/xe_uc_fw.c        | 248 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_uc_fw.h        |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_abi.h    | 127 +++++++++++++-
 drivers/gpu/drm/xe/xe_uc_fw_types.h  |   2 +
 6 files changed, 338 insertions(+), 63 deletions(-)

-- 
2.41.0

