Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F5FC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 10:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1A10E362;
	Tue,  2 May 2023 10:38:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DD210E362
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683023898; x=1714559898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nOVU4Y4sDEF7NiYf1IAH2AA6XFLsmuYtXPcamz9hgsA=;
 b=XcPGUoYYWeAv15Cf/EXzZzIKywygqIGWd02RUoytivZaaN+KGuB26dhw
 ymgAJFliBM2co2X/fgLbt/l8PbsKkVIWc/+5BJlphXRdW+Xu1bqJbVUG4
 OLDvIOJU5biKsrRQ05WJygCQdiqqBCdXAgRnp5cMYJOCtj1OTs9C8ni3q
 oY7e+3U5LtOwxOs5W0yJh1UAHyK2MW1fKhxv1CvmuKsqt+gCNY5oXG7jT
 5UHIgnRJsgAPzz4qOFNEeNMkjMhoOexm/GfWfCDebSndSkPBtKywK1nBH
 XTYccaRO46jDKyuahrZvxa5/dRxZQQOkufythBaeqP+8CTVFQLtD2z+J1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="345843610"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="345843610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 03:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="870506414"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="870506414"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 03:38:15 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  2 May 2023 13:35:48 +0300
Message-Id: <20230502103550.1601556-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/2] drm/xe: Introduce eudebug event interface v2
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

Hi,

This series introduces eudebug connection and
event uapi interface for a debugger to track
clients drm/xe resources. xe_file (client) and the
vm resources are introduced as a baseline, leaving
rest of the events as follow up patches at a later
time.

To support use case where debugger is connecting
to a drm/xe client which already has opened
connection(s) to xe driver and allocated vm(s),
patch 3/3 introduces discovery where all
currently active resources are presented through
events for the connected debugger.

v2: - access control root only, for now
    - debugs streamlined

Mika Kuoppala (2):
  drm/xe/eudebug: Introduce eudebug support
  drm/xe/eudebug: Introduce discovery for resources

 drivers/gpu/drm/xe/Makefile           |    3 +-
 drivers/gpu/drm/xe/xe_device.c        |   24 +-
 drivers/gpu/drm/xe/xe_device_types.h  |   25 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 1105 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  176 ++++
 drivers/gpu/drm/xe/xe_vm.c            |    5 +
 include/uapi/drm/xe_drm_tmp.h         |   76 ++
 8 files changed, 1439 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 include/uapi/drm/xe_drm_tmp.h

-- 
2.34.1

