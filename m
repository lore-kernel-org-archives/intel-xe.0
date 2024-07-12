Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE88C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC2C10EBFD;
	Fri, 12 Jul 2024 06:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0qxxucG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C2610EBFD
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766373; x=1752302373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m933cRqmoXMNdFawVQUuXgefUdwl3uiR1o+VwBbr0Eg=;
 b=R0qxxucGZBaAVIwoWxqHOs7tOAh9l7iWeaP7NBS6j/ICgruO+qNtBfa1
 NwxrH9TzDKQJxDFI0eDafL2U/NoEuIXKC/6kPdtGlpP918i6qZtq1pOKd
 nfeNCXGT4Rml72h1C7T+FqhBLJnJn86eXrzsV1hfnOhRS172wIkXe84fD
 8m22tYVpkw70n/zp4faUXd/NswxT7Z0BrcPOXqI6w4bo3mq0YW7/Qh02w
 tz0a1JYWPlWYKp1FwCnKtfzPRg12BcJvV2hyLs4C6mhandD9r30YcdD5q
 LxFlXObrjcguqjedvASztnh7bvZpPYHQXumVzbN0x1YtLTCXhwFfcQ9gY Q==;
X-CSE-ConnectionGUID: vkgJE1F8TROunMqLBuYB6A==
X-CSE-MsgGUID: YPRlvGPZS3KBLBmf2FCHQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35623920"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35623920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:32 -0700
X-CSE-ConnectionGUID: OfkubHAkSXaf93H3QecqgA==
X-CSE-MsgGUID: S9N42HhGR36WcZH7NqD1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49472842"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:32 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Fri, 12 Jul 2024 06:39:19 +0000
Message-Id: <cover.1720766122.git.akshata.jahagirdar@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe2+ has unified compression (exactly one compression mode/format),
where compression is now controlled via PAT at PTE level.
This simplifies KMD operations, as it can now decompress freely
without concern for the buffer's original compression format—unlike DG2,
which had multiple compression formats and thus required copying the
raw CCS state during VRAM eviction. In addition mixed VRAM and system
memory buffers were not supported with compression enabled.

On Xe2 dGPU compression is still only supported with VRAM, however we
can now support compression with VRAM and system memory buffers,
with GPU access being seamless underneath. So long as when doing
VRAM -> system memory the KMD uses compressed -> uncompressed,
to decompress it. This also allows CPU access to such buffers,
assuming that userspace first decompress the corresponding
pages being accessed.
If the pages are already in system memory then KMD would have already
decompressed them. When restoring such buffers with sysmem -> VRAM
the KMD can't easily know which pages were originally compressed,
so we always use uncompressed -> uncompressed here.
With this it also means we can drop all the raw CCS handling on such
platforms (including needing to allocate extra CCS storage).

In order to support this we now need to have two different identity
mappings for compressed and uncompressed VRAM.
In this patch, we set up the additional identity map for the VRAM with
compressed pat_index. We then select the appropriate mapping during
migration/clear. During eviction (vram->sysmem), we use the mapping
from compressed -> uncompressed. During restore (sysmem->vram), we need
the mapping from uncompressed -> uncompressed.
Therefore, we need to have two different mappings for compressed and
uncompressed vram. We set up an additional identity map for the vram
with compressed pat_index.
We then select the appropriate mapping during migration/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 389 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            |  91 ++++-
 5 files changed, 470 insertions(+), 18 deletions(-)

-- 
2.34.1

