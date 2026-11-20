Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4BB606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iU+huXVA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2495B89CA4;
	Fri, 20 Nov 2026 06:57:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BF889CA4
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795157819; x=1826693819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gdMHz/EKopqbaINEFksmxM4SXYwJpCKQ4nJK6N7yRa0=;
 b=iU+huXVAM7GLakGi3oqA3KOsO2CyuCt8vEFAwf6x/yGSI1TNtb9YAxgK
 aP0NXPXG8iRpKdRY/bkx4nKHKN4faBqRK1d2hzgckBc+sQfGahp37swEi
 uyPpR7GUPcWd5gEA47DMpctNOvDs9UWiW1Th4A0AqWXIZr+PcLTh07Tus
 tYVoAW3JqgjCR4tVFQt/XSOtGIm0eGmKv6rlsmi2iuCHcy5JA1TgtEqye
 9niFI6RWVTKSdVLDgmUW350t8TUinCcqWj31Ni/dl2nrNaZ3ofW1RzUXB
 vjU9kuEpbPkBnFO5/rE3QiSyGdMaf9BP867BMVKKxSW/leg3CnIrHQOSx A==;
X-CSE-ConnectionGUID: 4phBBIV0Sc+sWRvobkH7DA==
X-CSE-MsgGUID: ishfgZNSTfaPqcs9WOAzig==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3918155"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3918155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:56:59 -0800
X-CSE-ConnectionGUID: ycnAt9RhToeq+CypUgktFg==
X-CSE-MsgGUID: Q678VOXiR2ic8cBPzpwqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10860482"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2026 22:56:58 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH 0/2] drm/xe: Hold a fence reference while waiting for migration
Date: Fri, 20 Nov 2026 12:38:20 +0530
Message-ID: <20261120070822.3834209-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series addresses a potential race between xe_migrate_wait() and migration
submissions replacing m->fence.

Patch 1 takes a fence reference under job_mutex, then waits outside the lock.
Patch 2 centralizes fence replacement in a helper, documents the access rules,
and uses scoped_guard when taking the waiter's reference.

Bommu Krishnaiah (2):
  drm/xe: Hold a fence reference while waiting for migration
  drm/xe: Centralize migration fence updates

 drivers/gpu/drm/xe/xe_migrate.c | 42 +++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 15 deletions(-)

-- 
2.43.0

