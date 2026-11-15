Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57270606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgfVUPy5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E06810E26E;
	Sun, 15 Nov 2026 13:23:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9A710E076;
 Sun, 15 Nov 2026 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794749009; x=1826285009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BXBa3Yz94NYnpSPXejvLxG9taG2g9GHbrH+trnwrNZM=;
 b=hgfVUPy5WuYqpidMip9jwYDJk45n4WWmYMmKZEdORUAFqCrrCBgNjXGB
 d9R0d3nhI4GqwIgbWIv2nIXuIaNNSwvIQAe7UkWyq0BfxoUesQzAfy9ew
 9Vzq60fgQRUISPeSl7YJTMiitNsnd2Gh3QlBvxTmTwkKhPQfTfGh69B2w
 2Y0PAoB/le40TI5uCLxVjm5IKY7twAdwV7WsJYO3f0uay0o86H+9BnRI8
 5rQmMCU0Sf4VvTYVcMlz75Z+HMwWmgyf4ZnV/VOo3mu6Q4B8iF7pC9lyU
 TWKKd9jlZdD88P0BlmbSfeb5nz/geek3ElxWTJ+Ouy9+R00SWQtmyacS7 g==;
X-CSE-ConnectionGUID: e2KqEdIgR+O4e32cW9YCZA==
X-CSE-MsgGUID: VYBxoLwMTGa2rxgszmLxaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3483749"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3483749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:29 -0800
X-CSE-ConnectionGUID: IggU7rV7SeWItiGC3b7rOA==
X-CSE-MsgGUID: VRG1wZznRGmSViWa0SCj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9751533"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:27 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 0/2] drm/i915/psr: typo's cleanup
Date: Sun, 15 Nov 2026 14:23:03 +0100
Message-ID: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
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

Next version of [1]. 

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20261104231812.1704129-1-michal.grzelak@linux.intel.com/

---
Changelog:
v1->v2
- apply correct substitution (Sashiko)

Michał Grzelak (2):
  drm/i915/psr: clean function's name from typo
  drm/i915/psr: clean register macro's name from typo

 drivers/gpu/drm/i915/display/intel_psr.c      | 14 +++++++-------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.45.2

