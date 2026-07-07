Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19CC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 17:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239F10E0C1;
	Tue,  7 Jul 2026 17:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duP/4FZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B510E0C1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783447027; x=1814983027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=55diMDnLKtdvaesbdZ0FVZpkuINaY+68UCH0p3iLAto=;
 b=duP/4FZzYudiQD0Yu8zH368bnyfnJZiLxybiAGaUCcNWZBOQEqurpk7F
 5NEiImlTLU8DRkPLsKEmpkr0+x9uvEs+onXCCnufk4DXGcOG2PX+8QFhn
 3EQ/ZEC1HH6Pd/MIT2gjEV1wzVgTEu/O+AHN9WgWJS/fn+mz0EBQdA+5X
 uPUMyZ3UOgS8uJRT9BqBlyMyVi9jMpcJzknPHS6B9shHzflIrmU2ZfSeu
 7r4PHkWMsVXiHs+mL/EAYmZDm2whqncrg/B226sFwB2K+up5PL6WA7Y9a
 46bqPqXAOnzQer8SxtxQW8icvRPUuybhV0Vb3/N+C0gIOg9g8OojHlX7n Q==;
X-CSE-ConnectionGUID: nUOFk9o1TUaBWfILFSvIQQ==
X-CSE-MsgGUID: ToXFH8+tRG2uFXkU62eH3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86651275"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="86651275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:07 -0700
X-CSE-ConnectionGUID: 6+0BieXmRNS5JVX8ctqJSQ==
X-CSE-MsgGUID: PUZx5jBoTaaZlZGlnEiDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278436315"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 10:57:06 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/6] drm/xe/nvl/guc: Add NVL GuC firmware definitions
Date: Tue,  7 Jul 2026 10:56:33 -0700
Message-ID: <20260707175638.30935-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Series is intended to move Novalake S guc firmware definitions from
xe-for-CI branch to drm-xe-next. Update firmware definition to use major
versioned GuC firmware and recommend 70.71.0 (UAPI 1.37.2) version for
NVL.

The series is organized as follows.

- First 3 patches revert firmware definitions in topic/xe-for-CI branch.

- Patch 4 to Add GuC firmware definitions for NVL and initial recommended
  firmware version. To be merged into drm-xe-next

- Last 2 patches are to be merged into the topic/xe-for-CI branch after
  rebase onto drm-xe-next branch



Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

John INTEL (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Julia INTEL (3):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"

Matt Roper (1):
  drm/xe/guc: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.51.0

