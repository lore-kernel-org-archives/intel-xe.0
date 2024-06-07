Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A0EC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799F710E197;
	Fri,  7 Jun 2024 06:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZtpRFzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BE610E197
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717743109; x=1749279109;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChXxYnK8EN67cIuICjKgqaM3Ag1nW/7matuhLlJlZbw=;
 b=cZtpRFzCQuEF3qX3qSoIxI+lOTDFgtIef7S7S/3uN58OQ5QO1YyGlZ52
 0qNMS/XjVWUuMF73wMsEnH0pwIf60ucwmo+5gMSQss7cXgN2UE2QcOGeo
 L4i1Fa4Dea8nmIkqMlx8DnwtoyPG+zsIuOSvIGMxoV8WlkIAKZ43GuOYX
 fYKxSNCcEjrmFapeu+pnavVjU264tOdr4wlxNlcdBxkB+CV557pS3Boh+
 B+oQJ1NMJnRV7sQI9LOmjy+BW0kn4e2zrBIPZHn1OrQNA6WRNa+vRxspg
 vjSTn6vBMx6S5m4OCWOiBJ1CxdkngYXagtJu7N7Iz5yV+zP8BzLeJXvi4 w==;
X-CSE-ConnectionGUID: pOZ0+hn8TsajhIRsYGNr8w==
X-CSE-MsgGUID: cke/8Zd1RwmOGIDbQgqkSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14254922"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14254922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
X-CSE-ConnectionGUID: S1oikxHjR+qofMNAlKQT8g==
X-CSE-MsgGUID: JafZk23+S0WPWpiZJ+PGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="75702759"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 0/5] Only timeout jobs if they run longer than timeout
 period
Date: Thu,  6 Jun 2024 23:52:14 -0700
Message-Id: <20240607065219.2264624-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Debugging [1] hit a known flaw in the job timeout mechanism - jobs
timeout after a period of time in which they have been submitted to the
GuC not how long they have actually been running on the hardware.
Attempt to fix this.

Algorithm is as follows:
- Copy ctx timestamp from LRC to saved location at beginning of every
  job
- On TDR kick jobs off hardware via schedule disable so ctx timestamp is
  updated
- Compare ctx timestamp to saved ctx timestamp, if jobs having been
  running less than timeout period re-enable scheduling are restart TDR

Series needs a bit of work documented with FIXMEs, hence an RFC. Let's
agree if this is right direction before putting in more work.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799

Matthew Brost (5):
  drm/xe: Add LRC ctx timestamp support functions
  drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
  drm/xe: Emit ctx timestamp copy in ring ops
  drm/xe: Add ctx timestamp to LRC snapshot
  drm/xe: Sample ctx timestamp to determine if jobs have timed out

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 140 +++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.c                   |  49 ++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  21 +++
 5 files changed, 186 insertions(+), 33 deletions(-)

-- 
2.34.1

