Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A717C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80D310F463;
	Fri, 11 Sep 2026 04:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jm2GVP0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C15710EA68;
 Fri, 11 Sep 2026 04:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100116; x=1820636116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0es8S46vu/Ac6Ifr7Ig6Bo+gh6AKGxq8OhAK6boGRI=;
 b=jm2GVP0TPYpH7unByvw9VUBFEvGb8XwNcLgzFe6XOgS9oePYh6ZQwClM
 aZJXttwCTed9EVGLsVKjebzCaF2QE2OnOeF+o7f/5W+Lyfbf38V7zJ432
 /TEwdK8GZXSDbYnLbrYCqM2/p1vYTAM36SCW3qXKjrrlnPW56SoBU0969
 fOvAAmkjlqzmPTyCFd4biJtstJTLR79M3i1T4bmIVHg+e/u+ECEjsGjF4
 vDT3s9BcBquaSU29Y0FZAuhgqV77OFtmKpis7IIl6JE82Qwh8sxHTpFH5
 aVh2Y2E65Wnes0I8tOZaLrRffnEVJzzuUKgdLQ7Y4nJ9jranqSaNdMFfB g==;
X-CSE-ConnectionGUID: R3Fa5tacQK+/ZpUfazT3qw==
X-CSE-MsgGUID: d4nqKGbiQ7GJziyF5tZO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599965"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:16 -0700
X-CSE-ConnectionGUID: cJEFQVsTQCqq9YS+baQcrw==
X-CSE-MsgGUID: /tZUzxx1ROy5S5OWElk85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334471"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/10] drm/i915/dp: Bump the max Link M/N ratio to 22 for
 DISPLAY_VER >= 35
Date: Fri, 11 Sep 2026 09:44:49 +0530
Message-Id: <20260911041449.3699400-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
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

Starting Xe3p max M/N ratio has been increased to 22.

Bspec: 68922
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c2db83f80c7e..3405e411c324 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1269,6 +1269,9 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return 22;
+
 	if (display->platform.dg2)
 		return 4;
 
-- 
2.34.1

