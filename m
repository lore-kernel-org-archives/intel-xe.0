Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65C1CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 19:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D54910E0F4;
	Wed, 24 Jun 2026 19:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gje3Cflj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812310E0F4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782330773; x=1813866773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tAE5lgI5FdvLbWymUyL/16QWdKICC9s+6XtVtK0gOPk=;
 b=gje3Cfljb0XOAOw5EDeQzcrGzj5l+dGXVm6SCYTCDkXHX50RLHMwqN6U
 4zYDOhSN5H61ZLfFiiO0vMWk+hSUGvhWtSiNOvhLL78fn1oCg6I6BaQwR
 gunSAY4Ns18sLqpmfFkd5OUCN4A7QWfFPU+MZlwi46Xg9pcawV2VfPjg9
 Ga5EZgH9rmdEss3pLM/1l4qirKvUxG9IE/Y/3IiFV3oiw24KG+SmMO+oF
 vjX7OXOeB/+JeZecpMd8kFd4n91xJsZsJfS2fKXQhmBmg2eL4BmX7Luwg
 VyIZaD4288SanTV2Rix7AeBjYE2OTDU2MqrkNFtL8PJrxqfL84fr8TWBt Q==;
X-CSE-ConnectionGUID: 3TQbMdKIRHW+4BQlWN5VVw==
X-CSE-MsgGUID: bvggEjR8QNKT9SICFzu2fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83107527"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="83107527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:52 -0700
X-CSE-ConnectionGUID: jivMu4r2Q2GKEZRnh9cdEw==
X-CSE-MsgGUID: SXb4QuWDRHmwmSUvTSzYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="247074777"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:48 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] drm/xe/guc: distinguish wedged from recoverable
 cancellation
Date: Thu, 25 Jun 2026 01:16:19 +0530
Message-ID: <20260624194618.2793571-4-sk.anirban@intel.com>
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

The CT layer returns -ECANCELED regardless of whether cancellation
is due to a GT reset or a wedged device. Return -ENOTRECOVERABLE
on wedge so callers don't need xe_device_wedged() checks
to suppress spurious error logs.
Also document the return codes of xe_guc_ct_send() in kernel-doc form.

Sk Anirban (2):
  drm/xe/guc: distinguish wedged from recoverable cancellation
  drm/xe/guc: fix activity stats error message format

 drivers/gpu/drm/xe/xe_guc_ct.c              | 40 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  2 +-
 2 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.43.0

