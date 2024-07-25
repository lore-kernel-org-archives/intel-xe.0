Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E6C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C6110E203;
	Thu, 25 Jul 2024 00:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEaWVeOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48210E1AA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867554; x=1753403554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0IEcfEpJtnmXLbCzqMdSOQ5F0oSsVIOI0ZLG0A3XCJE=;
 b=NEaWVeOSV99BfiO5waecDgJiU69sUldXPtvKwJTfoyd3rfra0Im+Q95M
 njcb1JfOMSPCfc4MBe5xxSyQhKvh4xwG1QVksUhZlARpsN1KuLfi39kZ0
 94ivWgoUXrrH3zG+EzByp8KNSFa9tt4VrFqusUDFOQ4Atyp8yELjOLC2V
 CSjutD3Ra81I49BN6pUXU2YLyNRYoqca+kh0mX/E2ehiBWj12nnt+yEKW
 aP1wQHvDQFcr5cU4gPiOWawtmx9voMOzb/0ijFVlP/Uw5NwnkNggHAkMS
 XWGdSepX79kOIRElcAWgIw4/RcqKGmLjlHc6OWfedCns/MTenFYVynCrD w==;
X-CSE-ConnectionGUID: 1c5IKflSTfSLhZwbPGDLsw==
X-CSE-MsgGUID: NQVzGj3QTIm0bwE+TKaamg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192529"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:33 -0700
X-CSE-ConnectionGUID: g9Ngv+BWTaGIqVgTFyKdsw==
X-CSE-MsgGUID: tPZXTiwOSBWMf8tnt9QKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976342"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/6] Move HuC and GSC FW defs for LNL and BMG to drm-xe-next
Date: Wed, 24 Jul 2024 17:32:17 -0700
Message-ID: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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
weren't ready to be officially published. Now that we have updated HuC
and GSC blobs that are ready to be sent to linux-firmware, we can remove
the defines from the for-ci branch and add them to drm-xe-next.

Note that the 3 reverts are not meant to be merged, they're there to
indicate the removal of those patches from the for-ci branch. Only the
latter 3 patches are meant to be merged.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (6):
  Revert "drm/xe/huc: Define BMG HuC"
  Revert "drm/xe/gsc: define GSC FW for LNL"
  Revert "drm/xe/huc: Define LNL HuC"
  drm/xe/huc: Define HuC binary for LNL
  drm/xe/gsc: Define GSC binary for LNL
  drm/xe/huc: Define HuC binary for BMG

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

