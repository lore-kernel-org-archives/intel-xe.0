Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84204606A695
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iC4jBXRL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EC310E91B;
	Sat, 21 Nov 2026 02:02:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DBB10E83E
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226515; x=1826762515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x2RSSfatUa00SzAb6FyxtN0gAh7xMRwz/MrAoKYfz+U=;
 b=iC4jBXRLlnr0/JPHgB+DxJnCaaWguLwGxOnQHxvHhaAd2+CIcbAU+9bW
 atG0Px6v9MRODejSari4qgBAxyMPL1Q0k+1QEaHVcNaJ+71Io3ofHe50b
 KwjryOJMqorre44C14SgnqnOpPMARyqE9OY22OUcS8jV/xozt9l+REp91
 ZlfFq7k9pywVIzW9B+8BkMWxqtcze0IyM93MtKLq8RJIPWEMMZZlrjqn1
 db/p0x5Bo4G55mFkyWqAloc/PF8xuQKX1f89WuiGbFt1KroTXMKIMFU1g
 ETIe2rFzoFp5OgJPmjJY2KBnvnLGUu6Pgx73pzr/DnWgMXf7Y5nYE1eTN Q==;
X-CSE-ConnectionGUID: M3k9SvPWQDSfNdT9CFLN5A==
X-CSE-MsgGUID: q3z4I1NrQ4+VzhPXGka0Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118790"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:54 -0800
X-CSE-ConnectionGUID: w6G7+GkWRd+Bv3M99JtH1w==
X-CSE-MsgGUID: LTUrzK/hTcmSS51mBdZacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182104"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 0/7] Cleanup OA stream on PCI unbind/remove
Date: Fri, 20 Nov 2026 18:01:46 -0800
Message-ID: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

v2 - v8: Sashiko Comments and other refactor
v9: Incorporate comments from Sashiko and Shekhar

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (7):
  drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
  drm/xe/oa: Use the drm device address_space for the OA stream fd
  drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
  drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
  drm/xe/oa: Fence OA ioctls and mmap against device unplug and wedging
  drm/xe/oa: Free the OA buffer and the stream after the stream destroy
  drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset

 drivers/gpu/drm/xe/xe_bo.c          |  15 +-
 drivers/gpu/drm/xe/xe_oa.c          | 306 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 +-
 4 files changed, 305 insertions(+), 39 deletions(-)

-- 
2.55.0

