Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD3C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA4210E159;
	Tue, 25 Jul 2023 15:46:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADD710E159
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690299973; x=1721835973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrAS2A8eJ/aw2xoeB0npQG1LfbpgYYd6ud7KrAbdngs=;
 b=P+S/aR4ETaBY2vnq32ellygNR26BHCraiCplEEt5LXjuVG2eRL4sGCwd
 KPkU13t09Wdsz3+bNO8gpHbQejMo8fj1iihyFGHs1wa42L0mf/7LrV66t
 HYg0eJXqQmz3PQyp76b4sUbcWVadLQ6omR1XQ46VcwmB4thfYVjq0kjlU
 rZVirk1KrcScNxhIWB/RSyYVdOGhmkMeKBN/I6zWdHnIVqKFqH/+Rwbhg
 /TC39eFVVuyUId5bsi5sGLinyOWPhKW4+sRcBfvPP4c4Cq6kli5R7fUuH
 cxLXJ0M2qVvT0FGhWF5cqdN5SZJrp5DFx1+LWiY1DNX5lHS19SsiqiRNm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352667232"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352667232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729395453"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="729395453"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 08:46:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 21:21:12 +0530
Message-Id: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 0/3] Notify userspace about uevent failure
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

series sends an uevent in case of gt reset failure.
since we have no mechanism to ensure gt reset failure from
hw perspective introducing the fault injection to validate the uevent.

https://gitlab.freedesktop.org/drm/xe/ci/-/commit/5ab4b369758a57b5a799b93c1d5b556c98d9d557
is enabling the config to ensure debugfs creations are succesful.

Tested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Testcase: https://patchwork.freedesktop.org/series/121309/

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com> 

Himal Prasad Ghimiray (3):
  fault-inject: Include linux/types.h by default.
  drm/xe: Notify Userspace when gt reset fails
  drm/xe: Introduce fault injection for gt reset

 drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_gt.c      | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
 include/linux/fault-inject.h    |  3 ++-
 include/uapi/drm/xe_drm.h       |  8 ++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.25.1

