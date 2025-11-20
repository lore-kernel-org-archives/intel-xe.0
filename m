Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206ADCFA457
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 23:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66FB10E062;
	Thu, 20 Nov 2025 23:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSbzToOO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061E10E062
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 23:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763682320; x=1795218320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jqpQ4QYFIO9RzI1wZ+pLm7hhEuRTHB7vaKiXvAyAUb4=;
 b=dSbzToOOcUs6W+b/rnIjpPnPQGt/0sH9vnJB/b5lFDFzPw9bUSOOikHu
 jbMq5kGuZ8WGyl1qq8IzGAjMctcs2VjD1xj5NYzUuaMkBfSjszFJcrBoJ
 vTNGLzopVecViyjHuvQ8q/Ik3ZgOzCr35Vz6uKhL/bBqo/naMlln2F1Xr
 o/HVgIIHZ0xeGyIm36Sl2izq+iHB25atw2VjGTjqXyRa6oaBuOtmjVB4B
 BCRVm/RctDDkGm2JklzzshXqMTDKvFA/+RHZUmUU7fBxrjeHjYhzWcWpQ
 uYc5psyl3S/9EwCisc7yCynTgo5wdZahSSGjmLeIzh9nFGLayxzkAEHx1 Q==;
X-CSE-ConnectionGUID: B/9kRbijRKG4yJLbPE+ztw==
X-CSE-MsgGUID: f5Dw+ATiS0iMNa+1sakizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65807597"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65807597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:45:19 -0800
X-CSE-ConnectionGUID: VsG3Cc6GRWSJx9qj8UEtJQ==
X-CSE-MsgGUID: 2Flfn2HuQyWFP/vFLAdMQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="214877055"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 15:45:18 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] Silence allocation warnings for sync arrays
Date: Thu, 20 Nov 2025 23:42:54 +0000
Message-ID: <20251120234254.427452-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Suppress allocation warning as driver already return -ENOMEM safely.

Shuicheng Lin (2):
  drm/xe: Silence allocation warnings for sync arrays
  drm/xe/oa: Silence allocation warnings for sync arrays

 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c   | 3 ++-
 drivers/gpu/drm/xe/xe_vm.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.49.0

