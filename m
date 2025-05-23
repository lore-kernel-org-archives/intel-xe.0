Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F416C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BFE10E098;
	Fri, 23 May 2025 17:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFealSmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2274410E058
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748022171; x=1779558171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/5k7eGlpFWSZ5Kykl8Z0igT1JdtEWuuWQovLftUaV9A=;
 b=KFealSmfOOADXbvbJwU9I+gSTMGbGSfIuQidXgTgT1NxwBt6ga0ZDYhK
 iHmHOTbA7ZA2vfoyDN4BRS36JtTnKfI9Cn7PO/kVFyOn+3otn6j5hvahb
 IM3a19jhGJE+sDPUGBDmnbdt/veYb5eJWGsPeeMRLiNBuMnc6c3Ruux4G
 +C09ZRqwCGVWVnnqMhmHdPskDrEiM2eJN5FtvsoHI1xp2J98QZu+hrHe+
 e4V/sjDOlmwF5BRIpne5YdBniP7vVQjdlKeA2guBSve4yxAsfhSSBnt1X
 VxaqKKNogX2cgM45lMCwdJore4Xw4m64wxnngIeyV2F8Y2Wcy8C+co3nQ Q==;
X-CSE-ConnectionGUID: qmWmouY4QvqH2ekOoAIXNA==
X-CSE-MsgGUID: 02he5wmTTtC/NFkBn9/VHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53881256"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="53881256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
X-CSE-ConnectionGUID: XD9WBWWFTO+BbXyj+/nzmQ==
X-CSE-MsgGUID: JyfN+thbRiywaZ1ZOpEWdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141098129"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:42:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Add configfs to load with fewer
 engines
Date: Fri, 23 May 2025 10:42:30 -0700
Message-ID: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250520-engine-mask-f6f5962afa42
X-Mailer: b4 0.15-dev-f7671
Content-Transfer-Encoding: quoted-printable
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v3:=0D
- Add patch with coding style changes to header=0D
- Split patches: the use of the mask hw_engine initialization is one and th=
e=0D
  configfs handling is another=0D
- Move the lookup table outside of the function looking up the mask:=0D
  this will also be used in other patches in future=0D
- Change the _show() method to pretty-print engine names: it's not the=0D
  same format as passed in, but covers the "what was exactly parsed"=0D
  while at the same time not require one to lookup the indexes in the=0D
  source code (Stuart)=0D
- Avoid the term "fuse off" (Matt Roper)=0D
- Handle gcscs (Matt Roper)=0D
- Improve and fold conditions for checking if the engine instance is out=0D
  of bounds (Matt Roper)=0D
- Link to v2: https://lore.kernel.org/r/20250520-engine-mask-v2-1-46e76f935=
b35@intel.com=0D
=0D
Changes in v2:=0D
- Fix build with CONFIG_CONFIGFS_FS=3Dn=0D
- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d=
23b@intel.com=0D
---=0D
Lucas De Marchi (3):=0D
      drm/xe/configfs: Drop trailing semicolons=0D
      drm/xe: Allow to disable engines=0D
      drm/xe/configfs: Add attribute to disable engines=0D
=0D
 drivers/gpu/drm/xe/xe_configfs.c  | 148 ++++++++++++++++++++++++++++++++++=
++++=0D
 drivers/gpu/drm/xe/xe_configfs.h  |  10 +--=0D
 drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++=0D
 3 files changed, 174 insertions(+), 4 deletions(-)=0D
=0D
base-commit: 1bb9b646d6ead84cf3f16c724f7bca2cad161839=0D
change-id: 20250520-engine-mask-f6f5962afa42=0D
=0D
Lucas De Marchi=0D
=0D
