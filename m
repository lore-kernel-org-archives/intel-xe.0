Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF846C0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1210E29A;
	Thu, 23 Jan 2025 18:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd4pljRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F5310E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737655420; x=1769191420;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2PqqMI7lunNx+kmAyFMY44XdFsNTTlHnkf0dD43ej8=;
 b=Wd4pljRq8DyzcOgGGKgkhcLavhHeGLef9uOuGULh8cdd8twp1Agr/wSi
 U1j+/oksnTATAxFubisFggrZwXWMnqplpDE2q3So4PB9druGJNqUS9fVb
 s6twSxJuJ21W4J9xXvTMwZfYIpoAQRrKpyX+mB5DdVMYUV6XpUeiPx2Gz
 AooxMPEsmv5ivP9LxcJ3sCfU/NuwHCQFesGQ6NWqx8lC9fYUCOWZUK+Lt
 dbiBZKICr2/bEO9vjZmK2U26CgpD0SYWzWXoVWgpZId5WrKLSExEMHKuD
 DODf7pg27hww92sh1USbpfjbEO7g2AQs7NZne76Z5TlxdLb8v5ePsnCzy Q==;
X-CSE-ConnectionGUID: IbYsbsbcRm6UU57sOyV1Ig==
X-CSE-MsgGUID: KKaGXD45Qu6Zsl7tWvowew==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49162865"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49162865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:39 -0800
X-CSE-ConnectionGUID: ml53rmFpTAGvz7gEaGjpGg==
X-CSE-MsgGUID: IDPX0DBoSM6l4fefeqiR8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107964006"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:03:39 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Enable GuC log dump and minor fixes in devcoredump
Date: Thu, 23 Jan 2025 09:59:40 -0800
Message-ID: <20250123180320.66198-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patches enables dump GuC log dump again and don't require any
change in Mesa parser.

I will follow up with some changes in Mesa parser to not output
the GuC log binaries but bo and hw context parser are still functional
without those changes.

José Roberto de Souza (2):
  drm/xe: Make GUC binaries dump consistent with other binaries in
    devcoredump
  drm/xe: Drop duplicated information about GT tile in devcoredump

Lucas De Marchi (1):
  drm/xe: Fix and re-enable xe_print_blob_ascii85()

 drivers/gpu/drm/xe/xe_devcoredump.c | 33 ++++++++---------------------
 drivers/gpu/drm/xe/xe_devcoredump.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  7 ++++--
 drivers/gpu/drm/xe/xe_guc_log.c     |  5 ++++-
 4 files changed, 19 insertions(+), 28 deletions(-)

-- 
2.48.1

