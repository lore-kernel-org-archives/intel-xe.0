Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDA606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZRJsXwhK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D5110E115;
	Fri, 20 Nov 2026 07:00:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179D010E115;
 Fri, 20 Nov 2026 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795158016; x=1826694016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xMAQcROHXY1OAIiQnjupC9PcNoG/4e0YjNVvGvsEGIU=;
 b=ZRJsXwhK5zGNkz3sFriGoMSxHdaxUVSh8vWGp7JP30QIfzkDijzH+k47
 wmy9LXijdzKpDR5yYp/7+a5RQv4ZxldiGR58XAWOZoMOsqFFnQqIbZgBT
 eAHole9gS38fV3UjgFAEmskPBtPmbn05yqt7eCfqiNETDkBkdruJhBwhZ
 eqyreuSy34RDaHiRnD9INJW2ILmKSKqdsA0E80o0eO964j7KmzLNhAUnt
 MRn7fx01WIU4aR3M3hVVB7in5DWBkCwDnX9ooGarnF+l0ZK2XUvxRvivG
 3dCZQs02fPKqNz9QdWZT4iDuc7tS8Xk2GUZ70ATQe/HpbmmYTHh6XSQIN g==;
X-CSE-ConnectionGUID: v7e0rRhhQz+lrHiR1s48PQ==
X-CSE-MsgGUID: cIU8IVg8TZCrYtgsngQ4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3923126"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3923126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:00:15 -0800
X-CSE-ConnectionGUID: JXOe+Pl+Sl+lvUWxG8Bxxw==
X-CSE-MsgGUID: qhKvAQ+ITEuVvSYfjmkOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10970630"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 23:00:12 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH v2 0/2] drm/i915/lt_phy: Fix the ML to TX mapping
Date: Fri, 20 Nov 2026 14:58:04 +0800
Message-ID: <cover.1795157860.git.xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The signal levels of a main link are programmed to the wrong LT PHY
transmitter in DP-alt mode and on lane reversed native ports, and a
single lane DP-alt link with pin assignment D enables TX1 instead of
TX2.

v2: Split the patch into two as requested by Suraj Kandpal, one for the
    TX enable and one for the voltage swing programming.

v1: https://lore.kernel.org/r/20261119070444.2106229-1-xiaolu.xie@intel.com
    Review: https://lists.freedesktop.org/archives/intel-gfx/2026-November/401118.html

Eriksen Xie (2):
  drm/i915/lt_phy: Enable TX2 for single lane DP-alt links
  drm/i915/lt_phy: Fix the ML to TX mapping for voltage swing

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 32 ++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

-- 
2.43.0

