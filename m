Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58C606A32F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KSxKTwZJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266A310F54E;
	Tue,  3 Nov 2026 11:45:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51010E759
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793706345; x=1825242345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dx+iDFx6zS19t3pOBFnnqicZBmy/JPsew8WeXAxGw6U=;
 b=KSxKTwZJ78i1D7L2av5E65O7qS1xeCtDpIRfEQ3qzX+3ziQ9jvdcBzSi
 rGWw4b1G8mkB+BO8R1U4kNhx1CHMeT9Np4kfu0UBwcOnDqLNUHuT3UZzn
 2PKEmpms7rB61h/yHHm0em0zIVQ20UtrDVm/R8m0fkst0g4PxFhUPDyld
 G1AlJtFjQYjga2E3U1kXA4+IZWZ5lIzMElwtHZTd+XiX8oex8rI+fNtbN
 AfAXbMkKEBTPXPOq/m2+dqUWfAyIFnVFu95vM3Ess8a3hwueWxzXemvGK
 3IBZGJDhEXiItCftbKJ9OZcmK/Hdg3fHfhofAm7IZvN6sMVFtxx+1yJd9 g==;
X-CSE-ConnectionGUID: gyH05IMST82o2gu9Q/nCaw==
X-CSE-MsgGUID: e+R/0L2jQa2VLT+BTh0q1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2306293"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2306293"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:45:45 -0800
X-CSE-ConnectionGUID: pmtGY5joSa6oLZGK3okv2A==
X-CSE-MsgGUID: IXzVF184Sp2cXzmdbbXpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8183038"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa012.fm.intel.com with ESMTP; 03 Nov 2026 03:45:45 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] Fix VF probe issue due to missing LMTT dir ptr
Date: Tue,  3 Nov 2026 11:45:41 +0000
Message-ID: <20261103114540.240284-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

In the recent platforms, while probing VF driver, seeing below error in
dmesg:

*ERROR* Tile0: GT1: H2G request 0x550e failed: error 0x103 hint 0x0
*ERROR* Tile0: GT1: failed to enable GuC opt-in features: -EIO
*ERROR* SIGID=101 FATAL (-EIO) PROBE: driver loading failed for device '674c'
probe with driver xe failed with error -5

The LMTT directory pointer is configured on every GT of the tile only
from the primary GT's init/reset flow. On new platforms, both primary and
media GTs have their own forcewake. Primary GT's init holds only its own
forcewake, so the media GT write can be lost.

Program the LMTT directory pointer from each GT's own init and restart
path, while that GT's forcewake is held.

Also reordered include files in xe_lmtt.c.

Satyanarayana K V P (1):
  drm/xe/pf: Program LMTT directory pointer from each GT's init path

 drivers/gpu/drm/xe/xe_gt.c   | 14 ++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c | 28 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_lmtt.h |  5 +++--
 3 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.43.0

