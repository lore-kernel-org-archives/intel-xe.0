Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C23C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 20:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2829910E7A2;
	Wed,  6 Dec 2023 20:50:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEDF10E7A2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 20:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895838; x=1733431838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W8MfYKGVVbu9kn1uQ34julWATrc3bNvbU8Rzri3QJ20=;
 b=DadS8fHMH2I8vY07TutLNAgudbyBdE+AUhwk5AbhozONZ/CSrWatiJ3M
 5GgHYEthcalUJ9cUusG5seMH5lBNSzwfPSh4dUAwEF8ExFgw4XVWFz9Eh
 Q20riot4iMZ4WdYr51waJ/HeajtbzXlS5UNHBfEqMwQLXUNOUSCHAdFWT
 vLquXRj/+yg7UIbVW8ahkg4Ad6neMPRAroWxVNhHmgP+FvUC2cEr5KuEN
 DFdQvd0dQXu4rc5/wGdpcw6faJD9EwajXooIy2hYzBAz0L0ERDTjAqa5H
 9zClOq/tKCuwYTPbAHIZsOIm2tPQcztZWXovypa1UPL9i2jmrogtbAoME w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425274643"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425274643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805768408"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805768408"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 12:50:35 -0800
Message-ID: <20231206205034.1105637-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] xe: Add IP versions to GT query
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
Cc: Francois Dugast <francois.dugast@intel.com>, matthew.d.roper@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On MTL and later, drivers are expected to determine graphics/media
version and stepping from the values reported in the GMD_ID registers
rather than trying to infer them from PCI devid/revid.  Since userspace
cannot directly access these registers, the graphics/media GMD_ID must
be exposed through the uapi.

Repurpose one of the 'reserved' qwords in the GT query structure to hold
the IP version for platforms with GMD_ID.  These fields will continue to
be 0 on pre-MTL platforms.  Userspace should continue to utilize PCI
devid/revid on those older platforms.

Note that although the hardware has a display IP GMD_ID register as
well, that value will not be exposed through Xe uapi.  As always,
display userspace is expected to use standard atomic properties and
test-only commits to determine platform capabilities rather than
attempting to recognize the underlying IP.

Test-with: 20231206204942.1105505-1-matthew.d.roper@intel.com
Testcase: igt@xe_query@query-gt-list
Cc: Francois Dugast <francois.dugast@intel.com>,
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Matt Roper (2):
  drm/xe: Stash GMD_ID value in xe_gt
  drm/xe/uapi: Add IP version and stepping to GT list query

 drivers/gpu/drm/xe/xe_gt.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
 drivers/gpu/drm/xe/xe_query.c    |  8 ++++++++
 include/uapi/drm/xe_drm.h        | 10 +++++++++-
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.43.0

