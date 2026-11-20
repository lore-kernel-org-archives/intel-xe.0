Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECE606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kmg+1u5m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBED10E1FA;
	Fri, 20 Nov 2026 07:07:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B07D10E136;
 Fri, 20 Nov 2026 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795158421; x=1826694421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJzlWz4hP//F+uA7t8cwvhN7Wz1C1XB/M6OXfQQ+ijU=;
 b=Kmg+1u5mzNyfFAUC0yPhZnUk33p2PB4y1lwmYI7WNXVd+/dEB2YZzKSb
 sYMn/pSEbPXtTRNZmlTP601jSYmfqqfYiqsps9tLXWJd4hfHwCUQgn2yT
 PlSwBwUMKty4YGrrxZRvFSMPfQotwqlIEuGz7QBH8FuMEvpVe1/tG2PQJ
 hCXfx/0W+ZPp6jecRusKVIpizApyJtWf0z008ZFU0YMnZX4LVPY/WfgwA
 r81ifMlunTZshiA0iFLyVg7dpNcVjuKz0ImoMdrmwgb23Z4w8WSTyt1Jl
 CEBAtHvQVNfvUolqi6pnH+7oK4H7+rVjgePyfoKHbPEPWYiKIhE/0FtHs w==;
X-CSE-ConnectionGUID: WKJ/+NXmRvamEAs0zR7YTg==
X-CSE-MsgGUID: 5yKqDbXeQ3WjQ4AeMAZHtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4029473"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4029473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:37:08 -0800
X-CSE-ConnectionGUID: W7gLR2nDST+GML4qfctAhA==
X-CSE-MsgGUID: 4FcyFwA8QvK+lHjDxmx/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11194560"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2026 22:37:05 -0800
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
Date: Fri, 20 Nov 2026 14:34:57 +0800
Message-ID: <cover.1795156437.git.xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v2: Split into two patches as requested by Suraj Kandpal.

Eriksen Xie (2):
  drm/i915/lt_phy: Enable TX2 for single lane DP-alt links
  drm/i915/lt_phy: Fix the ML to TX mapping for voltage swing

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 32 ++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

-- 
2.43.0

