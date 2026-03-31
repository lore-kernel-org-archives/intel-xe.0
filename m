Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0135FF60CF
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 06:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467610E24D;
	Tue, 31 Mar 2026 06:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBiP6ZOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AC10E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774937806; x=1806473806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mnMUsmDgVBnxYLVkBEHqry/cHDzFKF2yRQSZLn1grWw=;
 b=dBiP6ZOLgdc4StriHkt+VjWahyRFNqIttI+YwuD5tnDFpvWtqOQtgrKt
 tabBvrWAyUrdZ7qZzIrdHMCYEQ2bnO5SK0iD7NWZNwSLCLjZFwIJfHSs3
 plpDROQLFcAX8QYhUczHlPo3VHN/Orv4dQ51BoILXTOdDF6K1V+DErimv
 5NwLeMBl1mYF6FsVfc0UUHf2xEOff9ecr6ZCwSzWH1SD7jZtRS1YaUbVa
 kk6EMr/6QNBdNvabCrrwBoGXQGb4EzdkqAL0l4UMfBcW2fM4raQALdgkG
 kftWEdPGdVf6RQ/Mz5szomOltW5mNRFXkOELWYEaZLeYNr3p8V4n0yPKN g==;
X-CSE-ConnectionGUID: Iy5RIQtqQI+rhGtNGnDD6Q==
X-CSE-MsgGUID: vrMF3SwoS7mfT4IV2rh5cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76001051"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="76001051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 23:16:46 -0700
X-CSE-ConnectionGUID: TkVORq3XSxaNjrGB5dt01A==
X-CSE-MsgGUID: eFRpoq5ITI6oToz7Sgvk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="264202797"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 23:16:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v7 0/1] Do not create drm device for PF only admin mode
Date: Tue, 31 Mar 2026 06:17:35 +0000
Message-ID: <20260331061736.1218962-1-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- Allowed xe_observation_ioctl as well with admin-only PF (Ashutosh,
Michal Wajdeczko).
- Updated commit message with steps to enable admin-only mode (Rodrigo).

V5 -> V6:
- Updated commit message.
- Make content of query_engines and query_mem_regions as empty in
admin-only PF mode instead of query size as zero.
- Allow all other query IOCTLs excepts query_engines and query_mem_regions
(Michal Wajdeczko).

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

 drivers/gpu/drm/xe/xe_device.c | 61 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h |  1 +
 drivers/gpu/drm/xe/xe_query.c  |  6 ++++
 3 files changed, 64 insertions(+), 4 deletions(-)

-- 
2.43.0

