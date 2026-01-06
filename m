Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B314FCD042B
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEF310E3C4;
	Tue,  6 Jan 2026 01:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsO1izKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEEB10E231
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767662972; x=1799198972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wx1KV+GCvFbitTbPqrW9xYXiKexxFPasaYXgpyNMGhQ=;
 b=ZsO1izKmFrgrKXtq6PYeFHvQXV3P8FZXc33vtoxeIadkoBT0q/Bpahd8
 g8dlP1OwrWDO/RypXpo+CLTSDchMElq37+Jp/TewoRs6bFAz6F3x43S5D
 8WG7De0rdSKczpcSGqJrcHjPuzZ2t5HgBcgURfvFtbhPE2YVBHi6+JALB
 U9QWyxklsDNpuRTEAKXrR6etcgyPdeDixaFPyI+PcStasC8YbgOoWE4DZ
 wsP7QQAi6P2O/4ije5wOk2nebd8BrjF2/SDMbW0HI6/+nKUO2y24U4hRa
 v0T2UoooDEvVahqnkysiLy1z53hKFMIp4QXPBn3qTuUCXkiv0QNbZ/R1t g==;
X-CSE-ConnectionGUID: 5xy/8ucRRfOHh/iqeHSLoQ==
X-CSE-MsgGUID: 5CA7FSTPRLim7tEmf2VGsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69072797"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69072797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
X-CSE-ConnectionGUID: 7vQqOlj8RKezln2aZZUPAw==
X-CSE-MsgGUID: H0P0FJvPRF2HRtF6d1SJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202148070"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/2] drm/xe: Remove multi-queue KEEP_ACTIVE feature
Date: Mon,  5 Jan 2026 17:29:14 -0800
Message-ID: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
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

There is no must have requirement for this feature from Compute UMD.
Revert it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  Revert "drm/xe/multi_queue: Support active group after primary is
    destroyed"
  drm/xe/doc: Remove KEEP_ACTIVE feature

 drivers/gpu/drm/xe/xe_device.c           |  7 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 60 ++----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 --
 include/uapi/drm/xe_drm.h                |  4 --
 5 files changed, 5 insertions(+), 72 deletions(-)

-- 
2.43.0

