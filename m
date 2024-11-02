Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F54E67807
	for <intel-xe@archiver.kernel.org>; Sat,  2 Nov 2024 16:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D02110E1A1;
	Sat,  2 Nov 2024 16:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mN+LE8dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A368210E084
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Nov 2024 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730563996; x=1762099996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ctyYv6Ta4ycjpCWgQx4kadxiL6TTvK4undJetCAcz3M=;
 b=mN+LE8dnBOzLq4YnaOXfXM46j084XJBPPdOc05zCiE4Bm+ZC0z7cUGqU
 8ZGZoBGpHVLZUyG6Q2vsATsT3bP7z40lzMt8p/s1Oufr9PSGyWuPQ1VW2
 79GL1Wc9unqY5DIKt3SmhX0lMGnFlj1dcKFKyfm3eHSNZdw9zznKWP+Lc
 ueRMTQMKMYh90m64Vr2jnnFwq/6NCS8Q9iTu8bpZ5zyXGKZjdYp3Rg5wb
 j60gUwHBPlLV2Lv5O/qAxh+ziZrUSXJudJXsHoKKhL4jA3gFvrTGkxCha
 vox2ZBQGQH2nwLXe8Tjqte4wgdsHToJkp5Lw02h71ORwubSdEqTx0mw7X g==;
X-CSE-ConnectionGUID: vZHbd/hlRF6vyBCG8LM4FA==
X-CSE-MsgGUID: ixg1S5RATuiAkZ/fPx+4Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30488794"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30488794"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:16 -0700
X-CSE-ConnectionGUID: FocqMvXnRuKIuZuZnoF4QQ==
X-CSE-MsgGUID: 7tH/RO+gRJCkKvLeTnJVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; d="scan'208";a="87842224"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/2] drm/xe: devcoredump documentation
Date: Sat,  2 Nov 2024 09:12:52 -0700
Message-ID: <20241102161254.1818604-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Improve our kernel-doc and wire it up to the documentation.

v2: Add new paragraph about coredump release and reword some phrases

Lucas De Marchi (2):
  drm/xe: Improve devcoredump documentation
  drm/xe: Wire up devcoredump in documentation

 Documentation/gpu/xe/index.rst          |  1 +
 Documentation/gpu/xe/xe_devcoredump.rst | 14 +++++++
 drivers/gpu/drm/xe/xe_devcoredump.c     | 51 +++++++++++++++----------
 3 files changed, 45 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst

-- 
2.47.0

