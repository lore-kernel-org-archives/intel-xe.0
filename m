Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C9D74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821710E3B7;
	Tue, 29 Oct 2024 21:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZMU3tXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7911610E3B1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238257; x=1761774257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E9PluJ75WCfP1ejCuZHzz28eRhzDggny8/qA7y/NYPs=;
 b=KZMU3tXjjG8diPZ/7lImAA52/Fr/yUEHKarBR0tDKhPZRMr0UFL2D/wz
 j6DSwH5hVjBeFKhiUMDYfVAzdOC9eoxseN5SL0sCEugUbcQgfx/R/HOrn
 XqECwYkcPwz6xzfk1WNLpZIJPsH0AzARqqhoq43xc8B1GvPaLwPokA4c6
 30zdtViWZxy+vf162kgE+QHQAMG2/pabk+ZtT7AdOWaVIJnp9UZ2HeayU
 5sBM9wbVIIQQ1I0afbEfSXuAaibn4DxWE5fg4RtyUMOzMCEDCxCUEBJvs
 pSxrLMEJ4PASnYprU8zLej6LfEcczgfCMTzF6sTXXRWJXmn1cNRwtXINc g==;
X-CSE-ConnectionGUID: iQKuT6T0SjOjZB1vj9RmZw==
X-CSE-MsgGUID: t820ecgzSh268+0+4/FCjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40523806"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40523806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
X-CSE-ConnectionGUID: Lt6LVzvpRXuSKwHWlBCf3w==
X-CSE-MsgGUID: FsSb7+xbT9GinjMKfgm2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="119579591"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/4] drm/xe: Fix races on fdinfo
Date: Tue, 29 Oct 2024 14:43:47 -0700
Message-ID: <20241029214351.776293-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

The current reading of engine utilization has same races. This should
fix most of them while also drastically reducing the update rate needed
on "normal apps".

I left tests/xe_drm_fdinfo --r utilization-single-full-load-destroy-queue
running on 2 systems and saw no failures after 100 iterations about
execution cycles being 0.

There are still issues calculating the percentage load - while I have
one additional patch to "fix" it on an idle system, I still can
consistently reproduce the issue in a LNL machine by overloading the CPU
with `stress --cpu $(nproc)`. So I will leave that for later since it's
a different issue not related to killing the exec queue.

Lucas De Marchi (4):
  drm/xe: Add trace to lrc timestamp update
  drm/xe: Stop accumulating LRC timestamp on job_free
  drm/xe: Reword exec_queue.lock doc
  drm/xe: Wait on killed exec queues

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++--
 drivers/gpu/drm/xe/xe_drm_client.c   |  7 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 10 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 --
 drivers/gpu/drm/xe/xe_lrc.c          |  3 ++
 drivers/gpu/drm/xe/xe_trace_lrc.c    |  9 +++++
 drivers/gpu/drm/xe/xe_trace_lrc.h    | 52 ++++++++++++++++++++++++++++
 8 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h

-- 
2.47.0

