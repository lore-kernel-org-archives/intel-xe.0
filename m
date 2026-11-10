Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC85F606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bwqTyB+l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5810E971;
	Tue, 10 Nov 2026 19:01:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09810E366
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794337262; x=1825873262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWhScvTW8nQS+mA2ZQQpDCP3M56vrk2IvQ10pP8Bo0w=;
 b=bwqTyB+lNrQYIfSGL2/QiXs22GDQyt7FRdxDfCkmG/smOQyFvhqPW/aA
 jWVvv3O20CzUwnKvy0f/AmMejooRskycl9wpKqzlGj6qtcutfeLdOQMQw
 XdL2LOTyHcMXtt1F8Wd2qVo/2aGSWtPhAMxQ5VSEV7Hc4c78tkH8rd1Yq
 F02t2Co2e8Dd2toJC0W5iVtmIVm4RYZJBoFENqfb9ObyFwyUkepgZzAjp
 TAElrDsReL14PI92sXw1m0fX+OEUhz9lrXThcwxcoUFuWoAABxFHAR1WZ
 N4KBnQm1fXNOUbkF+bS1w6DFsTBi63angKs8FzglSwgMKV6lrgc0u2mpf g==;
X-CSE-ConnectionGUID: Y0F7DomtS5OniX9qzzChvQ==
X-CSE-MsgGUID: l/zwjsoxQmOdbywPRkWLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3116707"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3116707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:00:59 -0800
X-CSE-ConnectionGUID: gLiO9+whTgWlfF6vVaWMSw==
X-CSE-MsgGUID: qQ0w2ip9Q2e/eLb51bWdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8300603"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:01:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v5 0/7] Cleanup OA stream on PCI unbind/remove
Date: Tue, 10 Nov 2026 11:00:53 -0800
Message-ID: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an OA stream FD is open, removing the PCI device due to PCIe errors
or doing an unbind causes a NPD and system reboots. While OA registers a
fini handler with devm, the handler does not take into account active OA
connections.

Add code to quiesce OA connection on PCI remove/unbind.

v2: Sashiko Comments
v3: More Sashiko fixes and refactor
v4: More Sashiko fixes and refactor
v5: Drop unpinning of BO in quiesce (Sashiko)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (7):
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Split OA stream destroy into HW teardown and resource
    release
  drm/xe/oa: Take the runtime PM reference in xe_oa_destroy_locked()
  drm/xe/oa: Skip OA HW teardown on a wedged device
  drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 335 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  23 +-
 4 files changed, 332 insertions(+), 44 deletions(-)

-- 
2.55.0

