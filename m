Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A4EC282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8C10E16C;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkTQt1dc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABECF10E16C
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031540; x=1772567540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y4gXcrYufpvvgpU1Ve0epVfdy1wMDfy2PR25Jj6UO8I=;
 b=TkTQt1dcoIa1+AHdUGYl6cXRpAREQ5Bsx/gmiBu2uSVTwSilE4uhSvEg
 jOulVOY2kqXGnVvMhcQz+tqX7XZCUdqiescdu3CWxITDmEWG1hKlrJvN+
 zXLTYJPOndS13K5knRO08KSWb9AgPvc5dROuMSh/mdYxyk34BV5vKZKwz
 Le6uhFiiUSxqS9dl1LnrmSQlaVTAE0XJy8ZEt+5idsePCUnqKjHJ07FUH
 tEZJpokgl2X4vPvd1P6/t9h3Nc+HtjEYJjiFkNUIlkAkOS+AgrGvqD2NZ
 5SR11z5KHydM5XuWvSIp8tAFO0TkwKVeghSC5DD/T3+BhjkFbcxSejq2y g==;
X-CSE-ConnectionGUID: 1ZzfezHnQWOIMqLo3gha3Q==
X-CSE-MsgGUID: ZEqFl/NLRKaCBX56ynWL1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167365"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167365"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:16 -0800
X-CSE-ConnectionGUID: hIbsIGxDT060Tf8baC6O3Q==
X-CSE-MsgGUID: 6eTzCnFwSB6tdaN6bYKmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366080"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/7] Support different GuCs per GT
Date: Mon,  3 Mar 2025 11:52:08 -0800
Message-ID: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Add support for loading a different GuC firmware image on each GT.

v2: Split and add reverts/re-applies to cope with some patches being
in the for-ci topic branch.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Clint Taylor (1):
  drm/xe/ptl: Add GuC firmware definition

Daniele Ceraolo Spurio (1):
  drm/xe/ptl: Define HuC FW version for PTL

John Harrison (4):
  Revert "drm/xe/ptl: Define HuC FW version for PTL"
  Revert "drm/xe/ptl: Add GuC firmware definition"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/uc: Add support for different firmware files on each GT

Julia Filipchuk (1):
  drm/xe/pvc: Add GuC firmware definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 73 +++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 30 deletions(-)

-- 
2.47.0

