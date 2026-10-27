Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F8606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 22:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XhM7W8H1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC3A10F877;
	Tue, 27 Oct 2026 22:45:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9C10E0AE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 22:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793141098; x=1824677098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ouB/kuORVxgyMxrM/zzT0JQxCpfSZypCAYafm1RS5bw=;
 b=XhM7W8H1V7WlRVt1fCQCm04cRlsl+I4FEszapkRLIqJn4szOckoOYYk5
 RQIuPJnPv0SqIHKvKV6eWDDAMmovRojpPl9xAO6v+9WL4pJ3KWhKdjgaQ
 OWyHK0rCg2WAug4jWy+XiW4RNZB2r7f4iQmNbjnVyUKnrzucryniYuiy0
 wYgrLykC3EFbV0JPw7Vh/Lgb0gvnc88oxey6oVNEJ1/gpe2/wBCXzi2tA
 rDrgB8himx0uS94La+CZUs79brNfRv6nNGJonhT+/SW3j/g1O5L+WMDMu
 rRH/e6HAijfaOOGbADrpG7mMwZtEFqD4LZKY7FdlymMxuowmp/B6J9V5k w==;
X-CSE-ConnectionGUID: MK7m5DOdSneo9D2te1ITIQ==
X-CSE-MsgGUID: ngbv5+l+RhW07btCjAoShg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1878232"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1878232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 15:44:58 -0700
X-CSE-ConnectionGUID: Dh5cmURpRXO6oRkQVLDU2Q==
X-CSE-MsgGUID: rCPHVHlgT4uHEsNOhi2lVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4721923"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 15:44:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/4] topic/xe-for-CI: update GuC for CRI and NVL-P to 70.80.0
Date: Tue, 27 Oct 2026 22:44:49 +0000
Message-ID: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move both CRI and NVL-P to a more recent GuC 70.80.0 .

Since those definitions are in topic/xe-for-CI, the series reverts the
older patches to mimic them being dropped from the branch and then picks
them back up with the updated FW version.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>

Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Daniele Ceraolo Spurio (2):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"

John Harrison (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

