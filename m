Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F47C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A69210E077;
	Wed,  5 Apr 2023 02:26:42 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF510E013
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680661600; x=1712197600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YU/Rcav6bnmk8MM0EIlYWGFqoaaYLP2P33iiUzWVe7Y=;
 b=KrnYuicnM5DLBlrG1LoE5msbzNrfb1Lyr9Z4mGZj37MdnKIaMaR4nlMc
 +Kviinpg+Pacb5IJLEHXVy32saxvXsY8C0Nl4tHOIN16kIUwG4ceWV52G
 aPlr3nT4k3OpRxppbTr3/EV02vMLSW6t7JGIz82DJBgfTGPsf2Be46Pnc
 KVigg/a8TatWwO2kMj08ysTCZgsyx7fyvt1OQvepd5cCle1V9dTwM0TZy
 /TCrOcdKpQzElPj00j/xrbrzmyl/2GbZvRlsf87DVipGhyKk8uGCYbJh0
 ku6giPCpPpChBg5QSQ8MDm93oOaXLYC8PrBjJBUAJz5A133+MLgaKhb8L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407429692"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="407429692"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716865317"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="716865317"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:26:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 19:26:35 -0700
Message-Id: <20230405022637.3960068-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix driver load
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

Looks like coalescing GGTT invalidations is causing issues with the
driver load, just disable this feature during driver load. Also add
module parameter to disable this feature for user space too in case we
suspect this is causing user hangs. 

Matthew Brost (2):
  drm/xe: Always invalidate GGTT on map during driver load
  drm/xe: Add always_invalidate_ggtt module parameter

 drivers/gpu/drm/xe/xe_ggtt.c   | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_module.c |  4 ++++
 drivers/gpu/drm/xe/xe_module.h |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1

