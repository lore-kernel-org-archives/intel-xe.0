Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B9606B0FF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5dgLmxS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24BC10E636;
	Mon,  2 Nov 2026 16:38:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E8810E636
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637533; x=1825173533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gogOnJdoV4Hz5+hUDwFGqnAdvROXVbEmT/O/yItkpQk=;
 b=I5dgLmxS7fnY4U4H+x+o0nu3XzJY3ZljPxkm527HKgjDsSlTD/N1uZ73
 amNYFgUc/UgSkTv2CqT7BFAENRa5frIjFs8bqZnYiJOmQXFjlLseRq3ck
 vpllEWaicGQgIv0swpKVRPdaZHtl0Svkxj6hx+ZWwPjH47d8Cs+G7Zk53
 7pdwxQbUHnnTCx4DrPsN1WCHG0d+KzoTcEM3xo3sUamR5GrEC4VNNS1yV
 SvcXqgyPQdA8vPME6JQCdsPVIeTSk3SKGyKfrPCrF319t8i+ifRFG9Ghz
 DjXN855niX1ncKBzgSONlBeVcbOHLPVdxgDl5AsAf3U3bf0suNSoIDXd/ w==;
X-CSE-ConnectionGUID: RHYXf4mtRViwGODvAypQtA==
X-CSE-MsgGUID: 34kSVscMSfugP/3h4oKvuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2354326"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2354326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:53 -0800
X-CSE-ConnectionGUID: noaLbn5tRzOYoDLAcXvQQg==
X-CSE-MsgGUID: bfSdVp5PTfSxB/OTP4sfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6159812"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:38:53 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/4] topic/xe-for-CI: update GuC for CRI and NVL-P to 70.83.0
Date: Mon,  2 Nov 2026 16:38:41 +0000
Message-ID: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move both CRI and NVL-P to a more recent GuC 70.83.0 .

Since those definitions are in topic/xe-for-CI, the series reverts the
older patches to mimic them being dropped from the branch and then picks
them back up with the updated FW version.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>

Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Daniele Ceraolo Spurio (3):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  topic/xe-for-CI: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

