Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7088C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 23:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DAD1128AF;
	Mon, 15 Apr 2024 23:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvyEkIyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E253D1128AF
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 23:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713223205; x=1744759205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CoppqfLpRcJemOxhGZj+A7Er62kIFNG9iFWaovmSn/Q=;
 b=ZvyEkIyGiaGYP4VPANhXYMvGuOasN91QdzejrwaxIeDFEtAdDU7uzLVJ
 V4nCyCQKvU8H6twOKgtal0T3/NEaNRPpFdZm/hSnezZayGSFMphs8UNhx
 W83+aOCZhLW22IAcoDSrOFavXqP8UJW2Q/s85omJicX2FaF9LpAAZQyqP
 GmKoeQDZdzEP8BU1uhvrShpWjbY5EbH5zA5ZKbgYveF/T15ZUEqERoiUu
 Bj+97ax0apZwxK6Wnx2WTXY202607ZVoaIs6IqlVhN7ozho5fxbBym4bm
 /kZormj9M8aFpqrD1kPG0lX+Rw+gHeAcqjwfVQX/LNI6P5UcEN6hp/OPV w==;
X-CSE-ConnectionGUID: +udn1KDnRyKlG5p2Vudp8A==
X-CSE-MsgGUID: 1e+ZiCn2RKCNwKvcPr8oeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8496772"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8496772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:57 -0700
X-CSE-ConnectionGUID: Rcg6O7sHSDac1d5dfOrTCg==
X-CSE-MsgGUID: 19dAW/zkQMWbwG41qhHSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22141830"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:19:55 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/3] LNL GSC FW support
Date: Mon, 15 Apr 2024 16:19:44 -0700
Message-ID: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
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

The flow is the same as MTL, so the only things we need to add are the
GSCCS and FW definitions. 
Due to the FW not being in its final state yet, we can't push it to
linux-firmware yet so it needs to be in the xe-for-ci branch. Also, due
to lack of mei support, a second patch for xe-for-ci has been added to
avoid attempting to use the GSC proxy until the mei patch is there.

I haven't yet added the gitlab links for the xe-for-ci patches because
the mei patch is expected to be published soon and therefore the patch
to skip the GSC proxy init might end up unneeded. I'll add the links in
if we decide to go with the series as-is.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/gsc: define GSCCS for LNL
  drm/xe/gsc: Skip GSC proxy init
  drm/xe/gsc: define GSC FW for LNL

 drivers/gpu/drm/xe/xe_gsc_proxy.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_pci.c       | 3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c     | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

