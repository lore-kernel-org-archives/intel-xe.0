Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAF3EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 12:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62B10E1A5;
	Thu, 22 Jun 2023 12:40:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C6610E1A5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687437598; x=1718973598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4nS0A32qf66rfvrBJ33dDbOl3MzjEeieap+AYltxVU8=;
 b=TRFgycxnM8YxNHa2qqOzte8XXW6vFIJDCK+z658WIOl6JgFtCeKJWZDq
 Ff1ibFwnxmNwGWVRzDuPlk1svQW8RHnlDbzD+oWxdAQF1CCM2LwOv6leP
 BiRoQLDYlBlTCyQ7nFC2ruJ7Ix3LDcNHlKERFhwXDaCV5bK5A0NlWmeEI
 JOh6HFjdGg2/s5IA7HdDUlWsZkBKnOSi1LXwVrEM7ZAg/34fcmHzgWrkT
 i+9lyNcIt+3vnr1YP9ucEC1EEIqPyNy9vPUksTMleRepd/hD9Ay7LIIIG
 F+b/0s+whqrjllSJ1sxtZAS37vkZfp1vJSO7Hu9LTUWOnQAy0MOPJzGQz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360492984"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="360492984"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1045149759"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="1045149759"
Received: from aadriaen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.46.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:39:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:39:43 +0000
Message-Id: <20230622123946.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/3] drm/xe: uAPI cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series addresses some feedback on xe_drm.h provided here:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

v2: Fix ordering of defines and fields in uAPI (Lucas De Marchi)
v3:
  - Rebase on drm-xe-next
  - Remove some empty lines, add documentation to structures related to
    drm_xe_device_query, changed pseudo code to snippet (Lucas De Marchi)
v4:
  - Move changelog to commit
  - Fix warnings showed only using dim checkpath
v5:
  - Rebase
  - Document topology mask query

Francois Dugast (3):
  drm/xe: Document structures for device query
  drm/xe: Move defines before relevant fields
  drm/xe: Document topology mask query

 include/uapi/drm/xe_drm.h | 172 +++++++++++++++++++++++++++++++-------
 1 file changed, 141 insertions(+), 31 deletions(-)

-- 
2.34.1

