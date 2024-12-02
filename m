Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEBFE69E8E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 20:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3410E160;
	Mon,  2 Dec 2024 20:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaPPy+94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114AB10E160
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733169836; x=1764705836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/qlW20sgmshSphGLT2w4dP9VtlHe2HncdUZE7jzPkLM=;
 b=EaPPy+94Nz5vAXa4PYAQITKxD78cVj2sXxrqGriqa981X8yX6Fw7fm4a
 3qJqqIZPIMEOmiUq1XsexHTXLdYthjn3LdbW2dKEekpfjS8aJzXrpJNau
 5z/vQ1EA65wNdApKQ9UnqUzxr5HtkedqCiz4LCBbHAUW/pEtsNM1DO6xz
 KVf4wAzHOAVpg3+rKWlhS2EMiXuSyf07lXvakzDMkMZNshH2nCclJq1Cp
 CAJmk4DNuus2iCf696gcYt+LPLw4bMRvkr1FKHmfix9/6t+xtR/i6Oa2O
 fyc17z6bxSpYBaMTZBbMqE9MU4+y/KIz02Js9mOaVuZLfrS70e46YNDRY w==;
X-CSE-ConnectionGUID: okSs5t8kQkig1805RDZLOw==
X-CSE-MsgGUID: YtjqcKrbRNeOSP+WhQXjIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44027255"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="44027255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 12:03:55 -0800
X-CSE-ConnectionGUID: fQOU6Gr7RC2pcwvEnm7Uww==
X-CSE-MsgGUID: GbgeE7/MRmmO7PpkMCljJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93395016"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 12:03:55 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 0/1] [CI] Support BMG PMT features for Xe
Date: Mon,  2 Dec 2024 15:03:43 -0500
Message-ID: <20241202200344.2939085-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
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

pdates for PMT to support user offsets from the sysfs API.

v2:
  Addressed review comments for the Xe driver udpates.
v3:
  Consolidate offest addition to addr
  Add r-b.
v4:
  Xe CI PMT patch has been merged

Michael J. Ruhl (1):
  drm/xe/vsec: Support BMG devices

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  19 +++
 drivers/gpu/drm/xe/xe_device.c       |   7 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_vsec.c         | 232 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  11 ++
 6 files changed, 276 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

-- 
2.44.0

