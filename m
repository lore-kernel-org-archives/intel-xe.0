Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B831EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 16:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E975310E2E8;
	Tue,  4 Jul 2023 16:09:12 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14A110E2E8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688486951; x=1720022951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gPJJPYSNiOManz3siT1gqCxleN/wYNRqxWYKiw9K38=;
 b=nWigh4lPgeNAOEU+eu83afsXoUgdyTgf6F7Nzn1atPZl0HkjRtjI35xk
 XunYIUz7rbG9Mceca8FJmbQNGyxXTVfaQD9m10phZ/aF2P3O2pJPasGsL
 U6qJR7X6MP1uMvgMbWcck9mVhDeh/l3HOUeRnh4vKmBNuy6JDZecIMaa6
 9tSBIIB+EYTYAJwmvrLsO3vH2Q1cr7ZEOB/Lj76v6kWsHFhJJCAio1tu4
 O+ko3MsWajudVers2UnnMSIXVUpM6kF7leEMuZni4Ggz+oqYTWSWt/CaW
 LvO0QdhtDfO3HCRJ2a+rc3w6hJji6D/Bpd+ishM7bExLjwcP6qwJ+ThAk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426837211"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="426837211"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 09:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718962247"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="718962247"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 09:09:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 09:09:06 -0700
Message-Id: <20230704160907.2173428-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Synchronize ext/intel_dram.c with the i915
 source
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

We can probably ifdef out most of intel_dram.c and stop copying it to
ext/intel_dram.c, but there some abstractions that would be needed for
e.g. the intel_uncore vs intel_de. Kick that can down the road and just
do the needed change for MTL.

Lucas De Marchi (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/display/ext/intel_dram.c | 40 ++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

-- 
2.40.1

