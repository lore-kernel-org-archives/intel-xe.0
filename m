Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83689C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4269110EEDA;
	Tue,  7 Jul 2026 19:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4RWQzpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5BB10EEDA
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783452356; x=1814988356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SDnn/1/T7cwlOEyr+pCsNDdI3hPeIL2QlontdxgkJRQ=;
 b=Z4RWQzppbtEQv87WQti9zr7LqX3Vrvd9mPtUDsCqxPYZIWNkZ+0RNpn8
 xfN/QZmxfGLmgqcatMUxt3W9vYCCgtliZ0FUaEFUj49LoRyduTmPGkrc2
 g4ArEEdXSM8ZjBM8PWQf28kseS8A9EAfTzdoVInTRD9BZlsUJcgMXzwe9
 Aqvs6m2oVcv7K7QQXdR/bHzoSZRooAtTwlm4YC1Q89teGWL6PLGVbsmze
 kD2uAqfV9p9rIkEjfXM1KZDY51QWzGyGccqzY+Lo1e1q2tirfdSY6g3oO
 6eOVMwa74E5vMT1OuraVPFx+RC5ShAFrdf/Tk7ki3FUq4IzqkcQ3RXRqO w==;
X-CSE-ConnectionGUID: DLtvxODSTouDP5Xp6bFFTQ==
X-CSE-MsgGUID: PR9sifqSQE6Ut3ZrB04MHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101657838"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101657838"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:25:56 -0700
X-CSE-ConnectionGUID: 59wQWymDQByQBt0w+lWTNw==
X-CSE-MsgGUID: 8Cw+ZQDkRfiThNZR4rLr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257960781"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:25:56 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 0/6] drm/xe/nvl/guc: Add NVL GuC firmware definitions
Date: Tue,  7 Jul 2026 12:24:36 -0700
Message-ID: <20260707192547.50535-8-julia.filipchuk@intel.com>
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

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

v2: Reword and take ownership of patch 4 (Daniele)


Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

John INTEL (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Julia INTEL (4):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
  drm/xe/guc: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.51.0

