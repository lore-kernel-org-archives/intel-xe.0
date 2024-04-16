Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C6C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 14:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF54112CF8;
	Tue, 16 Apr 2024 14:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnrtRsXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD594112CF9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713279060; x=1744815060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NRkhMUrDnvFi6Xija5liIHi0oaxWqYEb2jncDw941kw=;
 b=UnrtRsXd3MnHofccPPfDH815VasvtKOOda+CR/8a3WGfAtaMIHR790+s
 bJ1P26sCywAgHx9n09cZpG6NMh0B1Nd+kaZnmzlV0SLWEQlxpmDiamoB8
 hw6JpL6JJTNmvDCPdHmBLDqWxhG4Vg8SZzDeuYhwTHZfRSUF2gadpUS0O
 pGvaDOTy4Ilt5tJhox31+Wqcu+jciLhd44b2UvVM+8yKij8XWmwz4XZE/
 pN6Npl4OWhA5Lo8tSXR0UJQZCHxcow/nog69aW4gcX77ioe43CFycABjq
 j/17JUGjMrA+q1DS9cNpCd4a12H3Oyc39zk5/IU7Iwvfnlfcyol55jbNn A==;
X-CSE-ConnectionGUID: 8okFpvLgRzeohLC5awoGlw==
X-CSE-MsgGUID: vblDfQMAQbuhLC3sXYUypA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8585116"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8585116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:50:59 -0700
X-CSE-ConnectionGUID: E1c10leGSW+zRnE8X2TCqQ==
X-CSE-MsgGUID: OFVFf5jXTrO57h6m9X20VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26963676"
Received: from unknown (HELO localhost.localdomain) ([10.252.61.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:50:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 0/1] L3 bank mask
Date: Tue, 16 Apr 2024 14:50:36 +0000
Message-Id: <20240416145037.7-1-francois.dugast@intel.com>
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

The first patch has already been applied. Resending the second one as
there is now a userspace consumer for it, see details in commit message.

Francois Dugast (1):
  drm/xe/uapi: Expose the L3 bank mask

 drivers/gpu/drm/xe/xe_query.c | 9 ++++++++-
 include/uapi/drm/xe_drm.h     | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1

