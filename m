Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AE8FD5323
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 12:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A778C10EB15;
	Fri, 27 Feb 2026 12:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvpUtz70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0FE10EB15
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772194032; x=1803730032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXEpd0gFtuV0ayC0ptNwEDGc7prdYCLkaHStFpLUa3I=;
 b=KvpUtz707FnfAwIpNYankK2Br7QGzQWz6HZHHhE5u+1SJ/Y9un2n9/Ka
 KyXlVsnPgeiWpeJ1uETGF9MKKa+q7JA9XHFJydKgarAPrjyvgu3G5A0WO
 tyNlkibB/927dHSmFRMjvipyIdja9Ll683vW9Sit/XP6NVAZIkn+5jRWf
 3zJfboyAoYFRLD9HaofiAchOitoT6R7nl7NrCwZH5JIzxrP4B2+yo55FZ
 iJPvMg+UbFTtumDLkhVPE4zEBH3zoemcemFRMYgIRxQXdJzsZqSpxzFjP
 4UXQ7b7ivFXdydxdhKJxxyT9Pn2Le2Qcx/FaMKfQqWVfQ9zeJKoqb0MaB g==;
X-CSE-ConnectionGUID: xhMBJTABTqi7YHBxEZDleQ==
X-CSE-MsgGUID: CwPmjZWyRb61iM1rWzPeQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83909655"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83909655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 04:07:11 -0800
X-CSE-ConnectionGUID: HafWypitS928UuuEw8GK2A==
X-CSE-MsgGUID: wwkHmEHGQdyB94uur9Fsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254661481"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa001.jf.intel.com with ESMTP; 27 Feb 2026 04:07:10 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v5 0/1] Do not create drm device for PF only admin mode
Date: Fri, 27 Feb 2026 12:07:03 +0000
Message-ID: <20260227120702.3651913-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not allow users to run workloads.
Suppress device capabilities to userspace in admin-only PF mode.

---
V4 -> V5:
- Updated commit message (Matt B).
- Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
- Updated all query configs (Michal Wajdeczko).
- Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
- Fixed other review comments (Michal Wajdeczko).

V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().

Satyanarayana K V P (1):
  drm/xe/pf: Restrict device query responses in admin-only PF mode

 drivers/gpu/drm/xe/xe_device.c | 47 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_query.c  | 55 ++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov.h  | 11 +++++++
 3 files changed, 94 insertions(+), 19 deletions(-)

-- 
2.43.0

