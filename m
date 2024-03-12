Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AB8C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 21:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3510F206;
	Tue, 12 Mar 2024 21:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CemBfTu5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D0610E704
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 21:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710277950; x=1741813950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A92YsLiK9bRX8gcRpbcfJAqFU7vyQtYZwX0He+GOoIg=;
 b=CemBfTu5h7zx2YtwA8Crza9TmTMJrlb7yGZwMzdGTPO7KjAXWO09gYWf
 jfW7ak62/JYMLBz0IbrNJaPvlDDqn271SciC0tzvwPgvq4ajySQn7tRC3
 mlwEqXhb+iyXCjtQdtSVzx5GMPKZb0GcL4VPtJEWCg/fNvyhpZ+AMabC+
 q2MiJlH1RfsgkdP3+tJ75J+4ajX1eHQ5pIxeidPlvBN+vyMwMjvhz9Siy
 WG3ts1l/IThj4jPGvrFcmdhA4UZ61sGdZ/r82uThJunL/xfFkvxkjiu+y
 Kn/PY1eqJe6AKXNFOXWNmBE4HJN89Sd7NgiCJZffgPE1slesFpbLSILpW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5143314"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5143314"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11572046"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:12:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 0/1] xe: Add IP versions to GT query
Date: Tue, 12 Mar 2024 14:12:24 -0700
Message-ID: <20240312211229.2871288-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On MTL and later, drivers are expected to determine graphics/media
version and stepping from the values reported in the GMD_ID registers
rather than trying to infer them from PCI devid/revid.  Since userspace
cannot directly access these registers, the graphics/media GMD_ID must
be exposed through the uapi.

Repurpose one of the 'reserved' qwords in the GT query structure to hold
the IP version for platforms with GMD_ID.  These fields will continue to
be 0 on pre-MTL platforms.  Userspace should continue to utilize PCI
devid/revid on those older platforms.

Note that although the hardware has a display IP GMD_ID register as
well, that value will not be exposed through Xe uapi.  As always,
display userspace is expected to use standard atomic properties and
test-only commits to determine platform capabilities rather than
attempting to recognize the underlying IP.

v2:
 - Tweak field naming from "revid" to "rev"  (Lucas)
 - Fix kerneldoc copy/paste mistakes.
v3:
 - Resend for CI now that Mesa MR is done and we're ready to merge.

Test-with: 20240312205431.2869411-1-matthew.d.roper@intel.com
Testcase: igt@xe_query@query-gt-list
UMD(mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26908
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>

Matt Roper (1):
  drm/xe/uapi: Add IP version and stepping to GT list query

 drivers/gpu/drm/xe/xe_query.c |  8 ++++++++
 include/uapi/drm/xe_drm.h     | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.43.0

