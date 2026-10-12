Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C71CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 16:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DD110E60A;
	Mon, 12 Oct 2026 16:40:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907A10E611
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791823220; x=1823359220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B+cWFdchrDgMiH4gs5OsK8YpFHJc6bcEpdoFje1mhWE=;
 b=mikf13FeeFiZvBxGvCB4n1X0JgElPkMJ+8AuZ8cqSKfgCinQFtYoOhTQ
 QxT71IaPyGn8g+DHs63sFeaWuxf3api3YznGGQZ5pmbGj/B5Jww1wgrrH
 dKuKISd0+eZFlfybrReL9LxUdrlujV8WBIAFTJVsD+mrAcQtOUSBSRKu6
 ObE7BR5Eo/TK5ABdCKo5Rx2AaNAxV904Ho6kNYKPU69mayrXRuROfkpCN
 flVm28n5RXNXfe0eLDBO72kzjO2j36A7f/HJvWvgPewZGbNcLKAJLjese
 7q93xIGcOQE9+gsPNmikppfpqhGTba7CU0J8NLDHqXBDfLP7739xNwfoa Q==;
X-CSE-ConnectionGUID: QuFSaEDOSIW5KiO3KJAPUA==
X-CSE-MsgGUID: GkvPwI59TtmlI0uzKH2/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="550663"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="550663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 09:40:20 -0700
X-CSE-ConnectionGUID: 3nqcJ51FT/Se0bK2sZhNvQ==
X-CSE-MsgGUID: MrbKLKqdS7qkhPOvT7HZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="896774"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 09:40:18 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 0/2] drm/xe/tuning: Fix Xe3p tuning register mismatches
Date: Mon, 12 Oct 2026 22:49:02 +0530
Message-ID: <20261012171901.19508-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes two tuning programming mismatches reported by
igt@xe_debugfs@check-gt-reg-sr on CRI/Xe3p platforms.
The first patch stops applying obsolete media Compression Overfetch
tunings, while the second restricts the Anyhit NULL-query tuning to
render engines only.

Nitin Gote (2):
  drm/xe/tuning: Stop applying media CCCHKNREG1/L3SQCREG3 tunings from
    Xe3p onward
  drm/xe/tuning: Restrict Anyhit NULL-query tuning to render engines

 drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.50.1

