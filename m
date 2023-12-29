Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51452C47073
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 04:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B69410E154;
	Fri, 29 Dec 2023 04:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3DF10E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 04:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703824573; x=1735360573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b+0KNDR7b6i9ny07reCxkP6pEoNucey48KJ/wbSgKCo=;
 b=F1LUxKH6dNn5Nwj+05oQj4rcLhA/Z2SKTsa3sdilIdEq1ErN2l4t9nH9
 GeRTT8G8D+apYuarKoL6zTBa1UekOU41Es5RgbXN9hlBvnFrJ+/nhLR/l
 ID2V/sNj7V5xLe3t7Ukd7Tu0QBJtFRcaUsqfTe7evsukz7px5bTA9wyz9
 ucqZVsCygDzDSSZwC2NS1OC31yTD7/NAKYu0hNByQpZPpc1RfgCP1VebO
 +1BCfAKp3FYeu8t9laHm9YfZ4oq8GpZTYMZcmpxYWXlDJk1EMr8jMV6lF
 L1H44t/QC58pQal5HUgrwLafdUiQiEDY2DLDCjomMV0snzH9HGr2jZTN/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3916605"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="3916605"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902140263"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="902140263"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 0/4] GuC CT tweaks
Date: Thu, 28 Dec 2023 20:35:03 -0800
Message-Id: <20231229043507.1002411-1-matthew.brost@intel.com>
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

[1] https://patchwork.freedesktop.org/patch/572566/?series=127982&rev=1

Matthew Brost (4):
  drm/xe/guc: Add more GuC CT states
  drm/xe: Move TLB invalidation reset before HW reset
  drm/xe/guc: Protect queuing of G2H handler with fast lock
  drm/xe/guc: Flush G2H handler when turning off CTs

 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_guc.c          |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 62 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h       | 13 +++++-
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 +++++++-
 5 files changed, 78 insertions(+), 23 deletions(-)

-- 
2.34.1

