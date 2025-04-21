Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B18AC369C2
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 15:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8BD10E46B;
	Mon, 21 Apr 2025 15:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV4Qus+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2D10E26C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745248603; x=1776784603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Y8YHG3zUFH30DM9HdpITTXT3rGRujsCv70j1mB6guY=;
 b=VV4Qus+AukGrokr0LqR7LdagLyowp/htN6n5tOnZmXWg1wH1rSSCS9iy
 /29hvDWvThyu98aUqbmsb+KSOKTw3nCVZZBQ77C/hwOQQQ0oRJ5k1JIBX
 A567WWiHVqNXDSxJrWCX8Q10ASwwn4HuBezvF3GmQhfU13RpDAqQNWKB4
 fOqOI4YBOaI5O1NtElZggyHyia7aJ7JHh4bWJf8NvvyicS5ckz0bVTXV2
 SWYpYhjnhRtp6NyEMSGDYnKQ5FhxoQy1MqJ6ac3Ytxbf6cY33ZrmTwBuW
 /qQ1iuUCewe2qrsS3zFbPK/qAgKk6vWrHUxjLqswrVdDIfZIfaK9D257O g==;
X-CSE-ConnectionGUID: t7JC0foiTn2fUORo2A4Z3w==
X-CSE-MsgGUID: T5FjGOQKQB60mpLzqt7C/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46882678"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46882678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:16:34 -0700
X-CSE-ConnectionGUID: 5aXNlfYrRoe0qvgHHRewYA==
X-CSE-MsgGUID: VkjZDFjqRVeRFN/CmerFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="136607267"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:16:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: [PATCH 0/2] drm/xe/hwmon: Documentation fixes wrt kernel version
Date: Mon, 21 Apr 2025 08:15:37 -0700
Message-ID: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250421-hwmon-doc-fix-8b523cfd0925
X-Mailer: b4 0.15-dev-9a9c7
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

Some fixes to wrong kernel docs about kernel version in which hwmon=0D
attributes started to be supported.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Lucas De Marchi (2):=0D
      drm/xe/hwmon: Fix kernel version documentation for temperature=0D
      drm/xe/hwmon: Fix kernel version documentation for fan speed=0D
=0D
 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 10 +++++-----=0D
 1 file changed, 5 insertions(+), 5 deletions(-)=0D
=0D
base-commit: dc7f23c4cada96925696c13525cad17bdbc3d33e=0D
change-id: 20250421-hwmon-doc-fix-8b523cfd0925=0D
=0D
Lucas De Marchi=0D
=0D
