Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6358C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 18:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C7B10E305;
	Wed,  5 Jun 2024 18:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvJYwymh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B43D10E305
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611212; x=1749147212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHiSXL8fdZX9rT9rIcvF0AJJTDO5eFsUi6PtRSan/Ng=;
 b=VvJYwymhLbCGJbwQM5MDvGpoyBVRdaSrH4ge7t35ufvkXCp95EXnZKzL
 1+EQNnBauJXEmt3X6OV8NOKN3BMqZCoHnfK0dd8w/rQgfAMp/UZsnRKKm
 irXiAqRVtDY2fUHAJvlt1tsTX0iklszjOta+K55adRy/sCfwNTCMoFajj
 yuot6vI4dp7jJn3wKmofiXCknZcsgg/aY3xwA+JIRp7RfxAn1+jXxW4Yf
 F+7b+YebDhIXljUd1RieTAbrolDrWOMFCi8GAVEm/TpCtVPy/FGMhQObA
 zb8pYX5C6R0uW/frpcyl8/0RyMgDdKclqRc9ahtkPlXwG2bnxN1oSv7Fk g==;
X-CSE-ConnectionGUID: gpBYDt5OT225sYGb+e3zBQ==
X-CSE-MsgGUID: Q6GVWrKaR4eve35MdegzWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14362212"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14362212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:31 -0700
X-CSE-ConnectionGUID: WVCK1lmZTC6k6oZQ+wVFaA==
X-CSE-MsgGUID: rnHQIIGGSVS9pfkFG8KKvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42637712"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:31 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: uninitialized fence causing null ptr dereference
Date: Wed,  5 Jun 2024 11:15:27 -0700
Message-Id: <20240605181528.2047987-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

Commit 0ac7a2c745e8 introduced a null pointer dereference in trace event
because job->fence is not nessarily initialized.

Fei Yang (1):
  drm/xe: uninitialized fence causing null ptr dereference

 drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
 drivers/gpu/drm/xe/xe_trace.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

