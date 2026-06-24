Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363BCDE000
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 22:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A0B10E127;
	Wed, 24 Jun 2026 22:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpXAbAlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8F210E11F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782341239; x=1813877239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ACDyYGIuEGzlW05SgZWCWY/LioJNjAhkCuJfoA4lp4E=;
 b=XpXAbAlgig4HxWez9eaOcLnRyz4DoYZAme7vRw4CGdwQD0Tn32rOuZ3m
 qo+7h4fh+tRJByESt1e5vEO1d7sckAMrXPfiGfZc/rGJJBgaTuJvmpou6
 dqXhiD1I+twJueuePBLYHCNdSOTAJ+T3b1TCjQd8qW7PSt8GB9dnP91lg
 G1Fttu+iKnh/L+5DuF76ZxfGOAMa/xjNAbCHFXa4Yaxp09TZfjsMJE3ng
 phf0Li2ImaPg1MkkvRbZp5WSMBR/Hf/Z890yVQsv4k/9YeR3w+aJ/a/0b
 VJXpsrDVG48orqhBF+mpYJU/F1yL2DX/Ilm9XKUfs0IqonQOk/iYrh1zV w==;
X-CSE-ConnectionGUID: 39mlMRl+QlSsUmyO8nfzew==
X-CSE-MsgGUID: FvJc/m4lQzaAe5OpPvId1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94233915"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="94233915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 15:47:18 -0700
X-CSE-ConnectionGUID: BNRDDnofRAWLJGkb75p3Xw==
X-CSE-MsgGUID: NhxFsD/gRaeLKL5P3gCN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="249905263"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 15:47:18 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1 v4] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Date: Wed, 24 Jun 2026 15:51:03 -0700
Message-ID: <20260624225105.2355641-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Attempt again after validating this in the internal tree for a while.
I hope this time it will pass the CI.
I knew Matt Brost wanted to have a GAM port layer for the mmio access,
but not sure if it worth the effort if the only usage is for MMIO-based
TLB invalidation.


Fei Yang (1):
  drm/xe: Wait for HW clearance before issuing the next TLB inval.

 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

-- 
2.43.0

