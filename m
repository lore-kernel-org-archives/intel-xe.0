Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8BFC00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 23:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927EF89F63;
	Fri,  4 Aug 2023 23:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CA589F63
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691191042; x=1722727042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UVmjEGI3cWsQPbNiKGqdlI8SISJ4Z1Uk+wvkcMLQ+tM=;
 b=LBOroFpUVO8cuE1BmU7aRuT3vThJfwNAlfu7eDuk8jlIYda1mq4hb1Ky
 oboSgvFBJjuFgaBkuTvgcDDcXkmEvnDkcPH2wtVWwGxzFzf1MbcV5E1bX
 B7mk2m/SUAoj9vsn6HuAJ8ZjpQT54AejWG4LQNLgGHbSvOpyFXXua8dLH
 tv4OGpEdKJWPHEjOzbpqEBl0LYGyBwiMPzlcg/mHxTQ7kWxijr2d6c3kJ
 sOWdnm+AHDw2JMFnXbckyE+OtqSR0Oxr3tmQ4CbLnMnM1946CtCKq2EBQ
 xeG2F5otceLKJ+HXHL590QyHyHCcIKA4GaZrVLXdxXFjJnJHyPmNBclP3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401225997"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="401225997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853983485"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="853983485"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 16:17:07 -0700
Message-Id: <20230804231709.1065087-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Update ARL-S device IDs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update IDs and while at it fixup the coding style.

Lucas De Marchi (2):
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  drm/xe: Update ARL-S DevIDs to the latest BSpec

 include/drm/xe_pciids.h | 49 ++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

-- 
2.40.1

