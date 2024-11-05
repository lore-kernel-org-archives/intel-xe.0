Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB8BD3176B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D0A10E0A6;
	Tue,  5 Nov 2024 17:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfiN1cVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6510E0A6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827845; x=1762363845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IjMfVZmcoXGE0PjDDnguwlyEaVi4tMeXfYeswM9QFX0=;
 b=WfiN1cVjyP51jIRhpiZIBhivNxt7GJ14raCh9CILtwRpi7wzeRLSnVAW
 qPYzooxBqM54YCBU833krwFjEhJ6XHHeCyfd+vrwO81903p6RMHcboawQ
 0D00FCMBP5cqBotnCa+hHsYW53fgS2wSbmR709OzP89b3Yu7xhBeIeLyN
 gUbqDM3B7auSIzcv3DJgUNCRMDQA02bsAtTHwxmgsM84+Q4WOXRsawnlx
 EpThfT7VvhxXJEECtzbHu0xKtSQFBDoDpXFKLKBKbbQKL2l5lu19DTyGv
 9tDDsT+NdJwL4sswE7F7fcDgiBrEFBPAIkKesAJrXNZMUaijVCGu6YscV A==;
X-CSE-ConnectionGUID: dfTOfo//ShutOgrV7Y3ixw==
X-CSE-MsgGUID: a9sN+4oqSBuldb69vTYexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48094131"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="48094131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:45 -0800
X-CSE-ConnectionGUID: rB55HUBaSY2Z8FirkpQO6w==
X-CSE-MsgGUID: jUiUOrjHTyiFaptLgt3s1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114906259"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/4] GuC: Improve handling of the malformed G2H
Date: Tue,  5 Nov 2024 18:30:28 +0100
Message-Id: <20241105173032.1947-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Inspired by this log found during dirty experiments with VF:

 [ ] xe 0000:00:02.0: [drm] *ERROR* Invalid guc_id 4294967295
 [ ] DMAR: [DMA Write NO_PASID] Request device [00:02.0] fault addr 0x0 [fault reason 0x02] Present bit in context entry is clear
 [ ] DMAR: DRHD: handling fault status reg 2
 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: G2H action 0x6000 failed (-EPROTO)
 [ ] xe 0000:00:02.0: [drm] GT0: Capture 1.1: CTB is dead - reason=0x202

Cc: Matthew Brost <matthew.brost@intel.com>

Michal Wajdeczko (4):
  drm/xe/guc: Log content of the failed G2H message
  drm/xe/guc: Drop redundant logs about invalid G2H length
  drm/xe/guc: Don't read data from G2H prior to length check
  drm/xe/guc: Don't treat GuC generic CAT error as protocol error

 drivers/gpu/drm/xe/xe_guc_ct.c     |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c | 53 +++++++++++++++---------------
 2 files changed, 29 insertions(+), 28 deletions(-)

-- 
2.43.0

