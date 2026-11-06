Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D7B606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NN3QPkoy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C5810EA9D;
	Fri,  6 Nov 2026 15:54:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8E10EA9D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793980439; x=1825516439;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGZq8uI478FV1gT+FLCN5kXnJ+ai58msJkNAZzNTTNE=;
 b=NN3QPkoyzo8uTQdhWJYGimXpb95BYSDHrebfyAolbE5J4zHUZAXXid0o
 8EzHdbeEV+IosDDXcaS6ntGZzsSu03FJPPAqdhluXtbFfOvj/nskEnWEq
 vLrDt5cBtzmVjXOuqB20R35pzLNsN8qNA7MSTaYhw5M3L8r6LTxnVdiUJ
 xGh9bqgABcVsEpWwYhGOnS8TVetjMZuOGFBiquvUtRjdkVPLF7aU7oWPl
 xjunRpdfIjNcX0gnvNmIJJ5NGubcPBfvAj8cGDzR1g3R5lcV81n3PQDZk
 70MZd12sGXivwNGBPtBwsJ4oJKm0/ulHd6IVNgGdpBZFJjAwLlvSQ2eV0 Q==;
X-CSE-ConnectionGUID: LjGXLUZ8SHWStEZX1ru5/A==
X-CSE-MsgGUID: BChnv31UQK+Cv4whY9Fixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2895842"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2895842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:53:58 -0800
X-CSE-ConnectionGUID: IHQ3ookiQgKqiikJ+MacNQ==
X-CSE-MsgGUID: qutfFV4PRGuKY59LszadSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7650129"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:53:58 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Optimise suspend handling for CCS igpu platforms
Date: Fri,  6 Nov 2026 15:53:42 +0000
Message-ID: <20261106-s4-opti-v2-0-a3cdae711a3b@intel.com>
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
Changes in v2:
  - Fix the purge() path to revoke/re-fault mmaps (Sashiko)

---
Matthew Auld (2):
      drm/xe: only evict CCS buffers from TT on iGPU
      drm/xe/pm: skip BO eviction on iGPU for non-hibernation sleep

 drivers/gpu/drm/xe/xe_bo_evict.c | 66 ++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.c      | 21 +++++++++++--
 drivers/gpu/drm/xe/xe_pm.c       | 26 ++++++++++++----
 drivers/gpu/drm/xe/xe_pm.h       |  2 +-
 4 files changed, 95 insertions(+), 20 deletions(-)
---
base-commit: 0d3f664ba9aea5d6bc7b55acb7cb8c57e8d11db3
change-id: 20261105-s4-opti-95922f7ce3a6
