Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAA5EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 15:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8891210E6A3;
	Fri, 21 Jul 2023 15:29:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F3E10E698
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689953359; x=1721489359;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fi8ewZ9tlpjliGEICCvUvMqfS/8+o5r4ezhNi+XqsYc=;
 b=Qii/AbBVcPKrb9UI3DLcB55G0Tyb1UBFdHefRssyxre1HcDQjdIutnpJ
 QfcLvZq38ll0GgIqKSlf8rTyb0GO51qUPjCxttpls7vEmIcNs0H8OdVvN
 cOAmVDRvoMQ4Tzfmcbgg0spjS0hL47E6H6XRnP5oOP03I3eKm47Ghad84
 Ih7Rdt6LnkSzdt4DEzkwiT8AT3SxPhZZA5VwZRRUTyUL75oXkVSlpMoIY
 BpEz+tJX02Eija1MXs96gOUWWdH2SRvGZcxgQp2PYenWDTPsYTU1/doiA
 mJuX1XVJHVO9mlpdL/ShkTOqGhKN7pOpI5qygE1Ii4+S++VWpIymrPkAo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346649134"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="346649134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718863648"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718863648"
Received: from rtrejoca-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.30.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:29:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 16:28:52 +0100
Message-ID: <20230721152852.504995-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 0/3] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

IGT:  https://patchwork.freedesktop.org/series/115786/
Mesa: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23781

v2: Various improvements suggested by José
v3: Add some kernel-doc (Gwan-gyeong)
v4: Small kernel-doc fix, also use the correct version of the struct
v5: Rebase on latest xe-next changes
v6: Rebase on the needed PL_TT -> PL_TT move fix, plus fix some other issues
    reported by José when running actual workloads
v7: Rebase on latest xe-next changes
v8: Rebase and one kernel-doc warning fix

-- 
2.41.0

