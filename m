Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CCAFD8FD6
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DCA10E9C5;
	Thu, 26 Feb 2026 16:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI2fLZ+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3010E9C5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772123474; x=1803659474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2UJJMLcdImg1/cQT4wkh+Kvi8+VdmcXAZGyARgfEWl4=;
 b=GI2fLZ+kGPEHhQ+KpYm+rTxfbrl2KFIre4UT2jlZNVkaijRbwwCKAhQJ
 DRofGJsXliWIrBu+ZI8VI7fOf0z9W2VMJ/Bg1EiZRpNxQtbAVNJpgvcNd
 +K7i2sRlyanPfaTVfFf75PhrhgqFIUIDTG3MutGMCZa3ND8cs+cCFPRlP
 PB/QW7W37SLrn62H0vRMFcTpO9COWsw5ZE5veJmAI8RRu1X0kqqQJwWTg
 rNsvJjPgpnBkKtz5Fgche/yYJuJi4BzUOjRQxfrStPDW1rxCo0QfcRRce
 b1vF/Lh14H5eK9RvasOLQi4UABwCD64B2rxvJ7V8NShZ0by1MfbHf7rY1 A==;
X-CSE-ConnectionGUID: lhubBwqTTRuKXX8aE/PU9Q==
X-CSE-MsgGUID: cgdYmKErSLqb6/TpNVIgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90598917"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90598917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:31:14 -0800
X-CSE-ConnectionGUID: tHjqEtCLQTGDDW9W+1z0iw==
X-CSE-MsgGUID: g8enNsASSsu1WnCZJWF9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215736051"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa006.jf.intel.com with ESMTP; 26 Feb 2026 08:31:13 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v4 0/1] Do not create drm device for PF only admin mode
Date: Thu, 26 Feb 2026 16:31:05 +0000
Message-ID: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_query.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_sriov.h  |  8 ++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.43.0

