Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C5DE6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10B10E376;
	Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc5OcNWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D269210E208;
 Fri, 30 Jan 2026 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769802574; x=1801338574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UNPg2k9NCGEdxs2Ipcka7zeqB3c3EOb19DQvc5BI038=;
 b=Vc5OcNWpTRWatkjYqPHLOi3CoV3aRI07Q04RBMch+YmdzVcrXKIZ8io5
 hlgARCzzRKAskO3ZJkw8nNsoGcBhnVpFup6j6MY3NxNl2SWnQcuQEhFFj
 ArbLUJp7CV/Jmiwx4hdHv5kaxHl9nlYT99FnLD1YBVUFRcehl1qSpBguc
 AG1TOJF/AeeiPhx9D9nV0BVaNzgw+fdO/bb39Q9wjLQyqNlrmikBMofO7
 Ahvm7Iu9Xibg8iwqlQLlkwXGOx2i99xVyP+RfZgGPZb80W9ZZNLh8LxRa
 Mnp7ptT4fGBFLxCMuFjdTCUKFx+RND/GrCUte3j02tMcUm7rXukJp+WW1 w==;
X-CSE-ConnectionGUID: /5BPUUBIRHyCtAyNK1cv2g==
X-CSE-MsgGUID: yCBVFDZpTbiFNrmdKtUE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70260318"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70260318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:33 -0800
X-CSE-ConnectionGUID: yQbk8/K5ShqCDQNFUh54eQ==
X-CSE-MsgGUID: t7Pfqs7CTjC5GyQ22p+tdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="240202394"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/2] Small GPUSVM fixes 
Date: Fri, 30 Jan 2026 11:49:26 -0800
Message-Id: <20260130194928.3255613-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Noticed a couple of small GPUSVM issues which need fixing.

Matt

Matthew Brost (2):
  drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
  drm/gpusvm: Allow device pages to be mapped in mixed mappings after
    system pages

 drivers/gpu/drm/drm_gpusvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

