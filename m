Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21642C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D32110E1C4;
	Thu,  7 Dec 2023 13:50:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D69010E1C4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957021; x=1733493021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=40/OJTAE+Aez7GDffVPPATnvBU6a1cjxS6cDVm49Ib8=;
 b=KCKn8mUYMg3BJzGawOpS1B7HUVs6FcGNCUe24IkYf2rbrLt5sU8OVhys
 Hq3+1zE3DEH8cYqd00TI5/eIcDJnLB8L9hkA3tGKVsJETgPrNXxYjzw4f
 FpsxOWrzilQJYjvci7ASrLVkQN7Fw+RwhrtGywBD4lnRWwNtahPq8683J
 qm2LXMwSGMiNfExDB9OyKQjgmbCxZ7vOTZiPNrQU/MNc2PqRggOGrqTzk
 gEb9IdIdzXwUX6DoItU9EqOl5YpOuPWqKK/VHr6bEstWm7JVv+r4GhkdR
 CO/XI/jztR/oz6S30ySVUURZn+snTZTuND+PdUxPr4mme6JT2YKNKpUcL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722233"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722233"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115417"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115417"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 00/14] uAPI Alignment - Documentation
Date: Thu,  7 Dec 2023 13:49:55 +0000
Message-Id: <20231207135009.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series is an attempt to improve the documentation in xe_drm.h in order
to make its use easier by user space. The structure of the file is made
explicit, the same rules are applied everywhere, the generated kernel doc
is more complete. The series addresses some comments made by Oded:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

There is no functional change.

Francois Dugast (11):
  drm/xe/uapi: Add a comment to each struct
  drm/xe/uapi: Add missing documentation for struct members
  drm/xe/uapi: Document use of size in drm_xe_device_query
  drm/xe/uapi: Document drm_xe_query_config keys
  drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
  drm/xe/uapi: Make constant comments visible in kernel doc
  drm/xe/uapi: Replace BO with GEM in documentation
  drm/xe/uapi: Add block diagram of a device
  drm/xe/uapi: Add examples of user space code
  drm/xe/uapi: Move CPU_CACHING defines before doc
  drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used

Rodrigo Vivi (3):
  drm/xe/uapi: Order sections
  drm/xe/uapi: More uAPI documentation additions and cosmetic updates
  drm/xe/uapi: Document the memory_region bitmask

 drivers/gpu/drm/xe/xe_query.c |  19 +
 include/uapi/drm/xe_drm.h     | 758 +++++++++++++++++++++++-----------
 2 files changed, 544 insertions(+), 233 deletions(-)

-- 
2.34.1

