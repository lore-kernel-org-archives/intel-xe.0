Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6260A2607
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hSVur/Q4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A77112662;
	Fri, 13 Nov 2026 15:16:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306D7112647
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794582998; x=1826118998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfGmpmD7NPCKWjsPdK4DnCZm9IGA7P1D6wnNF4DAe94=;
 b=hSVur/Q4mCKgjFE7lbzqmvyXtdrAUjsHFiV3NeWBe/Bopike58W1DRj3
 zZJP+FYEyEH+H2ucI6ien2XtGm9Ow/pcGJuPt8qMkLV4S2E3PGFkDhSea
 7donO1pJ71sj/+ebaI0eZn48FUWTqwnJ77CfZcZFRV+lQNQyi1/jR7x5r
 RzaiLx12uDO6/1TYkNgRZWawhlCy4GA1a0Cte4UwT1xRxTHOmjC5RwqPo
 ggH8vwQVg4XCsc1xhXZSmT4hIBa7yZXtObKks03uvllvAe2Y6/L1P9bB+
 Mxj/CDGA5orrmR9pFcSykYwwioj/omnrCBrBEUpzms+J9Rl9ReIeRWAqe w==;
X-CSE-ConnectionGUID: wRC1YP2kTFa9S2Bncn3unQ==
X-CSE-MsgGUID: BDSwOjmCSHaq/fweeKKVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3394004"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3394004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:16:30 -0800
X-CSE-ConnectionGUID: +Gv7hY/MSyOduKPmprsx5g==
X-CSE-MsgGUID: MhGkmbmsQK2qWMg3367HTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8869109"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2026 07:16:29 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/2] drm/xe: add debugfs control for per-context ATS enable
Date: Fri, 13 Nov 2026 20:43:22 +0530
Message-ID: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
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

This series adds a debugfs-controlled knob to force the per-context ATS
enable bit into Xe LRC state for hardware validation.

The first patch introduces an enable_ctx_ats device flag and exposes it
via debugfs, defaulting to disabled. This is intended strictly as a
debug/validation control for SV/FV testing of per-context ATS behavior.

The second patch adds the relevant CTX_SYS_PASID LRC layout definition
and ATS-enable bit, then programs that bit during LRC initialization
when the debugfs knob is enabled. The change is intentionally limited to
the ATS-enable control bit and does not modify PASID or SVA binding
state.

With the knob left at its default value, there is no functional change.

Nareshkumar Gollakoti (2):
  drm/xe/debugfs: add Context ATS enable knob
  drm/xe/lrc: gate per-context ATS enable behind debugfs knob

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 +++
 drivers/gpu/drm/xe/xe_debugfs.c         | 41 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h    |  6 ++++
 drivers/gpu/drm/xe/xe_lrc.c             |  9 ++++++
 4 files changed, 60 insertions(+)

-- 
2.43.0

