Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894CAC3DA64
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 01:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9810E330;
	Fri, 26 Jul 2024 01:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPA3NGj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573010E330
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721957180; x=1753493180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OG5wXvYYP2QKjEvp7vbeX6Gk+yKGeZTNIXGLu8IYCb8=;
 b=GPA3NGj++aSS6E0SxxBVYA10YpoHd+pIYzvQ0yF3qcRduNu2HbYEXEnN
 e1g6ZaLGEvIgv3oy5hVsl2U1yrnElYVwQsqyNyGDlzZh7DaK16twDnGg7
 CfDKFy3kSxsWWAGc0+/zTTckiGA3KLOSxCTyMvN9CgAFgjd00H8o9Q+4L
 GmaXtRpRIfsSLSAzceGw+SXC9P0eGTqXZ/5KUseOvVyymC4y8BMvigXzX
 /a2G1IQueHz3D8/+/rFdZuePF2Iualid/xHVc+0xQ0ecij2RH5zA0zCMQ
 hwi4Tf3BRM6SYFi2/NI0j07KsT0IZkINu+af5rz1XbW2v9sJdMUjLzsOg A==;
X-CSE-ConnectionGUID: 22gNz9RYSKGziR9b9xeqbA==
X-CSE-MsgGUID: TpVD7bwRRz+WsXbeKf2eMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30393926"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="30393926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:20 -0700
X-CSE-ConnectionGUID: n1SPoUOAT7ClrJv/58rOcQ==
X-CSE-MsgGUID: vpOr80uLTQamGyXQTu3Ovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="84081316"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 18:26:19 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] Move GuC FW defs for LNL and BMG to drm-xe-next
Date: Thu, 25 Jul 2024 18:26:07 -0700
Message-ID: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The FW defines are currently in the for-ci branch because the FW blobs
weren't ready to be officially published. Now that we have updated GuC
blobs that are ready to be sent to linux-firmware, we can remove the
defines from the for-ci branch and add them to drm-xe-next.

Note that the first patch is meant for the CI branch, to be squashed
into the patch that added the FW defs.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe: Drop pre-release GuC definitions for LNL and BMG
  drm/xe/guc: Bump LNL GuC recommended version to 70.29.1
  drm/xe/guc: Add BMG GuC definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

