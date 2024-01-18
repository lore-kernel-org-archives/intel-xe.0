Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFFC47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 19:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A810E8D5;
	Thu, 18 Jan 2024 19:24:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0557110E8D5
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705605847; x=1737141847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GW5y+F0kH59roERtTCu97SyaSunZLIDGB817RIBy8kk=;
 b=cecSz5WzTra55Vse/ijC9Sn3rGyscd/Zpqrs+TLT3L4tEcqeUaY8Tqa4
 0F7ctgsv798Uo6X8wAxb/dDMlCeW4+mXaicDsmX+6g72RigB2qzFiqNgT
 +BsSgCre7ye7K3yRS5mbESseq3TEY7st7xFbn/pnTrBWZuJe7RMLeLi5X
 Q6lm63hWHV61f+whY2sU/+kistFOqU/0cOwP6JQYFFkF6RlDMwPj3YxYu
 vwxF0rjv8X+BpOYDxBOHCcGQr9I7KSHl507OrBuFvDAWblCs1pRRIn0PT
 s96P8ZLJmcog0V61q/e64RbfL9NUlYrjb44/i6KrO+Qspz6NquUyd56xa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7642095"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7642095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="490982"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 0/3] GuC CT tweaks
Date: Thu, 18 Jan 2024 11:24:39 -0800
Message-Id: <20240118192442.1480073-1-matthew.brost@intel.com>
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

Address some the issues discussed in [1].

v2: Rebase, address Michal's comments
v3: Rebase, address Michal's comments

[1] https://patchwork.freedesktop.org/patch/572566/?series=127982&rev=1

Matthew Brost (3):
  drm/xe/guc: Add more GuC CT states
  drm/xe: Move TLB invalidation reset before HW reset
  drm/xe/guc: Flush G2H handler when turning off CTs

 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 87 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 +++++-
 5 files changed, 97 insertions(+), 24 deletions(-)

-- 
2.34.1

