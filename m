Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE3606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQQKz93I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BDF10FFA0;
	Wed,  4 Nov 2026 23:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E692910E0E8;
 Wed,  4 Nov 2026 23:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793834303; x=1825370303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bX0JVBcRgVSWZoWEHuMGGZXHzv0LhVrZucRd6b0PG2k=;
 b=WQQKz93IHVwTo4XCxM1anLgUb43p+B8gElIgpyehXuZdJWoPO9zXFADo
 r82xU2IP+bc7S4So4kWdG/S0BvEFQBv3JpalThrLUh4/0udQ/OZS7ERaR
 ROM8llHW9iXLT7IxLGNyVICLD+kR4eByd1r2vRmeZMpiHkzlI94QgOCCK
 So7of+e/akpzidl5cq8iz6Y0CuI83KR1qC02LZ4k/4Bu1NYnYd7Kh0y6a
 ohgqQCrz98MNF1UtYVis4c5zHh4PMVf9URN/4nCKsmkxxxk+DYTCG+n6m
 jAiLUY1WPU+JY66KXdvnoEYUR7mjrDS+Zsbru0NwtTuT9cYksB5uccK6z A==;
X-CSE-ConnectionGUID: lsr8zMwmQNC9ii2khXhSgw==
X-CSE-MsgGUID: RHs5SfeCRZKYqXhOrlzLog==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2602641"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2602641"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:18:22 -0800
X-CSE-ConnectionGUID: aySZI3ZTQSyUkqPEk8j1Vg==
X-CSE-MsgGUID: 2VQnXEGSRMSXNJ1uOdLVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8623186"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 15:18:21 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 0/2] drm/i915/psr: typo's cleanup
Date: Thu,  5 Nov 2026 00:18:10 +0100
Message-ID: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Michał Grzelak (2):
  drm/i915/psr: clean function's name from typo
  drm/i915/psr: clean register macro's name from typo

 drivers/gpu/drm/i915/display/intel_psr.c      | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.45.2

