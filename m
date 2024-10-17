Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078C6D374A2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B843110E1B1;
	Thu, 17 Oct 2024 14:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN6ohU5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA110E1B1
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176272; x=1760712272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D2xmv/gD75lfpQQ+H+UzAarok7R1AeDrNyV052YUIY8=;
 b=gN6ohU5o+g3n8NlZGyfu+DDx4fKuHSXp2BAyv0i+82JnVRnhrCVyaVvS
 K5rxyqrtATDsMP5mQ3+QiURd+Em1wRi1eM7q4/2txvsKWBlQKpc/5CREd
 FijiXCVLemwsk759xLmQQZWYEC6HQzLmMGZKC1otmieTK4CSsyAqCvNZw
 ErBxjOYQ2DWOyT21BF5rJ25sHrNI2OtO1la1gx/NMQX7elpAmn5t7iDCp
 XG5iVia1zAgtVCkxMLGXDJvEGe0sNrO+yFroeBqMsVfaN23XBrvA1ODkz
 a7eTh5uap7eVGb4+O8c/r2hEqHHDYFBUJpvSagqeyJd0moEH7owopZrsJ w==;
X-CSE-ConnectionGUID: C+z9oVb7TlynGqR2TSt8kQ==
X-CSE-MsgGUID: 0HvFIXo5RCet9iMKW1FypA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28547044"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28547044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:31 -0700
X-CSE-ConnectionGUID: rw2e44DlRJK7XE2BV7s9PA==
X-CSE-MsgGUID: J6gylk7aSBO/uX+LPsmIdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="82522956"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/2] drm/xe: Avoid unnecessary OOM kills
Date: Thu, 17 Oct 2024 16:44:05 +0200
Message-ID: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

On kernel memory allocations where invoking the OOM killer is to be
avoided, but trying pretty hard to fulfill the allocation is still
desirable, one can use __GFP_RETRY_MAYFAIL.

Use that for buffer memory allocation-and validation and for
multiple bind memory allocation.

Thomas Hellström (2):
  drm/xe: Avoid the OOM killer on buffer object memory allocation
  drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds

 drivers/gpu/drm/xe/xe_bo.c | 9 ++++++++-
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.46.0

