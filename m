Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06979606A339
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBOM5fCA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E63112CB6;
	Fri,  6 Nov 2026 10:16:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C133112CDF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793960214; x=1825496214;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mbx7TUJ3UxyIkzEVbfjx9jcmQxe7eoqwEGGWer613Jw=;
 b=XBOM5fCAoLyD1+EXaP6XuwMtlUUDkbdQd6h4A4kaQ0FubeSnPXhbfnmg
 uYlw3Upt92uQ8WgLTNCOJoYyjSZcNSV6NFHHbma8ZoBM2+Q7GMS89ykmX
 SuNesuYyaG9gNum1Co72Dz620/L42WvM3DL5TixsMfGS7faFTXUIinjEa
 cO97cL4i04gIMjqDRC03/VZGAwf6PCNaN0o5OFmxRvf87jEk6f7Emc21A
 T3Wyla9zMQQvOekIs6CPyeeLQyvwQ8/caDHs7Z3ayJaAimcF6RQls/xkh
 LOMxDHl97zcPZikVuhDl5F9mzozLJxGqeVdKq8xo3lANh10SoHxH4CUXK Q==;
X-CSE-ConnectionGUID: bgQLzXEHTdmGscGy/qIfgQ==
X-CSE-MsgGUID: lANlQxe0RneXTm6DYduHbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2785435"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2785435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:16:54 -0800
X-CSE-ConnectionGUID: sNzhqCI9SQ+9hlB1XA976w==
X-CSE-MsgGUID: cum4Z5wXSBaRqaQr/QTNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7131699"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 02:16:53 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Optimise suspend handling for CCS igpu platforms
Date: Fri,  6 Nov 2026 10:16:41 +0000
Message-ID: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261105-s4-opti-95922f7ce3a6
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

CCS lives in stolen memory which in turn lives somewhere in RAM.
And since it's stolen memory the driver is responsible for doing any
save/restore as part of s4/hibernation. But for other suspend events it
should persist.

But currently we evict ALL TT userspace buffers on ANY suspend event
for igpu platforms with CCS. So here all user buffers need to be
re-validated and rebound on the first exec() call after wakeup, in
addition to a bunch of pointless GPU work to save and restore the CCS
state. Also, since we actively purge anything marked with DONTNEED
during eviction this will vaporise the Mesa buffer pool/cache. And this
currently happens on every s2idle or s3 event, which is the default in
most distros.

Given this, there are two angles to make this optimal for our suspend
handling:

 1. We should limit eviction only to suspected CCS buffers. If Mesa
    tagged the buffer with NO_COMP or we can deduce that there is no
    compression we can skip the buffer.

 2. We can limit eviction for CCS user buffers, for any < S4 suspend
    event. In theory only when RAM is powered down do we need to worry
    about saving CCS (same with GGTT). For s2idle etc. this flow is now
    a noop in terms of eviction.

This should be a significant improvement on lnl/ptl etc.

VLK-103395

---
Matthew Auld (2):
      drm/xe: only evict CCS buffers from TT on iGPU
      drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep

 drivers/gpu/drm/xe/xe_bo_evict.c | 64 +++++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pci.c      | 21 +++++++++++--
 drivers/gpu/drm/xe/xe_pm.c       | 26 ++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h       |  2 +-
 4 files changed, 93 insertions(+), 20 deletions(-)
---
base-commit: 7797f00bc4da28646c612b8130ccd5192548ceea
change-id: 20261105-s4-opti-95922f7ce3a6
