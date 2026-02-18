Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FE0E9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 07:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3481E10E574;
	Wed, 18 Feb 2026 07:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0spdZjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8156910E571;
 Wed, 18 Feb 2026 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771399352; x=1802935352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLq4MrXZFepM8181YTs+GRl6oXIi+u2CPpRSLMbsieI=;
 b=T0spdZjCqEQm/QY/0EZgvtduz2aojaYOFZ9kghwKYXD0Dmd2yN6wP+9I
 VYrXJIkmeoAuHNKu60Sl2EUasQOOP8zwrMhCOT0Rg+IH0h3fJ/P/ASmMN
 ZpvdQqQEh5wUcfiuy47EhOKwf4LhWYdDXYNdwHZN9xWJt0qeLGxdZsnZA
 9Pa1dwCjSS2fN6yR5vrkdMB93bU1ubUGY0X/BxHBwAzo/MF9Ss2C1upuu
 vgu82LfDNwc7mXM9MXr5XR+b8o486XMQyU7wPEfXsckd+FiOnCYTzG+r5
 n96Kgi50pFTZPbL74YKLbQHxqFVr4knPIhM0eyW2bTmRqdFsmp8edSox1 g==;
X-CSE-ConnectionGUID: DyV2tH08TaC2xK2kpOtLgA==
X-CSE-MsgGUID: qxEVYH98QcaR1WGEBVqbnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72519049"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72519049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 23:22:32 -0800
X-CSE-ConnectionGUID: AEUHbYIqR5GLUL6Tk7xDmw==
X-CSE-MsgGUID: 7qfj6d3GTdmoetzxLYy4+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213208229"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 23:22:27 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, harry.wentland@amd.com,
 daniels@collabora.com, mwen@igalia.com, sebastian.wick@redhat.com,
 uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 louis.chauvet@bootlin.com, stable@vger.kernel.org,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH 2/2] drm/atomic: Add affected colorops with affected planes
Date: Wed, 18 Feb 2026 12:27:13 +0530
Message-Id: <20260218065713.326417-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
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

When drm_atomic_add_affected_planes() adds a plane to the atomic
state, the associated colorops are not guaranteed to be included.
This can leave colorop state out of the transaction when planes
are pulled in implicitly (eg. during modeset or internal commits).

Also add affected colorops when adding affected planes to keep
plane and color pipeline state consistent within the atomic
transaction.

Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
Cc: <stable@vger.kernel.org> #v6.19+
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e3029c8f02e5..8bcd76aaeb6a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1588,6 +1588,7 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 	const struct drm_crtc_state *old_crtc_state =
 		drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_plane *plane;
+	int ret;
 
 	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
 
@@ -1601,6 +1602,10 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
+
+		ret = drm_atomic_add_affected_colorops(state, plane);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
-- 
2.25.1

