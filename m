Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCB606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bRjBmChr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F61121A8;
	Thu, 26 Nov 2026 09:07:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C301121A8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795684031; x=1827220031;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iCh7LSb4nEYOR+6Jm84kwdzGlcLRmjG+ElXjEoz1wIc=;
 b=bRjBmChriVktDudXcF0b/1mVNCZ8tecwcd2WrGFWcX0NE+aSK31GgLIy
 plxuLDvLF8qKEsock1QHKgbBJqx8RsEMOyE9V2MF+qioPZsFjo5L0rXyr
 /B6v2jYdg19gDZ6P/BmUhuHmNwDn7lnKj4rhyifr3IJUeVcKvq/CZiDey
 +mvS1aHJ7MQ7bKFdjZsvZz9FW1wrSiJYoz2GvcXd036t6YxpKgQtEDX1s
 uq8YNz4rJUFbEiNGxoS8tw1raR4/ENclvdY5cvUOWVfStY7tBlPQyZjTq
 r3JAd1OJie/kElVKzAxeJRohya1lDW5PrFrETJkNY3CpBZaj8t6no2cy/ A==;
X-CSE-ConnectionGUID: H8dLnCYiRpW0tyefgcm2Ng==
X-CSE-MsgGUID: GEBpOM/PSW2MkOSAkXbtQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4496707"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4496707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:07:10 -0800
X-CSE-ConnectionGUID: lVqlvaouSSW+pGVBEGgFjA==
X-CSE-MsgGUID: iO37q5RuTyGMvhGzJEg7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12340454"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2026 01:07:07 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Date: Thu, 26 Nov 2026 14:34:43 +0530
Message-ID: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p platforms.
The recommendation is to use the 64-bit MI_SEMAPHORE_WAIT_64 instruction
instead wherever the GT supports it.

The has_sem64 capability bit this relies on has already been merged, so
this series now carries the instruction definition and its first user.

Patch 1 adds the MI_SEMAPHORE_WAIT_64 instruction definition.

Patch 2 switches emit_fake_watchdog() over to MI_SEMAPHORE_WAIT_64 on
platforms that support it, falling back to the existing 32-bit
MI_SEMAPHORE_WAIT otherwise.

The ULLS postamble conversion, which only applies to dGFX platforms
with USM support, moves to a separate series, together with a debug
assert that catches MI_SEMAPHORE_WAIT being used on a GT with
has_sem64.

Testing status: patch 2 (fake watchdog) has been tested.

v2:
- Patch 1: Only compare has_sem64 when both GTs are present (Daniele)
- Patch 2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
- Patches 3 and 4: Drop the WA comment, document the zero upper SDD
  dword (Satya)

v3:
- Drop the has_sem64 patch, it has been merged
- Patch 1 (was 2): Drop the WA comment (Satya)
- Move the ULLS postamble patch to a separate series, together with a
  new assert for MI_SEMAPHORE_WAIT users

Tangudu Tilak Tirumalesh (2):
  drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
  drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  5 ++++
 drivers/gpu/drm/xe/xe_ring_ops.c              | 23 +++++++++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.46.0

