Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6223DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196C010E2C3;
	Fri, 26 Jul 2024 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BK/VoceF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F3F10E2C3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722017360; x=1753553360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MWNrZn7+H6bmtxp0W3QackGcbQH1XR3y7Weer5a9BHY=;
 b=BK/VoceFIAk54uysqSYppSpq2WwkgDdn2Lys1cUISpsb3HWYq5Ld7Ekv
 mQ3FEnOz/usWlNAcNYCek06ZyVjYulCyGsV7FQJFQZNsPGuCRgawuVUGd
 w0rLa6ishdUVKX8qDwD2TTD7Uusn6RHTfYGoCIyavxYj3tWBpsh69ZbB/
 6pHvh07MDH7lDLdpRjKl/VGwr39sUD8h28veUxjrjF7hFBXTncLVdf2OQ
 DQyKJhE502DoFHK5PIMfXefe53Y/bKIxvAv/1090uGmbh0QFi5qXgXqg4
 LcFitZfvduYyeRvnUY/lWaRWevikPK84wCYzAqQQQ3Yo5gHVSwa7xOixL Q==;
X-CSE-ConnectionGUID: t+jp+B12TEif5BrMLqshiw==
X-CSE-MsgGUID: vwV3YssaSq6UGGw6ysC6Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19667919"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19667919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:09:19 -0700
X-CSE-ConnectionGUID: V5zFoUpVSemh+BN3Pk0XmA==
X-CSE-MsgGUID: 8x2gcCj7Qw2ZE1BUhHNi3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53255961"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:09:19 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/1] drm/xe/xe2: Introduce performance changes
Date: Fri, 26 Jul 2024 23:20:22 -0700
Message-Id: <cover.1722060742.git.akshata.jahagirdar@intel.com>
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



Akshata Jahagirdar (1):
  drm/xe/xe2: Introduce performance changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.34.1

