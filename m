Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FE0C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 12:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BA110F1C7;
	Thu,  6 Aug 2026 12:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxjrHbQk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155F410F19D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017798; x=1817553798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sU7xiLcViAvIpHjzE+CA4HdJHYHI+aA87KM7/CAl1Jk=;
 b=WxjrHbQko2xjzcTzK386vHPYfdoOh6rOxzaYNqGh5EM2HCmTQ5lyEoBi
 GjzQAF7plqEc7h29aDYghATk6GA7DB68G5cnsJMpaK3OywklyGYC6gSaE
 W3QS4BQSA6Q3653BehXcqpZUn3DkwYgBSXhP0BOoNeYMtsCHuPL6fXMvi
 4hGnf8POeGyBhnHWj+pEtxyKK0Z32rrXC40/5FAsKUtayxKvFpsqqCX0Q
 BUhv77bGU/LqG/2uDzRsw8dI3BsMH08xxnVkVDTAiucTKpwDnL5/6Y4vf
 S0h9wNqJxPsRhB8qXeKo/IwVa/CiToRQqI4M7ctu2kH6MjVXlkq0cvjKc g==;
X-CSE-ConnectionGUID: 5t6BWddcTX+rmbSv2xvVdg==
X-CSE-MsgGUID: Jx1YNgahSDqBCg/eQUhuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90426978"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90426978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:03:17 -0700
X-CSE-ConnectionGUID: ysrSxX80SDm4tL4M0wLgWA==
X-CSE-MsgGUID: k8PfEyvSRkCE2OlAXpRvpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="257783856"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:03:14 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v2 0/2] drm/xe/sysctrl: Add fwctl support for System Controller
Date: Thu,  6 Aug 2026 05:03:10 -0700
Message-ID: <20260806120310.2054212-4-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

This series adds FWCTL support for the Xe System Controller (sysctrl)
firmware.

The Xe System Controller is a firmware-managed entity responsible for
selected platform-level control and coordination tasks on Intel Xe3p
discrete GPU platforms. This series registers a
FWCTL_DEVICE_TYPE_XE_SYSCTRL device so userspace can query sysctrl
capabilities and issue RPC requests through the generic
/dev/fwctl/fwctlN interface.

Supported operations are ECC status query, RAS error-injection
capability query, and RAS error injection, each gated by the
appropriate FWCTL_RPC scope and a per-context capability bit.

---
v2: (Rodrigo)
- Rename FWCTL_DEVICE_TYPE_XE to FWCTL_DEVICE_TYPE_XE_SYSCTRL, one type
  per firmware instead of a shared Xe-wide type
- Rename xe.h to xe_sysctrl.h to match
- Squash uapi and type definitions into a single patch
- Replace validate_scope() with explicit per-op scope/capability checks
  in xe_sysctrl_fwctl_rpc()
---

Anoop Vijay (2):
  drm/xe/sysctrl: Add System Controller get application status
  drm/xe/sysctrl: Add fwctl support for System Controller

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 .../userspace-api/fwctl/xe_sysctrl.rst        | 120 +++++++++
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_sysctrl.c               |  82 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 251 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_fwctl.h         |  13 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 151 +++++++++++
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_sysctrl.h               | 117 ++++++++
 12 files changed, 745 insertions(+)
 create mode 100644 Documentation/userspace-api/fwctl/xe_sysctrl.rst
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
 create mode 100644 include/uapi/fwctl/xe_sysctrl.h

-- 
2.43.0

