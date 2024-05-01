Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D13C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4810EAC1;
	Wed,  1 May 2024 23:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILSn7K4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33C10EAC1
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 23:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714605518; x=1746141518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+xiNPFkyY9qtz0OK/ChjrE8fG5S5uanHqB5QgJvb2DU=;
 b=ILSn7K4RlOwAwFBjNjtoVBcL3mQ7L+8rIS2HZMP9Yz8tHG6ap4hTfp9b
 lyc3LGocedRx95euSedmCCh4FWd/lRSb4L4xbPiUvaptTtqi81zj4O+QN
 gqsVctrlGYEGAADP5W4m2moedoaB/lPTyn7kr11jImFL5dbVpUDO7uIBZ
 WAr1Eof6KIwerw779XltuweGOAe5mo0rfW004T1WahKnBkGijqKRIkdvX
 OcXglosi7AvKxWK3lJp5j9ebMQywD6YZ1wlctzxNRTlDc7IIwl7giOdfD
 Da+6bdLdMZ/gr4IuMniLcwo5HIqEkXeQG/1tQY/pAwVJCDnv4QGDn/BMK A==;
X-CSE-ConnectionGUID: HCeMpGd/QpSGqkznWWEGyw==
X-CSE-MsgGUID: LSJz0fCDRaWTHmPh9wGLyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14163346"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="14163346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:38 -0700
X-CSE-ConnectionGUID: u3+HtFpZSJaVa6KcMi+L6Q==
X-CSE-MsgGUID: vBi+GJUxTAyo//6OUb0xPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31408569"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 16:18:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [xe-for-ci v3 0/2] LNL GSC FW support
Date: Wed,  1 May 2024 16:18:27 -0700
Message-ID: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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

The flow is the same as MTL, so the only things we need to add on the Xe
side is the FW definition. Due to the FW not being in its final state
yet, we can't push it to linux-firmware yet so it needs to be in the
xe-for-ci branch.
Also, the mei patch required for the mei driver to run on LNL (which is
needed for GSC proxy) is not merged yet, so it has been included here to
be merged in xe-for-ci while we wait for it to land in Linus' tree
(via char-misc).

v2: rebase

v3: rebase on already merged GSCCS patch, add mei patch instead of
disabling SW proxy

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Alexander Usyskin (1):
  mei: me: add lunar lake point M DID

Daniele Ceraolo Spurio (1):
  drm/xe/gsc: define GSC FW for LNL

 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 drivers/misc/mei/hw-me-regs.h | 2 ++
 drivers/misc/mei/pci-me.c     | 2 ++
 3 files changed, 5 insertions(+)

-- 
2.43.0

