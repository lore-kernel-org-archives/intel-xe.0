Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F007606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FF5VhvG+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530610F8E5;
	Wed,  4 Nov 2026 00:52:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EFA10E4C7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753551; x=1825289551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i2DKvUem3pywiNIkObNViG3OgulpaETm6+1rhDUKDRY=;
 b=FF5VhvG+9g0lErYvFRyuMld7o3AIBjP17uvvN2RIMNytCGPmAYD9FUlL
 tIwBrPtMQz/c/MSKaACQADAlQfaupGhkLFeUCwCjHW2/gNyUKXwSqf/9z
 QJNg8Im19CCqVQDiA9VjTXSNhLY/uhqZH06HUmm5RwHLns/gQbH/qXWbt
 /cEY1FPf+fSF4AiRSE5U3EDJY0jevozLvo3xX0uvmPQ8tnvM+Zzvt5IAs
 A0TSdFpedH6oT7Mtnx4SjhNKqc9LQjidzOYlu5PORrFAocVm6+Htriuy2
 /yfmP7qiEKnA4q5SsxOOi8ToEQn2VGUHHkrso7+WZr6Tin9kzD+HZQRW7 g==;
X-CSE-ConnectionGUID: mPFqyeHWRTiE84eauE5EnA==
X-CSE-MsgGUID: hwZGy/NVQCWF+4XiLjqm3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2529523"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2529523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:31 -0800
X-CSE-ConnectionGUID: AmSO5d1fT7uMZvKV0XLJHQ==
X-CSE-MsgGUID: ih+p3O00TVy2ffpqgTR8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6649322"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v3 0/5] Cleanup OA stream on PCI unbind/remove
Date: Tue,  3 Nov 2026 16:52:22 -0800
Message-ID: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (5):
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe/oa: Split OA stream destroy into HW teardown and resource
    release
  drm/xe/oa: Take the runtime PM reference in xe_oa_destroy_locked()
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 244 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  23 ++-
 4 files changed, 253 insertions(+), 32 deletions(-)

-- 
2.55.0

