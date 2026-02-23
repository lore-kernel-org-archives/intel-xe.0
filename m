Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82C3EC1106
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 16:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F0B10E0F8;
	Mon, 23 Feb 2026 16:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+Vcysjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D2210E0F8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771864119; x=1803400119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ro7SiYm/DngtsXUj1+bT5+jiMsXqV7jm5ZIUXhZ5zWc=;
 b=S+VcysjljztObMb9QJg/3Wqp6iFprwf7AUpe20d/nreKLkrTBBfHzcYw
 eifuE3RSU5oFo7oReW9xi/N33CLOrdFmZvPOIqWYR6W5fRBUJ7u8o/JbW
 upnI9+IHLQuwoEsH1Eu08LBfGiLpqRWn9tbUDtJ/6GxgI59s/cLDnes5K
 5l2G5jJqXeDAonon8SLHRjAH+UHDrLK+VoF9xJFJylvSxsbuKWSjuwokg
 IpkMZaPL5JunsxqvyaKPJNoO77dwYWpNhv+u6fpd8DkO3w5qJbWHvrz1i
 HpIzBmtAOBbSKOBMdj7vyU87vHAmx1NXqeZYBCn4ItmC+prQra95jUVkM g==;
X-CSE-ConnectionGUID: WbUGJkbpToaVYpFEqEcxow==
X-CSE-MsgGUID: 3oGmUQoRSRiwHl8XTXV22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72073323"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72073323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:28:38 -0800
X-CSE-ConnectionGUID: Vp1xEAXASu+CZz0k+XQ59A==
X-CSE-MsgGUID: tW1lQ+DGQY6ssjierN5j7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220609624"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 08:28:37 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] Misc fix for xe_guc_ct.c
Date: Mon, 23 Feb 2026 16:23:51 +0000
Message-ID: <20260223162350.3205364-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Shuicheng Lin (2):
  drm/xe/guc: Accumulate CT H2G retry sleep budget
  drm/xe/guc: Refine CT queue checks and log formatting

 drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.50.1

