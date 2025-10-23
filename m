Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254F3CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 04:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7D10E86A;
	Thu, 23 Oct 2025 04:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYBF5sCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB1510E86A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 04:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761194457; x=1792730457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M2mCIwLXZu8E9ecWfFmlN4/sdbQO9+S2/jH2+mp/q3c=;
 b=VYBF5sCCSlbrcs2V/34aj0q1KSoOB5oSmWpzKuLgktgBb6RjZ8yjvslk
 wgr1jlmsbd1T2JeRDQJovXO9cqjP1+WVfbPo256puwhp1IOkpw+Y5lwp5
 dGu9H51NujtcPaI4IS4OA9/3J/tPoCGJd7IPfZV87dJhkb+JVYt+leu8w
 i7URdfPlbkQoq58A3lwi5JW3JM6sXslHeQQmNVyIeAswnDzP8vaa7xd/u
 pXKpoBxMSOIKeB48TjUzIxF1J1ujo/yTbdbcsk2OpgXPvJptgoh21SEZD
 20Uu2dCCSqycWnhJOEeH2yRSJDAnBhNC68L0I7l/shORxvm1RGAuDb93v w==;
X-CSE-ConnectionGUID: VV5gVr/YRhCKOttzkat4ng==
X-CSE-MsgGUID: 0MEZh+q0Rs2JnMbfMK/dGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88819899"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="88819899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:40:56 -0700
X-CSE-ConnectionGUID: BweK4cn3Q0CMowB3UoacvA==
X-CSE-MsgGUID: 3puiXAzWSmapDAA5Xj4Veg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183273148"
Received: from rvuia-mobl.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.244.140])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:40:55 -0700
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tilak.tirumalesh.tangudu@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH] drm/xe/xe3: Apply wa_14024997852
Date: Thu, 23 Oct 2025 07:40:41 +0300
Message-ID: <20251023044041.13731-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.51.0
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

Whitelist registers needed for userspace to control autostrip on xe3.

Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 690bc327a363..fab56673153b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
+	{ XE_RTP_NAME("14024997852"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3500), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST(VFLSKPD,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.51.0

