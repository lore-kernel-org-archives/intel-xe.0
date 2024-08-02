Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E95C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 00:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D210710E638;
	Fri,  2 Aug 2024 00:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjJ1CHps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0110E526
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722559222; x=1754095222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U/R2dk/C/FgbqUS2jFZgJEfRLzkN0WnyxjLpyf3ATao=;
 b=AjJ1CHpsaDSoPaw0tKLepbNZu/GpEj6TFzyN/QSj/ZVl3jtGRC6YyVKr
 yFCKimroG8mnG99+QPy/aAHd9l7ic0+2ma3JlUcJayufXkOMdqPi4sTbo
 jbE4VLzYmlK+6LIVJ0ibspVeKoroLKM9YOccWGx+d53czZSZYkf5y5HPv
 IG1FvQ8tjjcdK34zA9IZACymTFmBPpX4eyeOpqh1xCl6gVNRd1hHYsYDc
 olTpQgbeBVyOJxIlaObmZ/PFQOYPqae4fE1igpatG46bPJknVUfkz3oG7
 gykBqZ0MxL7nhuwsWK+gnLP3MuMpJ6LLidHC/EFLrhArAB4WRqkFV8IfA g==;
X-CSE-ConnectionGUID: NKQ/t8AYQmWHPth3cRa7+A==
X-CSE-MsgGUID: OHWuZWLPQ8OjB1Eb7dNrNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="45963263"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="45963263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:22 -0700
X-CSE-ConnectionGUID: eSYL4op+Rjm/ZMam9h/hnQ==
X-CSE-MsgGUID: CV6ax3mySJ+NYYqLGM2rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="92767531"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 17:40:21 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Date: Thu,  1 Aug 2024 17:40:14 -0700
Message-ID: <20240802004017.3057708-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

Has additional patch for unmerged changes need before test.

Enable w/a for LNL and BMG.

Julia Filipchuk (2):
  NOT_UPSTREAM/CI: drm/xe/guc: Release GuC v70.29.2
  drm/xe/guc: Enable w/a 14022293748 and 22019794406

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc.h           |  3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 12 +++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c         | 30 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_uc_fw.h         |  6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  4 ++++
 6 files changed, 42 insertions(+), 14 deletions(-)

-- 
2.45.2

