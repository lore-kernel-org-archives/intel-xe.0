Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A34ACA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 14:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094A110E8CF;
	Thu, 18 Sep 2025 14:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oF0i6WIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3FE10E8CD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758205756; x=1789741756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAlVLLGvjE/qMadmkE080WQM90wBmpYBrHqrGh8TIhY=;
 b=oF0i6WIzHiUAoUWaG6np3TDdmltOAZu4IhWmd7q0r8xxPimviyx2noq5
 s+iCazcrSAsbz0kzXr+MPMxqPF6lbilazI+AMXyYxZe1+Lw7NXbmeDD3H
 CIshpkJ2tLyCdIDc6ItZZGSRzsqme1LvZF/wKMDYwEL8+C2VkYFPym+bP
 aSbuG08NMrdKscZVBoiN6/yCe5zoUYGur9fStL/XuoBllK8jHfIf3oFRM
 KQcT3ogmw5p3ndmue/U8q190oO1reRXaGQ+Dkv9BfKTmIG0nJt0l738Lk
 n7UDkoWK75ySefy7YzpHfbX/EC7jO5PtweeKXdNsl87e4B4pFphGOrTwR w==;
X-CSE-ConnectionGUID: iiDA0d4DSsyUH2ItvsN10w==
X-CSE-MsgGUID: 1IjsIS7/TV2dupOdIKhSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60427003"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60427003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:29:16 -0700
X-CSE-ConnectionGUID: TjcpCyIbScSN+XgZtS+vLg==
X-CSE-MsgGUID: XJXw9WaZReGBbcPdIP+RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="212708404"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:29:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] Suspend improvements
Date: Thu, 18 Sep 2025 16:28:46 +0200
Message-ID: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Two patches to improve suspend handling and code:

First patch takes the validation lock around user-space eviction. This
minimizes the number of bo locks held by racing processes and
therefore the likelyhood of a system bo being available for shrinking
if needed.

The second patch annotates the pm_block completion to avoid hard-to
track down suspend deadlocks moving forward.

Thomas Hellström (2):
  drm/xe/pm: Hold the validation lock around evicting user-space bos for
    suspend
  drm/xe/pm: Add lockdep annotation for the pm_block completion

 drivers/gpu/drm/xe/xe_exec.c |  3 +-
 drivers/gpu/drm/xe/xe_pm.c   | 66 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h   |  2 ++
 drivers/gpu/drm/xe/xe_vm.c   |  2 ++
 4 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.51.0

